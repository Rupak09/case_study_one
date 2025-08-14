-- USERS
CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- TRIP
CREATE TABLE Trip (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    trip_name VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- PLACE
CREATE TABLE Place (
    place_id INT PRIMARY KEY AUTO_INCREMENT,
    place_name VARCHAR(150) NOT NULL,
    place_type VARCHAR(50) NOT NULL
);

-- TRIP - PLACE RELATIONSHIP (many-to-many)
CREATE TABLE TripPlace (
    trip_id INT NOT NULL,
    place_id INT NOT NULL,
    PRIMARY KEY (trip_id, place_id),
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id),
    FOREIGN KEY (place_id) REFERENCES Place(place_id)
);

-- ACCOMMODATION
CREATE TABLE Accommodation (
    accom_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL
);

-- TRIP - ACCOMMODATION RELATIONSHIP 
CREATE TABLE TripAccommodation (
    trip_id INT NOT NULL,
    accom_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    PRIMARY KEY (trip_id, accom_id),
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id),
    FOREIGN KEY (accom_id) REFERENCES Accommodation(accom_id)
);

-- EXPENSE
CREATE TABLE Expense (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT NOT NULL,
    category ENUM('Food', 'Entry Ticket', 'Cab', 'Misc') NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id)
);

-- TRANSPORT
CREATE TABLE Transport (
    transport_id INT PRIMARY KEY AUTO_INCREMENT,
    mode VARCHAR(50) NOT NULL,
    company VARCHAR(100),
    price DECIMAL(10,2) NOT NULL
);

-- TRIP - TRANSPORT RELATIONSHIP 
CREATE TABLE TripTransport (
    trip_id INT NOT NULL,
    transport_id INT NOT NULL,
    departure_time DATETIME,
    arrival_time DATETIME,
    PRIMARY KEY (trip_id, transport_id),
    FOREIGN KEY (trip_id) REFERENCES Trip(trip_id),
    FOREIGN KEY (transport_id) REFERENCES Transport(transport_id)
);
