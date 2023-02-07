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
    public partial class ExtraFacilities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            facility_updateBtn.Enabled = false;
            facility_updateBtn.CssClass = "btn btn-secondary";
            facility_delBtn.Enabled = false;
            facility_delBtn.CssClass = "btn btn-secondary";


            txtFacility_Id.Enabled = false;

        }


        protected void facility_AddBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-MDRSSPS;Initial Catalog=MultiStep_Form;Integrated Security=true");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into facilityDetails_Master(facility_Type,facility_Cost) values(@facility_Type,@facility_Cost)", con);

                cmd.Parameters.AddWithValue("@facility_Type", txtFacility_type.Text);
                cmd.Parameters.AddWithValue("@facility_Cost", txtfacility_Cost.Text);

                cmd.ExecuteNonQuery();
                con.Close();

                string message = "Facility Added Successfully";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }

        protected void facility_updateBtn_Click(object sender, EventArgs e)
        {
            string query = "UPDATE facilityDetails_Master SET facility_Type =@facility_Type, facility_Cost =@facility_Cost WHERE facility_Id =@facility_Id";
            string constr = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@facility_Id", txtFacility_Id.Text);
                    cmd.Parameters.AddWithValue("@facility_Type", txtFacility_type.Text);
                    cmd.Parameters.AddWithValue("@facility_Cost", txtfacility_Cost.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    string message = "Facility Data updated Successfully";
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

        protected void facility_delBtn_Click(object sender, EventArgs e)
        {
            string query = "DELETE FROM facilityDetails_Master WHERE facility_Id=@facility_Id";
            string constr = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@facility_Id", txtFacility_Id.Text);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    string message = "Facility data deleted successfully Successfully";
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

        protected void facility_clearBtn_Click(object sender, EventArgs e)
        {
            txtFacility_Id.Text="";
            txtFacility_type.Text="";
            txtfacility_Cost.Text="";

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtFacility_Id.Text = row.Cells[1].Text;
            txtFacility_type.Text = row.Cells[2].Text;
            txtfacility_Cost.Text = row.Cells[3].Text;
           


            facility_updateBtn.Enabled = true;
            facility_updateBtn.CssClass = "btn btn-primary";
           
            facility_delBtn.Enabled = true;
            facility_delBtn.CssClass = "btn btn-primary";

        }
    }
}