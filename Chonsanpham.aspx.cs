using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class Chonsanpham : System.Web.UI.Page{
        protected void Page_Load(object sender, EventArgs e){
            string masp = "";
            if (Request.QueryString["MaSP"] != null)
                masp = Request.QueryString["MaSP"];
            Session["MaSP"] = masp;
            LoadSP(masp);
        }
        protected void LoadSP(string masp){
            string conStr = WebConfigurationManager.ConnectionStrings["QLMPConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            SqlDataAdapter adapt = new SqlDataAdapter("SELECT MaSP, TenSP, DonViTinh, GiaBan, MaloaiSP, HinhSP FROM SanPham WHERE MaSP=" + "'" + masp + "'", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            if (dt.Rows.Count == 0)
                return;
            lblTenSP.Text = "Tên hàng: " + dt.Rows[0]["TenSP"].ToString();
            lblMaSP.Text = "Mã hàng: " + dt.Rows[0]["MaSP"].ToString();
            lblDonVi.Text = dt.Rows[0]["DonViTinh"].ToString();
            lblDonGia.Text = "Đơn giá: " + dt.Rows[0]["GiaBan"].ToString();
            imgHinh.ImageUrl = dt.Rows[0]["HinhSP"].ToString();
            imgHinh.Height = 650;
            imgHinh.Width = 541;
            ViewState["SanPham"] = dt;
        }
        protected void butInsert_Click(object sender, EventArgs e)
        {
            DataTable dtSP = (DataTable)ViewState["SanPham"];
            DataTable dtGH;     
            int Soluong = 0;
            if (Session["GioHang"] == null){
                dtGH = new DataTable();
                dtGH.Columns.Add("MaSP");
                dtGH.Columns.Add("TenSP");
                dtGH.Columns.Add("GiaBan");
                dtGH.Columns.Add("SoLuong");
                dtGH.Columns.Add("TongTien");
            }
            else 
                dtGH = (DataTable)Session["GioHang"];
            string masp = (string)Session["MaSP"];
            int pos = TimSP(masp, dtGH);      
            if (pos != -1){
                Soluong = Convert.ToInt32(dtGH.Rows[pos]["SoLuong"]) + int.Parse(txtSoluong.Text);
                dtGH.Rows[pos]["SoLuong"] = Soluong;
                dtGH.Rows[pos]["TongTien"] = Convert.ToDouble(dtSP.Rows[0]["GiaBan"]) * Soluong;
            }
            else{
                Soluong = int.Parse(txtSoluong.Text);
                DataRow dr = dtGH.NewRow();
                dr["MaSP"] = dtSP.Rows[0]["MaSP"];
                dr["TenSP"] = dtSP.Rows[0]["TenSP"];
                dr["GiaBan"] = dtSP.Rows[0]["GiaBan"];
                dr["SoLuong"] = int.Parse(txtSoluong.Text);
                dr["TongTien"] = Convert.ToDouble(dtSP.Rows[0]["GiaBan"]) * Soluong;
                dtGH.Rows.Add(dr);
            }
            Session["Giohang"] = dtGH;
            Response.Redirect("Giohang.aspx");
        }
        public static int TimSP(string masp, DataTable dt)
        {
            int pos = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["MaSP"].ToString().ToLower() == masp.ToLower())
                {
                    pos = i;
                    break;
                }
            }
            return pos;
        } 
    }
}


