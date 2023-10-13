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
    public partial class Home : System.Web.UI.Page
    {
        
        protected int page = 0;
        protected void Page1(object sender, EventArgs e)
        {
            Session["page"]=btnPage1.Text;
        } 
        protected void Page2(object sender, EventArgs e)
        {
            Session["page"] = btnPage2.Text;
        } 
        protected void Page3(object sender, EventArgs e)
        {
            Session["page"] = btnPage3.Text;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id"] != null)
            {
                Member_id.Text = Session["User_id"].ToString();
            }
            if (Session["page"] !=null)
            {
                page = int.Parse(Session["page"].ToString());
            }
            //////////////////////////////頁面輸出//////////////////////////////
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
            con.Open();

            string query = $@"SELECT [Machine_id],Machines.[category_id],Categories.[category_id],[description],[AdM_id],Machines.[location_id],Locations.[location_id],Locations.[location]
	                              ,Locations.[country_id],Countrys.[country_id],Countrys.[country],[price],[payment],[title],[condition]
                                  FROM Machines,Categories,Locations,Countrys
                                  WHERE Categories.[category_id]=Machines.[category_id]
                                  AND Machines.[location_id]=Locations.[location_id]
                                  AND Locations.[country_id]=Countrys.[country_id]
                                  ORDER BY Machine_id DESC";
            SqlDataAdapter sqlData = new SqlDataAdapter(query, con);
            DataTable Data1 = new DataTable();
            sqlData.Fill(Data1);

            query = $@"SELECT [Worker_id],[first_name],[last_name],[Gender],[Work_kind],[Phone]
                       ,[Salary],[payment],[start_date],[days],[email]
                       FROM [LongMeter_DataPlus].[dbo].[AdWorker]";
            sqlData = new SqlDataAdapter(query, con);
            DataTable Data2 = new DataTable();
            sqlData.Fill(Data2);

            Random random = new Random();
            int person = 0;
            random.Next(0, 3);
            string[] Machine_id = new string[6];


            productTitle1.Text = Data1.Rows[page][13].ToString();
            Price1.Text = "$NT : " + Data1.Rows[page][11].ToString();
            Machine1.Text = "機器ID : " + Data1.Rows[page][0].ToString();
            Machine_id[0] = Data1.Rows[page][0].ToString();
            Country1.Text = "國家 : " + Data1.Rows[page][10].ToString();
            Location1.Text = "地址 : " + Data1.Rows[page][7].ToString();
            payment1.Text = "支付方法 : " + Data1.Rows[page][12].ToString();

            productTitle2.Text = Data1.Rows[page + 1][13].ToString();
            Price2.Text = "$NT : " + Data1.Rows[page + 1][11].ToString();
            Machine2.Text = "機器ID : " + Data1.Rows[page + 1][0].ToString();
            Machine_id[1] = Data1.Rows[page + 1][0].ToString();
            Country2.Text = "國家 : " + Data1.Rows[page + 1][10].ToString();
            Location2.Text = "地址 : " + Data1.Rows[page + 1][7].ToString();
            payment2.Text = "支付方法 : " + Data1.Rows[page + 1][12].ToString();

            productTitle3.Text = Data1.Rows[page + 2][13].ToString();
            Price3.Text = "$NT : " + Data1.Rows[page + 2][11].ToString();
            Machine3.Text = "機器ID : " + Data1.Rows[page + 2][0].ToString();
            Machine_id[2] = Data1.Rows[page + 2][0].ToString();
            Country3.Text = "國家 : " + Data1.Rows[page + 2][10].ToString();
            Location3.Text = "地址 : " + Data1.Rows[page + 2][7].ToString();
            payment3.Text = "支付方法 : " + Data1.Rows[page + 2][12].ToString();

            productTitle4.Text = Data1.Rows[page + 3][13].ToString();
            Price4.Text = "$NT : " + Data1.Rows[page + 3][11].ToString();
            Machine4.Text = "機器ID : " + Data1.Rows[page + 3][0].ToString();
            Machine_id[3] = Data1.Rows[page + 3][0].ToString();
            Country4.Text = "國家 : " + Data1.Rows[page + 3][10].ToString();
            Location4.Text = "地址 : " + Data1.Rows[page + 3][7].ToString();
            payment4.Text = "支付方法 : " + Data1.Rows[page + 3][12].ToString();

            if (random.Next(0, 2) > 0)
            {
                if (!Page.ClientScript.IsStartupScriptRegistered("ad"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ad", $"workerAd(true)", true);
                }
                workerName.Text = "求職者 : " + Data2.Rows[person][2].ToString();
                Salary.Text = "$NT : " + Data2.Rows[person][6].ToString() + "/hr";
                Work.Text = "工作 : " + Data2.Rows[person][4].ToString();
                if (Data2.Rows[person][3].ToString() == "M")
                    Gender.Text = "性別 : 男";
                else
                    Gender.Text = "性別 : 女";
                Phone.Text = "電話 : 0" + Data2.Rows[person][5].ToString();
                email.Text = Data2.Rows[person][10].ToString();
                payMethod.Text = "支付方法 : " + Data2.Rows[person][7].ToString();

                ///////////////////////// product////////////////////////
                productTitle6.Text = Data1.Rows[page + 4][13].ToString();
                Price6.Text = "$NT : " + Data1.Rows[page + 4][11].ToString();
                Machine6.Text = "機器ID : " + Data1.Rows[page + 4][0].ToString();
                Machine_id[5] = Data1.Rows[page + 4][0].ToString();
                Country6.Text = "國家 : " + Data1.Rows[page + 4][10].ToString();
                Location6.Text = "地址 : " + Data1.Rows[page + 4][7].ToString();
                payment6.Text = "支付方法 : " + Data1.Rows[page + 4][12].ToString();

                query = $@"SELECT
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[0]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[1]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[2]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[3]} AND buyer_id IS NULL AND [status]='open'),                    
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[5]} AND buyer_id IS NULL AND [status]='open');";
                sqlData = new SqlDataAdapter(query, con);
                Data1 = new DataTable();
                sqlData.Fill(Data1);

                sellC1.Text = Data1.Rows[0][0].ToString();
                sellC2.Text = Data1.Rows[0][1].ToString();
                sellC3.Text = Data1.Rows[0][2].ToString();
                sellC4.Text = Data1.Rows[0][3].ToString();
                sellC6.Text = Data1.Rows[0][4].ToString();
            }
            else
            {
                if (!Page.ClientScript.IsStartupScriptRegistered("adN"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "adN", $"workerAd(false)", true);
                }

                productTitle5.Text = Data1.Rows[page + 4][13].ToString();
                Price5.Text = "$NT : " + Data1.Rows[page + 4][11].ToString();
                Machine5.Text = "機器ID : " + Data1.Rows[page + 4][0].ToString();
                Machine_id[4] = Data1.Rows[page + 4][0].ToString();
                Country5.Text = "國家 : " + Data1.Rows[page + 4][10].ToString();
                Location5.Text = "地址 : " + Data1.Rows[page + 4][7].ToString();
                payment5.Text = "支付方法 : " + Data1.Rows[page + 4][12].ToString();

                productTitle6.Text = Data1.Rows[page + 5][13].ToString();
                Price6.Text = "$NT : " + Data1.Rows[page + 5][11].ToString();
                Machine6.Text = "機器ID : " + Data1.Rows[page + 5][0].ToString();
                Machine_id[5] = Data1.Rows[page + 5][0].ToString();
                Country6.Text = "國家 : " + Data1.Rows[page + 5][10].ToString();
                Location6.Text = "地址 : " + Data1.Rows[page + 5][7].ToString();
                payment6.Text = "支付方法 : " + Data1.Rows[page + 5][12].ToString();

                query = $@"SELECT
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[0]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[1]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[2]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[3]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[4]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[5]} AND buyer_id IS NULL AND [status]='open');";
                sqlData = new SqlDataAdapter(query, con);
                Data1 = new DataTable();
                sqlData.Fill(Data1);

                sellC1.Text = Data1.Rows[0][0].ToString();
                sellC2.Text = Data1.Rows[0][1].ToString();
                sellC3.Text = Data1.Rows[0][2].ToString();
                sellC4.Text = Data1.Rows[0][3].ToString();
                sellC5.Text = Data1.Rows[0][4].ToString();
                sellC6.Text = Data1.Rows[0][5].ToString();
            }


        }
        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
            con.Open();

            string query = $"SELECT count(*) from Membership where Account = '{Account.Text}' AND Password = '{Password.Text}'";
            SqlDataAdapter sqlData = new SqlDataAdapter(query, con);
            DataTable Data = new DataTable();
            sqlData.Fill(Data);

            if (int.Parse(Data.Rows[0][0].ToString()) >= 1 || Session["User_id"] != null)
            {
                Response.Write("<script>window.alert(\"登入成功\");</script>");
                query = $"SELECT Member_id,Account FROM Membership WHERE Account = '{Account.Text}'";
                sqlData = new SqlDataAdapter(query, con);
                Data = new DataTable();
                sqlData.Fill(Data);
                Session["User_id"] = Data.Rows[0][0].ToString();
                Member_id.Text = Session["User_id"].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "adN", $"workerAd(false)", false);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ad", $"workerAd(true)", false);
                if (!Page.ClientScript.IsStartupScriptRegistered("login"))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "login", "diplay(\"Login\");", true);
                }
            }
            else
            {
                Response.Write("<script>window.alert(\"帳號或密碼錯誤\");</script>");
            }
        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.alert(\"登出\");</script>");
            Session.Remove("User_id");
            Member_id.Text = "";
            if (!Page.ClientScript.IsStartupScriptRegistered("logout"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "login", "diplay(\"Login\");", true);
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            //Response.Write($"<script>window.alert(\"{SearchText.Text.Trim()}\");</script>");
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connect"].ToString());
            con.Open();
            string query = "";
            SqlDataAdapter sqlData;
            DataTable Data1 = new DataTable();
            DataTable Data2 = new DataTable();
            Random random = new Random();


            if (SearchText.Text != "")
            {
                if (kind.SelectedValue == "title")
                {
                    query = $@"SELECT [Machine_id],Machines.[category_id],Categories.[category_id],[description],
                              [AdM_id],Machines.[location_id],Locations.[location_id],Locations.[location],
	                          Locations.[country_id],Countrys.[country_id],Countrys.[country],[price],[payment],[title],[condition]
                              FROM Machines,Categories,Locations,Countrys
                              WHERE Categories.[category_id]=Machines.[category_id]
                              AND Machines.[location_id]=Locations.[location_id]
                              AND Locations.[country_id]=Countrys.[country_id]
                              AND (Machines.title LIKE '%{SearchText.Text.Trim()}%')
                              ORDER BY Machine_id DESC";
                }
                else if (kind.SelectedValue == "category")
                {
                    query = $@"SELECT [Machine_id],Machines.[category_id],Categories.[category_id],[description],
                              [AdM_id],Machines.[location_id],Locations.[location_id],Locations.[location],
	                          Locations.[country_id],Countrys.[country_id],Countrys.[country],[price],[payment],[title],[condition]
                              FROM Machines,Categories,Locations,Countrys
                              WHERE Categories.[category_id]=Machines.[category_id]
                              AND Machines.[location_id]=Locations.[location_id]
                              AND Locations.[country_id]=Countrys.[country_id]
                              AND (description LIKE '%{SearchText.Text.Trim()}%')
                              ORDER BY Machine_id DESC";
                }
                else if (kind.SelectedValue == "country")
                {
                    query = $@"SELECT [Machine_id],Machines.[category_id],Categories.[category_id],[description],
                              [AdM_id],Machines.[location_id],Locations.[location_id],Locations.[location],
	                          Locations.[country_id],Countrys.[country_id],Countrys.[country],[price],[payment],[title],[condition]
                              FROM Machines,Categories,Locations,Countrys
                              WHERE Categories.[category_id]=Machines.[category_id]
                              AND Machines.[location_id]=Locations.[location_id]
                              AND Locations.[country_id]=Countrys.[country_id]
                              AND (Countrys.[country] LIKE '%{SearchText.Text.Trim()}%')
                              ORDER BY Machine_id DESC";
                }
                else if (kind.SelectedValue == "payment")
                {
                    query = $@"SELECT [Machine_id],Machines.[category_id],Categories.[category_id],[description],
                              [AdM_id],Machines.[location_id],Locations.[location_id],Locations.[location],
	                          Locations.[country_id],Countrys.[country_id],Countrys.[country],[price],[payment],[title],[condition]
                              FROM Machines,Categories,Locations,Countrys
                              WHERE Categories.[category_id]=Machines.[category_id]
                              AND Machines.[location_id]=Locations.[location_id]
                              AND Locations.[country_id]=Countrys.[country_id]
                              AND ([payment] LIKE '%{SearchText.Text.Trim()}%')
                              ORDER BY Machine_id DESC";
                }
                else
                {
                    Response.Write($"<script>window.alert(\"請選擇篩選值\");</script>");
                }

                sqlData = new SqlDataAdapter(query, con);
                Data1 = new DataTable();
                sqlData.Fill(Data1);

                if (Data1.Rows.Count > 0)
                {
                    query = $@"SELECT [Worker_id],[first_name],[last_name],[Gender],[Work_kind],[Phone]
                       ,[Salary],[payment],[start_date],[days],[email]
                       FROM [LongMeter_DataPlus].[dbo].[AdWorker]";
                    sqlData = new SqlDataAdapter(query, con);
                    Data2 = new DataTable();
                    sqlData.Fill(Data2);

                    string[] Machine_id = new string[6];

                    productTitle1.Text = Data1.Rows[page][13].ToString();
                    Price1.Text = "$NT : " + Data1.Rows[page][11].ToString();
                    Machine1.Text = "機器ID : " + Data1.Rows[page][0].ToString();
                    Machine_id[0] = Data1.Rows[page][0].ToString();
                    Country1.Text = "國家 : " + Data1.Rows[page][10].ToString();
                    Location1.Text = "地址 : " + Data1.Rows[page][7].ToString();
                    payment1.Text = "支付方法 : " + Data1.Rows[page][12].ToString();

                    productTitle2.Text = Data1.Rows[page + 1][13].ToString();
                    Price2.Text = "$NT : " + Data1.Rows[page + 1][11].ToString();
                    Machine2.Text = "機器ID : " + Data1.Rows[page + 1][0].ToString();
                    Machine_id[1] = Data1.Rows[page + 1][0].ToString();
                    Country2.Text = "國家 : " + Data1.Rows[page + 1][10].ToString();
                    Location2.Text = "地址 : " + Data1.Rows[page + 1][7].ToString();
                    payment2.Text = "支付方法 : " + Data1.Rows[page + 1][12].ToString();

                    productTitle3.Text = Data1.Rows[page + 2][13].ToString();
                    Price3.Text = "$NT : " + Data1.Rows[page + 2][11].ToString();
                    Machine3.Text = "機器ID : " + Data1.Rows[page + 2][0].ToString();
                    Machine_id[2] = Data1.Rows[page + 2][0].ToString();
                    Country3.Text = "國家 : " + Data1.Rows[page + 2][10].ToString();
                    Location3.Text = "地址 : " + Data1.Rows[page + 2][7].ToString();
                    payment3.Text = "支付方法 : " + Data1.Rows[page + 2][12].ToString();

                    productTitle4.Text = Data1.Rows[page + 3][13].ToString();
                    Price4.Text = "$NT : " + Data1.Rows[page + 3][11].ToString();
                    Machine4.Text = "機器ID : " + Data1.Rows[page + 3][0].ToString();
                    Machine_id[3] = Data1.Rows[page + 3][0].ToString();
                    Country4.Text = "國家 : " + Data1.Rows[page + 3][10].ToString();
                    Location4.Text = "地址 : " + Data1.Rows[page + 3][7].ToString();
                    payment4.Text = "支付方法 : " + Data1.Rows[page + 3][12].ToString();                  

                    productTitle5.Text = Data1.Rows[page + 4][13].ToString();
                    Price5.Text = "$NT : " + Data1.Rows[page + 4][11].ToString();
                    Machine5.Text = "機器ID : " + Data1.Rows[page + 4][0].ToString();
                    Machine_id[4] = Data1.Rows[page + 4][0].ToString();
                    Country5.Text = "國家 : " + Data1.Rows[page + 4][10].ToString();
                    Location5.Text = "地址 : " + Data1.Rows[page + 4][7].ToString();
                    payment5.Text = "支付方法 : " + Data1.Rows[page + 4][12].ToString();

                    productTitle6.Text = Data1.Rows[page + 5][13].ToString();
                    Price6.Text = "$NT : " + Data1.Rows[page + 5][11].ToString();
                    Machine6.Text = "機器ID : " + Data1.Rows[page + 5][0].ToString();
                    Machine_id[5] = Data1.Rows[page + 5][0].ToString();
                    Country6.Text = "國家 : " + Data1.Rows[page + 5][10].ToString();
                    Location6.Text = "地址 : " + Data1.Rows[page + 5][7].ToString();
                    payment6.Text = "支付方法 : " + Data1.Rows[page + 5][12].ToString();

                    query = $@"SELECT
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[0]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[1]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[2]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[3]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[4]} AND buyer_id IS NULL AND [status]='open'),
                     (SELECT COUNT([Machine_id]) FROM [LongMeter_DataPlus].[dbo].[Orders] WHERE  [Machine_id]={Machine_id[5]} AND buyer_id IS NULL AND [status]='open');";
                    sqlData = new SqlDataAdapter(query, con);
                    Data1 = new DataTable();
                    sqlData.Fill(Data1);

                    sellC1.Text = Data1.Rows[0][0].ToString();
                    sellC2.Text = Data1.Rows[0][1].ToString();
                    sellC3.Text = Data1.Rows[0][2].ToString();
                    sellC4.Text = Data1.Rows[0][3].ToString();
                    sellC5.Text = Data1.Rows[0][4].ToString();
                    sellC6.Text = Data1.Rows[0][5].ToString();

                }
                else
                {
                    Response.Write("<script>window.alert(\"無查詢值\");</script>");
                }
            }
            else
            {
                Response.Write("<script>window.alert(\"請輸入搜尋值\");</script>");
            }
        }
    }
}
