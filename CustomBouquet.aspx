<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomBouquet.aspx.cs" Inherits="FlowerShop2.CustomBouquet" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Custom Bouquet</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Add your custom styles here */
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        select,
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
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

            button:hover {
                background-color: #ffffff;
                transition: background-color 0.5s;
            }
    </style>
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
