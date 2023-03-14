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

                                <form action="search2" class="wrap-search-header flex-w p-l-15">
                                    <button type="submit"  class="flex-c-m trans-04">
                                        <i class="zmdi zmdi-search"></i>
                                    </button>
                                    <input class="plh3" type="text" name="search" required placeholder="Search...">
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
                    Shoping Cart
                </span>
            </div>
        </div>

        <!-- Shoping Cart -->
        <div class="bg0 p-t-75 ">
            <div class="container">
                <div class="row">
                    <div action="updatecart" class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                        <div class="m-l-25 m-r--38 m-lr-0-xl">
                            <div class="wrap-table-shopping-cart">
                                <table class="table-shopping-cart">
                                    <tr class="table_head">
                                        <th class="column-1">Product</th>
                                        <th class="column-2"></th>
                                        <th class="column-3">Price</th>
                                        <th class="column-4">Quantity</th>
                                        <th class="column-5">Total</th>
                                    </tr>
                                    <c:forEach items="${requestScope.listProduct}" var="c">
                                        <h6 style="display: none" class="productId">${c.productId}</h6>
                                        <tr class="table_row">
                                            <td class="column-1">
                                                <a href="delete-product-from-cart?productId=${c.productId}">
                                                    <div class="how-itemcart1">
                                                        <img src="${c.image}" alt="IMG">
                                                    </div>
                                                </a>
                                            </td>
                                            <td class="column-2 nameProduct" >${c.nameProduct}(Size ${c.size})</td>
                                            <td class="column-3 price">$ ${c.price}</td>
                                            <td class="column-4">
                                                <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                                    <div onclick="changeTotal(${c.productId})" class="btn-num-product-down  cl8 hov-btn3 trans-04 flex-c-m">
                                                        <i class="fs-16 zmdi zmdi-minus"></i>
                                                    </div>

                                                    <input onchange="changeTotal2()"  class="mtext-104 cl3 txt-center num-product amount" type="number" name="num-product1" value="${c.amount}">

                                                    <div  onclick="changeTotal3(${c.productId})" class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" >
                                                        <i class="fs-16 zmdi zmdi-plus"></i>
                                                    </div>
                                                </div>
                                            </td>
                                            <td  class="column-5 totalProduct"></td>
                                        </tr>
                                    </c:forEach>


                                </table>
                            </div>
                            <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm  ">
                                <form action="coupon" class="flex-w flex-m m-r-20 m-tb-5">
                                    <input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="code" placeholder="Coupon Code">

                                    <button type="submit"  class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
                                        Apply coupon
                                    </button>
                                    <h5 class="m-l-90" style="color: ${requestScope.color}">${requestScope.message}</h5>
                                </form>

                            </div>

                        </div>
                    </div>

                    <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                        <form action="addtoorder" class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                            <h4 class="mtext-109 cl2 p-b-30">
                                Cart Totals
                            </h4>

                            <div class="flex-w flex-t bor12 p-b-13">
                                <div class="size-208">
                                    <span class="stext-110 cl2">
                                        Subtotal:
                                    </span>
                                </div>


                                <div class="size-209">
                                    <span id="total-of-product" class="mtext-110 cl2">
                                        
                                    </span>
                                </div>
                            </div>

                            <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                                <div class="size-208 w-full-ssm">
                                    <span class="stext-110 cl2">
                                        Shipping:
                                    </span>
                                </div>

                                <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                                    <p class="stext-111 cl6 p-t-2">

                                    </p>

                                    <div class="p-t-15">

                                        <div class="bor8 bg0 m-b-12">
                                            <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="name" placeholder="Name" value="${requestScope.customerName}">
                                        </div>
                                        <div class="bor8 bg0 m-b-12">
                                            <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="address" placeholder="Address" value="${requestScope.address}">
                                        </div>

                                        <div class="bor8 bg0 m-b-22">
                                            <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="phone" placeholder="Phone" value="${requestScope.phone}">
                                        </div>
                                        <input name ="discountTotal" type="text" style="display: none" value="${requestScope.discount==null?0:requestScope.discount}" />


                                    </div>
                                </div>
                            </div>

                            <div class="flex-w flex-t p-t-27 p-b-33">
                                <div class="size-208">
                                    <span class="mtext-101 cl2">
                                        Discount:
                                    </span>
                                </div>

                                <div class="size-209 p-t-1">
                                    <span id="discount" class="mtext-110 cl2">
                                        ${requestScope.discount==null?"0":requestScope.discount}%
                                    </span>
                                </div>
                            </div>
                            <div class="flex-w flex-t p-t-27 p-b-33">
                                <div class="size-208">
                                    <span class="mtext-101 cl2">
                                        Total:
                                    </span>
                                </div>

                                <div class="size-209 p-t-1">
                                    <span id="total-discount" class="mtext-110 cl2">
                                    </span>
                                </div>
                            </div>

                            <button type="submit" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                                Order now
                            </button>
                                    <div class="m-t-30" style="color: green">
                                        <h5>${requestScope.orderSuccess}</h5>
                                    </div>
                        </form>
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