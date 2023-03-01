<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    
        <section>
            <div class="form-box">
                <form action="login" method="post">
                    <div class="form-value">
                        <h2>Login</h2>
                        <div class="inputbox">
                            <ion-icon name="mail-outline"></ion-icon>
                            <input type="email" required name="username">
                            <label for="">Email</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" required name="password">
                            <label for="">Password</label>
                        </div>
                        <div class="forget">
                            <label for=""><input type="checkbox" name="" id="">Remember Me</label>
                        </div>
                        <button style="--clr:#6eff3e" type="submit"><span>Log in</span><i></i></button>
                        <div class="register">
                            <p>Don't have a account <a href="register.jsp">Register</a></p>
                        </div>
                    </div>
                </form>
            </div>
            
            <div class="toast" >
               
                <!-- Fail -->
                <div class="toast-message toast-failure"  style="display: ${requestScope.fail}">
                    <div class="toast-icon">
                        <ion-icon name="alert-circle-sharp"></ion-icon>
                    </div>
                    <div class="toast-body">
                        <h3 class="title">Failure</h3>
                        <p class="message">Login fail!! Please try again</p>
                    </div>
                    <div class="toast-close">
                        <ion-icon name="close-outline"></ion-icon>
                    </div>
                </div>
            </div>
        </section>
        


    
   
    <!-- Icont -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>