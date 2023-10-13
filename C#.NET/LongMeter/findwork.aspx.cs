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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            

        }

        protected void Apply_Click(object sender, EventArgs e)
        {
            System.DateTime currentTime = System.DateTime.Now;

            string Date= currentTime.ToString("yyyyMMdd");

            string Gen="", kind="";

            if (Gender.Text == "男")
                Gen = "M";
            else if (Gender.Text == "女")
                Gen = "G";

            if (workind.Text == "大卡車司機")
                kind = "truck";
            else if (workind.Text == "堆高機師傅")
                kind = "Stacker";
            else if (workind.Text == "怪手師傅")
                kind = "Excavator";


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
            con.Open();

            string query = "SELECT TOP (1) * FROM [LongMeter_DataPlus].[dbo].[AdWorker] ORDER BY Worker_id DESC";
            SqlDataAdapter sqlData = new SqlDataAdapter(query, con);
            DataTable Data = new DataTable();
            sqlData.Fill(Data);

            //firstName.Text = Data.Rows[0][0].ToString();

            query = $@"INSERT INTO AdWorker(first_name, last_name, Gender, Work_kind, Phone, Salary, payment, start_date, days,email) 
            VALUES('{firstName.Text}', '{lastName.Text}', '{Gen}', '{kind}', {Phone.Text}, {Salary.Text}, '{Salary.Text}', {Date}, {day.Text},'{email.Text}')";

            SqlCommand com = new SqlCommand(query, con);
            com.ExecuteNonQuery();
            //int.Parse(Data.Rows[0][0].ToString());
        }
    }
}