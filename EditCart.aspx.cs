using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace FlowerShop2
{
    public partial class EditCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                if (ddlProduct.Items.Count == 0)
                {
                    DataTable productData = FetchProductNamesFromDatabase();
                    ddlProduct.DataSource = productData;
                    ddlProduct.DataTextField = "ProductName"; // Replace with your actual column name for flower names
                    ddlProduct.DataBind();
                    ddlProduct.Items.Insert(0, new ListItem("--Select Product--", ""));
                }
            }
        }

        string connectionString = "Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True";

        private DataTable FetchProductNamesFromDatabase()
        {
            DataTable dt = new DataTable();
            try
            {

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT ProductName FROM Products", con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return dt;
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdatePrice();
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            UpdatePrice();
        }
        protected void txtBouquetQuantity_TextChanged(object sender, EventArgs e)
        {
            UpdatePrice();
        }
        private decimal GetProductPrice(string selectedProduct)
        {
            decimal productPrice = 0.0m;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT Price FROM Products WHERE ProductName = @ProductName";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ProductName", selectedProduct);

                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        productPrice = Convert.ToDecimal(result);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }

            return productPrice;
        }

        private void UpdatePrice()
        {
            string selectedProduct = ddlProduct.SelectedValue;
            int BouquetQuantity = 0;

            if (!string.IsNullOrEmpty(txtBouquetQuantity.Text))
            {
                BouquetQuantity = Convert.ToInt32(txtBouquetQuantity.Text);

            }

            decimal productPrice = GetProductPrice(selectedProduct);

            decimal totalPrice = productPrice * BouquetQuantity;

            lblPrice.Text = totalPrice.ToString("0.00");
        }

        protected void EditCart_Click(object sender, EventArgs e)
        {
            string productName = ddlProduct.SelectedValue;
            int BouquetQuantity = Convert.ToInt32(txtBouquetQuantity.Text);
            string UserID = Session["UserID"] as string;

            int cartID = GetCartID(UserID, productName); // Fetch CartID based on UserID and ProductName
            EditAll(productName, BouquetQuantity, cartID);
        }

        private int getProductID(string name)
        {
            int flowerid = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ProductID FROM Products WHERE ProductName = @ProductName";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ProductName", name);

                connection.Open();
                var result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    flowerid = (int)result;
                }
            }

            return flowerid;
        }

        private int GetCartID(string userID, string productName)
        {
            int cartID = 0;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT c.CartID " +
                                   "FROM Cart c " +
                                   "INNER JOIN Products p ON c.ProductID = p.ProductID " +
                                   "WHERE c.UserID = @UserID AND p.ProductName = @ProductName";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@ProductName", productName);

                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        cartID = Convert.ToInt32(result);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception or log it
            }

            return cartID;
        }

        protected void EditAll(string productName, int quantity, int CartID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Get the ID for the bouquet
                    int productID = getProductID(productName);
                    decimal productPrice = GetProductPrice(productName);
                    decimal totalPrice = productPrice * quantity;
                    string UserID = Session["UserID"] as string;


                    string query = "UPDATE Cart SET ProductID = @productID, Quantity = @Quantity, Subtotal = @Price WHERE UserID = @UserID AND CartID = @CartID;";
                    SqlCommand command = new SqlCommand(query, connection, transaction);

                    command.Parameters.AddWithValue("@productID", productID);
                    command.Parameters.AddWithValue("@Price", totalPrice);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@UserID", UserID);
                    command.Parameters.AddWithValue("@CartID", CartID);

                    command.ExecuteNonQuery();

                    transaction.Commit();
                    lblMessage.Text = "Insert successful"; // Display success message
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    lblMessage.Text = "Insert failed: " + ex.Message + CartID; // Display error message
                                                                      // Handle the exception
                }

            }
        }
    }
}
