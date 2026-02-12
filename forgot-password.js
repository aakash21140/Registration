document.getElementById("forgotForm").addEventListener("submit", function (e) {
    e.preventDefault();
    let valid = true;

    // Clear errors
    document.querySelectorAll(".error-message").forEach(span => {
        span.textContent = "";
        span.style.display = "none";
    });

    document.querySelectorAll("input").forEach(el => {
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
    const email = form.Email.value.trim();

    if (!email) {
        setError(form.Email, "Email is required");
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        setError(form.Email, "Invalid email format");
    }

    if (valid) {
        form.submit();
    }
});



//Date-Preview




