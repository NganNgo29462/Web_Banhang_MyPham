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
    public partial class Man_dongsanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            
            Session["txtmadongsp"] = txtMadongSP;
            Session["txtTenSP"] = txtTendongSP;
           
            string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;" +
                    "Trusted_Connection=True;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sqlCommand = "INSERT INTO DongSanPham ( MadongSP, TendongSP) " +
                                    "VALUES (@MadongSP, @TendongSP);";

                using (SqlCommand command = new SqlCommand(sqlCommand, connection))
                {
                    
                    command.Parameters.AddWithValue("@MadongSP", txtMadongSP.Text.Trim());
                    command.Parameters.AddWithValue("@TendongSP", txtTendongSP.Text.Trim());
                   

                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblStatus.Text = "Dòng sản phẩm đã được thêm thành công.";
                            //LoadGridViewData(); // Gọi lại phương thức nạp dữ liệu cho GridView
                            ClearTextBoxes();
                            grdDongSanPham.DataBind();

                        }
                        else
                        {
                            lblStatus.Text = "Lỗi: Không thể thêm dòng sản phẩm.";
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
            
            txtMadongSP.Text = string.Empty;
            txtTendongSP.Text = string.Empty;
            
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
        protected void grdDongSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Tính toán số thứ tự
                int rowIndex = e.Row.RowIndex + 1 + (grdDongSanPham.PageIndex * grdDongSanPham.PageSize);
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