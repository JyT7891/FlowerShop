using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop2
{
    public partial class CustomBouquet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ddlFlowers.Items.Count == 0)
                {
                    DataTable flowersData = FetchFlowerNamesFromDatabase();
                    ddlFlowers.DataSource = flowersData;
                    ddlFlowers.DataTextField = "FlowerName"; // Replace with your actual column name for flower names
                    ddlFlowers.DataBind();
                    ddlFlowers.Items.Insert(0, new ListItem("--Select Flower--", ""));
                }

                if (ddlWrappingPaper.Items.Count == 0)
                {
                    DataTable wrappingPaperData = FetchWrappingPaperFromDatabase();
                    ddlWrappingPaper.DataSource = wrappingPaperData;
                    ddlWrappingPaper.DataTextField = "WrapPaperName"; // Replace with your actual column name for wrapping paper names
                    ddlWrappingPaper.DataBind();
                    ddlWrappingPaper.Items.Insert(0, new ListItem("--Select Wrapping Paper--", ""));
                }

            }
            else
            {
                // Restore dropdownCounter from ViewState
                dropdownCounter = ViewState["DropdownCounter"] != null ? (int)ViewState["DropdownCounter"] : 1;
            }
        }
        string connectionString = "Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True";
        private DataTable FetchFlowerNamesFromDatabase()
        {
            DataTable dt = new DataTable();
            try
            {

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT FlowerName FROM Flowers", con))
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

        private DataTable FetchWrappingPaperFromDatabase()
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT WrapPaperName FROM FlowerWrappingPaper", con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception
            }
            return dt;
        }

        private int dropdownCounter = 1; // Counter to keep track of added dropdowns

        protected void btnAddFlower_Click(object sender, EventArgs e)
        {
            AddNewDropdown();

            // Save the incremented counter to ViewState
            ViewState["DropdownCounter"] = dropdownCounter;
        }

        // Function to add a new dropdown
        private void AddNewDropdown()
        {
            DropDownList newDropdown = new DropDownList();
            newDropdown.ID = "newFlowerDropdown" + dropdownCounter; // Unique ID for the new dropdown

            // Create a new quantity input for the flower
            TextBox newQuantity = new TextBox();
            newQuantity.ID = "newQuantity" + dropdownCounter; // Unique ID for the new quantity input
            newQuantity.Attributes["type"] = "number";
            newQuantity.Attributes["min"] = "1";

            DataTable flowersData = FetchFlowerNamesFromDatabase();
            newDropdown.DataSource = flowersData;
            newDropdown.DataTextField = "FlowerName"; // Replace with your actual column name for flower names
            newDropdown.DataBind();
            newDropdown.Items.Insert(0, new ListItem("--Select Flower--", ""));

            // Add a line break before the new dropdown and quantity input
            LiteralControl lineBreak = new LiteralControl("<br/>");

            // Find the container to add the new dropdown
            HtmlGenericControl container = (HtmlGenericControl)FindControl("flowerDropdowns");
            container.Controls.Add(lineBreak);
            container.Controls.Add(newDropdown);

            // Add the new quantity input to the QuantityDropDown div
            HtmlGenericControl quantityDiv = (HtmlGenericControl)FindControl("QuantityDropDown");
            quantityDiv.Controls.Add(lineBreak);
            quantityDiv.Controls.Add(newQuantity);

            dropdownCounter++; // Increment the counter for the next dropdown
        }

        protected void ddlFlowers_SelectedIndexChanged(object sender, EventArgs e)
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
        private decimal GetFlowerPrice(string flowerName)
        {
            decimal flowerPrice = 0.0m;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT Price FROM Flowers WHERE FlowerName = @FlowerName";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FlowerName", flowerName);

                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        flowerPrice = Convert.ToDecimal(result);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }

            return flowerPrice;
        }

        private decimal GetWrappingPaperPrice(string wrappingPaperName)
        {
            decimal wrappingPaperPrice = 0.0m;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT Price FROM FlowerWrappingPaper WHERE WrapPaperName = @WrapPaperName";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@WrapPaperName", wrappingPaperName);

                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        wrappingPaperPrice = Convert.ToDecimal(result);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }

            return wrappingPaperPrice;
        }

        private void UpdatePrice()
        {
            string selectedFlower = ddlFlowers.SelectedValue;
            int BouquetQuantity = 0;
            int quantity = 0;

            if (!string.IsNullOrEmpty(txtQuantity.Text))
            {
                quantity = Convert.ToInt32(txtQuantity.Text);
                
            }

            if (!string.IsNullOrEmpty(txtBouquetQuantity.Text))
            {
                BouquetQuantity = Convert.ToInt32(txtBouquetQuantity.Text);

            }

            decimal flowerPrice = GetFlowerPrice(selectedFlower);
            decimal wrappingPaperPrice = GetWrappingPaperPrice(ddlWrappingPaper.SelectedValue);

            decimal totalPrice = ((flowerPrice * quantity) + wrappingPaperPrice) * BouquetQuantity;

            lblPrice.Text = totalPrice.ToString("0.00");
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            string flowerName = ddlFlowers.SelectedValue;
            int quantity = Convert.ToInt32(txtQuantity.Text);
            int BouquetQuantity = Convert.ToInt32(txtBouquetQuantity.Text);
            string wrappingPaper = ddlWrappingPaper.SelectedValue;
            decimal wrappingPaperPrice = GetWrappingPaperPrice(wrappingPaper);

            int customBouquetID = InsertCustomBouquet(flowerName, quantity, wrappingPaper);

            if (customBouquetID != -1)
            {
                InsertIntoCart(BouquetQuantity,customBouquetID, quantity, flowerName, wrappingPaperPrice);
                InsertCustomBouquetFlowers(customBouquetID, quantity, flowerName);

            }
            else
            {
                lblMessage.Text = "Failed to add to cart. Please try again.";
            }
        }

        private int getFlowerID(string name)
        {
            int flowerid = 0;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT FlowerID FROM Flowers WHERE FlowerName = @FlowerName";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@FlowerName", name);

                connection.Open();
                var result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    flowerid = (int)result;
                }
            }

            return flowerid;
        }

        private int GetWrappingPaperID(string wrappingPaperName)
        {
            int wrappingPaperID = 0;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT WrapPaperID FROM FlowerWrappingPaper WHERE WrapPaperName = @WrapPaperName";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@WrapPaperName", wrappingPaperName);

                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        wrappingPaperID = (int)result;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }

            return wrappingPaperID;
        }

        private int InsertCustomBouquet(string flowerName, int quantity, string wrappingPaper)
        {
            int customBouquetID = -1;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Inserting into CustomBouquet
                    decimal flowerPrice = GetFlowerPrice(flowerName);
                    decimal wrappingPaperPrice = GetWrappingPaperPrice(wrappingPaper);
                    int wrapPaperID = GetWrappingPaperID(wrappingPaper);
                    decimal totalPrice = (flowerPrice * quantity) + wrappingPaperPrice;

                    string query1 = "INSERT INTO CustomBouquet (WrappingPaperID, Price) VALUES (@WrappingPaperID, @Price); SELECT SCOPE_IDENTITY();";
                    SqlCommand command1 = new SqlCommand(query1, connection, transaction);

                    command1.Parameters.AddWithValue("@WrappingPaperID", wrapPaperID);
                    command1.Parameters.AddWithValue("@Price", totalPrice);

                    customBouquetID = Convert.ToInt32(command1.ExecuteScalar());

                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    // Handle exception (log, display error message, etc.)
                }
            }

            return customBouquetID;
        }

        private void InsertIntoCart(int BouquetQuantity,int customBouquetID, int quantity, string flowerName, decimal wrappingPaperPrice)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Inserting into Cart
                    string userid = Session["UserID"] as string;
                    decimal totalPrice = ((GetFlowerPrice(flowerName) * quantity) + wrappingPaperPrice) * BouquetQuantity;
                    string query2 = "INSERT INTO Cart (UserID,CustomBouquetID,Quantity,Subtotal,FlowerID) VALUES (@UserID,@CustomBouquetID,@Quantity,@Subtotal,@FlowerID);";
                    SqlCommand command2 = new SqlCommand(query2, connection, transaction);

                    command2.Parameters.AddWithValue("@UserID", userid);
                    command2.Parameters.AddWithValue("@CustomBouquetID", customBouquetID);
                    command2.Parameters.AddWithValue("@Quantity", BouquetQuantity);
                    command2.Parameters.AddWithValue("@Subtotal", totalPrice);
                    command2.Parameters.AddWithValue("@FlowerID", getFlowerID(flowerName));

                    command2.ExecuteNonQuery();
                    transaction.Commit();
                    
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                }
            }
        }

        private void InsertCustomBouquetFlowers(int customBouquetID, int quantity, string flowerName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Get the ID for the bouquet
                    int flowerID = getFlowerID(flowerName); // Get the ID for the flower

                    string query = "INSERT INTO CustomBouquetFlowers (CustomBouquetID, FlowerID, FlowerQuantity) VALUES (@CustomBouquetID, @FlowerID, @FlowerQuantity)";
                    SqlCommand command = new SqlCommand(query, connection, transaction);

                    command.Parameters.AddWithValue("@CustomBouquetID", customBouquetID);
                    command.Parameters.AddWithValue("@FlowerID", flowerID);
                    command.Parameters.AddWithValue("@FlowerQuantity", quantity);

                    command.ExecuteNonQuery();

                    transaction.Commit();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully added the bouquet');", true);
                    Response.Redirect("Cart.aspx"); // Display success message
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Something went wrong');", true);
                    Response.Redirect("Cart.aspx"); // Display error message
                                                    // Handle the exception
                }
            }
        }

    }
}
