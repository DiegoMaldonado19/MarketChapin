document.addEventListener("DOMContentLoaded", function() {
    const registerForm = document.getElementById("registerForm");

    registerForm.addEventListener("submit", function(event) {
        event.preventDefault();

        const cui = document.getElementById("cui").value;
        const username = document.getElementById("username").value;
        const email = document.getElementById("email").value;
        const name = document.getElementById("name").value;
        const lastname = document.getElementById("lastname").value;
        const phone = document.getElementById("phone").value;
        const address = document.getElementById("address").value;
        const password = document.getElementById("password").value;

        const formData = new FormData();
        formData.append("cui", cui);
        formData.append("username", username);
        formData.append("email", email);
        formData.append("name", name);
        formData.append("lastname", lastname);
        formData.append("phone", phone);
        formData.append("address", address);
        formData.append("password", password);

        fetch("/controller/UserCreationController.php", {
            method: "POST",
            body: formData
        })
            .then(response => {
                return response.text().then(text => {
                    try {
                        return JSON.parse(text);
                    } catch (error) {
                        console.error("Error parsing JSON:", error, text);
                        throw new Error("Invalid JSON response");
                    }
                });
            })
            .then(data => {
                if (data.success) {
                    alert(data.message);
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Ocurrió un error. Por favor, inténtalo de nuevo más tarde.");
            });
    });


});