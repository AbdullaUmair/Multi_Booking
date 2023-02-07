<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Thank_You.aspx.cs" Inherits="Multi_Booking.Thank_You" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thanking You</title>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="StyleSheet.css"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>
    td, th { border: 1px solid }
    .auto-style1 {
        height: 22px;
    }
    .auto-style2 {
        width: 283px;
    }
    .auto-style3 {
        height: 22px;
        width: 283px;
    }
</style>
</head>
<body style="background-color:#062639">
    <form id="form1" runat="server">
        <div class="container mt-5" style="width: 60%; height: 349px">
            <h4 class="text-center" style="color:#ffb701!important">Thank you for Booking with us</h4>
            <h3 class="text-center text-white">Booking Details</h3>  
            <div class="row">

                <div class="col-lg-6">
                    <table class="table table-responsive border bg-white" style="padding:0;margin:0;">
  
  <tbody>
    <tr>
      <th class="auto-style2">Booking Date:</th>
         
      <td>
          <asp:Label ID="lblCurrentDate" runat="server" Text=""></asp:Label></td>
      
    </tr>
    <tr>
     <th class="auto-style2">First Name</th>
      <td>
          <asp:Label ID="lblfname" runat="server" Text=""></asp:Label>

      </td>

      
    </tr>
    <tr>
      <th scope="row" class="auto-style3">Last Name</th>
     
      <td class="auto-style1">
          <asp:Label ID="lblLname" runat="server" Text=""></asp:Label></td>
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Check In</th>
      <td>
          <asp:Label ID="lblCheckin" runat="server" Text=""></asp:Label></td>
      
    </tr>
     
      <tr>
      <th scope="row" class="auto-style2">Check Out</th>
      <td>
          <asp:Label ID="lblCheckout" runat="server" Text=""></asp:Label></td>
      
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Selected Room</th>
      <td>
          <asp:Label ID="lblRoom" runat="server" Text=""></asp:Label></td>
      
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Selected Room</th>
      <td>
          <asp:Label ID="lblroomtype" runat="server" Text=""></asp:Label></td>
     
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Adults</th>
      <td>
          <asp:Label ID="lblAdult" runat="server" Text=""></asp:Label></td>
      
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Child</th>
      <td>
          <asp:Label ID="lblChild" runat="server" Text=""></asp:Label></td>
      
    </tr>
    
  </tbody>
</table>
                    
                </div>

                <div class="col-lg-6">

                      <table class="table table-responsive border bg-white" style="padding:0;margin:0;">
  
  <tbody>
     <tr>
      <th scope="row" class="auto-style2">Mobile Number</th>
      <td> <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label></td>
      
    </tr>
        <tr>
      <th scope="row" class="auto-style2">Email_Id</th>
      <td>
          <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
      
    </tr>
       <tr>
      <th scope="row" class="auto-style2">Address</th>
      <td>
          <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></td>
      
    </tr>
    <tr>
     <th class="auto-style2">Room Price</th>
      <td>
          <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

      </td>

      
    </tr>
    <tr>
      <th scope="row" class="auto-style3">Tax</th>
     
      <td class="auto-style1">
          <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Facility Price</th>
      <td>
          <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
      
    </tr>
     
      <tr>
      <th scope="row" class="auto-style2">Promo Applied</th>
      <td>
          <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
      
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Discount</th>
      <td>
          <asp:Label ID="Label6" runat="server" Text=""></asp:Label></td>
      
    </tr>
      <tr>
      <th scope="row" class="auto-style2">Total</th>
      <td>
          <asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>
     
    </tr>
      
     
      
       
       
  </tbody>

</table>
<div class="d-flex justify-content-center align-items-center mt-3 mb-5">
                        <asp:LinkButton ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" CssClass="btn btn-warning">Back to home</asp:LinkButton>
                    </div>

                </div>


            </div>
        </div>
       
    </form>
</body>
</html>
