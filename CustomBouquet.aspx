<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomBouquet.aspx.cs" Inherits="FlowerShop2.CustomBouquet" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom Bouquet</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="CustomBouqet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Navigation ID="Navigation1" runat="server" />
        <!-- Add form elements for choosing flowers, quantity, wrapping paper, and displaying price -->
        <div class="container">
            <h1>Customize Your Bouquet</h1>

            <asp:Button ID="btnAddFlower" runat="server" Text="Add Flower" OnClick="btnAddFlower_Click" />
            <div>
                <!-- Initial dropdown -->
                <div class="row">
                    <div class="col-md-6" id="flowerDropdowns" runat="server">
                        <label for="ddlFlowers">Select Flowers:</label>
                        <asp:DropDownList ID="ddlFlowers" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFlowers_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="col-md-6" id="QuantityDropDown" runat="server">
                        <label for="txtQuantity">Quantity:</label>
                        <asp:TextBox ID="txtQuantity" runat="server" AutoPostBack="true" OnTextChanged="txtQuantity_TextChanged" type="number" min="1"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div>
                <label for="ddlWrappingPaper">Select Wrapping Paper:</label>
                <asp:DropDownList ID="ddlWrappingPaper" runat="server" AutoPostBack="true" OnSelectedIndexChanged="txtQuantity_TextChanged"></asp:DropDownList>
            </div>

            <div>
                <label for="lblPrice">Price:</label>
                <asp:Label ID="lblPrice" runat="server" Text="0.00"></asp:Label>
            </div>
            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="AddToCart_Click" />
        </div>
    </form>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
