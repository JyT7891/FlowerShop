using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop2
{
    public partial class QuantitySelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["ProductId"];
                string imagePath = GetImagePathFromDatabase(productId);
                GetProductName(productId);
                GetDescription(productId);
                imgFlower.ImageUrl = imagePath;
            }
        }
        string connectionString = "Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True";

        private string GetImagePathFromDatabase(string id)
        {
            string relativeImagePath = string.Empty;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ImagePath FROM Products WHERE ProductID = @productId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@productId", id);

                connection.Open();
                var result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    string imageName = result.ToString(); // Assuming ImagePath is the filename

                    // Construct the complete relative path to the Images folder
                    relativeImagePath = "~/DynamicData/Images/" + imageName; // Adjust the folder structure as needed
                }
            }

            return relativeImagePath;
        }

        private void GetProductName(string id)
        {
            string productName = string.Empty;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ProductName FROM Products WHERE ProductID = @productId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@productId", id);

                connection.Open();
                var result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    productName = result.ToString(); // Assuming ImagePath is the filename
                    lblProductName.Text = productName;
                }
            }
        }

        private void GetDescription(string id)
        {
            string description = string.Empty;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Description FROM Products WHERE ProductID = @productId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@productId", id);

                connection.Open();
                var result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    description = result.ToString(); // Assuming ImagePath is the filename
                    lblProductDescription.Text = description;
                }
            }
        }

        private int getFlowerID(string id)
        {
            int flowerid = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT FlowerID FROM Products WHERE ProductID = @productId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@productId", id);

                connection.Open();
                var result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    flowerid = (int)result;
                }
            }

            return flowerid;
        }

        private decimal getPrice(string id)
        {
            decimal price = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Price FROM Products WHERE ProductID = @productId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@productId", id);

                connection.Open();
                var result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    price = Convert.ToDecimal(result);
                }
            }

            return price;
        }

        protected void addToCart_Click(object sender, EventArgs e)
        {
            string userid = Session["UserID"] as string;
            string productId = Request.QueryString["ProductId"];
            int BouquetQuantity = Convert.ToInt32(txtQuantity.Text);
            decimal totalPrice = (getPrice(productId))*BouquetQuantity;
            int flowerid = getFlowerID(productId);


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();
                try
                {
                    string query = "INSERT INTO CART (UserID, ProductID, Quantity, Subtotal, FlowerID) VALUES (@UserID, @ProductID, @Quantity, @Subtotal, @FlowerID)";

                    SqlCommand command = new SqlCommand(query, connection, transaction);
                    command.Parameters.AddWithValue("@UserID", userid);
                    command.Parameters.AddWithValue("@ProductID", productId);
                    command.Parameters.AddWithValue("@Quantity", BouquetQuantity);
                    command.Parameters.AddWithValue("@Subtotal", totalPrice);
                    command.Parameters.AddWithValue("@FlowerID", flowerid);

                    command.ExecuteNonQuery();
                    transaction.Commit();

                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully added the bouquet to your cart');", true);
            Response.Redirect("Product.aspx");
        }
    }
}