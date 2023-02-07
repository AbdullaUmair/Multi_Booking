using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Multi_Booking
{
    public partial class Book_Multi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            promo_updateBtn.Enabled = false;
            promo_updateBtn.CssClass = "btn btn-secondary";
          
            promo_delBtn.Enabled = false;
            promo_delBtn.CssClass = "btn btn-secondary";

            txtPromo_Id.Enabled = false;
        }

        protected void promo_addBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-MDRSSPS;Initial Catalog=MultiStep_Form;Integrated Security=true");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into promotion_master(promo_Code,promo_tax) values(@promo_Code,@promo_tax)", con);

                cmd.Parameters.AddWithValue("@promo_Code", txtPromo.Text);
                cmd.Parameters.AddWithValue("@promo_tax", txtpromo_Tax.Text);
               
                cmd.ExecuteNonQuery();
                con.Close();

                string message = "PromoCode Added Successfully";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }

        protected void promo_updateBtn_Click(object sender, EventArgs e)
        {
            string query = "UPDATE promotion_master SET promo_Code =@promo_Code,promo_tax=@promo_tax WHERE Promo_Id =@Promo_Id";
            string constr = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Promo_Id", txtPromo_Id.Text);
                    cmd.Parameters.AddWithValue("@promo_Code", txtPromo.Text);
                    cmd.Parameters.AddWithValue("@promo_tax", txtpromo_Tax.Text);
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    string message = "promoCode Updated Successfully";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += Request.Url.AbsoluteUri;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
        }

        protected void promo_delBtn_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
            string query = "DELETE FROM promotion_master WHERE Promo_Id=@Promo_Id";
          
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@Promo_Id", txtPromo_Id.Text);
                    cmd.Parameters.AddWithValue("@promo_Code", txtPromo.Text);
                    cmd.Parameters.AddWithValue("@promo_tax", txtpromo_Tax.Text);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    string message = "PromoCode deleted successfully Successfully";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += Request.Url.AbsoluteUri;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtPromo_Id.Text = row.Cells[1].Text;
            txtPromo.Text = row.Cells[2].Text;
            txtpromo_Tax.Text = row.Cells[3].Text;


            promo_updateBtn.Enabled = true;
            promo_updateBtn.CssClass= "btn btn-primary";
            promo_delBtn.Enabled = true;
            promo_delBtn.CssClass= "btn btn-primary";
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            txtPromo.Text ="" ;
            txtpromo_Tax.Text="" ;
            txtPromo_Id.Text = "";
        }
    }
    }
