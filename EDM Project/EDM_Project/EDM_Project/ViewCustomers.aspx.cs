using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Web.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDM_Project
{
    public partial class ViewCustomers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                    string sql = "select distinct department from fields";
                    OracleConnection con = new OracleConnection(connectionString);
                    //{
                    con.Open();
                    using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                    {
                        // other parameters
                        DataTable table = new DataTable();
                        da.Fill(table);
                        DataRow dr = table.NewRow();
                        dr[0] = "--Select--";
                        table.Rows.InsertAt(dr, 0);
                        ddlDept.DataSource = table;
                        ddlDept.DataTextField = "Department";
                        ddlDept.DataValueField = "Department";
                        ddlDept.DataBind();
                    }
                }
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                string sql = "SELECT c.fname || ' ' || c.lname as \"cname\", c.phone, c.email, k.name, k.kid, c.cid FROM clients c, buy b, knowledge k WHERE c.cid = b.cid AND b.kid = k.kid";
                string sql2 = "SELECT distinct cl.fname || ' ' || cl.lname \"cname\", cl.phone, cl.email, k.name, k.kid, cl.cid FROM nugget_maturity m, cover c, fields f, nugget_size s, nuggets n, contributions cc, knowledge k, buy b, clients cl WHERE m.nid = c.nid AND c.fid = f.fid AND s.nid = m.nid AND k.kid = cc.kid AND cc.nid = n.nid AND n.nid = m.nid AND b.kid = k.kid AND cl.cid = b.cid AND m.maturity = :CMM AND f.department = :dept AND S.NUGGETSIZE = :Scale";
                OracleConnection con = new OracleConnection(connectionString);
                //{
                if (ddlDept.SelectedIndex.Equals("0") || ddlCMM.SelectedIndex.Equals("0") || ddlScale.SelectedIndex.Equals("0"))
                {
                    con.Open();
                    using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                    {
                        DataTable table = new DataTable();
                        da.Fill(table);
                        gviewCust.DataSource = table;
                        gviewCust.DataBind();
                        con.Close();
                        btnDelete.Visible = true;
                    }
                }
                else
                {
                    con.Open();
                    using (OracleDataAdapter da = new OracleDataAdapter(sql2, con))
                    {
                        da.SelectCommand.Parameters.AddWithValue("dept", ddlDept.SelectedValue);
                        da.SelectCommand.Parameters.AddWithValue("CMM", ddlCMM.SelectedValue);
                        da.SelectCommand.Parameters.AddWithValue("Scale", ddlScale.SelectedValue);
                        // other parameters
                        DataTable table = new DataTable();
                        da.Fill(table);
                        gviewCust.DataSource = table;
                        gviewCust.DataBind();
                        con.Close();
                        btnDelete.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gviewCust.Rows)
            {
                // Access the CheckBox
                CheckBox cb = (CheckBox)row.FindControl("chkboxKnw");
                if (cb != null && cb.Checked)
                {
                    string Name = gviewCust.Rows[row.RowIndex].Cells[1].Text.ToString();
                    string CName = gviewCust.Rows[row.RowIndex].Cells[2].Text.ToString();
                    string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                    OracleConnection con = new OracleConnection(connectionString);
                    con.Open();
                    OracleCommand cmd = new OracleCommand("delete_buy", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    OracleParameter inval = new OracleParameter("this_kid", OracleType.VarChar);
                    inval.Direction = ParameterDirection.Input;
                    inval.Value = Name;
                    OracleParameter inval2 = new OracleParameter("this_CID", OracleType.VarChar);
                    inval2.Direction = ParameterDirection.Input;
                    inval2.Value = CName;
                    cmd.Parameters.Add(inval);
                    cmd.Parameters.Add(inval2);
                    cmd.ExecuteNonQuery();
                    string sql = "SELECT c.fname || ' ' || c.lname as \"cname\", c.phone, c.email, k.name, k.kid, c.cid FROM clients c, buy b, knowledge k WHERE c.cid = b.cid AND b.kid = k.kid";
                    using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                    {
                        DataTable table = new DataTable();
                        da.Fill(table);
                        gviewCust.DataSource = table;
                        gviewCust.DataBind();
                        btnDelete.Visible = true;
                        con.Close();
                        Label1.Visible = true;
                    }
                }
            }
        }
        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}