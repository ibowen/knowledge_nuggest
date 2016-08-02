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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtboxPassword.Text) || string.IsNullOrEmpty(txtboxUser.Text))
                {
                    Label1.Visible = true;
                }
                else
                {
                    Label1.Visible = false;
                    string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString2"].ToString();
                    string sql = "select password, role, cid from login where username = :username";
                    //using (var con = new SqlConnection())
                    //using (var da = new SqlDataAdapter(sql, con))
                    OracleConnection con = new OracleConnection(connectionString);
                    //{
                    con.Open();
                    using (OracleDataAdapter da = new OracleDataAdapter(sql, con))
                    {
                        da.SelectCommand.Parameters.AddWithValue("username", txtboxUser.Text.Trim().ToString());
                        // other parameters
                        DataTable table = new DataTable();
                        da.Fill(table);
                        if (table != null)
                        {
                            if (table.Rows[0][0].ToString().Equals(txtboxPassword.Text))
                            {
                                if (table.Rows[0][1].ToString().Equals("1") && ddlRole.SelectedValue.Equals("1"))
                                {
                                    Session["CID"] = table.Rows[0][2].ToString();
                                    Session["USER"] = txtboxUser.Text.Trim().ToString();
                                    Response.Redirect("CustProfile.aspx");
                                }
                                if (table.Rows[0][1].ToString().Equals("0") && ddlRole.SelectedValue.Equals("0"))
                                {
                                    Session["CID"] = table.Rows[0][2].ToString();
                                    Session["USER"] = txtboxUser.Text.Trim().ToString();
                                    Response.Redirect("Default.aspx");
                                }
                            }
                        }
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}