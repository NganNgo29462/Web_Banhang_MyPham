using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Giohang.aspx");
        }

    }
}

