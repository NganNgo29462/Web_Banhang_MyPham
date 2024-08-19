using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class Order : System.Web.UI.Page
    {

        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }
        protected void buthome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void LoadData()
        {
            dt = (DataTable)Session["Giohang"];
            grdDonHang.DataSource = dt;
            grdDonHang.DataBind();
            grdDonHang.Columns[0].ControlStyle.Width = 80;
            grdDonHang.Columns[1].ControlStyle.Width = 150;
            grdDonHang.Columns[2].ControlStyle.Width = 80;
            grdDonHang.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            grdDonHang.Columns[3].ControlStyle.Width = 80;
            grdDonHang.Columns[3].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            grdDonHang.Columns[4].ControlStyle.Width = 100;
            grdDonHang.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            if (dt != null)
            {
                double tong = (double)Session["tong"];
                lblTongTien.Text = "Tổng tiền trên giỏ hàng là:" + String.Format("{0:0,000}", tong);
            }
        }

        protected void butDongY_Click(object sender, EventArgs e)
        {
            DateTime d = DateTime.Now;
            string maDonHang = d.Day.ToString() + d.Month.ToString() +d.Second.ToString();
            string makh = "KH" + d.Day.ToString() +d.Second.ToString();
            DateTime ngay = DateTime.Now;
            string ngayFormatted = ngay.ToString("yyyy-MM-dd");
            Session["txtHoTen"] = txtHoTen;
            Session["txtDienThoai"] = txtDienThoai;
            Session["txtNgaySinh"] = Calendar1;
            string ngaySinhFormatted = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Session["txtGT"] = txtGT;
            Session["maDH"] = maDonHang;
            string connectionString = "Data Source=DESKTOP-K9332PT;Initial Catalog=QLMP;" + "Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sqlCommand = "INSERT INTO KhachHang VALUES " +
                    "('" + makh + "',N' " + txtHoTen.Text + "',N'" + txtGT.Text + "', convert (date,'" + ngaySinhFormatted + "'), '" 
                    + txtDienThoai.Text + "');";                
                using (SqlCommand command = new SqlCommand(sqlCommand, connection))
                {
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblStatus1.Text = "Khách hàng đã được thêm thành công ";
                    }
                    else
                    {
                        lblStatus1.Text = "Lỗi ";
                    }
                }
                string sqlcmd = "INSERT INTO HoaDon VALUES ('" + maDonHang + "','" + makh + "', convert (date,'" + ngayFormatted + "'));";
                using (SqlCommand cmd = new SqlCommand(sqlcmd, connection))
                {
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblStatus2.Text = "Hóa đơn đã được thêm thành công ";
                    }
                    else{
                        lblStatus2.Text = "Lỗi ";
                    }
                }
            }
        }
    }
}
