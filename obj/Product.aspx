<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FlowerShop2.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Our Products</h1>
            <nav>
                <ul>
                    <li><a href="Homepage.aspx">Home</a></li>
                    <li><a href="About.aspx">About Us</a></li>
                    <li><a href="Contact.aspx">Contact Us</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <section class="product-list">
                <h2>All Products</h2>
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="product">
                            <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("ProductName") %>' />
                            <h3><%# Eval("ProductName") %></h3>
                            <p><%# Eval("Description") %></p>
                            <p>Price: $<%# Eval("Price") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </section>
        </main>

        <footer>
            <p>&copy; 2023 Flower Shop</p>
        </footer>
    </form>
</body>
</html>
