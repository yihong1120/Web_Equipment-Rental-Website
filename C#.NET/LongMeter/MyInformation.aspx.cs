using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LongMeter
{
    public partial class MyInformation : System.Web.UI.Page
    {

        public string[] Information = new string[7];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//如果不是用PostBack回來的話
            {
                if (Session["User_id"] != null)
                {
                    string Member_id = Session["User_id"].ToString();
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
                    con.Open();

                    string query = $"SELECT  * FROM [LongMeter_DataPlus].[dbo].[Membership] WHERE Member_id={100000}";

                    SqlDataAdapter sqlData = new SqlDataAdapter(query, con);
                    DataTable Data = new DataTable();
                    sqlData.Fill(Data);

                    firstNameM.Text = Data.Rows[0][1].ToString();
                    lastNameM.Text = Data.Rows[0][2].ToString();
                    AccountM.Text = Data.Rows[0][6].ToString();
                    passwordM.Text = Data.Rows[0][7].ToString();
                    PhoneM.Text = "0" + Data.Rows[0][4].ToString();
                    emailM.Text = Data.Rows[0][3].ToString();
                    addressM.Text = Data.Rows[0][5].ToString();
                }
                else
                {
                    firstNameM.Text = "尚未登入";
                    lastNameM.Text = "尚未登入";
                    AccountM.Text = "尚未登入";
                    passwordM.Text = "尚未登入";
                }
            }
        }

        protected void Modify_Click(object sender, EventArgs e)
        {            
            Information[0] = firstNameM.Text.Trim(); Information[1] = lastNameM.Text.Trim(); Information[2] = AccountM.Text.Trim();
            Information[3] = passwordM.Text.Trim(); Information[4] = PhoneM.Text.Trim(); Information[5] = emailM.Text.Trim(); Information[6] = addressM.Text.Trim();
            string Member_id = Session["User_id"].ToString();
            if (Session["User_id"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
                con.Open();
                string query = $@"UPDATE Membership 
                                  SET first_name = '{Information[0]}', last_name = '{Information[1]}', email = '{Information[5]}', Phone ={Information[4]}, Address = '{Information[6]}', Account = '{Information[2]}', Password = '{Information[3]}'
                                  WHERE[Member_id] = {Member_id}";

                SqlCommand com = new SqlCommand(query, con);

                com.ExecuteNonQuery();

                Response.Write("<script>window.alert(\"修改成功\");</script>");
            }
            else
                Response.Write("<script>window.alert(\"請先登入\");</script>");
            Response.Write("<script> window.location.href ='Home.aspx';</script>");
        }
    }
}