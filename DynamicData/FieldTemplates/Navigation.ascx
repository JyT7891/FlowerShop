<%@ Control Language="C#" CodeBehind="Navigation.ascx.cs" Inherits="FlowerShop2.DynamicData.FieldTemplates.Navigation1" %>

<asp:Literal runat="server" ID="Literal1" Text="<%# FieldValueString %>" />
<style>
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

    .header {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 10px;
        background-color: #f2f2f2;
        border-bottom: none;
    }

    .top-row {
        display: flex;
        justify-content: space-between;
        width: 100%; 
        max-width:1600px;
        padding: 10px;
        box-sizing: border-box;
        margin-left: 8%;
        margin-right: 8%;
    }


        .top-row .left-section, .top-row .center-section, .top-row .right-section {
            display: flex;
            align-items: center;
        }

            .top-row .center-section img {
                max-width: 150px;
            }

            .top-row .right-section img {
                margin-left: 10px; 
            }

    input[type="text"],
    img {
        border: none;
        outline: none;
    }

    .top-row > div {
        border-right: none;
    }

    #search-container {
        display: flex;
        align-items: center;
        width: 250px; 
        border: 1px solid #ccc; 
        height: 50px;
        padding: 10px;
        box-sizing: border-box;
    }

    #txtSearch {
        flex: 1;
        border: none;
        outline: none;
        width: calc(100% - 30px);
    }

    #search-icon {
        width: 20px; 
        margin-right: 10px; 
    }

    #cart-icon {
        width: 30px;
    }

    #user-icon {
        width: 25px;
    }

    body, html {
        margin: 0;
        padding: 0;
    }
</style>
<div class="top-row">
    <div class="left-section">
        <!-- Search bar -->
        <div id="search-container">
            <img id="search-icon" src="https://cdn4.iconfinder.com/data/icons/popular-ui/24/04_ui_user_interface_search_magnifying_glass_web_ios-256.png" alt="Search Icon" />
            <input type="text" id="txtSearch" placeholder="Search..." />
        </div>
    </div>
    <div class="center-section">
        <!-- Logo -->
        <img src="logo.png" alt="Blooming Blossoms" />
    </div>
    <div class="right-section">
        <!-- Cart icon -->
        <img id="cart-icon" src="https://cdn4.iconfinder.com/data/icons/vehicle-9/64/Vehicle_Transportation_Travel_Shopping_Cart-64.png" alt="Cart" />
        <span style="font-size: 16px;">Cart (<asp:Label ID="cartCountLabel" runat="server" Text="0"></asp:Label>)</span>
        <!-- User login icon -->
        <img id="user-icon" src="https://cdn1.iconfinder.com/data/icons/100-basic-for-user-interface/32/78-user-64.png" alt="User Login" />
        <span style="font-size: 16px;">User</span>
    </div>
</div>
<div class="navbar">
    <ul class="">
        <li><a href="Homepage.aspx">Home</a></li>
        <li><a href="Product.aspx">Products</a></li>
        <li><a href="Cart.aspx">Cart</a></li>
        <li><a href="About.aspx">About</a></li>
        <li><a href="Contact.aspx">Contact</a></li>
    </ul>
</div>
