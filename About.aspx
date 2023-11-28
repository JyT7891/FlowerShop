<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FlowerShop2.About" %>

<%@ Register TagPrefix="uc1" TagName="Navigation" Src="DynamicData/FieldTemplates/Navigation.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
    <link href="https://fonts.googleapis.com/css2?family=PT+Serif&display=swap" rel="stylesheet"/>
    <link href="About.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation bar -->
        <uc1:Navigation ID="Navigation1" runat="server" />

        <!-- About Us content -->
        <div class="about-section">
            <h1 id="title">About Us</h1>
            <p id="subTitle">Catering to your requirements, handling your needs with care</p>
            <br />
            <p>
                Our store is more than just another average online retailer. We sell not only top quality products, but give our customers a positive online shopping experience. 
                Forget about struggling to do everything at once: taking care of the family, running your business, walking your dog, cleaning the house, doing the shopping, etc. 
                Purchase the goods you need every day or just like in a few clicks or taps, depending on the device you use to access the Internet. We work to make your life more enjoyable.
            </p>
            <!-- Add more content as needed -->

            <div class="stat-container">
                <div>
                    <img id="magGlass-icon" src="https://cdn4.iconfinder.com/data/icons/popular-ui/24/04_ui_user_interface_search_magnifying_glass_web_ios-256.png" />
                    <p class="stat-title">For convenience of choice</p>
                    <p class="stat-text">
                        We think about the convenience of your choice. Our products are supplied with star rating that should help hesitant buyers to take a decision.
                        What’s more, you can search our site if you know exactly what you are looking for or use a bunch of different filters that will considerably save your time and efforts.
                    </p>
                </div>
                <div>
                    <img id="truck-icon" src="https://cdn3.iconfinder.com/data/icons/wpzoom-developer-icon-set/500/130-256.png" />
                    <p class="stat-title">Delivery products to all regions</p>
                    <p class="stat-text">
                        We deliver our goods worldwide. No matter where you live, your order will be shipped in time and delivered right to your door or to any other location you have stated. 
                        The packages are handled with utmost care, so the ordered products will be handed to you safe and sound, just like you expect them to be.
                    </p>
                </div>
                <div>
                    <img id="thumbsUp-icon" src="https://cdn1.iconfinder.com/data/icons/hand-icon/1792/thumbs-k-up-64.png" />
                    <p class="stat-title">The highest quality of products</p>
                    <p class="stat-text">
                       We guarantee the highest quality of the products we sell. Several decades of successful operation and millions of happy customers let us feel certain about that. 
                        Besides, all items we sell pass thorough quality control, so no characteristics mismatch can escape the eye of our professionals.
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
