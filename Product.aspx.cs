using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop2
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve data from the database and bind it to the Repeater
                BindProductData();
            }
        }

        string connectionString = "Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True"; // Replace with your connection string
        
        private void BindProductData()
        {
            string query = "SELECT * FROM Products ORDER BY ProductID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

                connection.Open();
                adapter.Fill(dataTable);
                connection.Close();

                ProductRepeater.DataSource = dataTable;
                ProductRepeater.DataBind();
            }
        }

        protected void ProductRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView rowView = e.Item.DataItem as DataRowView;
                if (rowView != null)
                {
                    // Access controls within the Repeater's ItemTemplate
                    Button btnCustomize = e.Item.FindControl("btnCustomize") as Button;
                    if (btnCustomize != null)
                    {
                        // Assuming you want to pass ProductID as CommandArgument
                        btnCustomize.CommandArgument = rowView["ProductID"].ToString();
                        btnCustomize.Click += addToCart_Click; // Handle customization button click
                    }
                }
            }
        }

        protected void addToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string productId = btn.CommandArgument; // Retrieve the ProductID for customization

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO CART VALUES ";

                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dataTable = new DataTable();

            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully added the bouquet to your cart');", true);
        }


        protected void CustomizeBouquet_Click(object sender,EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully customized the bouquet and added to your cart');", true);
            Response.Redirect("CustomBouquet.aspx");
        }
    }
}
