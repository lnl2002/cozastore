<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Shoping Cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body class="animsition">

        <!-- Header -->
        <header class="header-v4">
            <!-- Header desktop -->
            <div class="container-menu-desktop">
                <!-- Topbar -->
                <div class="top-bar">
                    <div class="content-topbar flex-sb-m h-full container">
                        <div class="left-top-bar">
                            Free shipping for standard order over $100
                        </div>

                        <div class="right-top-bar flex-w h-full">
                            <a href="#" class="flex-c-m trans-04 p-lr-25">
                                Help & FAQs
                            </a>

                            <a href="profile" class="flex-c-m trans-04 p-lr-25">
                                My Account
                            </a>


                        </div>
                    </div>
                </div>

                <div class="wrap-menu-desktop how-shadow1">
                    <nav class="limiter-menu-desktop container">

                        <!-- Logo desktop -->		
                        <a href="#" class="logo">
                            <img src="images/icons/logo-01.png" alt="IMG-LOGO">
                        </a>

                        <!-- Menu desktop -->
                        <div class="menu-desktop">
                            <ul class="main-menu">
                                <li>
                                    <a href="index">Home</a>

                                </li>

                                <li>
                                    <a href="product">Shop</a>
                                </li>

                                <li class="label1" >
                                    <a href="shopingcart">Shoping cart</a>
                                </li>


                                <li>
                                    <a href="about.jsp">About</a>
                                </li>

                                <li>
                                    <a href="contact.jsp">Contact</a>
                                </li>
                            </ul>
                        </div>	

                        <!-- Icon header -->
                        <div class="wrap-icon-header flex-w flex-r-m">
                            <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                                <i class="zmdi zmdi-search"></i>
                            </div>

                            <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
                                <i class="zmdi zmdi-shopping-cart"></i>
                            </div>

                            <a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                                <i class="zmdi zmdi-favorite-outline"></i>
                            </a>
                        </div>
                    </nav>
                </div>	
            </div>

            <!-- Header Mobile -->
            <div class="wrap-header-mobile">
                <!-- Logo moblie -->		
                <div class="logo-mobile">
                    <a href="index"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
                </div>

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m m-r-15">
                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
                        <i class="zmdi zmdi-search"></i>
                    </div>

                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>

                    <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
                        <i class="zmdi zmdi-favorite-outline"></i>
                    </a>
                </div>

                <!-- Button show menu -->
                <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </div>
            </div>


            <!-- Menu Mobile -->
            <div class="menu-mobile">
                <ul class="topbar-mobile">
                    <li>
                        <div class="left-top-bar">
                            Free shipping for standard order over $100
                        </div>
                    </li>

                    <li>
                        <div class="right-top-bar flex-w h-full">
                            <a href="#" class="flex-c-m p-lr-10 trans-04">
                                Help & FAQs
                            </a>

                            <a href="#" class="flex-c-m p-lr-10 trans-04">
                                My Account
                            </a>

                            <a href="#" class="flex-c-m p-lr-10 trans-04">
                                EN
                            </a>

                            <a href="#" class="flex-c-m p-lr-10 trans-04">
                                USD
                            </a>
                        </div>
                    </li>
                </ul>

                <ul class="main-menu-m">
                    <li>
                        <a href="index">Home</a>

                        <span class="arrow-main-menu-m">
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                        </span>
                    </li>

                    <li>
                        <a href="product">Shop</a>
                    </li>

                    <li>
                        <a href="shopingcart" class="label1 rs1" data-label1="hot">Features</a>
                    </li>

                    <li>
                        <a href="blog.jsp">Blog</a>
                    </li>

                    <li>
                        <a href="about.jsp">About</a>
                    </li>

                    <li>
                        <a href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </div>

            <!-- Modal Search -->
            <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
                <div class="container-search-header">
                    <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                        <img src="images/icons/icon-close2.png" alt="CLOSE">
                    </button>

                    <form class="wrap-search-header flex-w p-l-15">
                        <button class="flex-c-m trans-04">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                        <input class="plh3" type="text" name="search" placeholder="Search...">
                    </form>
                </div>
            </div>
        </header>

        <!-- Cart -->
        <div class="wrap-header-cart js-panel-cart">
            <div class="s-full js-hide-cart"></div>

            <div class="header-cart flex-col-l p-l-65 p-r-25">
                <div class="header-cart-title flex-w flex-sb-m p-b-8">
                    <span class="mtext-103 cl2">
                        Your Cart
                    </span>

                    <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>

                <div class="header-cart-content flex-w js-pscroll">
                    <ul class="header-cart-wrapitem w-full">
                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="images/item-cart-01.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    White Shirt Pleat
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $19.00
                                </span>
                            </div>
                        </li>

                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="images/item-cart-02.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    Converse All Star
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $39.00
                                </span>
                            </div>
                        </li>

                        <li class="header-cart-item flex-w flex-t m-b-12">
                            <div class="header-cart-item-img">
                                <img src="images/item-cart-03.jpg" alt="IMG">
                            </div>

                            <div class="header-cart-item-txt p-t-8">
                                <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                    Nixon Porter Leather
                                </a>

                                <span class="header-cart-item-info">
                                    1 x $17.00
                                </span>
                            </div>
                        </li>
                    </ul>

                    <div class="w-full">
                        <div class="header-cart-total w-full p-tb-40">
                            Total: $75.00
                        </div>

                        <div class="header-cart-buttons flex-w w-full">
                            <a href="shopingcart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                                View Cart
                            </a>

                            <a href="shopingcart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                                Check Out
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- breadcrumb -->
        <div class="container">
            <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
                <a href="index" class="stext-109 cl8 hov-cl1 trans-04">
                    Home
                    <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
                </a>

                <span class="stext-109 cl4">
                    Ordered
                </span>
            </div>
        </div>

        <div class="m-l-300 m-t-50">
            <h3>Order date: </h3>
        </div>
        <!-- Shoping Cart -->
        <div class="bg0 p-t-75 ">
            <div class="container">
                <div class="row">
                    <div action="updatecart" class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                        <c:forEach items="${requestScope.list}" var="c">
                            <c:forEach items="${c}" var="od">
                                ${od.productName}
                            </c:forEach>

                        </c:forEach>
                        <div class="m-l-25 m-r--38 m-lr-0-xl">
                            <div class="wrap-table-shopping-cart">
                                <table class="table-shopping-cart">
                                    <tr class="table_head">
                                        <th class="column-1">Product</th>
                                        <th class="column-2"></th>
                                        <th class="column-3">Price</th>
                                        <th class="column-4">Quantity</th>
                                        <th class="column-5">Size</th>
                                    </tr>

                                    <h6 style="display: none" class="productId">${od.productId}</h6>
                                    <tr class="table_row">
                                        <td class="column-1">

                                            <div class="how-itemcart1">
                                                <img src="" alt="IMG">
                                            </div>

                                        </td>
                                        <td class="column-2 " >${od.productName}(Size ${c.size})</td>
                                        <td class="column-3 ">$ ${od.price}</td>
                                        <td class="column-4">
                                            <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                                <div  class="btn-num-product-down  cl8 hov-btn3 trans-04 flex-c-m">
                                                    <i class="fs-16 zmdi zmdi-minus"></i>
                                                </div>

                                                <input  class="mtext-104 cl3 txt-center num-product amount" type="number" name="num-product1" value="${od.quantity}">

                                                <div   class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" >
                                                    <i class="fs-16 zmdi zmdi-plus"></i>
                                                </div>
                                            </div>
                                        </td>
                                        <td  class="column-5">${od.size}</td>
                                    </tr>


                                </table>
                            </div>
                            <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm  ">
                                <h5>TOTAL: ${od.total} </h5>

                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>




        <!-- Footer -->
        <footer class="bg3 p-t-75 p-b-32">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            Categories
                        </h4>

                        <ul>
                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Women
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Men
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Shoes
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Watches
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            Help
                        </h4>

                        <ul>
                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Track Order
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Returns 
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    Shipping
                                </a>
                            </li>

                            <li class="p-b-10">
                                <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                                    FAQs
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            GET IN TOUCH
                        </h4>

                        <p class="stext-107 cl7 size-201">
                            Any questions? Let us know in store at FPT University, Hoa Lac, Thach That, Ha Noi or call us on (+84) 984 068 859
                        </p>

                        <div class="p-t-27">
                            <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-facebook"></i>
                            </a>

                            <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-instagram"></i>
                            </a>

                            <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                                <i class="fa fa-pinterest-p"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-3 p-b-50">
                        <h4 class="stext-301 cl0 p-b-30">
                            Newsletter
                        </h4>

                        <form>
                            <div class="wrap-input1 w-full p-b-4">
                                <input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com">
                                <div class="focus-input1 trans-04"></div>
                            </div>

                            <div class="p-t-18">
                                <button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                                    Subscribe
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="p-t-40">
                    <div class="flex-c-m flex-w p-b-18">
                        <a href="#" class="m-all-1">
                            <img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
                        </a>

                        <a href="#" class="m-all-1">
                            <img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
                        </a>

                        <a href="#" class="m-all-1">
                            <img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
                        </a>

                        <a href="#" class="m-all-1">
                            <img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
                        </a>

                        <a href="#" class="m-all-1">
                            <img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
                        </a>
                    </div>


                </div>
            </div>
        </footer>


        <!-- Back to top -->
        <div class="btn-back-to-top" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="zmdi zmdi-chevron-up"></i>
            </span>
        </div>

        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <script>
            $(".js-select2").each(function () {
                $(this).select2({
                    minimumResultsForSearch: 20,
                    dropdownParent: $(this).next('.dropDownSelect2')
                });
            })
        </script>
        <!--===============================================================================================-->
        <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
            $('.js-pscroll').each(function () {
                $(this).css('position', 'relative');
                $(this).css('overflow', 'hidden');
                var ps = new PerfectScrollbar(this, {
                    wheelSpeed: 1,
                    scrollingThreshold: 1000,
                    wheelPropagation: false,
                });

                $(window).on('resize', function () {
                    ps.update();
                })
            });
        </script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script>

            function changeTotal(productId) {
                var total = 0;
                var discount = document.getElementById("discount");
                var discount_raw = discount.innerHTML;
                let numStr1 = discount_raw.match(/[0-9]+/g).join("");
                var discountValue = parseInt(numStr1);  //discount value

                var productIds = document.getElementsByClassName("productId");
                var prices = document.getElementsByClassName("price");
                var amounts = document.getElementsByClassName('amount');
                var totalProducts = document.getElementsByClassName('totalProduct');
                var values = [];
                for (var i = 0; i < amounts.length; i++) {
                    values.push(amounts[i].value);
                }
                for (var i = 0; i < prices.length; i++) {
                    let str = prices[i].innerHTML;
                    let numStr = str.match(/[0-9.]+/g).join("");
                    let price = parseFloat(numStr);
                    if (productIds[i].innerHTML == productId) {
                        totalProducts[i].innerHTML = "$ " + (price * (parseInt(values[i]) - 1));
                        total += price * (parseInt(values[i]) - 1);
                    } else {
                        totalProducts[i].innerHTML = "$ " + (price * parseInt(values[i]));
                        total += price * parseInt(values[i]);
                    }

                }
                document.getElementById("total-of-product").innerHTML = "$ " + (total);
                document.getElementById("total-discount").innerHTML = "$ " + (total - total * discountValue / 100);
            }

            function changeTotal2() {
                var total = 0;
                var discount = document.getElementById("discount");
                var discount_raw = discount.innerHTML;
                let numStr1 = discount_raw.match(/[0-9]+/g).join("");
                var discountValue = parseInt(numStr1);  //discount value

                var prices = document.getElementsByClassName("price");
                var amounts = document.getElementsByClassName('amount');
                var totalProducts = document.getElementsByClassName('totalProduct');
                var values = [];
                for (var i = 0; i < amounts.length; i++) {
                    values.push(amounts[i].value);
                }
                for (var i = 0; i < prices.length; i++) {
                    let str = prices[i].innerHTML;
                    let numStr = str.match(/[0-9.]+/g).join("");
                    let price = parseFloat(numStr);
                    totalProducts[i].innerHTML = "$ " + (price * parseInt(values[i]));
                    total += price * parseInt(values[i]);
                }
                document.getElementById("total-of-product").innerHTML = "$ " + (total);
                document.getElementById("total-discount").innerHTML = "$ " + (total - total * discountValue / 100);
            }
            function changeTotal3(productId) {
                var total = 0;
                var discount = document.getElementById("discount");
                var discount_raw = discount.innerHTML;
                let numStr1 = discount_raw.match(/[0-9]+/g).join("");
                var discountValue = parseInt(numStr1);  //discount value

                var productIds = document.getElementsByClassName("productId");
                var prices = document.getElementsByClassName("price");
                var amounts = document.getElementsByClassName('amount');
                var totalProducts = document.getElementsByClassName('totalProduct');
                var values = [];
                for (var i = 0; i < amounts.length; i++) {
                    values.push(amounts[i].value);
                }
                for (var i = 0; i < prices.length; i++) {
                    let str = prices[i].innerHTML;
                    let numStr = str.match(/[0-9.]+/g).join("");
                    let price = parseFloat(numStr);
                    if (productIds[i].innerHTML == productId) {
                        totalProducts[i].innerHTML = "$ " + (price * (parseInt(values[i]) + 1));
                        total += price * (parseInt(values[i]) + 1);
                    } else {
                        totalProducts[i].innerHTML = "$ " + (price * parseInt(values[i]));
                        total += price * parseInt(values[i]);
                    }

                }
                document.getElementById("total-of-product").innerHTML = "$ " + (total);
                document.getElementById("total-discount").innerHTML = "$ " + (total - total * discountValue / 100);
            }

            var discount = document.getElementById("discount");
            var discount_raw = discount.innerHTML;
            let numStr1 = discount_raw.match(/[0-9]+/g).join("");
            var discountValue = parseInt(numStr1);  //discount value
            var total = 0;
            var prices = document.getElementsByClassName("price");
            var amounts = document.getElementsByClassName('amount');
            var totalProducts = document.getElementsByClassName('totalProduct');
            var values = [];
            for (var i = 0; i < amounts.length; i++) {
                values.push(amounts[i].value);
            }
            for (var i = 0; i < prices.length; i++) {
                let str = prices[i].innerHTML;
                let numStr = str.match(/[0-9.]+/g).join("");
                let price = parseFloat(numStr);
                totalProducts[i].innerHTML = "$ " + (price * parseInt(values[i]));
                total += price * parseInt(values[i]);
            }
            document.getElementById("total-of-product").innerHTML = "$ " + (total);
            document.getElementById("total-discount").innerHTML = "$ " + (total - total * discountValue / 100);
        </script>


    </body>
</html>