<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="LongMeter.payment" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Payment</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <style>
    </style>

</head>

<body>
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
    <div class="container">
        <main>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="materials\logo\logo(signup).png" alt="logo" width="325"
                    height="130">
                <h2>付款表單</h2>
            </div>

            <form runat="server">
                <div class="needs-validation ">
                    <div class="col-md-7 col-lg-8 mx-auto">
                        <h4 class="mb-3">付款資訊</h4>

                        <div class="row g-3">
                            
                            <div class="col-12 py-2">
                                <label for="Phone" class="form-label">
                                    Phone<span
                                        class="text-muted">(Optional)</span></label>
                                <asp:TextBox class="form-control" ID="PhoneP" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-12 py-2">
                                <label for="email" class="form-label">Email</label>
                                <asp:TextBox class="form-control" ID="emailP" runat="server" placeholder="you@example.com"></asp:TextBox>
                                <div class="invalid-feedback">
                                    Please enter a valid email address for shipping updates.
                                </div>
                            </div>

                            <div class="col-12 py-2">
                                <label for="address" class="form-label">Address</label>
                                <asp:TextBox class="form-control" ID="addressP" runat="server" placeholder="1234 Main St" required=""></asp:TextBox>
                                <div class="invalid-feedback">
                                    Please enter your shipping address.
                                </div>
                            </div>

                            <div class="col-md-5 py-2">
                                <label for="transport" class="form-label">運送方式</label>
                                <select class="form-select" id="transport" required>
                                    <option value="">Choose...</option>
                                    <option>自取</option>
                                    <option>宅配</option>
                                </select>
                            </div>
                        </div>

                    </div>

                    <hr class="my-4">

                    <h4 class="mb-3">Item</h4>

                    <div class="my-3">
                        <label class="form-check-label" for="credit">Seller</label>
                    </div>

                    <div class="row gy-3">
                        <div class="col-md-10">
                            <label for="cc-name" class="form-label">Item</label>
                            <asp:Label ID="ItemTitle" runat="server" Text="商品名"></asp:Label>
                        </div>
                        <div class="col-md-10">
                            <small class="text-muted">
                                <asp:Label ID="Price" runat="server" Text="價格"></asp:Label>
                            </small>
                        </div>
                    </div>
                    <hr class="my-4">
                    <asp:Button class="w-100 btn btn-primary btn-lg" ID="PaymentP" runat="server" Text="確認付款" OnClick="PaymentP_Click" />
                </div>
            </form>
        </main>
    </div>


    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">2020 LongMeter</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">隱私權說明</a></li>
            <li class="list-inline-item"><a 
                >線上服務</a></li>
        </ul>
    </footer>


    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
