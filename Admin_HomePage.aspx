<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Homepage.aspx.cs" Inherits="YourNamespace.Admin_Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Homepage</title>
    <link rel="stylesheet" href="Homepage.css"> <!-- Link to your Homepage.css file -->
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <!-- Navigation bar -->
            <uc1:Navigation ID="Navigation1" runat="server" />
        </header>
        
        <!-- Other content for the admin homepage -->
        <div class="admin-content">
            <h1>Welcome to the Admin Dashboard</h1>
            <!-- Add more admin-specific content here -->
        </div>
    </form>
</body>
</html>
