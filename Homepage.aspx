<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="FlowerShop2.Homepage" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Homepage.css">
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            
            <!-- Navigation bar -->
            <uc1:Navigation ID="Navigation1" runat="server" />
        </header>
    </form>
</body>
</html>
