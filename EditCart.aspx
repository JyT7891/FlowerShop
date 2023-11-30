<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCart.aspx.cs" Inherits="FlowerShop2.EditCart" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Navigation ID="Navigation1" runat="server" />
        <!-- Add form elements for choosing flowers, quantity, wrapping paper, and displaying price -->
        <div class="container">
            <h1>Edit Your Bouquet</h1>
            <div>
                <!-- Initial dropdown -->
                <div class="row">
                    <div class="col-md-6" id="flowerDropdowns" runat="server">
                        <label for="ddlProduct">Select Product:</label>
                        <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged"></asp:DropDownList>
                    </div> 
                </div>
            </div>
            <div>
                <label for="txtBouquetQuantity">Bouquet Quantity:</label>
                <asp:TextBox ID="txtBouquetQuantity" runat="server" AutoPostBack="true" OnTextChanged="txtBouquetQuantity_TextChanged" type="number" min="1"></asp:TextBox>
            </div>
            <div>
                <label for="lblPrice">Price:</label>
                <asp:Label ID="lblPrice" runat="server" Text="0.00"></asp:Label>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="EditCart_Click" />
        </div>
    </form>
</body>
</html>
