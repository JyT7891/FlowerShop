<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="FlowerShop2.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header>
            <h1>Welcome to Our Flower Shop</h1>
            <nav>
                <ul>
                    <li><a href="Products.aspx">Products</a></li>
                    <li><a href="About.aspx">About Us</a></li>
                    <li><a href="Contact.aspx">Contact Us</a></li>
                </ul>
            </nav>
        </header>

        <!-- Main Content - Product Showcase -->
        <main>
            <section class="product-showcase">
                <h2>Featured Products</h2>
                <!-- Display featured products here -->
                <div class="product">
                    <img src="product1.jpg" alt="Product 1" />
                    <h3>Product Name 1</h3>
                    <p>Description of Product 1</p>
                    <p>Price: $XX.XX</p>
                    <a href="ProductDetails.aspx?id=1">View Details</a>
                </div>
                <div class="product">
                    <img src="product2.jpg" alt="Product 2" />
                    <h3>Product Name 2</h3>
                    <p>Description of Product 2</p>
                    <p>Price: $XX.XX</p>
                    <a href="ProductDetails.aspx?id=2">View Details</a>
                </div>
                <!-- Add more product divs as needed -->
            </section>
        </main>

        <!-- Footer -->
        <footer>
            <p>&copy; 2023 Flower Shop</p>
        </footer>
    </form>
</body>
</html>
