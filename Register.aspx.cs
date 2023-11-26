using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FlowerShop2
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True");

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid = TextBox1.Text, phone = TextBox2.Text, email = TextBox3.Text,password = TextBox4.Text, confirmPassword = TextBox5.Text, username=TextBox6.Text;

            if (password == confirmPassword)
            {
                connection.Open();
                SqlCommand command = new SqlCommand("INSERT INTO [FlowerShop].[dbo].[User]([UserID],[PhoneNumber],[Email],[UserPassword]) VALUES ('" + userid + "','" + username + "','" + phone + "','" + email + "','" + password + "');", connection);
                command.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('You have successfully created an account.');", true);
                Response.Redirect("Login.aspx");
                connection.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('User ID already exists. Please choose a different User ID.');", true);
                connection.Close();
            }

        }

    }
}