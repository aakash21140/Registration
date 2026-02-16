<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sign In</title>
  <link rel="stylesheet" href="login.css" />
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
 

</head>
<body>

  <form id="loginForm" action="logincfm.cfm" method="post">
    <div class="form_two">
      <h1>Sign In</h1>

      <!-- Email -->
      <div class="input-boxx">
        <input type="text" name="Email" id = "Email" placeholder="Your Email" value="#form.Email#">



        <span class="error-message">
          <cfif isDefined("loginError") AND loginError neq "">
            <cfoutput>#loginError#</cfoutput>
          </cfif>
        </span>
      </div>

      <!-- Password -->
      <div class="input-boxx">
        <input type="password" id= "Password" name="Password" placeholder="Your Password">
        <span class="error-message"></span>
      </div>

      <!-- Remember me + forgot password -->
      <div class="login-options">
        <label class="remember-me">
          <input type="checkbox" name="remember" value="1"> Remember me
        </label>
        <a href="forgot-password.html" class="forgot-password">Forgot password?</a>
      </div>

      <!-- Submit button -->
      <button type="submit" class="register-badge">Sign In</button>

      <!-- Link to registration -->
      <div class="auth-link">
        <a href="registration.cfm">Don't have an account? Sign Up</a>
      </div>
    </div>
  </form>

<script>
document.getElementById("loginForm").addEventListener("submit", function(e){
    e.preventDefault();
    let valid = true;

    // Clear previous errors
    document.querySelectorAll(".error-message").forEach(span => {
        span.style.display = "none";
    });

    function setError(input, message){
        valid = false;
        const errorSpan = input.parentElement.querySelector(".error-message");
        if(errorSpan){
            errorSpan.textContent = message;
            errorSpan.style.display = "block";
        }
    }

    const email = document.getElementById("Email");
    const password = document.getElementById("Password");
     
    
    if(!email.value.trim()) setError(email, "Email is required");
    else if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value.trim())) 
    setError(email, "Invalid email format");
    
    if(!password.value.trim()) setError(password, "Password is required");
    
    console.log(email)
    if(valid){
        this.submit(); // Submit form if all validations pass
    } 
});
</script>

</body>
</html>
