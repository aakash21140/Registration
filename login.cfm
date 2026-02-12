<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registration</title>

  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="login.css">
</head>
<body>

<form id="loginForm" action="login.php" method="post">
    
  <div class="form_two">
      <h1>Sign in</h1>


    <div class="input-boxx">
      <input type="text" name="Email" id="Email" placeholder="Your Email">
        <span class="error-message"></span>
    </div>

    <div class="input-boxx">
        <input type="confirm password" name="Password" placeholder="Your Password">
        <span class="error-message"></span>
    </div>
    
    <div class="login-options">
     <label class="remember-me">
     <input type="checkbox" name="remember">
       Remember me
     </label>

      <a href="forgot-password.html" class="forgot-password">
       Forgot password?
      </a>
    </div>

  

    <button type="submit" class="register-badge">Sign In </button><br>
    
  </div>

       
      