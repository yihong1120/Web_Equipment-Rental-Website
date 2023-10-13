<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="LongMeter.signUp" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MemberApply</title>

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
                <h2>會員申請</h2>
            </div>

            <div class="g-3">
                <div class="col-md-7 col-lg-8 mx-auto">
                    <h4 class="mb-3">會員資訊</h4>
                    <form class="needs-validation" novalidate runat="server">
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">First name</label>
                                <asp:TextBox class="form-control" ID="firstName" runat="server" required="true"></asp:TextBox>
                                <div class="invalid-feedback">
                                    Valid first name is required.
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Last name</label>
                                <asp:TextBox class="form-control" ID="lastName" runat="server" required="true"></asp:TextBox>
                                <div class="invalid-feedback">
                                    Valid last name is required.
                                </div>
                            </div>

                            <div class="col-12 py-2">
                                <label for="Account" class="form-label">Account</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="Account" runat="server" placeholder="Account" required="true"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Your Account is required.
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 py-2">
                                <label for="Password" class="form-label">Password</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="password" runat="server" placeholder="password" TextMode="Password" required="true"></asp:TextBox>
                                    <div class="invalid-feedback">
                                        Your password is required.
                                    </div>
                                </div>
                            </div>


                            <div class="col-12 py-2">
                                <label for="Phone" class="form-label">
                                    Phone<span class="text-muted">(Optional)</span></label>
                                <asp:TextBox class="form-control" ID="Phone" runat="server" placeholder="cellphone" required="true"></asp:TextBox>
                            </div>

                            <div class="col-12 py-2">
                                <label for="email" class="form-label">Email</label>
                                <asp:TextBox class="form-control" ID="email" runat="server" placeholder="you@example.com" required="true"></asp:TextBox>
                                <div class="invalid-feedback">
                                    Please enter a valid email address for shipping updates.
                                </div>
                            </div>

                            <div class="col-12 py-2">
                                <label for="address" class="form-label">Address</label>
                                <asp:TextBox class="form-control" ID="address" runat="server" ></asp:TextBox>
                                <div class="invalid-feedback">
                                    Please enter your shipping address.
                                </div>
                            </div>
                        </div>
                        <hr class="my-4">

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="privacy">
                            <label class="form-check-label" for="same-address">我已閱讀隱私條款</label>
                        </div>

                        <div class="form-check py-2">
                            <input type="checkbox" class="form-check-input" id="same-address">
                            <label class="form-check-label" for="same-address">用地址當作我預設寄送位置</label>
                        </div>
                        <div class="py-2">
                            <asp:Button class="w-100 btn btn-primary btn-lg py" ID="Apply" runat="server" Text="申請" OnClick="Apply_Click" />
                        </div>
                    </form>
                </div>
            </div>
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
