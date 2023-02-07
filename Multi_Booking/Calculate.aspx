<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculate.aspx.cs" Inherits="Multi_Booking.Calculate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap/bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="CSS/StyleSheet.css" rel="stylesheet" />
    <script src="bootstrap/bootstrap-5.0.2-dist/js"></script>
    <script src="javascr/JavaScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid bg-light">
        <div class="hotel">
            <h2 class="text-center">Hotel Booking Form</h2>
            <img class="img mt-4" src="New folder/images/img/hotel.jpg" />
            <div class="row g-0">
                <div class="hotel_card">
    

   <div>
    <span class="step mx-2">1. Select date</span>
    <span class="step mx-2">2. Select Room</span>
    <span class="step mx-2">3. Contact details</span>
    <span class="step mx-2">4. Make Payment</span>
  </div>
  <!-- One "tab" for each step in the form: -->
  <div class="tab">
      <div class="row mt-5">
      
          
         <div class="col-lg-6 col-md-6 col-12">
        <label for="booking-check-in" class="check">Check In</label><br />
        <input type="date" class="myform" placeholder="DD/MM/YYYY" oninput="this.className = ''" name="uname">
   
</div>
         <div class="col-lg-6 col-md-6 col-12">
        <label for="booking-check-out" class="check">Check Out</label><br />
        <input type="date" class="myform" placeholder="DD/MM/YYYY" oninput="this.className = ''" name="uname" >
    </div>
          </div>
    

    <div class="row">
        <div class="col-lg-6 col-md-6 col-12 mt-3">
            <label for="select room" class="check">Select Room</label>
                <select id="inputState" class="form-select myform" oninput="this.className = ''" name="uname">
                   <option>1 Room</option>             
                   <option>2 Room</option>
                   <option>3 Room</option>
                </select> 


        </div>
        <div class="col-lg-6 col-md-6 col-12 mt-3">
             <label for="select person" class="check">Select Person</label>
                <select id="textsize" class="form-select myform" oninput="this.className = ''" name="uname">
                   <option>1 person</option>             
                   <option>2 person</option>
                   <option>3 person</option>
                </select>

        </div>
    </div>
  </div>
  <div class="tab">
    
    <div class="container mt-3">
      <div class="row">
         <div class="col-lg-8 col-md-8 col-12">
            <div class="d-flex flex-column bd-highlight mb-3 text-white">
               <div class="clearfix">
                    <div class="p-2 bd-highlight" id="Rate1" >
                         <h3>Standard Room <span class="float-end">$21</span></h3>
                             <p>Garden View</p>
                    </div>
                    <div class="p-2 bd-highlight" id="Rate2">
                        <h3>Deluxe Room<span class="float-end">$29</span></h3>
                            <p>City View With Breakfast</p>
                    </div>
                    <div class="p-2 bd-highlight" id="Rate3">
                        <h3>Super Deluxe Room<span class="float-end">$35</span></h3>
                         <p>Sea View With Breakfast</p>
                     </div>
             
           </div>
            </div>
         </div>
  </div>
</div>
   
  </div>
  <div class="tab">
     <div class="row mt-2">
      <div class="col-lg-6 col-md-6 col-12">
          <label for ="first-name" class="check">First Name</label>
          <input type="text" class="myform" placeholder="Enter your First Name" >
      </div>
      <div class="col-lg-6 col-md-6 col-12">
          <label for ="last-name" class="check">Last Name</label>
          <input type="text" class="myform" placeholder="Enter your Last Name">
      </div>
  </div>

    <div class="row-mt-2">
        <label for="address" class="check">Email Address</label>
        <input type="text" class="myform" placeholder="Enter your Email Address"  />
    </div>

     <div class="row-mt-2">
        <label for="address" class="check">Address</label>
        <input type="text" class="myform" placeholder="Enter your Address" />
    </div>

     <div class="row-mt-2">
        <label for="address" class="check">Post Code</label>
        <input type="Number" class="myform" placeholder="Enter your Post Code"  />
    </div>

     <div class="row-mt-2">
        <label for="address" class="check">Phone Number</label>
        <input type="Number" class="myform" placeholder="Enter your Phonr Number"  />
    </div>

  </div>
  <div class="tab">
     
            
                <div class="row">
                     <div class="col-lg-6 col-md-6 col-12">
                         <label for="" class="check">Credit Card number:</label>
                         <input type="number" class="myform" placeholder="xxxx xxxx xxxx xxxx">
                      </div>

                     <div class="col-lg-6 col-md-6 col-12">
                        <label for="" class="check">CVV:</label>
                        <input type="password" class="myform">
                     </div>
                 </div>
     <div class="row mt-5">
         <div class="col-lg-6 col-md-6 col-12">
            <label class="text-white">Name on Credit Card:</label>
            <input type="text" class="myform" />
            <p><small class="text-secondary">Full name as displayed on card</small></p>
          </div>
         <div class="col-lg-6 col-md-6 col-12">
           <label class="text-white">Expired On:</label>
            <input type="date" class="myform" placeholder="" >
         </div>
      </div>
</div>

  

         <div style="overflow:auto;">
    <div style="float:right;">
      
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  


         
</div>
  </div>
    
  
 

</div>
</div>
    </form>
</body>
</html>
