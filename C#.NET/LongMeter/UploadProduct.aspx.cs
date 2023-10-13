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
    public partial class UploadProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_Click(object sender, EventArgs e)
        {
            int machine_id, country_id, location_id, category_id;
            int AdM_id = 0;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
            con.Open();
            string query = $"SELECT country_id FROM Countrys WHERE country = '{Country.Text}'";
            SqlDataAdapter sqlData = new SqlDataAdapter(query, con);
            DataTable Data = new DataTable();
            sqlData.Fill(Data);

            country_id = int.Parse(Data.Rows[0][0].ToString());

            query = $"SELECT TOP (1) * FROM [LongMeter_DataPlus].[dbo].[locations] ORDER BY location_id DESC";
            sqlData = new SqlDataAdapter(query, con);
            Data = new DataTable();
            sqlData.Fill(Data);

            location_id = int.Parse(Data.Rows[0][0].ToString()) + 1;

            query = $"SELECT TOP (1) * FROM [LongMeter_DataPlus].[dbo].[Machines] ORDER BY Machine_id DESC";
            sqlData = new SqlDataAdapter(query, con);
            Data = new DataTable();
            sqlData.Fill(Data);

            machine_id = int.Parse(Data.Rows[0][0].ToString()) + 1;

            query = $"SELECT category_id FROM Categories WHERE description = '{Category.Text}'";
            sqlData = new SqlDataAdapter(query, con);
            Data = new DataTable();
            sqlData.Fill(Data);

            category_id = int.Parse(Data.Rows[0][0].ToString());

            query = $"INSERT INTO Locations (country_id,location) VALUES({country_id},'{address.Text}')";

            SqlCommand com = new SqlCommand(query, con);
            com.ExecuteNonQuery();

            if (AdM_id != 0)
                query = $"INSERT INTO Machines (Machine_id,category_id,AdM_id,location_id,price,payment,title,condition) VALUES({machine_id},{category_id},{AdM_id},{location_id},{int.Parse(Price.Text)},'{payment.Text}','{productName.Text}',5)";
            else
                query = $"INSERT INTO Machines (Machine_id,category_id,location_id,price,payment,title,condition) VALUES({machine_id},{category_id},{location_id},{int.Parse(Price.Text)},'{payment.Text}','{productName.Text}',5)";

            com = new SqlCommand(query, con);
            com.ExecuteNonQuery();
            country_id = int.Parse(Data.Rows[0][0].ToString());


        }
    }
}