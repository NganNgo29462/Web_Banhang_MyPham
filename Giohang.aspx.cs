using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doan_thuchanhnghenghiep
{
    public partial class Giohang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }
        protected void LoadData()
        {
            dt = (DataTable)Session["Giohang"];
            grdGioHang.DataSource = dt;
            grdGioHang.DataBind();
            grdGioHang.Columns[2].ControlStyle.Width = 400;
            grdGioHang.Columns[3].ControlStyle.Width = 150;
            grdGioHang.Columns[4].ControlStyle.Width = 150;
            grdGioHang.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            grdGioHang.Columns[5].ControlStyle.Width = 150;
            grdGioHang.Columns[5].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            grdGioHang.Columns[6].ControlStyle.Width = 150;
            grdGioHang.Columns[6].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            if (dt != null)
            {
                double tong = TinhTongTien(dt);
                Session["tong"] = tong;     // lưu để truyền qua trang DonHang.aspx
                lblTongTien.Text = "Tổng tiền trên giỏ hàng là:" + String.Format("{0:0,000}", tong);
            }
        }

        protected void grdGioHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            dt = (DataTable)Session["GioHang"];
            GridViewRow row = grdGioHang.Rows[e.RowIndex];
            TextBox txtSoluong = (TextBox)(row.Cells[5].Controls[0]);
            int Soluong = Convert.ToInt32(txtSoluong.Text);
            dt.Rows[row.DataItemIndex]["SoLuong"] = txtSoluong.Text;
            dt.Rows[row.DataItemIndex]["TongTien"] =
            Convert.ToDouble(dt.Rows[row.DataItemIndex]["GiaBan"]) * Soluong;
            grdGioHang.EditIndex = -1;
            Session["Giohang"] = dt;
            LoadData();
        }
        protected void grdGioHang_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdGioHang.EditIndex = e.NewEditIndex;
            LoadData();
        }
        protected void grdGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dt = (DataTable)Session["Giohang"];
            GridViewRow row = grdGioHang.Rows[e.RowIndex];
            dt.Rows[row.DataItemIndex].Delete();
            grdGioHang.EditIndex = -1;
            Session["Giohang"] = dt;
            LoadData();
        }
        protected void grdGioHang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdGioHang.EditIndex = -1;
            LoadData();
        }
        protected double TinhTongTien(DataTable dt)
        {
            if (dt == null)
                return 0;
            double sum = 0;
            foreach (DataRow row in dt.Rows)
                sum += Convert.ToDouble(row["TongTien"]);
            return sum;
        }
        protected void butDathang_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["Giohang"];
        }
        protected void grdGioHang_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.RowIndex + 1 + (grdGioHang.PageIndex * grdGioHang.PageSize);
                Label lblSTT = (Label)e.Row.FindControl("lblSTT");
                if (lblSTT != null)
                {
                    lblSTT.Text = rowIndex.ToString();
                }
            }
        }
    }
}
