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
    public partial class Man_sanpham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {        }
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            Session["txtmasp"] = txtMaSP;
            Session["txtTenSP"] = txtTenSP;
            Session["txtMaloaiSP"] = txtlsp;
            Session["txtDonViTinh"] = txtdvt;
            Session["txtgb"] = txtDonGia;
            Session["txthinh"] = txth;
            Session["txtdsp"] = txtdsp;
            Session["txtdt"] = txtdt;
            Session["txtsl"] = txtsl;
            string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;" +
                    "Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sqlCommand = "INSERT INTO SanPham (MaSP, TenSP, DonViTinh, GiaBan, Soluongton, Dungtich, HinhSP, MaloaiSP, MadongSP) " +
                                    "VALUES (@MaSP, @TenSP, @DonViTinh, @GiaBan, @Soluongton, @Dungtich, @HinhSP, @MaloaiSP, @MadongSP);";
                using (SqlCommand command = new SqlCommand(sqlCommand, connection))
                {
                    command.Parameters.AddWithValue("@MaSP", txtMaSP.Text.Trim());
                    command.Parameters.AddWithValue("@TenSP", txtTenSP.Text.Trim());
                    command.Parameters.AddWithValue("@DonViTinh", txtdvt.Text.Trim());
                    command.Parameters.AddWithValue("@GiaBan", txtDonGia.Text.Trim());
                    command.Parameters.AddWithValue("@Soluongton", txtsl.Text.Trim());
                    command.Parameters.AddWithValue("@Dungtich", txtdt.Text.Trim());
                    command.Parameters.AddWithValue("@HinhSP", txth.Text.Trim());
                    command.Parameters.AddWithValue("@MaloaiSP", txtlsp.Text.Trim());
                    command.Parameters.AddWithValue("@MadongSP", txtdsp.Text.Trim());
                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblStatus.Text = "Sản phẩm đã được thêm thành công.";
                            ClearTextBoxes();
                            grdSanPham.DataBind();
                        }
                        else
                        {
                            lblStatus.Text = "Lỗi: Không thể thêm sản phẩm.";
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
            txtMaSP.Text = string.Empty;
            txtTenSP.Text = string.Empty;
            txtlsp.Text = string.Empty;
            txtdvt.Text = string.Empty;
            txtDonGia.Text = string.Empty;
            txtsl.Text = string.Empty;
            txtdt.Text = string.Empty;
            txtdsp.Text = string.Empty;
            txth.Text = string.Empty;
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
        protected void grdSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.RowIndex + 1 + (grdSanPham.PageIndex * grdSanPham.PageSize);
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                if (lblSTT != null)
                {
                    lblSTT.Text = rowIndex.ToString();
                }
            }
        }
    }
}