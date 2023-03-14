<%-- 
    Document   : add-category
    Created on : Mar 10, 2023, 6:07:02 PM
    Author     : Nhat Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
    <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
    <link rel="stylesheet" href="css/addCategory.css">
</head>
<body>
    <form action="addcategory" method="post" class="container">
        <div class="btn-back">
           <a href="tableproduct"><ion-icon name="arrow-back-sharp"></ion-icon></a> 
        </div>
        <div class="inputBox">
            <input type="text" required="required" name="categoryName">
            <span>Category Name</span> 
        </div>
        <div class="btn">
            <button type="submit">Add</button>
        </div>
    </form>
    <h3 style="color: ${requestScope.color};">${requestScope.message}</h3>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
