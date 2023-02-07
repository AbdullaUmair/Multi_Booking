<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="ExtraFacilities.aspx.cs" Inherits="Multi_Booking.ExtraFacilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div class="container mb-5 ">
          <h3 class="text-center mb-5 text-black">Extra Facility Details Master<hr style="width:10%;margin-left:45%"/></h3>
    <div class="row">
        <div class="card mb-3" style="width:540px;">
          
            <div class="col-lg-12 col-md-12 col-12">
                 <div class="row mt-5">
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="Label1" runat="server" Text="ID" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-5 col-md-6 col-12">
                     <div class="d-flex justify-content-center align-items-center">
                    <asp:TextBox ID="txtFacility_Id" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control "></asp:TextBox>
                    
                </div>
</div>
            </div>
            <div class="row mt-3" >
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="label2" runat="server" Text="Facility Type" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-5 col-md-6 col-12">
                     <div class="d-flex justify-content-center align-items-center">
                    <asp:TextBox ID="txtFacility_type" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control "  ></asp:TextBox>
               
                    </div>
                    </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="label3" runat="server" Text="Facility Cost" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
               
                    </div>
                <div class="col-lg-5 col-md-6 col-12">
                      <div class="d-flex justify-content-center align-items-center">
                    <asp:TextBox ID="txtfacility_Cost" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control"  ></asp:TextBox>
               <span class="font-weight-bold mx-2">INR</span>
                    </div>
                    </div>
                
            </div>
                <div class="row mt-5 mb-3">

                <div class="col-lg-3">
                    <asp:LinkButton ID="facility_AddBtn" runat="server"  class="btn btn-primary w-75" OnClick="facility_AddBtn_Click" >Add</asp:LinkButton>
                </div>
                
                <div class="col-lg-3">
                    <asp:LinkButton ID="facility_updateBtn" runat="server" class="btn btn-primary" OnClick="facility_updateBtn_Click"  >Update</asp:LinkButton>
               
             </div>

                
                <div class="col-lg-3">
                    <asp:LinkButton ID="facility_delBtn" runat="server" class="btn btn-primary " OnClick="facility_delBtn_Click"  >Delete</asp:LinkButton>
                </div>

                 <div class="col-lg-3">
                    <asp:LinkButton ID="facility_clearBtn" runat="server" class="btn btn-primary w-75" OnClick="facility_clearBtn_Click" >Clear</asp:LinkButton>
</div>
              
        </div>  
          
        </div>
        </div>

        <div class="col-lg-6 col-md-6 col-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="facility_Id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="336px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="facility_Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="facility_Id" />
                    <asp:BoundField DataField="facility_Type" HeaderText="Type" SortExpression="facility_Type" />
                    <asp:BoundField DataField="facility_Cost" HeaderText="Cost" SortExpression="facility_Cost" />
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
           
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MultiStep_FormConnectionString %>" DeleteCommand="DELETE FROM [facilityDetails_Master] WHERE [facility_Id] = @facility_Id" InsertCommand="INSERT INTO [facilityDetails_Master] ([facility_Type], [facility_Cost]) VALUES (@facility_Type, @facility_Cost)" SelectCommand="SELECT * FROM [facilityDetails_Master]" UpdateCommand="UPDATE [facilityDetails_Master] SET [facility_Type] = @facility_Type, [facility_Cost] = @facility_Cost WHERE [facility_Id] = @facility_Id">
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
           
        </div>
    </div>
    </div>
</asp:Content>
