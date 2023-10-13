using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LongMeter
{
    public partial class WebForm4 : System.Web.UI.Page
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
            seller_id.Text = "111";
            if (Session["User_id"]!=null)
            {
            seller_id.Text = Session["User_id"].ToString();
            }
            else
            {
                Response.Write("<script>window.alert(\"請先登入\");</script>");
                Response.Write("<script> window.location.href ='Home.aspx';</script>");
            }
        }
    }
}