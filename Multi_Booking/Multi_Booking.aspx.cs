using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Multi_Booking
{
    public partial class Multi_Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
            txtbpentrydate.Text = DateTime.Today.ToString("dd-MM-yyyy");

            txtFacility.Text = txtRoomFacilityPrice.Text;
            roomTaxtxt.Text = txtTaxPrice.Text;
            roomPricetxt.Text = txtRoomPrice.Text;
            totalAmount.Text = txtTotal.Text;

            if (!IsPostBack)
            {
                txtRoom.Text = "1";
                txtChild.Text = "0";
                txtAdult.Text = "1";
               





            }

            if (!IsPostBack)
            {
                discountList.Items.Add(new ListItem("--Select Promo Code--", ""));
                discountList.AppendDataBoundItems = true;
                String strConnString = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
                String strQuery = "select promo_Code, Promo_Id from promotion_master";
                SqlConnection con = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery;
                cmd.Connection = con;
                try 
                {
                    con.Open();
                    discountList.DataSource = cmd.ExecuteReader();
                    discountList.DataTextField = "promo_Code";
                    discountList.DataValueField = "Promo_Id";
                    discountList.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }

        }
   
        protected void Wizard1_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizard1.WizardSteps;
            SideBarList.DataBind();

        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }
            int stepIndex = Wizard1.WizardSteps.IndexOf(step);

            if (stepIndex < Wizard1.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizard1.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }


        protected void Wizard1_FinishButtonClick1(object sender, WizardNavigationEventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-MDRSSPS;Initial Catalog=MultiStep_Form;Integrated Security=True");
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Mutli_stepform(check_in,check_out,adult,child,select_room,select_rooms,first_name,last_name,email,address,post_code,phone,credit_card,cvv,name_cc,expired) values(@check_in,@check_out,@adult,@child,@select_room,@select_rooms,@first_name,@last_name,@email,@address,@post_code,@phone,@credit_card,@cvv,@name_cc,@expired)", con);
                cmd.Parameters.AddWithValue("@check_in", check_in.Text);
                cmd.Parameters.AddWithValue("@check_out", check_out.Text);
                cmd.Parameters.AddWithValue("@adult",txtAdult.Text);
                cmd.Parameters.AddWithValue("@child",txtChild.Text);
                cmd.Parameters.AddWithValue("@select_room",txtRoom.Text);
                cmd.Parameters.AddWithValue("@select_rooms", txtRoomPrice.Text);
                cmd.Parameters.AddWithValue("@first_name", fname.Text);
                cmd.Parameters.AddWithValue("@last_name", lname.Text);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@address", address.Text);
                cmd.Parameters.AddWithValue("@post_code", postCode.Text);
                cmd.Parameters.AddWithValue("@phone", phone.Text);
                cmd.Parameters.AddWithValue("@credit_card", TextBox9.Text);
                cmd.Parameters.AddWithValue("@cvv", TextBox10.Text);
                cmd.Parameters.AddWithValue("@name_cc", creditName.Text);
                cmd.Parameters.AddWithValue("@expired", expDate.Text);
                cmd.ExecuteNonQuery();
                con.Close();

             


                string message = "Booking Done Successfully";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                Response.Redirect("Thank_You.aspx?last_name=" + lname.Text + "&first_name=" + fname.Text + "&Booking=" + txtbpentrydate.Text + "&check_in=" + check_in.Text + "&check_out=" + check_out.Text + "&phone=" + phone.Text );
                Server.Transfer("Thank_You.aspx");
               

            }
        }


        public string today_date
        {
            get
            {
                return txtbpentrydate.Text;
            }
        }

     

        public string Name
        {
            get
            {
                return fname.Text;
            }
        }

        public string lName
        {
            get
            {
                return lname.Text;
            }
        }
        public string cIn
        {
            get
            {
                return check_in.Text;
            }
        }

        public string cout
        {
            get
            {
                return check_out.Text;
            }
        }

        public string room_num
        {
            get
            {
                return txtRoom.Text;
            }
        }
        public string child
        {
            get
            {
                return txtChild.Text;
            }
        }
        public string adult
        {
            get
            {
                return txtAdult.Text;
            }
        }
        public string mobile_num
        {
            get
            {
                return phone.Text;
            }
        }
        public string mail
        {
            get
            {
                return email.Text;
            }
        }

        public string address_detail
        {
            get
            {
                return address.Text;
            }
        }

        protected void adultDecrement_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtAdult.Text) > 0)
            {
                txtAdult.Text = (int.Parse(txtAdult.Text) - 1).ToString();
                lblAdultCount.Text = txtAdult.Text;
            }
        }

        protected void adultIncrement_Click(object sender, EventArgs e)
        {
            txtAdult.Text = (int.Parse(txtAdult.Text) + 1).ToString();
            lblAdultCount.Text = txtAdult.Text;
        }

        protected void roomDecrementBtn_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtRoom.Text) > 0)
            {
                txtRoom.Text = (int.Parse(txtRoom.Text) - 1).ToString();
                lblNoRoom.Text = txtRoom.Text;
            }
        }

        protected void roomIncrementBtn_Click(object sender, EventArgs e)
        {
            txtRoom.Text = (int.Parse(txtRoom.Text) + 1).ToString();
            lblNoRoom.Text = txtRoom.Text;
        }

        protected void childDecrementBtn_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtChild.Text) > 0)
            {
                txtChild.Text = (int.Parse(txtChild.Text) - 1).ToString();
                lblChildCount.Text = txtChild.Text;
            }
        }

        protected void childIncrementBtn_Click(object sender, EventArgs e)
        {
            txtChild.Text = (int.Parse(txtChild.Text) + 1).ToString();
            lblChildCount.Text = txtChild.Text;
        }

        

        protected void GetSelectedRecord(object sender, EventArgs e)
        {
            CheckBox chk = sender as CheckBox;
            GridViewRow row = (GridViewRow)(chk.NamingContainer);
            int index = row.RowIndex;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (i != index)
                    ((CheckBox)GridView1.Rows[i].FindControl("roomCheck")).Checked = false;
            }
            if (chk.Checked)
            {
                txtRoomPrice.Text = row.Cells[2].Text;
                txtTaxPrice.Text = row.Cells[3].Text;


                double serviceTax = Convert.ToDouble(row.Cells[3].Text.Trim());
                double amount = Convert.ToDouble(row.Cells[2].Text.Trim());
                double total = ((serviceTax * amount) / 100);
                double sum = (amount + total);
                txtTaxPrice.Text = total.ToString();
                txtTotal.Text = sum.ToString();

            }
            else
            {
               
                txtRoomPrice.Text = string.Empty;
                txtTaxPrice.Text = string.Empty;
                txtTotal.Text = string.Empty;
            }
        }

   

        protected void GetFacilityRecord(object sender, EventArgs e)
        {


            decimal total = 0;
            foreach (GridViewRow gvrow in grdv.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("facilityCheck");
                int facilityPrice = Convert.ToInt32(gvrow.Cells[2].Text);
                if (chk != null & chk.Checked)
                {
                  total = total + facilityPrice;
               txtRoomFacilityPrice.Text = total.ToString();
               double amt = Convert.ToDouble(txtRoomFacilityPrice.Text);
               double ttotal = Convert.ToDouble(txtRoomPrice.Text);
               double txtotal = Convert.ToDouble(txtTaxPrice.Text);
                double gtotal = amt + ttotal + txtotal;
                    txtTotal.Text = gtotal.ToString();

                }

               
               
            }

            

        }

        
      


        protected void check_out_TextChanged(object sender, EventArgs e)
        {
            DateTime FromDate = Convert.ToDateTime(check_in.Text);
            DateTime ToDate = Convert.ToDateTime(check_out.Text);

          
            TimeSpan objTimeSpan = ToDate - FromDate;
         
            int Years = ToDate.Year - FromDate.Year;
           
            int month = ToDate.Month - FromDate.Month;
         
            double Days = Convert.ToDouble(objTimeSpan.TotalDays);
        

         

            lblDuration.Text = Convert.ToString(Days);
        }

        protected void discountList_SelectedIndexChanged(object sender, EventArgs e)
        {
            String strConnString = ConfigurationManager.ConnectionStrings["MultiStep_FormConnectionString"].ConnectionString;
            String strQuery = "select promo_tax from promotion_master where" +
                              " Promo_Id = @Promo_Id";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@Promo_Id", discountList.SelectedItem.Value);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    txtDiscount.Text = sdr[0].ToString();
                }

                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
            double amt = Convert.ToDouble(totalAmount.Text);
            double disc = Convert.ToDouble(txtDiscount.Text);
            double afterDiscount = amt - (amt * disc / 100);

            totalAmount.Text = afterDiscount.ToString();

           
        }
    }
}