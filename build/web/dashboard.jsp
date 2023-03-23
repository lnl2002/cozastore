<%-- 
    Document   : dashboard
    Created on : Mar 9, 2023, 2:09:23 PM
    Author     : Nhat Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <title>Dash Board</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/ruang-admin.min.css" rel="stylesheet">

    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon">
                        <img src="images/icons/logo-02.png">
                    </div>
                    <div class="sidebar-brand-text mx-3"></div>
                </a>
                <hr class="sidebar-divider my-0">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="tableproduct">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Data Tables</span>
                    </a>
                </li>

                
                <hr class="sidebar-divider">
                <div class="version" id="version-ruangadmin"></div>
            </ul>
        </ul>
        <!-- Sidebar -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <!-- TopBar -->
                <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
                    <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <ul class="navbar-nav ml-auto">


                        <div class="topbar-divider d-none d-sm-block"></div>
                        <li id="showList" class="nav-item dropdown no-arrow" onclick="show()">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <img class="img-profile rounded-circle" src="images/boy.png" style="max-width: 60px">
                                <span class="ml-2 d-none d-lg-inline text-white small">${sessionScope.username}</span>
                            </a>
                            <div id="showList2"  class="dropdown-menu dropdown-menu-right shadow animated--grow-in " aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="profile">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout" data-toggle="modal" >
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- Topbar -->

                <!-- Container Fluid-->
                <div class="container-fluid" id="container-wrapper">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                        </ol>
                    </div>

                    <div class="row mb-3">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-uppercase mb-1">Total Revenue (Monthly)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">$${requestScope.moneyInMonth}</div>
                                            <div class="mt-2 mb-0 text-muted text-xs">
                                                <span class="${requestScope.color} mr-2"><i class="fa ${requestScope.symbol}"></i> ${requestScope.ratio}%</span>
                                                <span>Since last month</span>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-money-bill fa-2x text-primary"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-uppercase mb-1">Number Orders in month</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.numberOrder}</div>
                                            <div class="mt-2 mb-0 text-muted text-xs">
                                                <span class="${requestScope.colorOrder} mr-2"><i class="fas ${requestScope.symbolOrder}"></i> ${requestScope.numberOrderRatio}%</span>
                                                <span>Since last month</span>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-shopping-cart fa-2x text-success"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- New User Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-uppercase mb-1">Total Revenue (Year)</div>
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">$${requestScope.totalYear}</div>
                                            <div class="mt-2 mb-0 text-muted text-xs">
                                                <span class="${requestScope.colorYear} mr-2"><i class="fas ${requestScope.symbolYear}"></i> ${requestScope.yearRatio}%</span>
                                                <span>Since last year</span>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-money-bill-wave fa-2x text-info"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pending Requests Card Example -->


                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Monthly Recap Report</h6>
                                    <div id="showListTiny3" class="dropdown no-arrow" onclick="show3()">
                                        <a class="dropdown-toggle btn btn-primary btn-sm" href="#" role="button" id="dropdownMenuLink"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${requestScope.monthlyTitle} <i class="fas fa-chevron-down"></i>
                                        </a>
                                        <div id="showListTiny4" class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                             aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item ${requestScope.active2021}" href="dashboard?year=2021">2021</a>
                                            <a class="dropdown-item ${requestScope.active2022}" href="dashboard?year=2022">2022</a>
                                            <a class="dropdown-item ${requestScope.active2023}" href="dashboard?year=2023">2023</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card mb-4">
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Products Sold 2023</h6>
                                    <div id="showListTiny" class="dropdown no-arrow" onclick="show2()">
                                        <a class="dropdown-toggle btn btn-primary btn-sm" href="#" role="button" id="dropdownMenuLink"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${requestScope.cicrleTitle} <i class="fas fa-chevron-down"></i>
                                        </a>
                                        <div id="showListTiny2" class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                             aria-labelledby="dropdownMenuLink">
                                            <a class="dropdown-item ${requestScope.active1}" href="dashboard?option=1">Month</a>
                                            <a class="dropdown-item ${requestScope.active2}" href="dashboard?option=2">Year</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <canvas id="myCircleChart"></canvas>
                                </div>

                            </div>
                        </div>
                        <!-- Bar chart -->
                        <div class="col-lg-8">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Chart compares the total revenue of the years</h6>
                                </div>
                                <div class="card-body">
                                    <div class="chart-bar">
                                        <canvas id="myBarChart"></canvas>
                                    </div>
                                    <hr>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Row-->



                    <!-- Modal Logout -->
                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure you want to logout?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                    <a href="login.html" class="btn btn-primary">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!---Container Fluid-->
            </div>
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>copyright &copy; <script> document.write(new Date().getFullYear());</script> - developed by
                            <b>lamlnhe161656</b>
                        </span>
                    </div>
                </div>
            </footer>
            <!-- Footer -->
        </div>
    </div>

    <!-- Scroll to top -->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/ruang-admin.min.js"></script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    
    <!--        <script src="js/demo/chart-area-demo.js"></script>  -->
    <script>
                            // Set new default font family and font color to mimic Bootstrap's default styling
                            Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                            Chart.defaults.global.defaultFontColor = '#858796';

                            function number_format(number, decimals, dec_point, thousands_sep) {
                                // *     example: number_format(1234.56, 2, ',', ' ');
                                // *     return: '1 234,56'
                                number = (number + '').replace(',', '').replace(' ', '');
                                var n = !isFinite(+number) ? 0 : +number,
                                        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                                        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                                        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                                        s = '',
                                        toFixedFix = function (n, prec) {
                                            var k = Math.pow(10, prec);
                                            return '' + Math.round(n * k) / k;
                                        };
                                // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                                s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
                                if (s[0].length > 3) {
                                    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                                }
                                if ((s[1] || '').length < prec) {
                                    s[1] = s[1] || '';
                                    s[1] += new Array(prec - s[1].length + 1).join('0');
                                }
                                return s.join(dec);
                            }
                            var ctx = document.getElementById("myAreaChart");
                            var myLineChart = new Chart(ctx, {
                                type: 'line',
                                data: {
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                    datasets: [{
                                            label: "Earnings",
                                            lineTension: 0.3,
                                            backgroundColor: "rgba(78, 115, 223, 0.5)",
                                            borderColor: "rgba(78, 115, 223, 1)",
                                            pointRadius: 3,
                                            pointBackgroundColor: "rgba(78, 115, 223, 1)",
                                            pointBorderColor: "rgba(78, 115, 223, 1)",
                                            pointHoverRadius: 3,
                                            pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                                            pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                                            pointHitRadius: 10,
                                            pointBorderWidth: 2,
                                            data: [${requestScope.month1}, ${requestScope.month2}, ${requestScope.month3}, ${requestScope.month4}, ${requestScope.month5}, ${requestScope.month6}
                                                , ${requestScope.month7}, ${requestScope.month8}, ${requestScope.month9}, ${requestScope.month10}, ${requestScope.month11}, ${requestScope.month12}],
                                        }],
                                },
                                options: {
                                    maintainAspectRatio: false,
                                    layout: {
                                        padding: {
                                            left: 10,
                                            right: 25,
                                            top: 25,
                                            bottom: 0
                                        }
                                    },
                                    scales: {
                                        xAxes: [{
                                                time: {
                                                    unit: 'date'
                                                },
                                                gridLines: {
                                                    display: false,
                                                    drawBorder: false
                                                },
                                                ticks: {
                                                    maxTicksLimit: 7
                                                }
                                            }],
                                        yAxes: [{
                                                ticks: {
                                                    maxTicksLimit: 5,
                                                    padding: 10,
                                                    // Include a dollar sign in the ticks
                                                    callback: function (value, index, values) {
                                                        return '$' + number_format(value);
                                                    }
                                                },
                                                gridLines: {
                                                    color: "rgb(234, 236, 244)",
                                                    zeroLineColor: "rgb(234, 236, 244)",
                                                    drawBorder: false,
                                                    borderDash: [2],
                                                    zeroLineBorderDash: [2]
                                                }
                                            }],
                                    },
                                    legend: {
                                        display: false
                                    },
                                    tooltips: {
                                        backgroundColor: "rgb(255,255,255)",
                                        bodyFontColor: "#858796",
                                        titleMarginBottom: 10,
                                        titleFontColor: '#6e707e',
                                        titleFontSize: 14,
                                        borderColor: '#dddfeb',
                                        borderWidth: 1,
                                        xPadding: 15,
                                        yPadding: 15,
                                        displayColors: false,
                                        intersect: false,
                                        mode: 'index',
                                        caretPadding: 10,
                                        callbacks: {
                                            label: function (tooltipItem, chart) {
                                                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                                return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                                            }
                                        }
                                    }
                                }
                            });

    </script>
    <script>
        var ctx = document.getElementById('myCircleChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Women', 'Men', 'Bag', 'Shoes', 'Watch'],
                datasets: [{
                        label: '# of Votes',
                        data: [${requestScope.categoryQuantity1}, ${requestScope.categoryQuantity2}, ${requestScope.categoryQuantity3},
        ${requestScope.categoryQuantity4}, ${requestScope.categoryQuantity5}],
                        backgroundColor: [
                            'rgba(255, 99, 132)',
                            'rgba(54, 162, 235)',
                            'rgba(255, 206, 86)',
                            'rgba(75, 192, 192)',
                            'rgba(153, 102, 255)',
                            'rgba(255, 159, 64)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: 'Product Sold ( ${requestScope.thisMonth} )'
                },
                legend: {
                    position: 'bottom',
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        });
    </script>
    <script>
        function show() {
            document.getElementById("showList").classList.toggle("show");
            document.getElementById("showList2").classList.toggle("show");
            var btn = document.getElementsByClassName("dropdown-toggle");
            var ariaExpandedValue = btn.getAttribute('aria-expanded');
            if (ariaExpandedValue === 'false') {
                btn.setAttribute('aria-expanded', 'true'); // Thiết lập giá trị mới là true
            } else {
                btn.setAttribute('aria-expanded', 'false');
            }
        }
        function show2() {
            document.getElementById("showListTiny").classList.toggle("show");
            document.getElementById("showListTiny2").classList.toggle("show");
            var btn = document.getElementsByClassName("dropdown-toggle");
            var ariaExpandedValue = btn.getAttribute('aria-expanded');
            if (ariaExpandedValue === 'false') {
                btn.setAttribute('aria-expanded', 'true'); // Thiết lập giá trị mới là true
            } else {
                btn.setAttribute('aria-expanded', 'false');
            }
        }
        function show3() {
            document.getElementById("showListTiny3").classList.toggle("show");
            document.getElementById("showListTiny4").classList.toggle("show");
            var btn = document.getElementsByClassName("dropdown-toggle");
            var ariaExpandedValue = btn.getAttribute('aria-expanded');
            if (ariaExpandedValue === 'false') {
                btn.setAttribute('aria-expanded', 'true'); // Thiết lập giá trị mới là true
            } else {
                btn.setAttribute('aria-expanded', 'false');
            }
        }
    </script>
    <script>
        // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        function number_format(number, decimals, dec_point, thousands_sep) {
            // *     example: number_format(1234.56, 2, ',', ' ');
            // *     return: '1 234,56'
            number = (number + '').replace(',', '').replace(' ', '');
            var n = !isFinite(+number) ? 0 : +number,
                    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                    s = '',
                    toFixedFix = function (n, prec) {
                        var k = Math.pow(10, prec);
                        return '' + Math.round(n * k) / k;
                    };
            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
            s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
            if (s[0].length > 3) {
                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
            }
            if ((s[1] || '').length < prec) {
                s[1] = s[1] || '';
                s[1] += new Array(prec - s[1].length + 1).join('0');
            }
            return s.join(dec);
        }

