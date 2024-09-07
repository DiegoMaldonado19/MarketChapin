document.addEventListener('DOMContentLoaded', function() {

// Fetch product data
    fetch('/controller/ViewOffersController.php')
        .then(response => response.json())
        .then(data => {
            const offersContainer = document.getElementById('offers');
            data.forEach(offer => {
                const categoriesCard = document.createElement('div');
                categoriesCard.className = 'col-md-4';
                categoriesCard.innerHTML = `
                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title h5">Oferta ${offer.id}</h3>
                            <p class="card-text">${offer.user_cui}</p>
                            <p class="card-text">${offer.description}</p>
                            <p class="card-text">${offer.state}</p>
                            <p class="card-text">${offer.date}</p>
                        </div>
                    </div>
                `;
                offersContainer.appendChild(categoriesCard);
            });


            navContainer.innerHTML = `     
                <li class="nav-item"><a class="nav-link text-white" href="../index.html">Inicio</a></li>
                `;

        })
        .catch(error => console.error('Error fetching posts:', error));

});