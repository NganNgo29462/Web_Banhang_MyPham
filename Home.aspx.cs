using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }
        protected void btncn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void btntl_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://cocoonvietnam.com/trang/cau-chuyen-thuong-hieu");
        }
        protected void btnnl_Click(object sender, EventArgs e)
        {
        }
    }
}

