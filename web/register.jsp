<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration</title>
        <link rel="stylesheet" href="css/login1.css">
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <style>
            h2 {
                position: absolute;
                bottom: 80%;
                text-align: center;
            }
            .form-info {
                margin-top: 0px;
                margin-left: 100px;
            }

            .submit{
                position: absolute;
                top: 83%;
                text-align: center;
            }
            .container {
                width: 900px;
                height: 580px;
            }
        </style>
    </head>
    <body>

        <section>
            <form class="form-box container" action="register" method="post">
                <h2>Registration</h2>
                <div class="form-value form-register">

                    <div class="inputbox">
                        <h3 style="color: red">${requestScope.existEmail}</h3>
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="email" required name="username">
                        <label for="">Email</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" required name="password">
                        <label for="">Password</label>
                    </div>
                    <div class="inputbox">
                        <h3 style="color: red">${requestScope.rePassword}</h3>
                        <ion-icon name="lock-closed-outline"></ion-icon>
                        <input type="password" required name="rePassword">
                        <label for="">Re-enter password</label>
                    </div>
                </div>

                <div class="form-value form-info">

                    <div class="inputbox">
                        <ion-icon name="mail-outline"></ion-icon>
                        <input type="text" required name="name">
                        <label for="">Name</label>
                    </div>
                    <div class="inputbox">
                        <h3 style="color: red">${requestScope.wrongDate}</h3>
                        <ion-icon name="calendar-outline"></ion-icon>
                        <input type="text" required name="birth">
                        <label for="">Birth (YYYY-MM-DD)</label>
                    </div>
                    <div class="inputbox">
                        <h3 style="color: red">${requestScope.wrongPhone}</h3>
                        <ion-icon name="call-outline"></ion-icon>
                        <input type="text" required name="phone">
                        <label for="">Phone</label>
                    </div>
                    <div class="inputbox">
                        <ion-icon name="location-outline"></ion-icon>
                        <input type="text" required name="address">
                        <label for="">Address</label>
                    </div>


                </div>
                <div class="submit">
                    <button type="submit" class="next-link" style="--clr:#6eff3e" ><span>Create</span><i></i></button>
                    <div class="register">
                        <p>Had an account <a href="login">Log in</a></p>
                    </div>
                </div>

            </form>

            <div class="toast" >
                <!-- success -->
                <div class="toast-message toast-success" style="display: ${requestScope.sucess}">
                     <div class="toast-icon">
                    <ion-icon name="checkmark-circle-sharp"></ion-icon>
                </div>
                <div class="toast-body">
                    <h3 class="title">Success</h3>
                    <p class="message">${requestScope.message}</p>
                </div>
                <div class="toast-close">
                    <ion-icon name="close-outline"></ion-icon>
                </div>
            </div>
            <!-- Fail -->
            <div class="toast-message toast-failure"  style="display: ${requestScope.fail}">
                <div class="toast-icon">
                    <ion-icon name="alert-circle-sharp"></ion-icon>
                </div>
                <div class="toast-body">
                    <h3 class="title">Failure</h3>
                    <p class="message">${requestScope.message}</p>
                </div>
                <div class="toast-close">
                    <ion-icon name="close-outline"></ion-icon>
                </div>
            </div>
        </div>
    </section>




    <script src="js/register.js"></script>
    <!-- Icont -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>