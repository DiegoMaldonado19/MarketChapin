document.addEventListener("DOMContentLoaded", function () {

    const categoryCreationForm = document.getElementById("categoryCreationForm");

    categoryCreationForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const name = document.getElementById("name").value;

        const formData = new FormData();
        formData.append("name", name);

        fetch('../../controller/CategoryCreationController.php', {
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

                window.location.href = "../index.html";
            })
            .catch(error => {
                console.error("Error:", error);
                alert("Ocurrió un error. Por favor, inténtalo de nuevo más tarde.");
            });
    });


});