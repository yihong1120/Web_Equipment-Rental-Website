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
    public partial class payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PaymentP_Click(object sender, EventArgs e)
        {
            if (Session["User_id"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
                con.Open();
                string Member_id = Session["User_id"].ToString();
                string query = $"INSERT INTO [LongMeter_DataPlus].[dbo].[Orders] ([Machine_id], [seller_id], [buyer_id], [Create_date], [Deal_price],[status]) VALUES (100000, 1, {Member_id}, 20210108, 2000, 'open')";

                SqlCommand com = new SqlCommand(query, con);

                com.ExecuteNonQuery();
            }
            else
            {
                Response.Write("<script>window.alert(\"請先登入\");</script>");
                Response.Write("<script> window.location.href ='Home.aspx';</script>");
            }


        }
    }
}