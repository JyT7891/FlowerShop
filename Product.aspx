<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FlowerShop2.Product" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Product.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <%-- Include the Navigation.ascx control --%>
        <uc1:Navigation ID="Navigation1" runat="server" />

        <div class="container">
            <div class="content" style="width: 90%; margin: 0 auto;">
                <h1>Products</h1>

                <div class="product-container">
                    <asp:Repeater ID="ProductRepeater" runat="server">
                        <ItemTemplate>
                            <div class="product-card">
                                <img src='<%# ResolveUrl("~/DynamicData/Images/" + Eval("ImagePath")) %>' alt='<%# Eval("ProductName") %>' />
                                <div class="product-card-body">
                                    <h3 class="product-card-title"><%# Eval("ProductName") %></h3>
                                    <p><%# Eval("Description") %></p>
                                    <p><%# String.Format("{0:C}", Eval("Price")) %></p>
                                </div>
                                <asp:Button OnClick="addToCart_Click" ID="btnAddToCart" runat="server" CssClass="add-to-cart" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("ProductId") %>' />
                                <br />
                                <asp:Button OnClick="CustomizeBouquet_Click" ID="btnCustomize" runat="server" CssClass="custom" Text="Customize Bouquet" CommandName="CustomizeBouquet" CommandArgument='<%# Eval("ProductId") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>
        </div>
    </form>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
