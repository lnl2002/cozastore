<%-- 
    Document   : addSize
    Created on : Mar 20, 2023, 11:27:41 PM
    Author     : Nhat Anh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <form action="addsize" method="post" class="container">
            <div class="btn-back">
                <a href="tableproduct"><ion-icon name="arrow-back-sharp"></ion-icon></a> 
            </div>
            <div class="inputBox">
                <input type="text" required="required" name="size">
                <span>Size</span> 
            </div>
            <div class="inputBox">
                <input type="text" required="required" name="description">
                <span>Description</span> 
            </div>
            <div class="inputBox">
                <p>Add into?</p>
                <select class="category" name="category">
                    <option value="all">All</option>
                    <c:forEach items="${requestScope.categories}" var="c">
                        <option value="${c.categoryId}" >${c.categoryName}</option>
                    </c:forEach>
                </select>

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
