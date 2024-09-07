document.addEventListener("DOMContentLoaded", function () {

    let user_cui = " ";

    fetch('../../controller/SessionController.php')
        .then(response => response.json())
        .then(sessionData => {
            user_cui = sessionData.user_cui;
        })
        .catch(error => console.error('Error fetching session data:', error));


    const postCreationForm = document.getElementById("postCreationForm");

    postCreationForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const description = document.getElementById("description").value;
        const product_name = document.getElementById("product_name").value;
        const product_description = document.getElementById("product_description").value;
        const product_price = document.getElementById("product_price").value;
        const payment_method = document.getElementById("payment_method").value;


        const today = new Date();

        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');

        const formattedDate = `${year}-${month}-${day}`;

        console.log(user_cui);
        const formData = new FormData();
        formData.append("user_cui", user_cui);
        formData.append("description", description);
        formData.append("product_name", product_name);
        formData.append("product_description", product_description);
        formData.append("product_price", product_price);
        formData.append("payment_method", payment_method);
        formData.append("date", formattedDate);

        fetch("/controller/PostCreationController.php", {
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