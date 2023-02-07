<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostBack="true" CodeBehind="Multi_Booking.aspx.cs" Inherits="Multi_Booking.Multi_Booking"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server">
 <title>Hotel Booking</title>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
     
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <link rel="stylesheet" href="StyleSheet.css"/>
   
    <style>
        input[type="datetime-local"]::-webkit-calendar-picker-indicator
  
    {
        color: white!important;
      

    }


 .wrapper{
  
  width: 120px;
  height:40px;
  display: flex;
  align-items: center;
  justify-content: center;
  background:#ffff;
  border-radius: 20px!important;
  box-shadow: 0 5px 10px rgba(0,0,0,0.2);
}
.wrapper .btnDesign{
  width: 100%;
  height:40px;
  text-align: center;
  font-size: 20px;
  font-weight: 600;
  cursor: pointer;
  user-select: none;
  color:black;
  padding:3px;
  
}
.wrapper .num{
  font-size: 20px;
 
  pointer-events: none;
}
.hotelTitle{

    position:absolute;
    left:50%;
    top:60%;
    transform:translate(-50%,-50%);
    font-size:50px;
   
   
}
.header-img{

    background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('../pictures/Hotel.jpg');
    width:100%;
    height:80vh
}

input[type="checkbox"]  {
    display: inline!important;
    width:100px;
}
ul.breadcrumb {
  padding: 50px;
  list-style: none;
  background-color: #eee;
  margin-bottom:0!important;
}
ul.breadcrumb li {
  display: inline;
  font-size: 18px;
}
ul.breadcrumb li+li:before {
  padding: 8px;
  color: black;
  content: "/\00a0";
}
ul.breadcrumb li a {
  color: #0275d8;
  text-decoration: none;
}
ul.breadcrumb li a:hover {
  color: #01447e;
  text-decoration: underline;
}
 .line{
     border: 1px solid;
 }
 .bg-img{
     background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)),url('../img/breadcrumbBg.jpg');
     width:100%;
     height:150px;
 }
    
 .textb_design{

     border-radius:15px;
     background-color:white;
 }
 
 
 </style>
   
      
     


    
</head>
<body>
  

    <form id="form1" runat="server">
 <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
               <div class="container-fluid ">
               <div class="row">
         <ul class="breadcrumb bg-img">
    <li><a href="#" class="text-white">Home</a></li>
    <li><a href="#" class="text-white">Hotel Booking</a></li>
 
</ul>


  </div>
 
               </div>

       
       <%-- <asp:UpdatePanel runat="server">
            <ContentTemplate>--%>
                 <div class="content">
             <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="false" FinishCompleteButtonText="Book Now" StartNextButtonText="Select Rooms" StepNextButtonText="Select Next" OnFinishButtonClick="Wizard1_FinishButtonClick1" ActiveStepIndex="4">
                 <StartNextButtonStyle Font-Bold="True" Font-Size="Larger" Height="50px" Width="130px" />
                 <StepNextButtonStyle Font-Bold="True" Width="130px" />
           <WizardSteps>
               <asp:WizardStep ID="WizardStep1" runat="server" Title="1.Select Dates">
                 <div class="tab mt-5 mb-5">
                   <div class="row">
                        <div class="col-lg-8">
                            <div class="row ">
                                <div class="col">
                                Booking Date :<asp:TextBox ID="txtbpentrydate" class=" labelform labelform2 mt-1 text-white" runat="server" ReadOnly="true"></asp:TextBox>

</div>
  <div class="col text-white">
      <asp:Label ID="Label1" runat="server" Text="Label" CssClass="labelname">Check In:</asp:Label>
      <asp:TextBox ID="check_in" runat="server" type="date" class=" labelform labelform2 mt-1 text-white"></asp:TextBox>  
      
  </div>
  <div class="col">
      <asp:Label ID="Label2" runat="server" Text="Label" CssClass="labelname">Check Out:</asp:Label>
     <asp:TextBox ID="check_out" runat="server" type="date"  AutoPostBack="True" class=" labelform labelform2 mt-1 text-white" OnTextChanged="check_out_TextChanged"></asp:TextBox>



      </div>

