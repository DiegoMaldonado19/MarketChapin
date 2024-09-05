document.addEventListener('DOMContentLoaded', function() {

// Fetch product data
    fetch('/controller/ShippingController.php')
        .then(response => response.json())
        .then(data => {
            const productsContainer = document.getElementById('shippings');
            data.forEach(shipping => {
                const shippingsCard = document.createElement('div');
                shippingsCard.className = 'col-md-4';
                shippingsCard.innerHTML = `
                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title h5">Envio ${shipping.id}</h3>
                            <p class="card-text">Fecha de salida: ${shipping.departure_date}</p>
                            <p class="card-text">Fecha de entrega: ${shipping.delivery_date}</p>
                            <p class="card-text">Id Post: ${shipping.trade_post_id}</p>
                            <p class="card-text">Id Oferta: ${shipping.trade_offer_id}</p>
                            <p class="card-text">Id Usuario que recibe: ${shipping.receptor_id}</p>
                            <p class="card-text">Id usuario que envia: ${shipping.sender_id}</p>
                            <p class="card-text">Id empresa encargada del envio: ${shipping.shipping_company_id}</p>
                        </div>
                    </div>
                `;
                productsContainer.appendChild(shippingsCard);
            });
        })
        .catch(error => console.error('Error fetching posts:', error));

});