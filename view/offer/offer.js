document.addEventListener("DOMContentLoaded", function () {

    let user_cui = " ";

    fetch('../../controller/SessionController.php')
        .then(response => response.json())
        .then(sessionData => {
            user_cui = sessionData.user_cui;
        })
        .catch(error => console.error('Error fetching session data:', error));


    const offerCreationForm = document.getElementById("offerCreationForm");

    offerCreationForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const description = document.getElementById("description").value;
        const amount = document.getElementById("amount").value;
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
        formData.append("date", formattedDate);
        formData.append("amount", amount);
        formData.append("payment_method", payment_method);

        fetch("/controller/OfferCreationController.php", {
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