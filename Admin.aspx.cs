using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True");

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get username and password from the input fields
            string userid = TextBox1.Text;
            string password = TextBox2.Text;

            connection.Open();

            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE [AdminID] = @AdminID AND [AdminPassword] = @AdminPassword", connection);
            command.Parameters.AddWithValue("@AdminID", AdminID);
            command.Parameters.AddWithValue("@AdminPassword", Adminpassword);

            int count = (int)command.ExecuteScalar();

        if (count > 0)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('You have successfully logged in as admin');", true);
        Response.Redirect("AdminHomepage.aspx");
        }
    else
        {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('The ID or password you entered is invalid or you are not an admin.');", true);
          }
        }
    }
}
