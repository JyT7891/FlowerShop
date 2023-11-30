<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FlowerShop2.Cart" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Include any necessary CSS or Bootstrap -->
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        /* Navigation styles */
        .navbar {
            width: 100%;
            background-color: #f2f2f2;
            padding: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
        }

            .navbar h2 {
                margin-bottom: 10px;
                font-size: 1.3em;
                color: #333;
            }

            .navbar ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }

                .navbar ul li {
                    margin-left: 15px;
                }

                    .navbar ul li a {
                        text-decoration: none;
                        color: #555;
                        padding: 12px 18px;
                        transition: background-color 0.3s;
                        display: inline-block;
                    }

                        .navbar ul li a:hover {
                            background-color: #ddd;
                            color: #333;
                        }

        /* Cart page specific styles */
        #form1 {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        /* GridView styles */
        .cart-container {
            margin-top: 20px;
            text-align: center;
            padding: 20px;
            width: 80%; /* Set the same width as in the Products page */
            margin: 0 auto; /* Center align the container */
            min-height: 300px; /* Minimum height for the container */
        }

        #GridViewCart {
            width: 100%; /* Adjust as needed */
            border-collapse: collapse;
            background-color: #fff;
        }

            #GridViewCart th,
            #GridViewCart td {
                padding: 12px 8px;
                text-align: left;
                border: none;
                border-bottom: 1px solid #ddd; /* Add bottom border */
            }

            #GridViewCart th {
                background-color: #f2f2f2;
            }

        /* Edit and Delete buttons in GridView */
        .btn {
            padding: 6px 12px;
            margin: 4px;
            font-size: 14px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            background-color: #fff;
            border: 1px solid #007bff; /* Button border color */
            color: #007bff; /* Button text color */
        }

            .btn.edit {
                position: relative;
            }

                .btn.edit:hover {
                    background-color: #007bff; /* Same color as the border on hover */
                    color: #fff; /* Text color on hover */
                    transition: background-color 0.5s;
                }

                    .btn.edit:hover:before {
                        content: '';
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background-color: #007bff; /* Same color as the border on hover */
                        z-index: -1;
                    }

            .btn.delete {
                background-color: #dc3545; /* Red color for delete button */
                border-color: #dc3545;
                color: #fff; /* White text color */
            }

                .btn.delete:hover {
                    background-color: #ff5252; /* Lighter shade of red on hover */
                    border-color: #ff5252;
                    color: #fff; /* White text color */
                    transition: background-color 0.5s;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Navigation ID="Navigation1" runat="server" />
        <div class="cart-container">
            <h2>Shopping Cart</h2>
            <!-- Cart Items will be displayed here -->
            <asp:GridView ID="GridViewCart" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridViewCart_RowDataBound" DataKeyNames="ProductName,Quantity,Subtotal">
                <Columns>
                    <asp:TemplateField HeaderText="Product Details">
                        <ItemTemplate>
                            <div class="product-card-body">
                                <h3 class="product-card-title"><%# Eval("ProductName") %></h3>
                                <p><%# Eval("Description") %></p>
                                <p><%# String.Format("{0:C}", Eval("Price")) %></p>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" />
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:Button runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# String.Format("{0}|{1},{2}", Eval("ProductName"), Eval("Quantity"), Eval("Subtotal")) %>' CssClass="btn edit" OnClick="editCart"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# String.Format("{0}|{1},{2}", Eval("ProductName"), Eval("Quantity"), Eval("Subtotal")) %>' CssClass="btn delete" OnClick="deleteFromCart" />


                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div style="text-align: center; margin-top: 20px;">
                <asp:Button runat="server" Text="Checkout" CssClass="btn checkout" OnClick="CheckOut"/>
            </div>
        </div>
    </form>
</body>
</html>
