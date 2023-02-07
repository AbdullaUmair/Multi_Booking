using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Multi_Booking
{
    public partial class admin_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            updateBtn.Enabled = false;
            updateBtn.CssClass = "btn btn-secondary";
            delBtn.Enabled = false;
            delBtn.CssClass = "btn btn-secondary";
            txtId.Enabled = false;

        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-MDRSSPS;Initial Catalog=MultiStep_Form;Integrated Security=true");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into roomtTyepe_master(room_Type,amount,tax) values(@room_Type,@amount,@tax)", con);

                cmd.Parameters.AddWithValue("@room_Type", txtroom_type.Text);
                cmd.Parameters.AddWithValue("@amount", txtPrice.Text);
                cmd.Parameters.AddWithValue("@tax", txtTax.Text);

                cmd.ExecuteNonQuery();
                con.Close();

                string message = "Room Type Added Successfully";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                GridViewRow row = GridView1.SelectedRow;
                txtId.Text= row.Cells[1].Text;
                txtroom_type.Text = row.Cells[2].Text;
                txtPrice.Text = row.Cells[3].Text;
                txtTax.Text = row.Cells[4].Text;

            updateBtn.Enabled = true;
            updateBtn.CssClass = "btn btn-primary";
            delBtn.Enabled = true;
            delBtn.CssClass = "btn btn-primary";
        }

       

        protected void updateBtn_Click(object sender, EventArgs e)
        {

            string query = "UPDATE roomtTyepe_master SET room_type =@room_type, amount =@amount,tax=@tax WHERE roomType_Id =@roomType_Id";
            string constr = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@roomType_Id", txtId.Text);
                    cmd.Parameters.AddWithValue("@room_type", txtroom_type.Text);
                    cmd.Parameters.AddWithValue("@amount", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@tax", txtTax.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    string message = "Room Data updated Successfully";
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

        protected void delBtn_Click(object sender, EventArgs e)
        {
            string query = "DELETE FROM roomtTyepe_master WHERE roomType_Id=@roomType_Id";
            string constr = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@roomType_Id", txtId.Text);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    string message = "Room data deleted successfully Successfully";
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

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            txtroom_type.Text = "";
            txtPrice.Text = "";
            txtTax.Text = "";
        }
    }
}
  