<%@ Control Language="C#" CodeBehind="Navigation.ascx.cs" Inherits="FlowerShop2.DynamicData.FieldTemplates.Navigation1" %>

<asp:Literal runat="server" ID="Literal1" Text="<%# FieldValueString %>" />
<link href="Navigation.css" rel="stylesheet" />
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
