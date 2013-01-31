using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS
{
    static class Utility
    {
        public static string GetSettingByKey(string key)
        {
            MyCMSContext db = new MyCMSContext();
            return db.Settings.Find(key).Value;
        }

        public static DataTable ToDataTable<T>(IList<T> data)// T is any generic type
        {
            PropertyDescriptorCollection props = TypeDescriptor.GetProperties(typeof(T));

            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
                table.Columns.Add(prop.Name, prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }

        public static void ShowNoResultFound(DataTable source, GridView gv)
        {
            source.Rows.Add(source.NewRow()); // create a new blank row to the DataTable
            // Bind the DataTable which contain a blank row to the GridView
            gv.DataSource = source;
            gv.DataBind();
            // Get the total number of columns in the GridView to know what the Column Span should be
            int columnsCount = gv.Columns.Count;
            gv.Rows[0].Cells.Clear();// clear all the cells in the row
            gv.Rows[0].Cells.Add(new TableCell()); //add a new blank cell
            gv.Rows[0].Cells[0].ColumnSpan = columnsCount; //set the column span to the new added cell

            //You can set the styles here
            gv.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            gv.Rows[0].Cells[0].ForeColor = System.Drawing.Color.Red;
            gv.Rows[0].Cells[0].Font.Bold = true;
            //set No Results found to the new added cell
            gv.Rows[0].Cells[0].Text = "NO RESULT FOUND!";
        }

        const string spaceChar = "&nbsp;&nbsp;&nbsp; ";
        public static void GetListPages(List<PageInfo> pages, ref ListItemCollection list, int level)
        {
            MyCMSContext db = new MyCMSContext();
            string space = "";
            for (int i = 0; i < level; i++)
            {
                space += spaceChar;
            }
            foreach (var item in pages)
            {
                list.Add(new ListItem(WebUtility.HtmlDecode(space + item.PageName.ToString()), item.PageId.ToString()));
                var subPages = db.Pages.Where(t => t.ParentId == item.PageId).ToList();
                if (subPages.Count > 0)
                {
                    GetListPages(subPages, ref list, level + 1);
                }
            }
        }

        public static string GetPageUrl(int PageId)
        {
            MyCMSContext db = new MyCMSContext();
            string url = "";
            var page = db.Pages.Where(t => t.PageId == PageId).FirstOrDefault();
            if (page != null)
            {
                RecursivePageUrl(PageId, ref url);
                url = reverseIt(url);
                url = "/" + url;
            }
            return url;
        }

        public static void RecursivePageUrl(int PageId, ref string url)
        {
            MyCMSContext db = new MyCMSContext();
            var page = db.Pages.Where(t => t.PageId == PageId).FirstOrDefault();
            url += page.PageSEO + ",";
            var parentPage = db.Pages.Where(t => t.PageId == page.ParentId).FirstOrDefault();
            if (parentPage != null)
            {
                RecursivePageUrl(parentPage.PageId, ref url);
            }
        }

        public static string reverseIt(string strSource)
        {
            strSource = strSource.Substring(0, strSource.Length - 1);
            string[] arySource = strSource.Split(new char[] { ',' });
            string strReverse = string.Empty;
            if (arySource.Length > 1)
            {
                for (int i = arySource.Length - 1; i >= 0; i--)
                {
                    if (strReverse != "")
                    {
                        strReverse = strReverse + "/" + arySource[i];
                    }
                    else
                    {
                        strReverse = arySource[i];
                    }

                }
            }
            else
            {
                strReverse = arySource[0];
            }
            return strReverse;
        }
    }
}