<div class="row mt-5">

         <div class="col-lg-4">
        <asp:Label ID="Label4" runat="server" Text="Label" CssClass="labelname">No of Rooms:</asp:Label>  
  
     
          <div class="wrapper mt-3">
         <asp:Button ID="roomDecrementBtn" runat="server" Text="-" CssClass="btnDesign" OnClick="roomDecrementBtn_Click" />
       <asp:TextBox ID="txtRoom" runat="server"  CssClass="btnDesign" >0</asp:TextBox>
        <asp:Button ID="roomIncrementBtn" runat="server" Text="+" CssClass="btnDesign" OnClick="roomIncrementBtn_Click"  />   
       </div>
              
       
       
   
  </div>
  
    <div class="col-lg-4">
        <asp:Label ID="Label3" runat="server" Text="Label" CssClass="labelname">No of Adults:</asp:Label>  
   
         
          <div class="wrapper mt-3">
        <asp:Button ID="adultDecrement" runat="server" Text="-" CssClass="btnDesign" OnClick="adultDecrement_Click"/>
       <asp:TextBox ID="txtAdult" runat="server"  CssClass="btnDesign">0</asp:TextBox>
        <asp:Button ID="adultIncrement" runat="server" Text="+" CssClass="btnDesign" OnClick="adultIncrement_Click"/>
       </div>
             
        
        
        
        
    </div>


     <div class="col-lg-4">
        <asp:Label ID="Label15" runat="server" Text="Label" CssClass="labelname">No of Child:</asp:Label>  
  
         
          
          <div class="wrapper mt-3">
       <asp:Button ID="childDecrementBtn" runat="server" Text="-" CssClass="btnDesign" OnClick="childDecrementBtn_Click" />
       <asp:TextBox ID="txtChild" runat="server"  CssClass="btnDesign">0</asp:TextBox>
        <asp:Button ID="childIncrementBtn" runat="server" Text="+" CssClass="btnDesign" OnClick="childIncrementBtn_Click" />
       </div>
         
         
        
    </div>
</div>

                              </div>
<div class="row mt-4 ">
<%--<div class="col ">
    <asp:Label ID="Label3" runat="server" Text="Label" CssClass="labelname ">No of Rooms:</asp:Label>
   <%-- <asp:DropDownList ID="DropDownList1" CssClass="labelform labelform2 form-control  mt-1" runat="server">
        <asp:ListItem>1 Rooms</asp:ListItem>
        <asp:ListItem>2 Rooms</asp:ListItem>
        <asp:ListItem>3 Rooms</asp:ListItem>

    </asp:DropDownList>
    <asp:Button ID="btnMinus" runat="server" OnClick="OnMinus"
    Style="font-weight: 700; font-size: x-large ; width:15%;" Text="-" />

<asp:Button ID="btnPlus" runat="server" OnClick="OnPlus"
    Style="font-size: x-large;width:15%" Text="+" />

    </div>
<%--    <div class="col">
    <asp:Label ID="Label4" runat="server" Text="Label" CssClass="labelname ">No of Adult's:</asp:Label>
    <asp:Button ID="Button1" runat="server" OnClick="OnMinu"
    Style="font-weight: 700; font-size: x-large ; width:15%;" Text="-" />
<asp:TextBox ID="TextBox13" runat="server" Width="80px" CssClass="text-center"></asp:TextBox>
<asp:Button ID="Button2" runat="server" OnClick="OnPlu"
    Style="font-size: x-large;width:15%" Text="+" />
        <br />
         <asp:Label ID="Label15" runat="server" Text="Label" CssClass="labelname mt-3">No of Child's:</asp:Label>
    <asp:Button ID="Button3" runat="server" OnClick="OnMin"
    Style="font-weight: 700; font-size: x-large ; width:15%;" Text="-" CssClass="mt-3" />
