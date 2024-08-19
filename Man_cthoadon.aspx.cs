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
    public partial class Man_cthoadon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            Session["txtMaHD"] = txtMaHD;
            Session["txtMaSP"] = txtMaSP;
            Session["txtSoLuongHD"] = txtSoLuongHD;
            Session["txtGiaBan"] = txtGiaBan;



            string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;" +
                    "Trusted_Connection=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sqlCommand = "INSERT INTO CTHoaDon (MaHD,MaSP, SoLuongHD, GiaBan) VALUES (@MaHD,@MaSP, @SoLuongHD, @GiaBan);";

                using (SqlCommand command = new SqlCommand(sqlCommand, connection))
                {
                    command.Parameters.AddWithValue("@MaHD", txtMaHD.Text.Trim());
                    command.Parameters.AddWithValue("@MaSP", txtMaSP.Text.Trim());
                    command.Parameters.AddWithValue("@SoLuongHD", txtSoLuongHD.Text.Trim());
                 
                    command.Parameters.AddWithValue("@GiaBan", txtGiaBan.Text.Trim());


                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblStatus.Text = "Chi tiết hóa đơn đã được thêm thành công.";
                            //LoadGridViewData(); // Gọi lại phương thức nạp dữ liệu cho GridView
                            ClearTextBoxes();
                            grdCTHoaDon.DataBind();

                        }
                        else
                        {
                            lblStatus.Text = "Lỗi: Không thể thêm hóa đơn.";
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
            txtMaHD.Text = string.Empty;
            txtMaSP.Text = string.Empty;
            txtSoLuongHD.Text = string.Empty;
            txtGiaBan.Text = string.Empty;
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
        protected void grdCTHoaDon_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Tính toán số thứ tự
                int rowIndex = e.Row.RowIndex + 1 + (grdCTHoaDon.PageIndex * grdCTHoaDon.PageSize);
                // Lấy control Label trong cột Số Thứ Tự và gán giá trị
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                if (lblSTT != null)
                {
                    lblSTT.Text = rowIndex.ToString();
                }
            }
        }
      

       
    }
}