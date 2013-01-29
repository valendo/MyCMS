using MyCMS.Logic;
using MyCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyCMS.Modules.Language
{
    public partial class View : BaseUserControl
    {
        MyCMSContext db = new MyCMSContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var languageSetting = db.LanguageSettings.Find(this.ModuleId);
            if (languageSetting != null)
            {
                var languages = db.Languages.Where(t => t.ModuleId == this.ModuleId).ToList();
                if (languages.Count > 0)
                {
                    if (languageSetting.Type == "flag")
                    {
                        foreach (var item in languages)
                        {
                            ImageButton btn = new ImageButton();
                            btn.ID = "language_" + item.CultureCode;
                            btn.ImageUrl = "/images/icons/flags/" + item.CultureCode + ".gif";
                            btn.CssClass = "image_language";
                            
                            btn.CommandArgument = item.CultureCode;
                            btn.Click += language_Click;
                            pchContent.Controls.Add(btn);
                            pchContent.Controls.Add(new LiteralControl("<span>&nbsp;&nbsp;</span>"));
                        }
                    }
                    else if (languageSetting.Type == "text")
                    {
                        foreach (var item in languages)
                        {
                            LinkButton link = new LinkButton();
                            link.ID = "language_" + item.CultureCode;
                            link.Text = item.CultureName;
                            link.CssClass = "link_language";
                            link.CommandArgument = item.CultureCode;
                            link.Click += language_Click;
                            pchContent.Controls.Add(link);
                            pchContent.Controls.Add(new LiteralControl("<span>&nbsp;&nbsp;</span>"));
                        }
                    }
                    else if (languageSetting.Type == "flagtext")
                    {
                        foreach (var item in languages)
                        {
                            ImageButton btn = new ImageButton();
                            btn.ID = "img_language_" + item.CultureCode;
                            btn.ImageUrl = "/images/icons/flags/" + item.CultureCode + ".gif";
                            btn.CssClass = "image_language";
                            btn.ImageAlign = ImageAlign.AbsMiddle;
                            btn.CommandArgument = item.CultureCode;
                            btn.Click += language_Click;
                            LinkButton link = new LinkButton();
                            link.ID = "link_language_" + item.CultureCode;
                            link.Text = item.CultureName;
                            link.CssClass = "link_language";
                            link.CommandArgument = item.CultureCode;
                            link.Click += language_Click;
                            pchContent.Controls.Add(btn);
                            pchContent.Controls.Add(new LiteralControl("<span>&nbsp;</span>"));
                            pchContent.Controls.Add(link);
                            pchContent.Controls.Add(new LiteralControl("<span>&nbsp;&nbsp;</span>"));
                        }
                    }
                    else if (languageSetting.Type == "dropdown")
                    {
                        DropDownList ddl = new DropDownList();
                        ddl.ID = "ddl_language";
                        ddl.DataSource = languages;
                        ddl.DataTextField = "CultureName";
                        ddl.DataValueField = "CultureCode";
                        ddl.DataBind();
                        pchContent.Controls.Add(ddl);
                    }
                }
                else
                {

                    ltrContent.Text = "<div class='warning'>No languages set! Please add new langauge.</div>";
                }
            }
            else
            {
                ltrContent.Text = "<div class='warning'>No languages set! Please add new langauge.</div>";
            }
        }

        void language_Click(object sender, EventArgs e)
        {

            string type = sender.GetType().Name;
            if (type == "ImageButton")
            {
                ImageButton ctl = (ImageButton)sender;
                string CultureCode = ctl.CommandArgument;
                Response.Write(CultureCode);
            }
            else if (type == "LinkButton")
            {
                LinkButton ctl = (LinkButton)sender;
                string CultureCode = ctl.CommandArgument;
                Response.Write(CultureCode);
            }
            
        }

    }
}