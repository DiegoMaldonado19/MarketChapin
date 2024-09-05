document.addEventListener('DOMContentLoaded', function() {
    // Fetch session data
    fetch('../controller/SessionController.php')
        .then(response => response.json())
        .then(sessionData => {
            const userContainer = document.getElementById('user-info');
            const loginLink = document.querySelector('a[href="login/login.html"]');

            if (sessionData.authenticated) {
                // Mostrar mensaje de bienvenida
                userContainer.innerHTML = `
                    <p>Bienvenido, ${sessionData.username}</p>
                    <a id="logout-link" href="#">Cerrar Sesión</a>
                `;
                // Ocultar enlace de "Inicio de Sesión"
                if (loginLink) {
                    loginLink.style.display = 'none';
                }

                // Agregar evento de cierre de sesión
                const logoutLink = document.getElementById('logout-link');
                logoutLink.addEventListener('click', function(event) {
                    event.preventDefault();
                    fetch('../controller/Loggout.php')
                        .then(response => response.json())
                        .then(data => {
                            if (!data.authenticated) {
                                window.location.href = 'index.html';
                            }
                        })
                        .catch(error => console.error('Error logging out:', error));
                });
            } else {
                userContainer.innerHTML = `
                    <p>No has iniciado sesión.</p>
                `;
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