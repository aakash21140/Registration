<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registration</title>

  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="registration.css">
  <script>
   function extractDateDetails(input) {
    const monthLabel = document.getElementById("mon");
    const yearLabel = document.getElementById("yr");

    if (input.value) {
        const selectedDate = new Date(input.value);
        monthLabel.textContent = selectedDate.toLocaleString('default', { month: 'long' });
        yearLabel.textContent = selectedDate.getFullYear();
        monthLabel.style.color = "green";
        yearLabel.style.color = "green";
    } else {
        monthLabel.textContent = "Month";
        yearLabel.textContent = "Year";
        monthLabel.style.color = "#333";
        yearLabel.style.color = "#333";
    }
    }
  </script>

</head>
<body>

<form id="registrationForm" action="register.cfm" method="post" enctype="multipart/form-data">

  <div id="main">

    <!-- FORM ONE -->
    <div class="form_one">
      <h1>General Information</h1>

      <!-- Title -->
      <div class="input-box">
        <select name="Title" id="title">
          <option value="">Title</option>
          <option>Mr</option>
          <option>Mrs</option>
          <option>Ms</option>
          <option>Dr</option>
        </select>
        <i class='bx bx-chevron-down'></i>
        <span class="error-message"></span>
      </div>

      <!-- First / Last Name -->
      <div class="name">
        <div class="input-box">
          <input type="text" name="first_name" placeholder="First Name">
          <span class="error-message"></span>
        </div>
        <div class="input-box">
          <input type="text" name="last_name" placeholder="Last Name">
          <span class="error-message"></span>
        </div>
      </div>

      <!-- Position -->
      <div class="input-box">
        <select name="Position">
          <option value="">Position</option>
          <option>Manager</option>
          <option>Developer</option>
          <option>Designer</option>
        </select>
        <i class='bx bx-chevron-down'></i>
        <span class="error-message"></span>
      </div>

      <!-- Company -->
      <div class="input-box">
        <input type="text" name="company" placeholder="Company">
        <span class="error-message"></span>
      </div>

      <!-- Business / Employees -->
      
      <div class="input-box file-box">
        <input type="file" name="myfile" id="file" accept="image/*">
          <span class="error-message"></span>

      <div class="preview-container">
          <img id="filePreview" src="" alt="Image Preview">
      </div>
      </div>


      <!--DAte -->
       <div class="input-box date-box">
        <input type="date" name="mydate" id="date" onchange="extractDateDetails(this)">
         <span class="error-message"></span>
         <div class="date-preview">
         <label id="mon">Month</label>
         <label id="yr">Year</label>
         </div>
       </div>


      
    </div>

    <!-- FORM TWO -->
    <div class="form_two">
      <h1>Sign Up</h1>

    

        <div class="input-boxx">
          <input type="text" name="Number"  id="Phone" placeholder="Phone Number">
          <span class="error-message"></span>
        </div>
      

      <div class="input-boxx">
        <input type="text" name="Email" id="Email" placeholder="Your Email">
        <span class="error-message"></span>
      </div>

      <div class="input-boxx password-box">
        <input type="confirm password" name="Password" placeholder="Your Password">
        <span class="info-icon">i
          <div class="password-rules">
           <ul>
             <li>At least 6 characters</li>
             <li>One uppercase letter</li>
             <li>One number</li>
             <li>One special character</li>
           </ul>
           </div>
         </span>

 
        <span class="error-message"></span>

      </div>

      <div class="input-boxx">
        <input type="confirm password" name="CPassword" placeholder="Confirm Password">
        <span class="error-message"></span>
      </div>

      <div class="checkbox-container">
        <input type="checkbox" name="terms" id="terms" value="1">
        <label for="terms">
          I do accept the <a href="#" class="terms-link">Terms and Conditions</a>
        </label>
        <span class="error-message"></span>
      </div>

     <!--- <input type="submit" class="register-badge" name="submit" value="Register Badge"> --->
      <button type="submit" class="register-badge" value="submit" name="submit">Register Badge</button>

      <div class="auth-link">
       <a href="login.cfm">Already have an account? Sign in</a>
      </div>

      
    </div>
       

  </div>
</form>

<script src="validation2.js"></script>
</body>
</html>
