using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class Man_nguoidung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {       }
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            Session["txtTendn"] = txtTendn;
            Session["txtpass"] = txtpass;
            string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;" + "Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sqlCommand = "INSERT INTO phanquyen (Tendn,pass) VALUES (@Tendn,@pass);";
                using (SqlCommand command = new SqlCommand(sqlCommand, connection))
                {
                    command.Parameters.AddWithValue("@Tendn", txtTendn.Text.Trim());
                    command.Parameters.AddWithValue("@pass", txtpass.Text.Trim());
                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblStatus.Text = "Tài khoản đã được thêm thành công.";
                            ClearTextBoxes();
                            grdnguoidung.DataBind();
                        }
                        else
                        {
                            lblStatus.Text = "Lỗi: Không thể thêm tài khoản.";
                        }
                    }
                    catch (SqlException ex)
                    {
                        lblStatus.Text = "Lỗi cơ sở dữ liệu: " + ex.Message;
                    }
                }
            }
        }
        private void ClearTextBoxes()
        {
            txtTendn.Text = string.Empty;
            txtpass.Text = string.Empty;
        }
        protected void btnShowModal_Click(object sender, EventArgs e)
        {
            pnlModal.Style["display"] = "block";
            modalBackground.Style["display"] = "block";
        }
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            pnlModal.Style["display"] = "none";
            modalBackground.Style["display"] = "none";
        }
        protected void grdnguoidung_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.RowIndex + 1 + (grdnguoidung.PageIndex * grdnguoidung.PageSize);
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                if (lblSTT != null)
                {
                    lblSTT.Text = rowIndex.ToString();
                }
            }
        }
    }
}