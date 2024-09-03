CREATE TABLE UserRole (
    ID INT PRIMARY KEY,
    Name VARCHAR(25) NOT NULL
);

CREATE TABLE Category (
    ID INT PRIMARY KEY,
    Name VARCHAR(30) NOT NULL
);

CREATE TABLE ShippingCompany (
    ID INT PRIMARY KEY,
    Name VARCHAR(60) NOT NULL
);

CREATE TABLE Product (
    ID INT PRIMARY KEY,
    Name VARCHAR(60) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2),
    Available BOOLEAN,
    Interchangeable BOOLEAN,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

CREATE TABLE User (
    CUI INT PRIMARY KEY,
    Username VARCHAR(25) NOT NULL,
    Email VARCHAR(25) NOT NULL,
    Name VARCHAR(60) NOT NULL,
    Lastname VARCHAR(60) NOT NULL,
    Phone VARCHAR(12),
    Address TEXT,
    RoleID INT,
    Password VARCHAR(30) NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES UserRole(ID)
);

CREATE TABLE UserInventory (
    UserID INT,
    ProductID INT,
    PRIMARY KEY (UserID, ProductID),
    FOREIGN KEY (UserID) REFERENCES User(CUI),
    FOREIGN KEY (ProductID) REFERENCES Product(ID)
);

CREATE TABLE Post (
    ID INT PRIMARY KEY,
    UserCUI INT,
    Description TEXT,
    ProductID INT,
    Date DATE,
    State BOOLEAN,
    FOREIGN KEY (UserCUI) REFERENCES User(CUI),
    FOREIGN KEY (ProductID) REFERENCES Product(ID)
);

CREATE TABLE PostDetails (
    PostID INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(30),
    PRIMARY KEY (PostID),
    FOREIGN KEY (PostID) REFERENCES Post(ID)
);

CREATE TABLE Offer (
    ID INT PRIMARY KEY,
    UserCUI INT,
    Description TEXT,
    State BOOLEAN,
    Date DATE,
    FOREIGN KEY (UserCUI) REFERENCES User(CUI)
);

CREATE TABLE OfferDetails (
    OfferID INT,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(30),
    PRIMARY KEY (OfferID),
    FOREIGN KEY (OfferID) REFERENCES Offer(ID)
);

CREATE TABLE Trade (
    PostID INT,
    OfferID INT,
    Date DATE,
    PRIMARY KEY (PostID, OfferID),
    FOREIGN KEY (PostID) REFERENCES Post(ID),
    FOREIGN KEY (OfferID) REFERENCES Offer(ID)
);

CREATE TABLE Shipping (
    ID INT PRIMARY KEY,
    Date DATE,
    DepartureDate DATE,
    DeliveryDate DATE,
    TradePostID INT,
    TradeOfferID INT,
    ReceptorID INT,
    SenderID INT,
    ShippingCompanyID INT,
    FOREIGN KEY (TradePostID, TradeOfferID) REFERENCES Trade(PostID, OfferID),
    FOREIGN KEY (ReceptorID) REFERENCES User(CUI),
    FOREIGN KEY (SenderID) REFERENCES User(CUI),
    FOREIGN KEY (ShippingCompanyID) REFERENCES ShippingCompany(ID)
);