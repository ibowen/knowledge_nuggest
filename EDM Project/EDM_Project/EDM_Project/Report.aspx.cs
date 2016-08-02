using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDM_Project
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtFromDate.Text))
                {
                    lblDateMsg.Visible = true;
                    lblDateMsg.Text = "From Date cannot be empty!!";
                }
                else if (string.IsNullOrEmpty(txtToDate.Text))
                {
                    lblDateMsg.Visible = true;
                    lblDateMsg.Text = "To Date cannot be empty!!";
                }
                else
                {
                    lblDateMsg.Visible = false;
                    string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                    string sql = "SELECT x.\"CNAME\", x.\"MODE\", x.\"DATE\", x.\"PFEE\", x.\"VFEE\", y.\"KNAME\", y.\"PNAME\" FROM (SELECT c1.fname || ' ' || c1.lname \"CNAME\", p1.paymode \"MODE\", p1.startdate \"DATE\", p1.fee2provider \"PFEE\", p1.fee2vendor \"VFEE\", p1.KID \"KID\" FROM payments p1, clients c1 WHERE p1.cid = c1.cid AND to_char(p1.startdate, 'mm/dd/yyyy') >= :fromdate AND to_char(p1.startdate, 'mm/dd/yyyy') <= :todate) x,(SELECT distinct k.name \"KNAME\", k.kid \"ID\", p.name \"PNAME\" FROM nugget_maturity m, cover c, fields f, nugget_size s, contributions co, knowledge k, nuggets n, providers p WHERE m.nid = c.nid AND n.pid = p.pid AND c.fid = f.fid AND s.nid = m.nid AND n.nid = m.nid AND co.nid = n.nid AND k.kid = co.kid) y WHERE x.\"KID\" = y.\"ID\"";
                    //string sql2 = "SELECT k.name FROM nuggets k WHERE k.nid IN (SELECT m.nid FROM nugget_maturity m, cover c, fields f, nugget_size s WHERE m.nid = c.nid AND c.fid = f.fid AND s.nid = m.nid AND m.maturity = :CMM AND f.department = :dept AND S.NUGGETSIZE = :Scale) MINUS (SELECT n.name FROM nuggets n WHERE n.nid IN (SELECT c.nid FROM contributions c WHERE c.kid IN (SELECT k.kid FROM knowledge k WHERE k.name = :knowledge)))";

                    OracleConnection con = new OracleConnection(connectionString);
                    //{
                    con.Open();
                    using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                    {
                        string todate = txtFromDate.Text.ToString();
                        da.SelectCommand.Parameters.AddWithValue("fromdate", String.Format("{0:d}", txtFromDate.Text));
                        da.SelectCommand.Parameters.AddWithValue("todate", String.Format("{0:d}", txtToDate.Text));
                        //da.SelectCommand.Parameters.AddWithValue("Scale", ddlBusScale.SelectedValue);
                        // other parameters
                        DataTable table = new DataTable();
                        da.Fill(table);
                        gviewReport.DataSource = table;
                        gviewReport.DataBind();
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}