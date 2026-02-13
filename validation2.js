


document.getElementById("registrationForm").addEventListener("submit", async function (e) {
     e.preventDefault();
    let valid = true;

    // Clear previous errors
    document.querySelectorAll(".error-message").forEach(span => {
        span.textContent = "";
        span.style.display = "none";
    });

    document.querySelectorAll("input, select").forEach(el => {
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

    const form = e.target;



    // Validation checks
    if (!form.Title.value) setError(form.Title, "Select a title");
    if (!form.first_name.value.trim()) setError(form.first_name, "First name required");
    if (!form.last_name.value.trim()) setError(form.last_name, "Last name required");
    if (!form.Position.value) setError(form.Position, "Select a position");
    if (!form.company.value.trim()) setError(form.company, "Company required");
    if (!form.myfile.value.trim()) setError(form.myfile, "Upload File");
    if (!form.mydate.value.trim()) setError(form.mydate, "Select a date");
    
   

   

    // Password Conditions
    const password = form.Password.value;

    if (password.length < 6) {
    setError(form.Password, "Password must be at least 6 characters");
    }
    else if (!/[A-Z]/.test(password)) {
    setError(form.Password, "Password must contain at least one uppercase letter");
    }
    else if (!/[0-9]/.test(password)) {
    setError(form.Password, "Password must contain at least one number");
    }
    else if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
    setError(form.Password, "Password must contain at least one special character");
    }


    // Checkbox validation
    if (!form.terms.checked) {
        const termsContainer = form.terms.parentElement;
        const errorSpan = termsContainer.querySelector(".error-message");
        valid = false;
        if (errorSpan) {
            errorSpan.textContent = "You must accept the terms";
            errorSpan.style.display = "block";
        }
    }
    // Confirm Password
    if (form.Password.value !== form.CPassword.value) {
    setError(form.CPassword, "Passwords do not match"); }
    

    // =======================
// EMAIL & PHONE LOGIC



// EMAIL is mandatory
if (!form.Email.value.trim()) {
    setError(form.Email, "Email is mandatory");

    // ALSO show error under phone only if phone is empty
    if (!form.Number.value.trim()) {
        setError(form.Number, "Email is mandatory");
    }
} else {
    // Email format check
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.Email.value.trim())) {
        setError(form.Email, "Invalid email format");
    }

    // AJAX Email Check
if (form.Email.value.trim() && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.Email.value.trim())) {
    const emailExists = await checkEmail(form.Email.value.trim());
    console.log(emailExists)
    if (emailExists) setError(form.Email, "Email is already registered");
}


    // PHONE is optional — validate only if filled
    if (form.Number.value.trim()) {
        if (!/^\d{7,15}$/.test(form.Number.value.trim())) {
            setError(form.Number, "Invalid phone number");
        }
    }
}



    // If form is valid, submit
    if (!valid) {
        e.preventDefault();
    }
});



// showing image of the seleced file

const fileInput = document.getElementById("file");
const filePreview = document.getElementById("filePreview");

fileInput.addEventListener("change", function(){
    const file =  this.files[0];
    if (file){
        const reader = new FileReader ();
        reader.onload =  function(e) {
            filePreview.src= e.target.result;
            filePreview.style.display="block";

        }
        reader.readAsDataURL(file);
        
    }else{
        filePreview.src = "";
        filePreview.style.display ="none";
    }

});