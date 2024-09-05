# MarketChapin

The MarketChapin website developed using the MVC (Model-View-Controller) architecture. 
Allows users to create post to offer their products and receive money or another product,
it represents a purchase, sale and exchanges model.
The app is built using PHP, MySQL, JavaScript, HTML, and CSS.

## Features

- **User Registration and Authentication**: Users can sign up for an account, and registered users can log in securely to access their tasks.

- **Post Creation**: Users can create posts to show and offer their available products to the rest of the users in the system.

- **Home page view**: Users can view all the available products in the main page without login, they need to login if they wan to answer to the post with an offer.

- **Inventory Management**: Users can manage their products with a simple and interactive Inventory View.

- **Offer Creation**: Users can create offers to answer to the post, they need to login before creating any offer.

- **Category views**: Users can view all the available products by categories.


## Technologies Used

- **MySQL**: Used as the database management system to store user information and market data.

- **PHP**: Used for server-side scripting and handling backend logic.

- **JavaScript**: Provides interactive functionality and dynamic updates on the frontend.

- **HTML**: Responsible for structuring the content and layout of the app.

- **CSS**: Used for styling the app and making it visually appealing.

## MVC Architecture

The app follows the MVC architectural pattern to ensure separation of concerns and maintainable code:

- **Model**: Represents the data and business logic of the application. In this app, the models handle database interactions, such as retrieving and updating tasks.
We used PHP in all the Model structure.

- **View**: Responsible for rendering the user interface. Views generate the HTML that is sent to the user's browser.
We used HTML, Javascript and CSS in all the Views structure.

- **Controller**: Manages the interaction between the model and the view. Controllers handle user requests, process input data, and update the model accordingly. They also determine which view should be displayed to the user.
We used PHP for all the controller structure.

## Installation and Setup

1. Clone the repository to your web server's directory.

2. Create a MySQL database and import the provided SQL file (`database.sql`) to set up the required tables.
You can find it under the following path: `database/sql file`.

3. Make sure you have a web server (e.g., Apache) running with PHP enabled.

4. Open the app in your web browser.

## Usage

1. You can open the main page an visualize all the available products.

2. If you want to add a new post or add a new offer for a product, you will need to login in the system.

3. After logging the site will show you a new panel and new buttons to create your post and offers.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.

2. Create a new branch for your feature or bug fix.

3. Make your changes and test thoroughly.

4. Submit a pull request, explaining the changes you've made.

## Autor ✒️

* **Diego José Maldonado Monterroso - 201931811**
* **September 05, 2024.**
* **Quetzaltenango, Guatemala.**

## License

This project is licensed under the [MIT License](LICENSE).

---