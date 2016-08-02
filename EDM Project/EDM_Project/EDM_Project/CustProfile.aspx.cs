using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
using System.Web.Configuration;
using System.Threading;

namespace EDM_Project
{
    public partial class CustProfile : System.Web.UI.Page
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
                    string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                    string sql = "SELECT fname, lname,	cname, cmpsize,	phone, email FROM clients WHERE cid = :cid";
                    string sql2 = "SELECT k.name, k.price, p.startdate FROM clients c, buy b, knowledge k, payments p WHERE c.cid = b.cid AND b.kid = k.kid and k.kid = p.kid and p.cid = c.cid AND c.cid = :cid";

                    OracleConnection con = new OracleConnection(connectionString);
                    //{
                    con.Open();
                    if (!IsPostBack)
                    {
                        using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                        {
                            da.SelectCommand.Parameters.AddWithValue("cid", Session["CID"].ToString());
                            // other parameters
                            DataTable table = new DataTable();
                            da.Fill(table);
                            txtFName.Text = table.Rows[0][0].ToString();
                            txtLName.Text = table.Rows[0][1].ToString();
                            txtEMail.Text = table.Rows[0][5].ToString();
                            txtPhone.Text = table.Rows[0][4].ToString();
                            txtSize.Text = table.Rows[0][3].ToString();
                            txtCustID.Text = Session["CID"].ToString();
                        }
                    }
                    using (OracleDataAdapter da = new OracleDataAdapter(sql2, con))
                    {
                        da.SelectCommand.Parameters.AddWithValue("cid", Session["CID"].ToString());
                        // other parameters
                        DataTable table = new DataTable();
                        da.Fill(table);
                        GridView1.DataSource = table;
                        GridView1.DataBind();
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnEditCancel_Click(object sender, EventArgs e)
        {
            int click = 0;
            if (btnEditCancel.Text.Equals("Edit") && click==0)
            {
                txtFName.Enabled = true;
                txtLName.Enabled = true;
                txtEMail.Enabled = true;
                txtPhone.Enabled = true;
                txtSize.Enabled = true;
                btnSave.Visible = true;
                btnEditCancel.Text = "Cancel";
                click = 1;
            }
            if (btnEditCancel.Text.Equals("Cancel") && click==0)
            {
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtEMail.Enabled = false;
                txtPhone.Enabled = false;
                btnSave.Visible = false;
                txtSize.Enabled = false;
                btnEditCancel.Text = "Edit";
                click = 1;
            }
        }


        public void editInfo()
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                OracleConnection con = new OracleConnection(connectionString);
                con.Open();
                OracleCommand cmd = new OracleCommand("UPDATE_CLIENTS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                OracleParameter inval = new OracleParameter("pfname", OracleType.VarChar);
                inval.Direction = ParameterDirection.Input;
                inval.Value = txtFName.Text;
                OracleParameter inval2 = new OracleParameter("plname", OracleType.VarChar);
                inval2.Direction = ParameterDirection.Input;
                inval2.Value = txtLName.Text;
                OracleParameter inval3 = new OracleParameter("pcmpsize", OracleType.VarChar);
                inval3.Direction = ParameterDirection.Input;
                inval3.Value = txtSize.Text;
                OracleParameter inval4 = new OracleParameter("pphone", OracleType.VarChar);
                inval4.Direction = ParameterDirection.Input;
                inval4.Value = txtPhone.Text;
                OracleParameter inval5 = new OracleParameter("pemail", OracleType.VarChar);
                inval5.Direction = ParameterDirection.Input;
                inval5.Value = txtEMail.Text;
                OracleParameter inval6 = new OracleParameter("pCID", OracleType.VarChar);
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
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtEMail.Enabled = false;
                txtPhone.Enabled = false;
                btnSave.Visible = false;
                txtSize.Enabled = false;
                btnEditCancel.Text = "Edit";
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Thread newThread = new Thread(editInfo);
            //newThread.Start();
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                OracleConnection con = new OracleConnection(connectionString);
                con.Open();
                OracleCommand cmd = new OracleCommand("UPDATE_CLIENTS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                OracleParameter inval = new OracleParameter("pfname", OracleType.VarChar);
                inval.Direction = ParameterDirection.Input;
                inval.Value = txtFName.Text;
                OracleParameter inval2 = new OracleParameter("plname", OracleType.VarChar);
                inval2.Direction = ParameterDirection.Input;
                inval2.Value = txtLName.Text;
                OracleParameter inval3 = new OracleParameter("pcmpsize", OracleType.VarChar);
                inval3.Direction = ParameterDirection.Input;
                inval3.Value = txtSize.Text;
                OracleParameter inval4 = new OracleParameter("pphone", OracleType.VarChar);
                inval4.Direction = ParameterDirection.Input;
                inval4.Value = txtPhone.Text;
                OracleParameter inval5 = new OracleParameter("pemail", OracleType.VarChar);
                inval5.Direction = ParameterDirection.Input;
                inval5.Value = txtEMail.Text;
                OracleParameter inval6 = new OracleParameter("pCID", OracleType.VarChar);
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
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtEMail.Enabled = false;
                txtPhone.Enabled = false;
                btnSave.Visible = false;
                txtSize.Enabled = false;
                btnEditCancel.Text = "Edit";
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