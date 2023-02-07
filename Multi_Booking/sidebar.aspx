<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sidebar.aspx.cs" Inherits="Multi_Booking.sidebar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>  
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
       
   #Wizard1 li a {
    color: white;
    text-decoration: none;
    padding: 0px 15px 0px 20px;
    background: brown;
    background: hsla(34,85%,35%,1);
    position: relative;
    display: block;
    float: left;
}
  
    </style>
</head>
    
<body>
    <form id="form1" runat="server">
      
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <asp:Wizard ID="Wizard1" runat="server">
                    <SideBarTemplate>
                        <asp:DataList ID="SideBarList" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="SideBarButton" runat="server"></asp:LinkButton>
                            </ItemTemplate>
                            <SelectedItemStyle Font-Bold="True" />
                        </asp:DataList>
                    </SideBarTemplate>
                    <WizardSteps>
                        <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1"></asp:WizardStep>
                        <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2"></asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    </form>
</body>
</html>
