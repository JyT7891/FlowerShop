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
            int quantity = 0;

            if (!string.IsNullOrEmpty(txtQuantity.Text))
            {
                quantity = Convert.ToInt32(txtQuantity.Text);
            }

            decimal flowerPrice = GetFlowerPrice(selectedFlower);
            decimal wrappingPaperPrice = GetWrappingPaperPrice(ddlWrappingPaper.SelectedValue);

            decimal totalPrice = (flowerPrice * quantity) + wrappingPaperPrice;

            lblPrice.Text = totalPrice.ToString("0.00");
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            string selectedFlower = ddlFlowers.SelectedValue;
            int quantity = 0;

            if (!string.IsNullOrEmpty(txtQuantity.Text))
            {
                quantity = Convert.ToInt32(txtQuantity.Text);
            }

            string selectedWrappingPaper = ddlWrappingPaper.SelectedValue;

            // Call the method to add the selected items to the cart
            AddToCart(selectedFlower, quantity, selectedWrappingPaper);

            ddlFlowers.SelectedIndex = 0;
            txtQuantity.Text = "";
            ddlWrappingPaper.SelectedIndex = 0;
        }

        private void AddToCart(string flowerName, int quantity, string wrappingPaper)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO CartItems (FlowerName, Quantity, WrapPaperName) VALUES (@FlowerName, @Quantity, @WrapPaperName)";
                    SqlCommand command = new SqlCommand(query, connection);

                    command.Parameters.AddWithValue("@FlowerName", flowerName);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@WrapPaperName", wrappingPaper);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                // Provide feedback or perform any other actions after adding to the cart
            }
            catch (Exception ex)
            {
                // Handle exception (e.g., log or display an error message)
            }
        }

    }
}
