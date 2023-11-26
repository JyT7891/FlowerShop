<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="FlowerShop2.Product" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Styles for header */
        .grid-header {
            background-color: #333;
            color: #fff;
        }

        /* Styles for rows */
        .grid-row {
            background-color: #f9f9f9;
        }

        /* Styles for alternating rows */
        .grid-alt-row {
            background-color: #e3e3e3;
        }

        /* Custom styles for specific columns */
        .product-name {
            font-weight: bold;
            color: #007bff; /* Change this to your desired color */
            /* Add any other styles you want for product names */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%-- Include the Navigation.ascx control --%>
        <uc1:Navigation ID="Navigation1" runat="server" />

        <div class="content">
            <h1>Products</h1>

            <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                    <asp:TemplateField HeaderText="Product Image">
                        <ItemTemplate>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="100" Width="100" AlternateText="Product Image" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                </Columns>
                <HeaderStyle CssClass="grid-header" />
                <RowStyle CssClass="grid-row" />
                <AlternatingRowStyle CssClass="grid-alt-row" />
            </asp:GridView>

        </div>
    </form>
</body>
</html>
