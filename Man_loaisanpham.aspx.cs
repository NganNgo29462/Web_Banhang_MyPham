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
    public partial class Man_loaisanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            Session["txtmaloaisp"] = txtMaloaiSP;
            Session["txtmadongsp"] = txtMadongSP;
            Session["txtTenSP"] = txtTenloaiSP;
           
            string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;" +
                    "Trusted_Connection=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sqlCommand = "INSERT INTO LoaiSanPham (MaloaiSP, MadongSP, TenloaiSP) " +
                                    "VALUES (@MaloaiSP, @MadongSP, @TenloaiSP);";

                using (SqlCommand command = new SqlCommand(sqlCommand, connection))
                {
                    command.Parameters.AddWithValue("@MaloaiSP", txtMaloaiSP.Text.Trim());
                    command.Parameters.AddWithValue("@MadongSP", txtMadongSP.Text.Trim());
                    command.Parameters.AddWithValue("@TenloaiSP", txtTenloaiSP.Text.Trim());
                   

                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblStatus.Text = "Loại sản phẩm đã được thêm thành công.";
                            //LoadGridViewData(); // Gọi lại phương thức nạp dữ liệu cho GridView
                            ClearTextBoxes();
                            grdLoaiSanPham.DataBind();

                        }
                        else
                        {
                            lblStatus.Text = "Lỗi: Không thể thêm loại sản phẩm.";
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
            txtMaloaiSP.Text = string.Empty;
            txtMadongSP.Text = string.Empty;
            txtTenloaiSP.Text = string.Empty;
            
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
        protected void grdLoaiSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Tính toán số thứ tự
                int rowIndex = e.Row.RowIndex + 1 + (grdLoaiSanPham.PageIndex * grdLoaiSanPham.PageSize);
                // Lấy control Label trong cột Số Thứ Tự và gán giá trị
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                if (lblSTT != null)
                {
                    lblSTT.Text = rowIndex.ToString();
                }
            }
        }
        //private void LoadGridViewData()
        //{
        //    string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;Trusted_Connection=True;";

        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        connection.Open();
        //        string query = "SELECT * FROM SanPham";

        //        using (SqlCommand command = new SqlCommand(query, connection))
        //        {
        //            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
        //            {
        //                DataTable dataTable = new DataTable();
        //                adapter.Fill(dataTable);
        //                grdSanPham.DataSource = dataTable;
        //                grdSanPham.DataBind();
        //            }
        //        }
        //    }
        //}
    }
}