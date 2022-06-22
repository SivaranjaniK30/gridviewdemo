using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication8
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        string connectionstring = @"Data Source = SIVARANJANIK;Initial Catalog =HR; Integrated Security = true";

        protected void Page_Load(object sender, EventArgs e)
        {
            /*  string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
              using (SqlConnection con = new SqlConnection(cs))
              {
                  con.Open();
                  SqlCommand cmd = new SqlCommand("Select * from employees", con);

              }*/
            using (SqlConnection sqlconn = new SqlConnection(connectionstring))
            {
                sqlconn.Open();
                SqlDataAdapter sqldatas = new SqlDataAdapter("select * from employees", sqlconn);
                DataTable tab = new DataTable();
                sqldatas.Fill(tab);
                gvemp.DataSource = tab;
                gvemp.DataBind();
            }

            Response.Write(System.Threading.Thread.CurrentThread.CurrentCulture.ToString());

        }
        //onclick
        protected void linkselect_click(object sender, EventArgs e)
        {
            int employee_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
        }
        //rowdatabound
        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt32(e.Row.Cells[10].Text) == 1 || Convert.ToInt32(e.Row.Cells[10].Text) == 2 || Convert.ToInt32(e.Row.Cells[10].Text) == 3 || Convert.ToInt32(e.Row.Cells[10].Text) == 4)
                {
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-IN");
                }
                else if (Convert.ToInt32(e.Row.Cells[10].Text) == 5 || Convert.ToInt32(e.Row.Cells[10].Text) == 6 || Convert.ToInt32(e.Row.Cells[10].Text) == 7)
                {
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
                }
                else if (Convert.ToInt32(e.Row.Cells[10].Text) == 8 || Convert.ToInt32(e.Row.Cells[10].Text) == 9)
                {
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-GB");
                }
                else
                {
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-MY");
                }


            }
        }
        /*  protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
          {
              if (e.Row.RowType == DataControlRowType.DataRow)
              {
                  if (Convert.ToInt32(e.Row.Cells[10].Text) == 1 )
                  {
                      System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-IN");
                  }
                  else if (Convert.ToInt32(e.Row.Cells[10].Text) == 2 )
                  {
                      System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
                  }
                  else if (Convert.ToInt32(e.Row.Cells[10].Text) == 3)
                  {
                      System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-GB");
                  }
                  else if (Convert.ToInt32(e.Row.Cells[10].Text) == 4)
                  {
                      System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-MY");
                  }

              }
              
    }*/
}
}