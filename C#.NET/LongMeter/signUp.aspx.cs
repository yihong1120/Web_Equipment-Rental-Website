using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace LongMeter
{
    public partial class signUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Apply_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
            //SqlConnection con = new SqlConnection(LMGlobalClass.connect_string);
            // 可自行訂立
            con.Open();


            string query = "SELECT TOP (1) * FROM [LongMeter_DataPlus].[dbo].[Machines] ORDER BY Machine_id DESC";

            SqlDataAdapter sqlData = new SqlDataAdapter(query, con);
            DataTable Data = new DataTable();
            sqlData.Fill(Data);

            int Member_id = int.Parse(Data.Rows[0][0].ToString()) + 1;

            query = $"INSERT INTO [LongMeter_DataPlus].[dbo].[Membership] ([Member_id], [first_name], [last_name], [email], [Phone], [Address], [Account], [Password]) VALUES ({Member_id}, '{firstName.Text}', '{lastName.Text}', '{email.Text}', {int.Parse(Phone.Text)}, '{address.Text}', '{Account.Text}', '{password.Text}')";


            SqlCommand com = new SqlCommand(query, con);

            com.ExecuteNonQuery();

            //firstName.Text=Data.Rows[0][0].ToString();
            //lastName.Text = Data.Rows[0][1].ToString();
            //Account.Text = Data.Rows[0][7].ToString();
            //password.Text = Data.Rows[0][8].ToString();
            //Phone.Text = "0" + Data.Rows[0][2].ToString();
            //email.Text = Data.Rows[0][3].ToString();
            //address.Text = Data.Rows[0][4].ToString();

        }
    }
}