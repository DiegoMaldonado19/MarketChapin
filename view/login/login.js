document.addEventListener("DOMContentLoaded", function() {
    const loginForm = document.getElementById("loginForm");

    loginForm.addEventListener("submit", function(event) {
        event.preventDefault();

        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        const formData = new FormData();
        formData.append("username", username);
        formData.append("password", password);

        fetch("/controller/LoginController.php", {
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
                    // Redirigir al usuario a la página principal o dashboard
                    window.location.href = "../index.html";
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
