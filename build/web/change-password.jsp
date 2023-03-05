<%-- 
    Document   : change-password
    Created on : Mar 2, 2023, 9:21:28 PM
    Author     : Nhat Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="css/change.css">
    </head>
    <body>
        <div class="mainDiv">
            <div class="cardStyle">
                <div class="back-home">
                    <a href="profile"><ion-icon name="arrow-back-sharp"></ion-icon></ion-icon></a>
                </div>
                <form action="change" method="post" name="signupForm" id="signupForm">

                    <img src="" id="signupLogo"/>

                    <h2 class="formTitle">
                        Change your account
                    </h2>
                    <h3 style="color: red">${requestScope.message}</h3>
                    <div class="inputDiv">
                        <label class="inputLabel" for="password">Old Password</label>
                        <input type="password" id="" name="oldPassword" required>
                    </div>
                    <div class="inputDiv">
                        <label class="inputLabel" for="password">New Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="inputDiv">
                        <label class="inputLabel" for="confirmPassword">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword">
                    </div>

                    <div class="buttonWrapper">
                        <button type="submit"  onclick="validateSignupForm()" class="submitButton ">
                            <span>Continue</span>

                        </button>
                    </div>

                </form>
            </div>
        </div>
        <script src="js/change.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
