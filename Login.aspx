<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FlowerShop2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-div">
            <table class="auto-style1">
                <tr>
                    <td>
                        <h2>Login Page</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your User ID"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter your password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td>

                        <asp:Label ID="Label3" runat="server" Text="New User? "> </asp:Label>
                        <a href="Register.aspx" style="color: blue;">Sign Up</a>

                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
