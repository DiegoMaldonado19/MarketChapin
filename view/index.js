document.addEventListener('DOMContentLoaded', function() {
    // Fetch session data
    fetch('../controller/SessionController.php')
        .then(response => response.json())
        .then(sessionData => {
            const userContainer = document.getElementById('user-info');
            const loginLink = document.querySelector('a[href="login/login.html"]');
            console.log("a");
            if (sessionData.authenticated == true) {
                // Mostrar mensaje de bienvenida
                userContainer.innerHTML = `
                    <p>Bienvenido, ${sessionData.username}</p>
                `;
                console.log("b");
                // Ocultar enlace de "Inicio de Sesión"
                if (loginLink) {
                    loginLink.style.display = 'none';
                    console.log("c");
                }
            } else {
                userContainer.innerHTML = `
                    <p>Bienvenido!</p>
                `;
                console.log("d");
            }
        })
        .catch(error => console.error('Error fetching session data:', error));

    // Fetch product data
    fetch('../controller/IndexController.php')
        .then(response => response.json())
        .then(data => {
            const productsContainer = document.getElementById('featured-products');
            data.forEach(post => {
                const productCard = document.createElement('div');
                productCard.className = 'col-md-4';
                productCard.innerHTML = `
                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title h5">Producto ${post.product_id}</h3>
                            <p class="card-text">${post.description}</p>
                            <p class="card-text">Fecha: ${post.date}</p>
                            <p class="card-text">Estado: ${post.state == 1 ? 'Disponible' : 'No disponible'}</p>
                        </div>
                    </div>
                `;
                productsContainer.appendChild(productCard);
            });
        })
        .catch(error => console.error('Error fetching posts:', error));
});
