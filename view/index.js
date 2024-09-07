document.addEventListener('DOMContentLoaded', function() {
    let isAuthenticated = false;

    // Fetch session data
    fetch('../controller/SessionController.php')
        .then(response => response.json())
        .then(sessionData => {
            const userContainer = document.getElementById('user-info');
            const loginLink = document.querySelector('a[href="login/login.html"]');
            const navContainer = document.getElementById('link-container')

            if (sessionData.authenticated) {
                isAuthenticated = true;
                // Mostrar mensaje de bienvenida
                userContainer.innerHTML = `
                    <p>Bienvenido, ${sessionData.name} ${sessionData.lastname}</p>
                    <a id="logout-link" href="#">Cerrar Sesión</a>
                `;

                if (loginLink) {
                    loginLink.style.display = 'none';
                }

                navContainer.innerHTML = `
                
                <li class="nav-item"><a class="nav-link text-white" href="index.html">Inicio</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="category/category.html">Categorías</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="shipping/shipping.html">Envíos</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="post/post.html">Publicar Producto</a></li>
                `;

                // Agregar evento de cierre de sesión
                const logoutLink = document.getElementById('logout-link');
                logoutLink.addEventListener('click', function(event) {
                    event.preventDefault();
                    fetch('../controller/Loggout.php')
                        .then(response => response.json())
                        .then(data => {
                            if (data.authenticated == false) {
                                // Recargar la página
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
                            <p class="card-text">Descripcion: ${post.description}</p>
                            <p class="card-text">Fecha: ${post.date}</p>
                            <p class="card-text">Estado: ${post.state == 1 ? 'Disponible' : 'No disponible'}</p>
                            ${isAuthenticated ? '<button class="btn btn-primary" onclick="offerCreation()">Hacer oferta</button>' : ''}
                        </div>
                    </div>
                `;
                productsContainer.appendChild(productCard);
            });
        })
        .catch(error => console.error('Error fetching posts:', error));
});