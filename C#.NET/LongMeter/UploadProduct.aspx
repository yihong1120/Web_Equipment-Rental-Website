<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadProduct.aspx.cs" Inherits="LongMeter.UploadProduct" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UploadProduct</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <style>
    </style>

</head>
<body>
    <div class="container">
        <main>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="materials\logo\logo(signup).png" alt="logo" width="325"
                    height="130">
                <h2>新增商品表單</h2>
            </div>

            <form class="needs-validation" runat="server" novalidate>
                <div class="row g-3">
                    <div class="col-md-7 col-lg-8 mx-auto">
                        <h4 class="mb-3">商品資訊</h4>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">商品名</label>
                                <asp:TextBox class="form-control" ID="productName" runat="server"></asp:TextBox>
                                <div class="invalid-feedback">
                                    Valid 商品名 is required.
                                </div>
                            </div>

                            <div class="cols-2 py-3" style="margin-left: 20px">
                                <label for="Category" class="form-label">Category</label>
                                <asp:DropDownList class="form-select" ID="Category" runat="server" DataSourceID="SqlDataSource1" DataTextField="description" DataValueField="description"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LongMeter_DataPlusConnectionString %>" SelectCommand="SELECT [description] FROM [Categories]"></asp:SqlDataSource>
                                <div class="invalid-feedback">
                                    Please select a valid Category.
                                </div>
                            </div>

                            <div class="col-5 py-2">
                                <label for="Price" class="form-label">Price</label>
                                <asp:TextBox class="form-control" ID="Price" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-8 py-2">
                                <label for="Price" class="form-label">Country</label>
                                <asp:DropDownList class="col-md-5 py-2" Style="margin-left: 20px" ID="Country" runat="server" DataSourceID="SqlDataSource_Country" DataTextField="country" DataValueField="country"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:LongMeter_DataPlusConnectionString %>" SelectCommand="SELECT [country] FROM [Countrys]"></asp:SqlDataSource>
                            </div>

                            <div class="col-10 py-2">
                                <label for="address" class="form-label">Address</label>
                                <asp:TextBox class="form-control" ID="address" runat="server"></asp:TextBox>
                                <div class="invalid-feedback">
                                    Please enter your shipping address.
                                </div>
                            </div>
                            <div class="col-8 py-2">
                                <asp:DropDownList class="col-md-5 py-2" Style="margin-left: 20px" ID="payment" runat="server">
                                    <asp:ListItem Enabled="True" Selected="True">選擇付款方式</asp:ListItem>
                                    <asp:ListItem Enabled="True" Selected="False">MOCC</asp:ListItem>
                                    <asp:ListItem Enabled="True" Selected="False">PayPal</asp:ListItem>
                                    <asp:ListItem Enabled="True" Selected="False">PaymentSeeDescription</asp:ListItem>
                                    <asp:ListItem Enabled="True" Selected="False">LoanCheck</asp:ListItem>
                                    <asp:ListItem Enabled="True" Selected="False">CashOnPickup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-check col-md-5 py-2">
                            <input type="checkbox" class="form-check-input">
                            <label class="form-check-label" for="Ad">加強推廣</label>
                        </div>
                    </div>
                </div>
                <hr class="my-4">
                <asp:Button class="w-100 btn btn-primary btn-lg" ID="Add" runat="server" Text="新增商品" OnClick="Add_Click" />
            </form>
        </main>

        <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mb-1">2020 LongMeter</p>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">隱私權說明</a></li>
                <li class="list-inline-item"><a href="#">線上服務</a></li>
            </ul>
        </footer>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
