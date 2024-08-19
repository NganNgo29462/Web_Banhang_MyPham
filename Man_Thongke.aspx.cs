using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class Man_Thongke : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int soLuongSanPhamDaBan = LaySoLuongSanPhamDaBan();
            lblsp.Text = soLuongSanPhamDaBan.ToString();
            int skh = soKH();
            lblskh.Text = skh.ToString();
            int shd = soHD();
            lblshd.Text = shd.ToString();
            int sdt = sodt();
            lbldt.Text = sdt.ToString();
            if (!IsPostBack)
            {
                lsp();
                dsp();
            }
        }
        private int LaySoLuongSanPhamDaBan()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLMPConnectionString"].ConnectionString;
            string query = "SELECT SUM(CTHoaDon.SoLuongHD) FROM CTHoaDon JOIN HoaDon ON HoaDon.MaHD = CTHoaDon.MaHD";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }
        private int soKH()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLMPConnectionString"].ConnectionString;
            string query = "SELECT count(MaKH) FROM KhachHang";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }
        private int soHD()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLMPConnectionString"].ConnectionString;
            string query = "SELECT count(MaHD) FROM HoaDon";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }
        private int sodt()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLMPConnectionString"].ConnectionString;
            string query = "SELECT sum(SoLuongHD*GiaBan) FROM CTHoaDon ";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    return (int)command.ExecuteScalar();
                }
            }
        }
        private void lsp()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLMPConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @" SELECT TOP 1 TenloaiSP
                    FROM LoaiSanPham  
                    JOIN SanPham on LoaiSanPham.MaloaiSP=SanPham.MaloaiSP
                    JOIN CTHoaDon ON SanPham.MaSP = CTHoaDon.MaSP
                    GROUP BY TenloaiSP
                    ORDER BY COUNT(*) DESC;
                ";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string tenSanPham = reader["TenloaiSP"].ToString();
                            lbllsp.Text = tenSanPham;
                        }
                    }
                }
            }
        }
        private void dsp()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLMPConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @" SELECT TOP 1 TendongSP
                    FROM DongSanPham  
                    JOIN SanPham on DongSanPham.MadongSP=SanPham.MadongSP
                    JOIN CTHoaDon ON SanPham.MaSP = CTHoaDon.MaSP
                    GROUP BY TendongSP
                    ORDER BY COUNT(*) DESC;
                ";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string tenSanPham = reader["TendongSP"].ToString();
                            lbldsp.Text = tenSanPham;
                        }
                    }
                }
            }
        }

    }
}
