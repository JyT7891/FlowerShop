<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FlowerShop2.Product" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom styles */
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 20px;
        }

        .product-card {
            width: calc(30% - 20px);
            margin-bottom: 20px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            position: relative;
        }

            .product-card:hover {
                box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            }

            .product-card img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

        .product-card-body {
            padding: 20px;
            text-align: center;
            min-height: 300px; /* Set minimum height for product details */
        }

        .product-card-title {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .add-to-cart {
            display: inline-block;
            padding: 10px 20px;
            background-color: #00efff;
            color: #000;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            transition: background-color 0.5s;
        }

            .add-to-cart:hover {
                background-color: #ffffff;
                transition: background-color 0.5s;
            }

        .custom {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ffcc00; /* Adjust color as needed */
            color: #000;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            position: absolute;
            bottom: 50px; /* Adjust the vertical position */
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            transition: background-color 0.5s;
        }

            .custom:hover {
                background-color: #ffffff;
                transition: background-color 0.5s;
            }
    s</style>
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