<asp:TextBox ID="TextBox14" runat="server" Width="80px" CssClass="text-center mt-3 "></asp:TextBox>
<asp:Button ID="Button4" runat="server" OnClick="OnPl"
    Style="font-size: x-large;width:15%" Text="+"  CssClass="mt-3"/>
            </div>--%>

   
    </div>
 <%-- <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-secondary float-end mt-3" OnClick="LinkButton1_Click" >Select Room</asp:LinkButton>--%>

                        </div>
                        <div class="col-lg-4">
                              
<table class="table-dark border m-3" cellspacing="25px" cellpadding="10px">
  <tbody>
    <tr class="table-dark">
      <th scope="row" class="line">Duration</th>
      <td class="line">
          <asp:Label ID="lblDuration" runat="server" Text=""></asp:Label><span>/Night</span>
             </td>

   
    </tr>
    <tr>
      <th scope="row" class="line">No Of Rooms</th>
      <td>
          <asp:Label ID="lblNoRoom" runat="server" Text="1"></asp:Label></td>
     
    </tr>
    <tr>
      <th scope="row" class="line">Adult</th>
     
      <td class="line">
          <asp:Label ID="lblAdultCount" runat="server" Text="1"></asp:Label></td>
    </tr>
      <tr>
      <th scope="row" class="line">Child</th>
     
      <td class="line">
          <asp:Label ID="lblChildCount" runat="server" Text="0"></asp:Label></td>
    </tr>
     
  </tbody>
</table>
                        </div>

                    </div>
          
                </div>
               </asp:WizardStep>
               <asp:WizardStep ID="WizardStep2" runat="server" Title="2.Select Room">
                  <div class="tab mb-5 mt-2" >
                
     <div class="container">

         <div class="row">
          

            <div class="col-lg-4 col-md-4 col-12 p-0">
 
                      <h5 class="">Select Rooms</h5><hr style="width:20%;"/>
                          
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="1" CssClass="mt-1" DataSourceID="SqlDataSource2" GridLines="Horizontal"  ItemType="center" >
                              <AlternatingRowStyle BackColor="#F7F7F7" />
                              <Columns>
                                  <asp:TemplateField>
                                      <ItemTemplate>
                                          <asp:CheckBox ID="roomCheck" runat="server" OnCheckedChanged="GetSelectedRecord" AutoPostBack="true" />
                                      </ItemTemplate>
                                      
                                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  </asp:TemplateField>
                                  <asp:BoundField DataField="room_Type" HeaderText="Type" SortExpression="room_Type">
                                  <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                  <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="amount" HeaderText="Price (INR)" SortExpression="amount">
                                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  </asp:BoundField>
                                  <asp:BoundField DataField="tax" HeaderText="Tax (%)" SortExpression="tax">
                                  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  </asp:BoundField>
                              </Columns>
                              <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                              <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                              <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                              <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                              <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                              <SortedAscendingCellStyle BackColor="#F4F4FD" />
                              <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                              <SortedDescendingCellStyle BackColor="#D8D8F0" />
                              <SortedDescendingHeaderStyle BackColor="#3E3277" />
                          </asp:GridView>
                          
                     <div>                              
                     </div>            
                 </div>   
               

           
            <div class="col-lg-4 col-md-4 col-12 p-0">
                   <h5 class="">Extra Facilities</h5><hr style="width:20%;"/>
                     
                     <asp:GridView ID="grdv" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="1" DataKeyNames="facility_Id" DataSourceID="SqlDataSource3" GridLines="Horizontal" Width="292px">
                         <AlternatingRowStyle BackColor="#F7F7F7" />
                         <Columns>
                             <asp:TemplateField HeaderText="" ShowHeader="False"  >
                                 
                                 <ItemTemplate>
                                 <%--    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>--%>
                                  
                                     <asp:CheckBox ID="facilityCheck" runat="server"  OnCheckedChanged="GetFacilityRecord" AutoPostBack="true"/>
                                     
                                 </ItemTemplate>
                                 <HeaderStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                                 <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle"/>
                             </asp:TemplateField>
                             <asp:BoundField DataField="facility_Type" HeaderText="Type" SortExpression="facility_Type">
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
                             </asp:BoundField>
                             <asp:BoundField DataField="facility_Cost" HeaderText="Price (INR)" SortExpression="facility_Cost">
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                             </asp:BoundField>
                         </Columns>
                         <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                         <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                         <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                         <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                         <SortedAscendingCellStyle BackColor="#F4F4FD" />
                         <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                         <SortedDescendingCellStyle BackColor="#D8D8F0" />
                         <SortedDescendingHeaderStyle BackColor="#3E3277" />
                     </asp:GridView>
              
                    
            </div>

                
             <div class="col-lg-4 col-md-4 col-12 p-0">
                 <div class="row mt-5">
                     <div class="col-lg-6">
