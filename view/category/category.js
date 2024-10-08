document.addEventListener('DOMContentLoaded', function() {

// Fetch product data
    fetch('/controller/CategoryController.php')
        .then(response => response.json())
        .then(data => {
            const productsContainer = document.getElementById('categories');
            const navContainer = document.getElementById('link-container')
            data.forEach(category => {
                const categoriesCard = document.createElement('div');
                categoriesCard.className = 'col-md-4';
                categoriesCard.innerHTML = `
                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title h5">Categoria ${category.id}</h3>
                            <p class="card-text">${category.name}</p>
                        </div>
                    </div>
                `;
                productsContainer.appendChild(categoriesCard);
            });


            navContainer.innerHTML = `     
                <li class="nav-item"><a class="nav-link text-white" href="../index.html">Inicio</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="createCategory.html">Crear Categoria</a></li>
                `;

        })
        .catch(error => console.error('Error fetching posts:', error));

});