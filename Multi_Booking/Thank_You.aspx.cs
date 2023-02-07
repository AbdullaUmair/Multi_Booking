using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Multi_Booking
{
    public partial class Thank_You : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Multi_Booking lastPage = (Multi_Booking)Context.Handler;

                //lblCurrentDate.Text = lastPage.today_date;
                //lblfname.Text = lastPage.Name;
                //lblLname.Text = lastPage.lName;
                //lblCheckin.Text = lastPage.cIn;
                //lblCheckout.Text = lastPage.cout;
                //lblRoom.Text = lastPage.room_num;
                //lblAdult.Text = lastPage.adult;
                //lblChild.Text = lastPage.child;
                //lblMobile.Text = lastPage.mobile_num;
                //lblEmail.Text = lastPage.mail;
                //lblAddress.Text = lastPage.address_detail;

                


            }


        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Multi_Booking.aspx");
        }
    }
}