<asp:Label ID="lblPriceRoom" runat="server" Text="Price"></asp:Label>
               <asp:TextBox ID="txtRoomPrice" runat="server" cssClass="textb_design" Enabled="false"></asp:TextBox>
</div>
                 <div class="col-lg-6">
 <asp:Label ID="lblRoomTax" runat="server" Text="Tax"></asp:Label>
               <asp:TextBox ID="txtTaxPrice" runat="server" cssClass="textb_design" Enabled="false"></asp:TextBox>

</div>
                     <div class="col-lg-6">
    <asp:Label ID="lblFacilitycharge" runat="server" Text="Extra Charge"></asp:Label>
                  <asp:TextBox ID="txtRoomFacilityPrice" runat="server" cssClass="textb_design" Enabled="false"></asp:TextBox>

</div>
                     <div class="col-lg-6">
 <asp:Label ID="lblGrandTotal" runat="server" Text="Total"></asp:Label>
                  <asp:TextBox ID="txtTotal" runat="server" cssClass="textb_design" Enabled="false" ></asp:TextBox>

</div>

                 </div>



             </div>

                </div>           
     </div>






 </div>



               </asp:WizardStep>
               <asp:WizardStep ID="WizardStep3" runat="server" Title="3.Contact Details">
                  <%-- Detail tab start --%>
                <div class="tab mt-4 mb-5">
                    <div class="container">
                    <div class="row mt-2">

                    <div class="col-lg-6 col-md-6 col-12">
                    <asp:Label ID="Label5" runat="server" Text="Label" CssClass="labelname">First Name:</asp:Label>
                    <asp:TextBox ID="fname" runat="server" CssClass="labelform labelform2" placeholder="Enter  Your First Name"></asp:TextBox>
        
                        </div>
                    <div class="col-lg-6 col-md-6 col-12">
                        <asp:Label ID="Label6" runat="server" Text="Label" CssClass="labelname">Last Name:</asp:Label>
                        <asp:TextBox ID="lname" runat="server"  CssClass="labelform labelform2"  placeholder="Enter  Your Last Name" ></asp:TextBox>
     
                        </div>

                    <div class="col-lg-6 col-md-12 col-12">
                         <asp:Label ID="Label7" runat="server" Text="Label" CssClass="labelname">Email Address</asp:Label>
                         <asp:TextBox ID="email" runat="server" CssClass="labelform labelform2" placeholder="Enter Your Email Address"></asp:TextBox>
                      </div> 

                    <div class="col-lg-6 co-md-12 col-12">
                        <asp:Label ID="Label8" runat="server" Text="Label" CssClass="labelname">Full Address</asp:Label>
                        <asp:TextBox ID="address" runat="server" CssClass="labelform labelform2" placeholder="Enter Your Address"></asp:TextBox>
                        </div>
                      
                    <div class="col-lg-6 co-md-12 col-12">
                        <asp:Label ID="Label9" runat="server" Text="Label" CssClass="labelname">Post Code:</asp:Label>
                        <asp:TextBox ID="postCode" runat="server" CssClass="labelform labelform2" placeholder="Enter Your Postal Code"></asp:TextBox>
                             </div>   
                         <div class="col-lg-6 co-md-12 col-12 ">
                        <asp:Label ID="Label10" runat="server" Text="Label" CssClass="labelname">Phone:</asp:Label>
                        <asp:TextBox ID="phone" runat="server" CssClass="labelform labelform2" placeholder="Enter Your Phone Number"></asp:TextBox>
                        </div>
                    </div>
