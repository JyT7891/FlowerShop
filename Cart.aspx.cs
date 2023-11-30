using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FlowerShop2
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCartData();
            }
        }

        string connectionString = "Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True";

        private void BindCartData()
        {
            // Retrieve cart data from the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string userid = Session["UserID"] as string;
                string query = "SELECT CB.CustomBouquetID, P.ProductName, P.Description, P.Price, C.Quantity, C.Subtotal FROM Cart C LEFT JOIN Products P ON C.ProductID = P.ProductID LEFT JOIN CustomBouquet CB ON C.CustomBouquetID = CB.CustomBouquetID WHERE C.UserID = @userid;"; // Adjust query as needed
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@userid", userid);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                connection.Open();
                dataAdapter.Fill(dataTable);
                connection.Close();

                // Bind data to GridView
                GridViewCart.DataSource = dataTable;
                GridViewCart.DataBind();
            }
        }

        protected void GridViewCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Retrieve the ProductName value from the DataTable
                DataRowView rowView = e.Row.DataItem as DataRowView;
                if (rowView != null)
                {
                    // Check if the ProductName value is empty or null in the DataTable
                    if (string.IsNullOrEmpty(rowView["ProductName"].ToString()))
                    {
                        // Set a default name (e.g., "Unknown Product")
                        e.Row.Cells[0].Text = "Custom Bouquet";
                    }
                }
            }
        }

        protected void deleteFromCart(object sender, EventArgs e)
        {
            // Check if the sender is a Button
            if (sender is Button deleteButton)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string[] arguments = deleteButton.CommandArgument.Split('|');
                    if (arguments.Length >= 2)
                    {
                        string ProductName = arguments[0];
                        string[] quantitySubtotal = arguments[1].Split(',');
                        if (quantitySubtotal.Length >= 2)
                        {
                            string quantity = quantitySubtotal[0];
                            string subTotal = quantitySubtotal[1];

                            string userid = Session["UserID"] as string;
                            string query = "DELETE C FROM Cart C LEFT JOIN Products P ON C.ProductID = P.ProductID LEFT JOIN CustomBouquet CB ON C.CustomBouquetID = CB.CustomBouquetID WHERE P.ProductName = @ProductName AND C.UserID = @userid AND C.Quantity = @quantity AND C.Subtotal = @subTotal;"; // Adjust query as needed
                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@ProductName", ProductName);
                            command.Parameters.AddWithValue("@userid", userid);
                            command.Parameters.AddWithValue("@quantity", quantity);
                            command.Parameters.AddWithValue("@subTotal", subTotal);

                            connection.Open();
                            command.ExecuteNonQuery();
                            connection.Close();

                            // Rebind the GridView after deletion
                            BindCartData();
                        }
                    }
                }
            }
        }

        protected void editCart(object sender, EventArgs e)
        {
            if (sender is Button editButton)
            {
                string[] arguments = editButton.CommandArgument.Split('|');
                if (arguments.Length >= 2)
                {
                    string ProductName = arguments[0];
                    string[] quantitySubtotal = arguments[1].Split(',');
                    if (quantitySubtotal.Length >= 2)
                    {
                        string quantity = quantitySubtotal[0];
                        string subTotal = quantitySubtotal[1];
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            string query = "SELECT ProductID FROM Products WHERE ProductName=@ProductName";
                            SqlCommand command = new SqlCommand(query, connection);
                            command.Parameters.AddWithValue("@ProductName", ProductName);
                            connection.Open();
                            object result = command.ExecuteScalar();

                            if (result != null)
                            {
                                Response.Redirect($"EditCart.aspx?ProductName={ProductName}&quantity={quantity}&subTotal={subTotal}");
                            }
                            else
                            {
                                Response.Redirect($"EditCustom.aspx?ProductName={ProductName}&quantity={quantity}&subTotal={subTotal}");
                            }
                        }
                    }
                }
            }
        }

        protected void CheckOut(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx");
        }
    }
}