// Bar Chart Example
        var ctx = document.getElementById("myBarChart");
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["2021", "2022", "2023"],
                datasets: [{
                        label: "Revenue",
                        backgroundColor: "#4e73df",
                        hoverBackgroundColor: "#2e59d9",
                        borderColor: "#4e73df",
                        data: [${requestScope.total2021}, ${requestScope.total2022},${requestScope.total2023}],
                    }],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                            time: {
                                unit: 'year'
                            },
                            gridLines: {
                                display: false,
                                drawBorder: false
                            },
                            ticks: {
                                maxTicksLimit: 6
                            },
                            maxBarThickness: 25,
                        }],
                    yAxes: [{
                            ticks: {
                                 maxTicksLimit: 5,
                                 padding: 10,
                                // Include a dollar sign in the ticks
                                callback: function (value, index, values) {
                                    return '$' + number_format(value);
                                }
                            },
                            gridLines: {
                                color: "rgb(234, 236, 244)",
                                zeroLineColor: "rgb(234, 236, 244)",
                                drawBorder: false,
                                borderDash: [2],
                                zeroLineBorderDash: [2]
                            }
                        }],
                },
                legend: {
                    display: false
                },
                tooltips: {
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function (tooltipItem, chart) {
                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                        }
                    }
                },
            }
        });

    </script>
</body>

</html>
