document.addEventListener('DOMContentLoaded', function() {
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
