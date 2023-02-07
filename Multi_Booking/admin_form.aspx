<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_form.aspx.cs" Inherits="Multi_Booking.admin_form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container mb-5 ">
          <h3 class="text-center mb-5 text-black">Room Details Master</h3><hr style="width:10%;margin-left:45%"/>
    <div class="row">
        <div class="card mb-3" style="width:540px;">
          
            <div class="col-lg-12 col-md-12 col-12">
            <div class="row mt-3" >
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="Label4" runat="server" Text="Room_ID" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-6 col-md-6 col-12 ">
                    <asp:TextBox ID="txtId" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control w-100" ></asp:TextBox>
                </div>

            </div>
            <div class="row mt-3">
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="Label1" runat="server" Text="Room Type" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <asp:TextBox ID="txtroom_type" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control"  ></asp:TextBox>
                </div>

            </div>
                 
            <div class="row mt-3">
                <div class="col-lg-3 col-md-6 col-12">
                    <asp:Label ID="Label2" runat="server" Text="Price"  BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-5 col-md-6 col-12">
                       <div class="d-flex justify-content-center align-items-center">
                    <asp:TextBox ID="txtPrice" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control" ></asp:TextBox>
                <span class="font-weight-bold mx-2">INR

                </span>
                       </div>
                       </div>
                

            </div>
            <div class="row mt-3">
                <div class="col-lg-3 col-md-6 col-12">
                    <asp:Label ID="Label3" runat="server" Text="Tax" BorderStyle="None" ForeColor="Black" CssClass="mt-3"></asp:Label>
                </div>
                <div class="col-lg-5 col-md-6 col-12">
                    <div class="d-flex justify-content-center align-items-center">
                    <asp:TextBox ID="txtTax" runat="server" BorderColor="#4e73df" ForeColor="Black" CssClass="form-control" ></asp:TextBox>
                <span class="font-weight-bold mx-2">%</span>
                        </div>
                </div>
                
            </div>

            <div class="row mt-5 mb-3">

                <div class="col-lg-3">
                    <asp:LinkButton ID="addBtn" runat="server" OnClick="addBtn_Click" class="btn btn-primary w-75" >Add</asp:LinkButton>
                </div>
                
                <div class="col-lg-3">
                    <asp:LinkButton ID="updateBtn" runat="server" class="btn btn-primary" OnClick="updateBtn_Click" >Update</asp:LinkButton>
               
             </div>

                
                <div class="col-lg-3">
                    <asp:LinkButton ID="delBtn" runat="server" class="btn btn-primary " OnClick="delBtn_Click" >Delete</asp:LinkButton>
                </div>

                 <div class="col-lg-3">
                    <asp:LinkButton ID="clearBtn" runat="server" class="btn btn-primary w-75" OnClick="clearBtn_Click" >Clear</asp:LinkButton>
</div>
              
        </div>
        </div>
        </div>

        <div class="col-lg-6 col-md-6 col-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="roomType_Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="261px" Width="493px" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="roomType_Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="roomType_Id" />
                    <asp:BoundField DataField="room_Type" HeaderText="Room" SortExpression="room_Type" />
                    <asp:BoundField DataField="amount" HeaderText="Price(INR)" SortExpression="amount" />
                    <asp:BoundField DataField="tax" HeaderText="Tax(%)" SortExpression="tax" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>
    </div>




    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MultiStep_FormConnectionString %>" DeleteCommand="DELETE FROM [roomtTyepe_master] WHERE [roomType_Id] = @roomType_Id" InsertCommand="INSERT INTO [roomtTyepe_master] ([room_Type], [amount], [tax]) VALUES (@room_Type, @amount, @tax)" SelectCommand="SELECT * FROM [roomtTyepe_master]" UpdateCommand="UPDATE [roomtTyepe_master] SET [room_Type] = @room_Type, [amount] = @amount, [tax] = @tax WHERE [roomType_Id] = @roomType_Id">
        <DeleteParameters>
            <asp:Parameter Name="roomType_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="room_Type" Type="String" />
            <asp:Parameter Name="amount" Type="Int32" />
            <asp:Parameter Name="tax" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="room_Type" Type="String" />
            <asp:Parameter Name="amount" Type="Int32" />
            <asp:Parameter Name="tax" Type="Decimal" />
            <asp:Parameter Name="roomType_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <script>
      
    </script>

    
 
</asp:Content>
