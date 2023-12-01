<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuantitySelection.aspx.cs" Inherits="FlowerShop2.QuantitySelection" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Quantity</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="QuantitySelection.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Navigation ID="Navigation1" runat="server" />
        <div class="container container-border">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1>Select Quantity</h1>
                    <asp:Image ID="imgFlower" runat="server" CssClass="flower-img" />

                    <div class="product-info">
                        <asp:Label ID="lblProductName" runat="server" CssClass="product-name"></asp:Label><br />
                        <asp:Label ID="lblProductDescription" runat="server" CssClass="product-description"></asp:Label>
                    </div>

                    <label for="txtQuantity">Quantity:</label><br />
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="bouquet-quantity" type="number" min="1"></asp:TextBox><br />
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    <asp:Button OnClick="addToCart_Click" ID="btnAddToCart" runat="server" Text="Add to Cart" CommandName="AddToCart" CssClass="add-to-cart" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
