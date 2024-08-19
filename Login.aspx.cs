using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {  
            
        }
        static void OpenAspxPage(string pageName)
        {
            try
            {
                HttpContext context = HttpContext.Current;
                if (context != null)
                {
                    string pagePath = context.Request.Url.GetLeftPart(UriPartial.Authority) 
                        + context.Request.ApplicationPath + "/" + pageName;
                    context.Response.Redirect(pagePath);
                }
                else
                {
                    Console.WriteLine("Không thể truy cập HttpContext.");
                }
            }
            catch (Exception ex){
                Console.WriteLine("Đã xảy ra lỗi: " + ex.Message);
            }
        }
        protected void btnLoginheader_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;" +
                   "Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sqlCommand = "Select * from phanquyen where Tendn='" + txtTendangnhap.Text
                    + "' and pass= '" + txtMatkhau.Text + "'";
                using (SqlCommand command = new SqlCommand(sqlCommand, connection))
                {
                    SqlDataReader rd = command.ExecuteReader();
                    if (rd.HasRows)
                    {
                        string pageName = "Man_Thongke.aspx";
                        OpenAspxPage(pageName);
                    }
                    else
                    { }
                }
            }
        }
    }
}