</div>
                   


               <%--     <div class="col-lg-3">
                 <div class="leftside">
    <div class="detail">
         <h5>Duration: <span class="detailvalue">1 Night</span></h5>
        
    </div>
     <div class="detail">
         <h5>Rooms: <span class="detailvalue">1 Rooms</span></h5>
         
    </div>
     <div class="detail">
         <h5>Persons:  <span class="detailvalue">1 Persons</span></h5>

        
    </div>
     <div class="detail">
         <h5>Room Type: <span class="detailvalue">Standard Room</span></h5>
         
    </div>
   
</div>
             </div>--%>



                     

                </div>






      <%-- Detail tab end --%>
               </asp:WizardStep>
               <asp:WizardStep ID="WizardStep4" runat="server" Title="4.Make Payment">
                       <%-- payment tab start --%>
      <div class="tab mt-5 mb-5">

          <div class="container">
              <div class="row">
 <div class="col-lg-9 col-md-9 col-12">
     <div class="row">
         <div class="col-lg-6 col-md-6 col-12">
               <asp:Label ID="Label11" runat="server" Text="Label" CssClass="labelname">Credit Card number:</asp:Label>
     <asp:TextBox ID="TextBox9" runat="server" CssClass="labelform labelform2" placeholder="xxxx xxxx xxxx xxxx"></asp:TextBox>

         </div>
          <div class="col-lg-6 col-md-6 col-12">
              <asp:Label ID="Label12" runat="server" Text="Label"  CssClass="labelname">CVV:</asp:Label>
              <asp:TextBox ID="TextBox10" runat="server" CssClass="labelform labelform2"></asp:TextBox>


          </div>
     </div>
   <div class="row">
<div class="col-lg-6 col-md-6 col-12">
    <asp:Label ID="Label13" runat="server" Text="Label"  CssClass="labelname">Name on Credit Card:</asp:Label>
    <asp:TextBox ID="creditName" runat="server" CssClass="labelform labelform2" placeholder="Full name as display on card"></asp:TextBox>
</div>
<div class="col-lg-6 col-md-6 col-12">
    <asp:Label ID="Label14" runat="server" Text="Label" CssClass="labelname" >Expired On:</asp:Label>
    <asp:TextBox ID="expDate" runat="server" type="date" CssClass="labelform labelform2"></asp:TextBox>
</div>

</div>




        </div>
                 
             <div class="col-lg-3">
                <%-- <div class="leftside">
    <div class="detail">
         <h5>Duration: <span class="detailvalue">/Night</span></h5>
        
    </div>
     <div class="detail">
         <h5>Rooms: <span class="detailvalue">1 Rooms</span></h5>
         
    </div>
     <div class="detail">
         <h5>Persons:  <span class="detailvalue">1 Persons</span></h5>

        
    </div>
     <div class="detail ">
         <h5>Room Type: <span class="detailvalue">Standard Room</span></h5>
         
    </div>
   
