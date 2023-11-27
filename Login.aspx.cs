using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FlowerShop2
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True");

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid = TextBox1.Text;
            string password = TextBox2.Text;

            connection.Open();

            SqlCommand command = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE [UserID] = @UserID AND [UserPassword] = @Password", connection);
            command.Parameters.AddWithValue("@UserID", userid);
            command.Parameters.AddWithValue("@Password", password);

            int count = (int)command.ExecuteScalar();

            if (count > 0)
            {
                // Store UserId in a session variable
                Session["UserID"] = userid;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('You have successfully logged in');", true);
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('The id or password you entered is invalid.');", true);
            }

            connection.Close();
        }
    }
}
