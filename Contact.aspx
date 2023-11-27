<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FlowerShop2.Contact" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
    <!-- You can include your CSS links or stylesheets here -->
    <style>
        /* Add your styles here */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:Navigation ID="Navigation1" runat="server" />
        <div class="contact-container">
            <h1>Contact Us</h1>
            <p>Feel free to reach out to us for any inquiries or feedback.</p>

            <!-- Contact form -->
            <form id="contactForm" method="post" action="ContactFormHandler.aspx">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="message">Message:</label>
                <textarea id="message" name="message" required></textarea>

                <button type="submit">Submit</button>
            </form>
        </div>
    </form>
</body>
</html>