</div>--%>
               
             </div>
              </div>
          </div>
             </div>
      <%-- payment tab end --%>
               </asp:WizardStep>
           <asp:WizardStep ID="WizardStep5" runat="server" Title="Confirm Your Booking" >
                    <div class="container">
                       <div class="row g-3 align-items-center mt-3">
  <div class="col-lg-1">
      <asp:Label ID="Label16" runat="server" Text="Room Price"></asp:Label>
  </div>
  <div class="col-auto">
   
      <asp:TextBox ID="roomPricetxt" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
                           <div class="col-lg-1">
    <asp:Label ID="lblRoom_tax" runat="server" Text="Room Tax"></asp:Label>
    
      </div>
                           <div class="col-auto">
   
      <asp:TextBox ID="roomTaxtxt" runat="server" CssClass="form-control"></asp:TextBox>
      </div>

                           
                           </div>
                         <div class="row g-3 align-items-center mt-3">
  <div class="col-lg-1">
      <asp:Label ID="lblFacility" runat="server" Text="Extra Facility"></asp:Label>
  </div>
  <div class="col-auto">
   
      <asp:TextBox ID="txtFacility" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
                           <div class="col-lg-1">
    <asp:Label ID="lblDropdown" runat="server" Text="Promo"></asp:Label>
    
      </div>
                           <div class="col-auto">
   
                               <asp:DropDownList ID="discountList" runat="server" CssClass="form-control" OnSelectedIndexChanged="discountList_SelectedIndexChanged" AutoPostBack = "true">
                                   <asp:ListItem></asp:ListItem>
                               </asp:DropDownList>
      </div>

                           
                           </div>
                         <div class="row g-3 align-items-center mt-3">
  <div class="col-lg-1">
      <asp:Label ID="lblDiscount" runat="server" Text="Discount (%)"></asp:Label>
  </div>
  <div class="col-auto">
   
      <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
                           <div class="col-lg-1">
    <asp:Label ID="Label21" runat="server" Text="Total"></asp:Label>
    
      </div>
                           <div class="col-auto">
   
      <asp:TextBox ID="totalAmount" runat="server" CssClass="form-control"></asp:TextBox>
      </div>

                           
                           </div>
                    </div>
  
               </asp:WizardStep>
          </WizardSteps>

           <FinishCompleteButtonStyle Font-Bold="True" />
            
                
           <HeaderTemplate>
               <ul id="wizHeader">
                   <asp:Repeater ID="SideBarList" runat="server">
                       <ItemTemplate>
                           <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
                               <%# Eval("Name")%></a> </li>
                       </ItemTemplate>
                   </asp:Repeater>
               </ul>
           </HeaderTemplate>
       </asp:Wizard>
</div>
       





           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
            
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MultiStep_FormConnectionString %>" SelectCommand="SELECT * FROM [Mutli_stepform]">
         </asp:SqlDataSource>
   <script type="text/javascript">
       $(function () {
           var today = new Date();
           var month = ('0' + (today.getMonth() + 1)).slice(-2);
           var day = ('0' + today.getDate()).slice(-2);
           var year = today.getFullYear();
           var date = year + '-' + month + '-' + day;
           $('[id*=TextBox1]').attr('min', date);
       });


       

       


   </script>

         
             
          

    
               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MultiStep_FormConnectionString %>" SelectCommand="SELECT [room_Type], [amount], [tax] FROM [roomtTyepe_master]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MultiStep_FormConnectionString %>" DeleteCommand="DELETE FROM [facilityDetails_Master] WHERE [facility_Id] = @facility_Id" InsertCommand="INSERT INTO [facilityDetails_Master] ([facility_Type], [facility_Cost]) VALUES (@facility_Type, @facility_Cost)" SelectCommand="SELECT * FROM [facilityDetails_Master]" UpdateCommand="UPDATE [facilityDetails_Master] SET [facility_Type] = @facility_Type, [facility_Cost] = @facility_Cost WHERE [facility_Id] = @facility_Id">
            <DeleteParameters>
                <asp:Parameter Name="facility_Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="facility_Type" Type="String" />
                <asp:Parameter Name="facility_Cost" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="facility_Type" Type="String" />
                <asp:Parameter Name="facility_Cost" Type="Int32" />
                <asp:Parameter Name="facility_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
   
     
    
</body>
</html>
