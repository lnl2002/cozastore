<%-- 
    Document   : datatables
    Created on : Mar 9, 2023, 2:08:57 PM
    Author     : Nhat Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <title> DataTables</title>
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/ruang-admin.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <style>
            .update-delete{
                display:flex;
                width: 30px;
                height: 30px;
                background-color: yellow;
                align-items: center;
                justify-content: center;
                font-size: 20px;
                margin-bottom: 20px;
                color: white;
                cursor: pointer;
            }
        </style>
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav sidebar sidebar-light accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.jsp">
                    <div class="sidebar-brand-icon">
                        <img src="images/icons/logo-02.png" >
                    </div>
                </a>
                <hr class="sidebar-divider my-0">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>
                <hr class="sidebar-divider">





                <li class="nav-item">
                    <a class="nav-link" href="simple-tables.jsp">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Simple Tables</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="datatables.jsp">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Data Tables</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="charts.jsp">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span>
                    </a>
                </li>
                <hr class="sidebar-divider">
                <div class="version" id="version-ruangadmin"></div>
            </ul>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!-- TopBar -->
                    <nav  class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
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
                            <h1 class="h3 mb-0 text-gray-800">DataTables</h1>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Tables</li>
                                <li class="breadcrumb-item active" aria-current="page">DataTables</li>
                            </ol>
                        </div>

                        <!-- Row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Categories</h6>
                                        <h6 class="m-0 font-weight-bold text-primary"> <a href="addcategory" style="font-size: 30px; cursor: pointer"><ion-icon name="add-circle-sharp"></ion-icon> </a> </h6>
                                    </div>

                                    <div class="table-responsive p-3">
                                        <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>Category ID</th>
                                                    <th>Category Name</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${requestScope.categories}" var="c">
                                                    <tr>
                                                        <td>${c.categoryId}</td>
                                                        <td>${c.categoryName}</td>
                                                        <td>
                                                            <div class="update-delete" style="background-color: #ffb848">
                                                                <a href="updatecategory?categoryName=${c.categoryName}" ><ion-icon name="construct-sharp"></ion-icon></a>
                                                            </div>
                                                            <div class="update-delete" style="background-color: red">
                                                                <a onclick="doDelete2('${c.categoryId}')" ><ion-icon name="trash-sharp"></ion-icon></a>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- Datatables -->
                            <div class="col-lg-12">
                                <div class="card mb-4">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Products</h6>
                                        <h6 class="m-0 font-weight-bold text-primary"> <a href="addproduct" style="font-size: 30px; cursor: pointer"><ion-icon name="add-circle-sharp"></ion-icon> </a> </h6>
                                    </div>
                                    <div class="table-responsive p-3">
                                        <table class="table align-items-center table-flush" id="dataTable">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Date release</th>
                                                    <th>Name Product</th>
                                                    <th>Color</th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                    <th>Descript</th>
                                                    <th>Category ID</th>
                                                    <th>Category name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${requestScope.products}" var="c">
                                                    <tr>
                                                        <td>${c.productId}</td>
                                                        <td>${c.dateRelease}</td>
                                                        <td>${c.nameProduct}</td>
                                                        <td>${c.color}</td>
                                                        <td>${c.quantity}</td>
                                                        <td>${c.price}</td>
                                                        <td>${c.descript}</td>
                                                        <td>${c.categoryId}</td>
                                                        <td>${c.categoryName}</td>
                                                        <td>
                                                            <div class="update-delete" style="background-color: #ffb848">
                                                                <a href="updateproduct?id=${c.productId}"><ion-icon name="construct-sharp"></ion-icon></a>
                                                            </div>
                                                            <div class="update-delete" style="background-color: red">
                                                                <a onclick="doDelete('${c.productId}')" ><ion-icon name="trash-sharp"></ion-icon></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- DataTable with Hover -->

                        </div>
                        <!--Row-->

                        

                        

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
        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script>
                                $(document).ready(function () {
                                    $('#dataTable').DataTable(); // ID From dataTable 
                                    $('#dataTableHover').DataTable(); // ID From dataTable with Hover
                                });
        </script>
        <script>
            function doDelete(id) {
                if (confirm("Do you want delete " + id + " ?")) {
                    window.location = "delete?id=" + id;
                }
            }
            function doDelete2(id) {
                if (confirm("Do you want delete " + id + " ?")) {
                    window.location = "deletecategory?id=" + id;
                }
            }
        </script>
        <script>
            function show(){
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
        </script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>

</html>
