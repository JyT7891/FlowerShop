<%@ Control Language="C#" CodeBehind="Navigation.ascx.cs" Inherits="FlowerShop2.DynamicData.FieldTemplates.Navigation1" %>

<asp:Literal runat="server" ID="Literal1" Text="<%# FieldValueString %>" />
<style>
    .navbar {
        width: 100%;
        background-color: #f2f2f2;
        padding: 10px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: center; /* Center content horizontally */
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
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
        }

            .navbar ul li {
                margin-left: 15px;
            }

                .navbar ul li a {
                    text-decoration: none;
                    color: #555;
                    padding: 12px 18px; /* Increase padding to expand the clickable area */
                    transition: background-color 0.3s;
                    display: inline-block; /* Ensures padding affects the entire area */
                }

                    .navbar ul li a:hover {
                        background-color: #ddd;
                        color: #333;
                    }
</style>
<div class="navbar">
    <ul class="">
        <li><a href="Homepage.aspx">Home</a></li>
        <li><a href="Products.aspx">Products</a></li>
        <li><a href="Cart.aspx">Cart</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="Contact.aspx">Contact</a></li>
    </ul>
</div>
