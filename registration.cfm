<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Registration</title>

  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="registration.css" />

  <script>
    // Email check function (async)
    async function checkEmail(email) {
      try {
        const response = await fetch("checkEmail.cfm", {
          method: "POST",
          headers: { "Content-Type": "application/x-www-form-urlencoded" },
          body: "Email=" + encodeURIComponent(email),
        });
        const data = await response.json();
        return data.exists;
      } catch (err) {
        console.error("Error checking email:", err);
        return false;
      }
    }

    // Wait for DOM ready
    document.addEventListener("DOMContentLoaded", function () {
      const form = document.getElementById("registrationForm");
      const dateInput = document.getElementById("date");
      const agePreview = document.getElementById("agePreview");
      const fileInput = document.getElementById("file");
      const filePreview = document.getElementById("filePreview");

      // Age calculation on date change
      dateInput.addEventListener("change", function () {
        if (!this.value) {
          agePreview.textContent = "";
          return;
        }
        const dob = new Date(this.value);
        const today = new Date();

        let years = today.getFullYear() - dob.getFullYear();
        let months = today.getMonth() - dob.getMonth();
        const days = today.getDate() - dob.getDate();

        if (days < 0) months--;
        if (months < 0) {
          years--;
          months += 12;
        }

        agePreview.textContent = `Age: ${years} years ${months} months`;
      });

      // File preview on file select
      fileInput.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function (e) {
            filePreview.src = e.target.result;
            filePreview.style.display = "block";
          };
          reader.readAsDataURL(file);
        } else {
          filePreview.src = "";
          filePreview.style.display = "none";
        }
      });

      // Form submission and validation
      form.addEventListener("submit", async function (e) {
        e.preventDefault();
        let valid = true;

        // Clear all previous errors
        document.querySelectorAll(".error-message").forEach((span) => {
          span.textContent = "";
          span.style.display = "none";
        });
        document.querySelectorAll("input, select").forEach((el) => {
          el.classList.remove("error");
        });

        function setError(input, message) {
          valid = false;
          input.classList.add("error");
          const errorSpan = input.parentElement.querySelector(".error-message");
          if (errorSpan) {
            errorSpan.textContent = message;
            errorSpan.style.display = "block";
          }
        }

        // Validate fields
        if (!form.Title.value) setError(form.Title, "Select a title");
        if (!form.first_name.value.trim()) setError(form.first_name, "First name required");
        if (!form.last_name.value.trim()) setError(form.last_name, "Last name required");
        if (!form.Position.value) setError(form.Position, "Select a position");
        if (!form.company.value.trim()) setError(form.company, "Company required");
        if (!form.myfile.value.trim()) setError(form.myfile, "Upload File");
        if (!form.mydate.value.trim()) setError(form.mydate, "Select a date");

        // Password validations
        const password = form.Password.value;
        if (password.length < 6) {
          setError(form.Password, "Password must be at least 6 characters");
        } else if (!/[A-Z]/.test(password)) {
          setError(form.Password, "Password must contain at least one uppercase letter");
        } else if (!/[0-9]/.test(password)) {
          setError(form.Password, "Password must contain at least one number");
        } else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
          setError(form.Password, "Password must contain at least one special character");
        }

        // Confirm password match
        if (form.Password.value !== form.CPassword.value) {
          setError(form.CPassword, "Passwords do not match");
        }

        // Terms checkbox validation
        if (!form.terms.checked) {
          const termsContainer = form.terms.parentElement;
          const errorSpan = termsContainer.querySelector(".error-message");
          valid = false;
          if (errorSpan) {
            errorSpan.textContent = "You must accept the terms";
            errorSpan.style.display = "block";
          }
        }

        // Email & phone validations
        if (!form.Email.value.trim()) {
          setError(form.Email, "Email is mandatory");
          if (!form.Number.value.trim()) {
            setError(form.Number, "Phone is mandatory if email is missing");
          }
        } else {
          // Email format check
          if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.Email.value.trim())) {
            setError(form.Email, "Invalid email format");
          } else {
            // Async email existence check
            const emailExists = await checkEmail(form.Email.value.trim());
            if (emailExists) setError(form.Email, "Email is already registered");
          }
          // Phone optional validation if filled
          if (form.Number.value.trim() && !/^\d{7,15}$/.test(form.Number.value.trim())) {
            setError(form.Number, "Invalid phone number");
          }
        }

        // Submit if valid
        if (valid) {
          form.submit(); // Submit form if valid
        }
      });
    });
  </script>
</head>

<body>
  <form
    id="registrationForm"
    action="register.cfm"
    method="post"
    enctype="multipart/form-data"
  >
    <div id="main">
      <!-- FORM ONE -->
      <div class="form_one">
        <h1>General Information</h1>

        <div class="input-box">
          <select name="Title" id="title">
            <option value="">Title</option>
            <option>Mr</option>
            <option>Mrs</option>
            <option>Ms</option>
            <option>Dr</option>
          </select>
          <i class="bx bx-chevron-down"></i>
          <span class="error-message"></span>
        </div>

        <div class="name">
          <div class="input-box">
            <input type="text" name="first_name" placeholder="First Name" />
            <span class="error-message"></span>
          </div>
          <div class="input-box">
            <input type="text" name="last_name" placeholder="Last Name" />
            <span class="error-message"></span>
          </div>
        </div>

        <div class="input-box">
          <select name="Position">
            <option value="">Position</option>
            <option>Manager</option>
            <option>Developer</option>
            <option>Designer</option>
          </select>
          <i class="bx bx-chevron-down"></i>
          <span class="error-message"></span>
        </div>

        <div class="input-box">
          <input type="text" name="company" placeholder="Company" />
          <span class="error-message"></span>
        </div>

        <div class="input-box file-box">
          <input type="file" name="myfile" id="file" accept="image/*" />
          <span class="error-message"></span>
          <div class="preview-container">
            <img id="filePreview" src="" alt="Image Preview" />
          </div>
        </div>

        <div class="input-box date-box">
          <input type="date" name="mydate" id="date" />
          <span class="error-message"></span>
          <span id="agePreview">Age will appear here</span>
        </div>
      </div>

      <!-- FORM TWO -->
      <div class="form_two">
        <h1>Sign Up</h1>

        <div class="input-boxx">
          <input
            type="text"
            name="Number"
            id="Phone"
            placeholder="Phone Number"
          />
          <span class="error-message"></span>
        </div>

        <div class="input-boxx">
          <input
            type="text"
            name="Email"
            id="Email"
            placeholder="Your Email"
            value=""
          />
          <span class="error-message"></span>
        </div>

        <div class="input-boxx password-box">
          <input type="password" name="Password" placeholder="Your Password" />
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
          <input
            type="password"
            name="CPassword"
            placeholder="Confirm Password"
          />
          <span class="error-message"></span>
        </div>

        <div class="checkbox-container">
          <input type="checkbox" name="terms" id="terms" value="1" />
          <label for="terms">
            I do accept the <a href="#" class="terms-link">Terms and Conditions</a>
          </label>
          <span class="error-message"></span>
        </div>

        <button type="submit" class="register-badge" name="submitBtn" value="submit">Register Badge</button>


        <div class="auth-link">
          <a href="login.cfm">Already have an account? Sign in</a>
        </div>
      </div>
    </div>
  </form>
</body>
</html>
