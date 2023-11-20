using System;
using System.Collections.Generic;
using System.Web.UI;

namespace FlowerShop2
{
    public partial class Product : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            // Assuming you have a class named ProductDataRetriever handling data retrieval
            ProductDataRetriever retriever = new ProductDataRetriever();
            List<ProductModel> productList = retriever.GetProductsFromDatabase();

            rptProducts.DataSource = productList;
            rptProducts.DataBind();
        }
    }
}
