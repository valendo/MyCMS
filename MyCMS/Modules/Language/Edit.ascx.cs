using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Language
{
    public partial class Edit : BaseAdminUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindingLanguages();
                BindingLanguageSettings();
            }
        }

        public ListItemCollection GetPages()
        {
            var pages = db.Pages.Where(t => t.ParentId == -1).ToList();
            ListItemCollection list = new ListItemCollection();
            MyCMS.Utility.GetListPages(pages, ref list, 0);
            return list;

        }

        protected void BindingLanguageSettings()
        {
            var languageSetting = db.LanguageSettings.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            if (languageSetting != null)
            {
                ddlType.SelectedValue = languageSetting.Type;
                chkHideCurrent.Checked = languageSetting.HideCurrent;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var languageSetting = db.LanguageSettings.Where(t => t.ModuleId == this.ModuleId).FirstOrDefault();
            var oLanguageSetting = new LanguageSettingInfo();
            if (languageSetting != null)
            {
                oLanguageSetting = db.LanguageSettings.Find(this.ModuleId);
                oLanguageSetting.Type = ddlType.SelectedValue;
                oLanguageSetting.HideCurrent = chkHideCurrent.Checked;
                db.Entry(oLanguageSetting).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                oLanguageSetting.ModuleId = this.ModuleId;
                oLanguageSetting.Type = ddlType.SelectedValue;
                oLanguageSetting.HideCurrent = chkHideCurrent.Checked;
                db.LanguageSettings.Add(oLanguageSetting);
                db.SaveChanges();
            }
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "closePopup();", true);
        }
        
        public List<LanguageInfo> GetCultures()
        {
            List<LanguageInfo> list = new List<LanguageInfo>();
            
            foreach (CultureInfo ci in CultureInfo.GetCultures(CultureTypes.SpecificCultures))
            {
                list.Add(new LanguageInfo() { CultureCode = ci.TextInfo.CultureName, CultureName = ci.EnglishName });
            }
            return list.OrderBy(t => t.CultureName).ToList();
        }

        protected void BindingLanguages()
        {
            var languages = db.Languages.Where(t => t.ModuleId == this.ModuleId).OrderBy(t => t.SortOrder).ToList();
            if (languages.Count > 0)
            {
                gvLanguages.DataSource = languages;
                gvLanguages.DataBind();
            }
            else
            {
                MyCMS.Utility.ShowNoResultFound(MyCMS.Utility.ToDataTable(languages), gvLanguages);
            }
        }

        protected void gvLanguages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "insert")
            {
                if (Page.IsValid)
                {
                    LanguageInfo language = new LanguageInfo();
                    language.ModuleId = this.ModuleId;
                    string CultureCode = ((DropDownList)gvLanguages.FooterRow.FindControl("ddlCultureCode")).SelectedValue;
                    language.CultureCode = CultureCode;
                    language.CultureName = ((TextBox)gvLanguages.FooterRow.FindControl("txtCultureName")).Text;
                    language.PageId = int.Parse(((DropDownList)gvLanguages.FooterRow.FindControl("ddlPage")).SelectedValue);
                    if (!string.IsNullOrWhiteSpace(((TextBox)gvLanguages.FooterRow.FindControl("txtSortOrder")).Text))
                        language.SortOrder = int.Parse(((TextBox)gvLanguages.FooterRow.FindControl("txtSortOrder")).Text);
                    else
                        language.SortOrder = 1;
                    var exist = db.Languages.Where(t => t.ModuleId == this.ModuleId && t.CultureCode == CultureCode).FirstOrDefault();
                    if (exist == null)
                    {
                        db.Languages.Add(language);
                        db.SaveChanges();
                    }
                    BindingLanguages();
                }
            }
        }

        protected void gvLanguages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int LanguageId = (int)gvLanguages.DataKeys[e.RowIndex].Value;
            LanguageInfo language = new LanguageInfo();
            language = db.Languages.Find(LanguageId);
            db.Languages.Remove(language);
            db.SaveChanges();
            BindingLanguages();
        }

        protected void gvLanguages_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLanguages.EditIndex = e.NewEditIndex;
            BindingLanguages();
        }

        protected void gvLanguages_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLanguages.EditIndex = -1;
            BindingLanguages();
            
        }

        protected void gvLanguages_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Page.IsValid)
            {
                int LanguageId = (int)gvLanguages.DataKeys[e.RowIndex].Value;
                LanguageInfo language = new LanguageInfo();
                language.ModuleId = this.ModuleId;
                language = db.Languages.Find(LanguageId);
                string CultureCode = ((DropDownList)gvLanguages.Rows[e.RowIndex].FindControl("ddlCultureCode")).SelectedValue;
                language.CultureCode = CultureCode;
                language.CultureName = ((TextBox)gvLanguages.Rows[e.RowIndex].FindControl("txtCultureName")).Text;
                language.PageId = int.Parse(((DropDownList)gvLanguages.Rows[e.RowIndex].FindControl("ddlPage")).SelectedValue);
                if (!string.IsNullOrWhiteSpace(((TextBox)gvLanguages.Rows[e.RowIndex].FindControl("txtSortOrder")).Text))
                    language.SortOrder = int.Parse(((TextBox)gvLanguages.Rows[e.RowIndex].FindControl("txtSortOrder")).Text);
                else
                    language.SortOrder = 1;
                var exist = db.Languages.Where(t => t.ModuleId == this.ModuleId && t.CultureCode == CultureCode && t.LanguageId != LanguageId).FirstOrDefault();
                if (exist == null)
                {
                    db.Entry(language).State = EntityState.Modified;
                    db.SaveChanges();
                    gvLanguages.EditIndex = -1;
                    BindingLanguages();
                }
            }
        }

        protected void gvLanguages_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow) && (gvLanguages.EditIndex == e.Row.RowIndex))
            {
                int LanguageId = (int)gvLanguages.DataKeys[e.Row.RowIndex].Value;
                var language = db.Languages.Find(LanguageId);
                DropDownList ddlCultureCode = (DropDownList)e.Row.FindControl("ddlCultureCode");
                ddlCultureCode.SelectedValue = language.CultureCode;
                DropDownList ddlPage = (DropDownList)e.Row.FindControl("ddlPage");
                ddlPage.SelectedValue = language.PageId.ToString();
            }
            else if ((e.Row.RowType == DataControlRowType.DataRow) && (gvLanguages.EditIndex == -1))
            {
                int LanguageId = (int)gvLanguages.DataKeys[e.Row.RowIndex].Value;
                var language = db.Languages.Find(LanguageId);
                Label lblPage = (Label)e.Row.FindControl("lblPage");
                lblPage.Text = MyCMS.Utility.GetPageUrl(language.PageId);
            }
        }

        
    }
}