<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyProducts.aspx.cs" Inherits="LongMeter.WebForm4" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Products</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <style>
        .MyProducts {
            padding: 0px 250px;
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand brand" href="#">
                    <img src="materials\logo\logo(new).png" alt="LongMeter">
                    LongMeter</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li>
                            <a class="nav-link" href="Home.aspx">首頁</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="findwork.aspx">工作刊登</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MyProducts.aspx">我的交易</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MyInformation.aspx">修改資訊</a>
                        </li>
                        <!-- Login -->

                        <!-- Login -->
                    </ul>
                </div>
            </div>
        </nav>

        <!-- TOP -->

        <div class="container py-3 Footerbottom"></div>
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="materials\logo\logo(signup).png" alt="" width="325" height="130">
            <h2 style="margin-top: 70px;">我的交易</h2>
        </div>
        <div class="py-5 text-center">
              <a class="nav-link" href="UploadProduct.aspx">增加商品</a>
        </div>
        <!-- List -->

        <div class="MyProducts">
            <label>User :</label>
            <asp:Label ID="seller_id" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="沒有資料錄可顯示。" ForeColor="#333333" GridLines="None" Width="1036px" Height="249px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="Product_id" SortExpression="product_id" />
                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    <asp:BoundField DataField="buyer_id" HeaderText="Buyer_id" SortExpression="buyer_id" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#455663" Font-Bold="True" ForeColor="#F0F0F0" />
                <HeaderStyle BackColor="#455663" Font-Bold="True" ForeColor="	#F0F0F0" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LongMeter_DataPlusConnectionString2 %>" SelectCommand="SELECT [seller_id], [product_id], [price], [status], [buyer_id], [CreateDate] FROM [transactions$] WHERE ([seller_id] = @seller_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="seller_id" Name="seller_id" PropertyName="Text" Type="Double" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
