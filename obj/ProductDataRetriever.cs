using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FlowerShop2
{
    public class ProductDataRetriever
    {
        // Method to retrieve products from the database
        public List<ProductModel> GetProductsFromDatabase()
        {
            // Replace this logic with your actual data retrieval from the database
            // For demonstration, creating a list of simulated products
            var productList = new List<ProductModel>
            {
                new ProductModel { ProductId = 1, ProductName = "Rose Bouquet", Description = "Beautiful arrangement of roses", Price = 29.99m, ImagePath = "rose.jpg" },
                new ProductModel { ProductId = 2, ProductName = "Mixed Flower Basket", Description = "Assorted flowers in a decorative basket", Price = 39.99m, ImagePath = "mixed-flowers.jpg" },
                // Add more products as needed
            };

            return productList;
        }
    }
}