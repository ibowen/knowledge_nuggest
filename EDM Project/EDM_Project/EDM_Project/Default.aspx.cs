using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDM_Project
{
    public partial class Default : System.Web.UI.Page
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
        
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlDept.ClearSelection();
            ddlCMM.ClearSelection();
            ddlBusScale.ClearSelection();
            txtKnowledge.Text = string.Empty;
            ListBox1.ClearSelection();
            ListBox2.ClearSelection();
            ListBox1.Items.Clear();
            ListBox2.Items.Clear();
            Panel2.Visible = false;
            lblmsg.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                ListBox1.Items.Clear();
                ListBox2.Items.Clear();
                txtKnowledge.Text = string.Empty;
                ddlExistKnowledge.Items.Clear();
                Panel2.Visible = false;
                Panel1.Visible = true;
                lblmsg.Visible = false;
                if (ddlBusScale.SelectedIndex != 0 && ddlCMM.SelectedIndex != 0 && ddlDept.SelectedIndex != 0)
                {
                    string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();                     
                    string sql = "select k.name from knowledge k where k.kid in(select c.kid from contributions c where c.nid in(select k.nid from nuggets k where k.nid in (select m.nid from nugget_maturity m, cover c, fields f, nugget_size s where m.nid = c.nid and c.fid = f.fid and s.nid = m.nid and m.maturity = :CMM and f.department = :dept and S.NUGGETSIZE = :Scale)))";
                    //using (var con = new SqlConnection())
                    //using (var da = new SqlDataAdapter(sql, con))
                    OracleConnection con = new OracleConnection(connectionString);
                    //{
                        con.Open();
                        using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                        {
                            try
                            {
                                da.SelectCommand.Parameters.AddWithValue("dept", ddlDept.SelectedValue);
                                da.SelectCommand.Parameters.AddWithValue("CMM", ddlCMM.SelectedValue);
                                da.SelectCommand.Parameters.AddWithValue("Scale", ddlBusScale.SelectedValue);
                                // other parameters
                                DataTable table = new DataTable();
                                da.Fill(table);
                                DataRow dr = table.NewRow();
                                dr[0] = "--Select--";
                                table.Rows.InsertAt(dr, 0);
                                ddlExistKnowledge.DataSource = table;
                                ddlExistKnowledge.DataTextField = "Name";
                                ddlExistKnowledge.DataValueField = "Name";
                                ddlExistKnowledge.DataBind();
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

        protected void btnAddKnw_Click(object sender, EventArgs e)
        {
            //if (ListBox1.SelectedIndex != 0)
            //{
                ListBox2.DataTextField = ListBox1.DataTextField;
                ListBox2.DataValueField = ListBox1.DataValueField;
                ListBox2.Items.Add(ListBox1.SelectedItem);
                
                ListBox1.Items.Remove(ListBox1.SelectedItem);
            //}
        }

        protected void btnRemoveKnw_Click(object sender, EventArgs e)
        {            
            ListBox1.Items.Add(ListBox2.SelectedItem);
            ListBox2.Items.Remove(ListBox2.SelectedItem);
        }

        protected void btnEditKnowledge_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                string sql = "SELECT n.name, n.nid FROM nuggets n WHERE n.nid IN (SELECT c.nid FROM contributions c WHERE c.kid IN (SELECT k.kid FROM knowledge k WHERE k.name = :knowledge))";
                string sql2 = "SELECT k.name, k.nid FROM nuggets k WHERE k.nid IN (SELECT m.nid FROM nugget_maturity m, cover c, fields f, nugget_size s WHERE m.nid = c.nid AND c.fid = f.fid AND s.nid = m.nid AND m.maturity = :CMM AND f.department = :dept AND S.NUGGETSIZE = :Scale) MINUS (SELECT n.name, n.nid FROM nuggets n WHERE n.nid IN (SELECT c.nid FROM contributions c WHERE c.kid IN (SELECT k.kid FROM knowledge k WHERE k.name = :knowledge)))";
                //using (var da = new SqlDataAdapter(sql, con))
                OracleConnection con = new OracleConnection(connectionString);
                //{
                con.Open();
                using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                {
                    da.SelectCommand.Parameters.AddWithValue("knowledge", ddlExistKnowledge.SelectedValue);
                    // other parameters
                    DataTable table = new DataTable();
                    da.Fill(table);
                    ListBox2.DataSource = table;
                    ListBox2.DataTextField = "Name";
                    ListBox2.DataValueField = "nid";
                    ListBox2.DataBind();
                }
                using (OracleDataAdapter da2 = new OracleDataAdapter(sql2, con))
                {
                    da2.SelectCommand.Parameters.AddWithValue("dept", ddlDept.SelectedValue);
                    da2.SelectCommand.Parameters.AddWithValue("CMM", ddlCMM.SelectedValue);
                    da2.SelectCommand.Parameters.AddWithValue("Scale", ddlBusScale.SelectedValue);
                    da2.SelectCommand.Parameters.AddWithValue("knowledge", ddlExistKnowledge.SelectedValue);
                    // other parameters
                    DataTable table = new DataTable();
                    da2.Fill(table);
                    ListBox1.DataSource = table;
                    ListBox1.DataTextField = "Name";
                    ListBox1.DataValueField = "nid";
                    ListBox1.DataBind();
                }
                con.Close();
                Panel2.Visible = true;
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnCreateNewKnw_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                string sql = "SELECT k.nid, k.name FROM nuggets k WHERE k.nid IN (SELECT m.nid FROM nugget_maturity m, cover c, fields f, nugget_size s WHERE m.nid = c.nid AND c.fid = f.fid AND s.nid = m.nid AND m.maturity = :CMM AND f.department = :dept AND S.NUGGETSIZE = :Scale)";
                //string sql2 = "SELECT k.name FROM nuggets k WHERE k.nid IN (SELECT m.nid FROM nugget_maturity m, cover c, fields f, nugget_size s WHERE m.nid = c.nid AND c.fid = f.fid AND s.nid = m.nid AND m.maturity = :CMM AND f.department = :dept AND S.NUGGETSIZE = :Scale) MINUS (SELECT n.name FROM nuggets n WHERE n.nid IN (SELECT c.nid FROM contributions c WHERE c.kid IN (SELECT k.kid FROM knowledge k WHERE k.name = :knowledge)))";
                
                OracleConnection con = new OracleConnection(connectionString);
                //{
                con.Open();
                using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                {
                    da.SelectCommand.Parameters.AddWithValue("dept", ddlDept.SelectedValue);
                    da.SelectCommand.Parameters.AddWithValue("CMM", ddlCMM.SelectedValue);
                    da.SelectCommand.Parameters.AddWithValue("Scale", ddlBusScale.SelectedValue);
                    // other parameters
                    DataTable table = new DataTable();
                    da.Fill(table);
                    ListBox1.DataSource = table;
                    ListBox1.DataTextField = "name";
                    ListBox1.DataValueField = "nid";
                    ListBox1.DataBind();
                    con.Close();
                    Panel2.Visible = true;
                    Panel1.Visible = false;
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void btnCreateKnowledge_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                OracleConnection con = new OracleConnection(connectionString);
                con.Open();
                OracleCommand cmd = new OracleCommand("create_knowledge", con);
                cmd.CommandType = CommandType.StoredProcedure;
                OracleParameter inval = new OracleParameter("this_name", OracleType.VarChar);
                inval.Direction = ParameterDirection.Input;
                inval.Value = txtKnowledge.Text;
                OracleParameter inval2 = new OracleParameter("this_startdate", OracleType.DateTime);
                inval2.Direction = ParameterDirection.Input;
                inval2.Value = System.DateTime.Now;
                OracleParameter inval3 = new OracleParameter("this_enddate", OracleType.DateTime);
                inval3.Direction = ParameterDirection.Input;
                inval3.Value = System.DateTime.Now.AddYears(4);
                OracleParameter inval4 = new OracleParameter("this_kid", OracleType.VarChar);
                inval4.Direction = ParameterDirection.Output;
                inval4.Size = 20;
                cmd.Parameters.Add(inval);
                cmd.Parameters.Add(inval2);
                cmd.Parameters.Add(inval3);
                cmd.Parameters.Add(inval4);
                cmd.ExecuteNonQuery();
                string kid = cmd.Parameters[3].Value.ToString();
                string nugId = string.Empty;
                for (int i = 0; i < ListBox2.Items.Count; i++ )
                {
                    string name = ListBox2.Items[i].ToString();
                    //string connectionString2 = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                    string sql = "select nid from nuggets where name = :nugname";
                    OracleConnection con2 = new OracleConnection(connectionString);
                //{
                con2.Open();
                using (OracleDataAdapter da = new OracleDataAdapter(sql, con2))
                {
                    da.SelectCommand.Parameters.AddWithValue(":nugname", name);
                    // other parameters
                    DataTable table = new DataTable();
                    da.Fill(table);
                    nugId = table.Rows[0][0].ToString();
                    con2.Close();
                }
                    OracleCommand cmd2 = new OracleCommand("create_contribution", con);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    OracleParameter inpval5 = new OracleParameter("this_kid", OracleType.VarChar);
                    inpval5.Direction = ParameterDirection.Input;
                    inpval5.Value = kid;
                    OracleParameter invpal6 = new OracleParameter("this_nid", OracleType.VarChar);
                    invpal6.Direction = ParameterDirection.Input;
                    invpal6.Value = nugId.ToString();
                    cmd2.Parameters.Add(inpval5);
                    cmd2.Parameters.Add(invpal6);
                    cmd2.ExecuteNonQuery();
                }
                con.Close();
                lblmsg.Visible = true;
                Panel2.Visible = false;
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