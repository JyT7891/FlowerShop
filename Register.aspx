<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FlowerShop2.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Register.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="2"><h1>Sign Up Page</h1></td>
                </tr>
                <tr>
                    <td>
                        <label>User ID</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Username</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Phone Number</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Email</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="241px" type="email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Password</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="241px" type="password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Re-enter password</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="241px" type="password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Register" onclick="Button1_Click"/>
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
