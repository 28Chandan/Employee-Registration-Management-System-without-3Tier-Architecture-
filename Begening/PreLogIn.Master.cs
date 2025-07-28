using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Begening
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            




            string ActState = Session["activeNav"] as string;
            if (ActState == "home")
            {
                homeBtn.CssClass = "navItem actBtn";
            }
            else if (ActState == "contact")
            {
                contactBtn.CssClass = "navItem actBtn";
            }
            else if (ActState == "about")
            {
                aboutBtn.CssClass = "navItem actBtn";
            }


        }

        protected void homeBtn_Click(object sender, EventArgs e)
        {
            Session["activeNav"] = "home";
            Response.Redirect("home.aspx");

        }

        protected void contactBtn_Click(object sender, EventArgs e)
        {
            Session["activeNav"] = "contact";
            Response.Redirect("Contact.aspx");
        }

        protected void aboutBtn_Click(object sender, EventArgs e)
        {
            Session["activeNav"] = "about";
            Response.Redirect("About.aspx");
        }
    }
}