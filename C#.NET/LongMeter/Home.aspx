<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LongMeter.Home" %>

<!DOCTYPE html>

<html lang="zh-Hant-TW">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>LongMeter</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
    <script type="text/javascript">
        function diplay(S) {
            if (S == "Login") {
                document.getElementById("LogOutNav").style.display = "block";
                document.getElementById("LoginNav").style.display = "none";
            }
            else if (S == "Logout") {
                document.getElementById("LogOutNav").style.display = "none";
                document.getElementById("LoginNav").style.display = "block";
            }
        }
        function workerAd(Ad) {
            if (Ad == true) {
                document.getElementById("product5").style.display = "none";
                document.getElementById("adWorker").style.display = "block";
            }
            else if (Ad == false) {
                document.getElementById("product5").style.display = "block";
                document.getElementById("adWorker").style.display = "none";
            }
        }

    </script>
</head>
<body>
    <form runat="server">
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
                        <li class="nav-item" style="display: block" id="LoginNav">
                            <div class="dropdown">
                                <a class="btn btn-secondary btn-menu" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">登入I註冊
                                </a>
                                <div class="dropdown-menu">
                                    <asp:Panel ID="LoginF" class="px-4 py-3" runat="server" DefaultButton="Sign">
                                        <div class="form-group">
                                            <label for="Account">Account</label>
                                            <asp:TextBox class="form-control" ID="Account" runat="server" placeholder="Account"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="Password">Password</label>
                                            <asp:TextBox class="form-control" ID="Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <asp:Button class="btn btn-secondary" ID="Sign" runat="server" Text="Sign in" OnClick="Login_Click" />
                                    </asp:Panel>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="signUp.aspx">New around here? Sign up</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item" id="LogOutNav" style="display: none">
                            <div class="dropdown">
                                <a class="btn btn-secondary btn-menu" href="#" role="button" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">登出
                                </a>
                                <div class="dropdown-menu">
                                    <asp:Panel ID="LogOutF" class="px-4 py-3" runat="server" DefaultButton="LogOut">
                                        <label for="Member">MemberID</label>
                                        <asp:Label ID="Member_id" runat="server" Text=""></asp:Label>
                                        <asp:Button class="btn btn-secondary" ID="LogOut" runat="server" Text="LogOut" OnClick="LogOut_Click" />
                                    </asp:Panel>
                                </div>
                            </div>
                        </li>
                        <!-- Login -->
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container">
            <div class="row">

                <div class="col-lg-3">
                    <img style="width: 235px; height: 600px; padding-top: 100px; padding-right: 20px;" src="" alt="求贊助">
                </div>
                <!-- /.col-lg-3 -->
                <div class="col-lg-9">
                    <div id="carouselExampleIndicators" class="carousel slide my-4 carousel-fade" data-ride="carousel">
                        <!-- 圖片到哪提示 -->
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        </ol>
                        <!-- 輪播 -->
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block img-fluid" src="materials\photo\m\cover_001.png" alt="First slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>廣告</h5>
                                    <p>賣錢錢錢</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="materials\photo\900\裁切_210108_1.jpg" alt="Second slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>廣告</h5>
                                    <p>賣錢錢錢</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="materials\photo\900\裁切_210108_4.jpg" alt="Third slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>廣告</h5>
                                    <p>賣錢錢錢</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block img-fluid" src="materials\photo\900\裁切_210108_2.jpg" alt="Fourth slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>


                    <!-- Search -->
                    <asp:Panel ID="Search" runat="server" DefaultButton="SearchBtn">
                        <div class="input-group mb-3">
                            <asp:DropDownList ID="kind" runat="server">
                                <asp:ListItem Selected="True">title</asp:ListItem>
                                <asp:ListItem>category</asp:ListItem>
                                <asp:ListItem>country</asp:ListItem>
                                <asp:ListItem>payment</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox class="form-control" ID="SearchText" runat="server" placeholder="search for....?"></asp:TextBox>
                            <div class="input-group-append">
                                <asp:Button class="btn btn-outline-secondary" ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" />
                            </div>
                        </div>
                    </asp:Panel>
                    <!-- Search -->


                    <!-- 商品空間 -->
                    <div class="row">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="materials\photo\700\裁切_210108.jpg" alt=""></a>

                                <div class="card-body">
                                    <h4 class="card-title" style="color: yellowgreen">
                                        <asp:Label ID="productTitle1" runat="server" Text="商品"></asp:Label>
                                    </h4>
                                    <h5>
                                        <asp:Label ID="Price1" runat="server" Text="999"></asp:Label></h5>
                                    <p class="card-text">
                                        <asp:Label ID="Machine1" runat="server" Text="機器ID"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Country1" runat="server" Text="國家"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Location1" runat="server" Text="地址"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="payment1" runat="server" Text="支付方法"></asp:Label>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p>
                                                已售出:
                                                <asp:Label ID="sellC1" runat="server" Text="255"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <asp:LinkButton ID="Buy1" runat="server" Text="直接購買" PostBackUrl="payment.aspx"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="materials\photo\700\裁切_210108_0.jpg" alt=""></a>

                                <div class="card-body">
                                    <h4 class="card-title" style="color: yellowgreen">
                                        <asp:Label ID="productTitle2" runat="server" Text="商品"></asp:Label>
                                    </h4>
                                    <h5>
                                        <asp:Label ID="Price2" runat="server" Text="999"></asp:Label></h5>
                                    <p class="card-text">
                                        <asp:Label ID="Machine2" runat="server" Text="機器ID"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Country2" runat="server" Text="國家"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Location2" runat="server" Text="地址"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="payment2" runat="server" Text="支付方法"></asp:Label>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p>
                                                已售出:
                                                <asp:Label ID="sellC2" runat="server" Text="255"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <asp:LinkButton ID="Buy2" runat="server" Text="直接購買" PostBackUrl="payment.aspx"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="materials\photo\700\裁切_210108_4.jpg" alt=""></a>

                                <div class="card-body">
                                    <h4 class="card-title" style="color: yellowgreen">
                                        <asp:Label ID="productTitle3" runat="server" Text="商品"></asp:Label>
                                    </h4>
                                    <h5>
                                        <asp:Label ID="Price3" runat="server" Text="999"></asp:Label></h5>
                                    <p class="card-text">
                                        <asp:Label ID="Machine3" runat="server" Text="機器ID"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Country3" runat="server" Text="國家"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Location3" runat="server" Text="地址"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="payment3" runat="server" Text="支付方法"></asp:Label>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p>
                                                已售出:
                                                <asp:Label ID="sellC3" runat="server" Text="255"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <asp:LinkButton ID="Buy3" runat="server" Text="直接購買" PostBackUrl="payment.aspx"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="materials\photo\700\裁切_210108_2.jpg" alt=""></a>

                                <div class="card-body">
                                    <h4 class="card-title" style="color: yellowgreen">
                                        <asp:Label ID="productTitle4" runat="server" Text="商品"></asp:Label>
                                    </h4>
                                    <h5>
                                        <asp:Label ID="Price4" runat="server" Text="999"></asp:Label></h5>
                                    <p class="card-text">
                                        <asp:Label ID="Machine4" runat="server" Text="機器ID"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Country4" runat="server" Text="國家"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Location4" runat="server" Text="地址"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="payment4" runat="server" Text="支付方法"></asp:Label>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p>
                                                已售出:
                                                <asp:Label ID="sellC4" runat="server" Text="255"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <asp:LinkButton ID="Buy4" runat="server" Text="直接購買" PostBackUrl="payment.aspx"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4" id="product5" style="display: none;">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="materials\photo\700\裁切_210108_3.jpg" alt=""></a>

                                <div class="card-body">
                                    <h4 class="card-title" style="color: yellowgreen">
                                        <asp:Label ID="productTitle5" runat="server" Text="商品"></asp:Label>
                                    </h4>
                                    <h5>
                                        <asp:Label ID="Price5" runat="server" Text="999"></asp:Label></h5>
                                    <p class="card-text">
                                        <asp:Label ID="Machine5" runat="server" Text="機器ID"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Country5" runat="server" Text="國家"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Location5" runat="server" Text="地址"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="payment5" runat="server" Text="支付方法"></asp:Label>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p>
                                                已售出:
                                                <asp:Label ID="sellC5" runat="server" Text="255"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <asp:LinkButton ID="Buy5" runat="server" Text="直接購買" PostBackUrl="payment.aspx"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4" id="adWorker" style="display: none;">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="materials\photo\700\3947.png_860.png" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title" style="color: yellowgreen">
                                        <asp:Label ID="workerName" runat="server" Text="工人名"></asp:Label>
                                    </h4>
                                    <h5>
                                        <asp:Label ID="Salary" runat="server" Text="NT 200/hr"></asp:Label></h5>
                                    <p class="card-text">
                                        <asp:Label ID="Work" runat="server" Text="工作種類"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Gender" runat="server" Text="性別"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Phone" runat="server" Text="電話"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="email" runat="server" Text="信箱"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="payMethod" runat="server" Text="支付方法"></asp:Label>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <a href="#">
                                    <img class="card-img-top" src="materials\photo\700\裁切_210108_1.jpg" alt=""></a>

                                <div class="card-body">
                                    <h4 class="card-title" style="color: yellowgreen">
                                        <asp:Label ID="productTitle6" runat="server" Text="商品"></asp:Label>
                                    </h4>
                                    <h5>
                                        <asp:Label ID="Price6" runat="server" Text="999"></asp:Label></h5>
                                    <p class="card-text">
                                        <asp:Label ID="Machine6" runat="server" Text="機器ID"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Country6" runat="server" Text="國家"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="Location6" runat="server" Text="地址"></asp:Label>
                                    </p>
                                    <p class="card-text">
                                        <asp:Label ID="payment6" runat="server" Text="支付方法"></asp:Label>
                                    </p>
                                </div>
                                <div class="card-footer">
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p>
                                                已售出:
                                                <asp:Label ID="sellC6" runat="server" Text="255"></asp:Label>
                                            </p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <asp:LinkButton ID="Buy6" runat="server" Text="直接購買" PostBackUrl="payment.aspx"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.row -->

                    <!-- 下頁按鈕 -->
                    <div>
                        <nav aria-label="Change Page">
                            <ul class="pagination justify-content-center">

                                <li class="page-item">
                                    <asp:Button class="page-link" ID="btnPage1" runat="server" Text="1" OnClick="Page1" /></li>
                                <li class="page-item">
                                    <asp:Button class="page-link" ID="btnPage2" runat="server" Text="2" OnClick="Page2" /></li>

                                <li class="page-item">
                                    <asp:Button class="page-link" ID="btnPage3" runat="server" Text="3" OnClick="Page3" /></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- 下頁按鈕 ↑-->
                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-4 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">客服服務:090999999 </p>
                <p class="m-0 text-center text-white">聯絡信箱:090999999 </p>
                <p class="m-0 text-center text-white">LongMeter Thank you </p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
