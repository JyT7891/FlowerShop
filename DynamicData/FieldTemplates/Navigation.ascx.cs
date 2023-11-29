using System;
using System.Collections;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace FlowerShop2.DynamicData.FieldTemplates
{
    public partial class Navigation1 : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                
                return Literal1;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCartCount();
            }
        }
        string connectionString = "Data Source=DESKTOP-O59O2R0\\SQLEXPRESS;Initial Catalog=FlowerShop;Integrated Security=True";
        private void getCartCount()
        {
            string userid = Session["UserID"] as string;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) AS TotalRows FROM Cart WHERE userid = @userid";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@userid", userid);
                
                connection.Open();
                var result = command.ExecuteScalar();

                cartCountLabel.Text =result.ToString();
            }
        }
    }
}
