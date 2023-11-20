<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="FlowerShop2.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Global styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* Header styles */
header {
    background-color: #fff;
    padding: 20px;
    text-align: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
    margin: 0;
    color: #333;
}

nav ul {
    list-style: none;
    padding: 0;
}

nav ul li {
    display: inline;
    margin-right: 20px;
}

nav ul li a {
    text-decoration: none;
    color: #333;
}

nav ul li a:hover {
    color: #FF69B4;
}

/* Main content - Product Showcase */
main {
    padding: 20px;
}

.product-showcase {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}

.product {
    background-color: #fff;
    padding: 15px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.product img {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
}

.product h3 {
    margin-top: 10px;
    font-size: 18px;
    color: #333;
}

.product p {
    color: #666;
}

.product a {
    display: block;
    margin-top: 10px;
    text-decoration: none;
    color: #FF69B4;
}

.product a:hover {
    text-decoration: underline;
}

    </style>
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
