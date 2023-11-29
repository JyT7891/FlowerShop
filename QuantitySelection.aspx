<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuantitySelection.aspx.cs" Inherits="FlowerShop2.QuantitySelection" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Quantity</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Existing styles */
        .bouquet-quantity {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .container-border {
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            padding: 20px;
            margin-top: 20px;
        }

        /* Additional styles */
        .flower-img {
            display: block;
            margin: 0 auto;
            width: 80%; /* Adjust the width as needed */
            height: auto; /* Adjust the height automatically */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sample box shadow */
            margin-bottom: 20px;
        }


        .product-info {
            text-align: center;
            margin-bottom: 20px;
        }

            .product-info h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .product-info p {
                font-size: 16px;
                color: #555;
                margin-bottom: 0;
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
            transition: background-color 0.5s;
        }

            .add-to-cart:hover {
                background-color: #ffffff;
                transition: background-color 0.5s;
            }
    </style>
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
