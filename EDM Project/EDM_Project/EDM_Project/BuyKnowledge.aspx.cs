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
    public partial class BuyKnowledge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                            ddlDpt.DataSource = table;
                            ddlDpt.DataTextField = "Department";
                            ddlDpt.DataValueField = "Department";
                            ddlDpt.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            lblBuy.Visible = false;
            try
            {
                if (ddlBusScale.SelectedIndex != 0 && ddlCMM.SelectedIndex != 0 && ddlDpt.SelectedIndex != 0)
                {
                    string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                    string sql = "SELECT kid, name, price FROM knowledge WHERE kid IN (SELECT c.kid FROM contributions c WHERE c.nid IN (SELECT k.nid FROM nuggets k WHERE k.nid IN (SELECT m.nid FROM nugget_maturity m, cover c, fields f, nugget_size s WHERE m.nid = c.nid AND c.fid = f.fid AND s.nid = m.nid AND m.maturity  = :CMM AND f.department = :dept AND S.NUGGETSIZE = :Scale)))";
                    //string sql = "SELECT k.kid, k.name, k.price FROM nugget_maturity m, cover c, fields f, nugget_size s, contributions co, knowledge k, nuggets n WHERE m.nid = c.nid AND c.fid = f.fid AND s.nid = m.nid AND n.nid = m.nid AND co.nid = n.nid AND k.kid = co.kid AND m.maturity = :CMM AND f.department = :dept AND S.NUGGETSIZE = :Scale";
                    //using (var con = new SqlConnection())
                    //using (var da = new SqlDataAdapter(sql, con))
                    OracleConnection con = new OracleConnection(connectionString);
                    //{
                    con.Open();
                    using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                    {
                        try
                        {
                            da.SelectCommand.Parameters.AddWithValue("dept", ddlDpt.SelectedValue);
                            da.SelectCommand.Parameters.AddWithValue("CMM", ddlCMM.SelectedValue);
                            da.SelectCommand.Parameters.AddWithValue("Scale", ddlBusScale.SelectedValue);
                            // other parameters
                            DataTable table = new DataTable();
                            da.Fill(table);
                            gviewKnwDet.DataSource = table;
                            gviewKnwDet.DataBind();
                        }
                        catch (Exception ex)
                        {

                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                    //}
                }
                else
                {

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            try
            {                
                foreach (GridViewRow row in gviewKnwDet.Rows)
                {
                    // Access the CheckBox
                    CheckBox cb = (CheckBox)row.FindControl("chkboxBuy");
                    if (cb != null && cb.Checked)
                    {
                        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                        OracleConnection con = new OracleConnection(connectionString);
                        con.Open();
                        OracleCommand cmd = new OracleCommand("buy_knowledge", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        string Name = gviewKnwDet.Rows[row.RowIndex].Cells[1].Text.ToString();
                        string CName = gviewKnwDet.Rows[row.RowIndex].Cells[2].Text.ToString();
                        OracleParameter inval = new OracleParameter("this_startdate", OracleType.DateTime);
                        inval.Direction = ParameterDirection.Input;
                        inval.Value = System.DateTime.Now;
                        OracleParameter inval2 = new OracleParameter("this_enddate", OracleType.DateTime);
                        inval2.Direction = ParameterDirection.Input;
                        inval2.Value = System.DateTime.Now.AddYears(4);
                        OracleParameter inval3 = new OracleParameter("this_paymode", OracleType.VarChar);
                        inval3.Direction = ParameterDirection.Input;
                        inval3.Value = DropDownList1.SelectedValue;
                        OracleParameter inval4 = new OracleParameter("this_kid", OracleType.VarChar);
                        inval4.Direction = ParameterDirection.Input;
                        inval4.Value = Name;
                        OracleParameter inval5 = new OracleParameter("this_veid", OracleType.VarChar);
                        inval5.Direction = ParameterDirection.Input;
                        inval5.Value = "VE004";
                        OracleParameter inval6 = new OracleParameter("this_cid", OracleType.VarChar);
                        inval6.Direction = ParameterDirection.Input;
                        inval6.Value = Session["CID"].ToString();
                        cmd.Parameters.Add(inval);
                        cmd.Parameters.Add(inval2);
                        cmd.Parameters.Add(inval3);
                        cmd.Parameters.Add(inval4);
                        cmd.Parameters.Add(inval5);
                        cmd.Parameters.Add(inval6);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                lblBuy.Visible = true;
                lblBuy.Text = "Knowledge added successfully!!";
                Panel1.Visible = false;
                gviewKnwDet.DataSource = null;
                gviewKnwDet.DataBind();
            }
            catch (Exception ex)
            {
                lblBuy.Text = "Knowledge Already Exists";
                lblBuy.Visible = true;
            }
        }
        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session["User"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}