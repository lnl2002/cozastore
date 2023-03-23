<%-- 
    Document   : updateSize
    Created on : Mar 21, 2023, 8:41:51 AM
    Author     : Nhat Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Size</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <link rel="stylesheet" href="css/addCategory.css">
        <style>
            .inputBox{
                margin-bottom: 20px;
                width: 400px;
            }
            .category{
                width: 100%;
                text-align: center;
                padding: 5px;
                font-size: 16px;
            }
            .inputBox p{
                font-size: 1em;
                color: rgba(255, 255, 255, 0.705);
                text-transform: uppercase;
                margin-left: 10px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <form action="updatesize" method="post" class="container">
            <div class="btn-back">
                <a href="tableproduct"><ion-icon name="arrow-back-sharp"></ion-icon></a> 
            </div>
            <div class="inputBox">
                <input type="text" name="sizeOld" value="${requestScope.size}" style="display: none;">
                <input type="text" required="required" name="sizeNew" value="${requestScope.size}">
                <span>Size</span> 
            </div>
            <div class="inputBox">
                <input type="text" required="required" name="description" value="${requestScope.description}">
                <span>Description</span> 
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
