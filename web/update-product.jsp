<%-- 
    Document   : update-product
    Created on : Mar 11, 2023, 8:59:33 PM
    Author     : Nhat Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
   <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add product</title>
    <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
    <link rel="stylesheet" href="css/addCategory.css">
    <style>
        .product{
            border: 1px solid  #00dfc4;
            border-radius: 10px;
            padding: 40px;
        }
        .inputBox {
            position: relative;
            width: 250px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form action="updateproduct?id=${requestScope.productId}" method="post" class="container product">
        <div class="btn-back">
           <a href="tableproduct"><ion-icon name="arrow-back-sharp"></ion-icon></a> 
        </div>
        <div class="inputBox">
            <input type="text" required="required" name="nameProduct" value="${requestScope.productName}">
            <span>Name product</span> 
        </div>
        <div class="inputBox">
            <input type="text" required="required" name="color" value="${requestScope.color}">
            <span>Color</span> 
        </div>
        <div class="inputBox">
            <input type="number" required="required" name="quantity"  value="${requestScope.quantity}">
            <span>Quantity</span> 
        </div>
        <div class="inputBox ">
            <input type="text" required="required" name="price" value="${requestScope.price}">
            <span>Price</span> 
        </div>
        
        <div class="inputBox descipt">
            <input type="text" required="required"  name="descript" value="${requestScope.descript}">
            <span>Descipt</span> 
        </div>
        <div class="inputBox">
            <input type="number" required="required" name="categoryId" value="${requestScope.categoryId}">
            <span>CategoryId</span> 
        </div>
<!--        <div class="inputBox">
            <input type="image" required="required">
            <span>CategoryId</span> 
        </div>-->
        
        <div class="btn">
            <button  type="submit" >Update</button>
        </div>
    </form>
    <h3 style="color: ${requestScope.colorStyle};">${requestScope.message}</h3>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    
</body>
</html>
</html>
