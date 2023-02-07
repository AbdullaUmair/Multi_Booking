<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Book_Multi.aspx.cs" Inherits="Multi_Booking.Book_Multi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  

    <div class="container mb-5 ">
          <h3 class="text-center mb-5 text-black">Promo Code Details Master<hr style="width:10%;margin-left:45%"/></h3>
    <div class="row">
        <div class="card mb-3" style="width:540px;">
          
            <div class="col-lg-12 col-md-12 col-12">
                 <div class="row mt-5">
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="Label1" runat="server" Text="Promo ID" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <asp:TextBox ID="txtPromo_Id" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control w-100"></asp:TextBox>
                </div>

            </div>
            <div class="row mt-3" >
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="promolabel" runat="server" Text="Promo Code" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <asp:TextBox ID="txtPromo" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control w-100"  ></asp:TextBox>
                </div>

            </div>
            <div class="row mt-3">
                <div class="col-lg-3 col-md-6 col-12">
                    
                    <asp:Label ID="taxlabel" runat="server" Text="Promo Tax" BorderStyle="None" ForeColor="Black" CssClass="mt-2"></asp:Label>
                </div>
                <div class="col-lg-5 col-md-6 col-12">
                      <div class="d-flex justify-content-center align-items-center">
                    <asp:TextBox ID="txtpromo_Tax" runat="server" BorderColor="#4e73df" ForeColor="Black"  CssClass="form-control"  ></asp:TextBox>
               <span class="font-weight-bold mx-2">%</span>
                    </div>
                    </div>
                
            </div>
                 
          <div class="row mt-5 mb-3">

                <div class="col-lg-3">
                    <asp:LinkButton ID="promo_addBtn" runat="server"  class="btn btn-primary w-75" OnClick="promo_addBtn_Click" >Add</asp:LinkButton>
                </div>
                
                <div class="col-lg-3">
                    <asp:LinkButton ID="promo_updateBtn" runat="server" class="btn btn-primary " OnClick="promo_updateBtn_Click"  >Update</asp:LinkButton>
               
             </div>

                
                <div class="col-lg-3">
                    <asp:LinkButton ID="promo_delBtn" runat="server" class="btn btn-primary " OnClick="promo_delBtn_Click" >Delete</asp:LinkButton>
                </div>
                <div class="col-lg-3">
                    <asp:LinkButton ID="clearBtn" runat="server" class="btn btn-primary w-75" OnClick="clearBtn_Click">Clear</asp:LinkButton>
</div>        
        </div>
          
        </div>
        </div>

        <div class="col-lg-6 col-md-6 col-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Promo_Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="369px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Promo_Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Promo_Id" />
                    <asp:BoundField DataField="promo_Code" HeaderText="Promo Code" SortExpression="promo_Code" />
                    <asp:BoundField DataField="promo_tax" HeaderText="Tax(%)" SortExpression="promo_tax" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MultiStep_FormConnectionString %>" DeleteCommand="DELETE FROM [promotion_master] WHERE [Promo_Id] = @Promo_Id" InsertCommand="INSERT INTO [promotion_master] ([promo_Code], [promo_tax]) VALUES (@promo_Code, @promo_tax)" SelectCommand="SELECT * FROM [promotion_master]" UpdateCommand="UPDATE [promotion_master] SET [promo_Code] = @promo_Code, [promo_tax] = @promo_tax WHERE [Promo_Id] = @Promo_Id">
                <DeleteParameters>
                    <asp:Parameter Name="Promo_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="promo_Code" Type="String" />
                    <asp:Parameter Name="promo_tax" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="promo_Code" Type="String" />
                    <asp:Parameter Name="promo_tax" Type="Int32" />
                    <asp:Parameter Name="Promo_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    </div>
   






</asp:Content>
                     