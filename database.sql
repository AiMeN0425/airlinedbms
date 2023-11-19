create database airlines;
use airlines;
create table Aircraft_type( A_ID int NOT NULL auto_increment primary key, Capacity int, A_model varchar(50), A_weight int, Company varchar(50));

create table Route( Route_ID int NOT NULL auto_increment primary key, Departure varchar(50), Destination VARCHAR(50), R_type VARCHAR(20));

CREATE TABLE Flight (Flight_ID varchar(50) PRIMARY KEY, Departure varchar(50),Arrival varchar(50),Flight_date DATE,Route_ID INT,FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID));

CREATE TABLE Airfare (Fare_ID INT NOT NULL auto_increment PRIMARY KEY,Class varchar(50),Charged_amount decimal(8,2),Description varchar(50),Flight_ID varchar (50),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID) on UPDATE cascade);
ALTER TABLE Airfare
ADD INDEX (Charged_amount);

create table Passengers(P_ID int NOT NULL auto_increment primary key, P_fname varchar(50),P_lname varchar(50),Age int, Street varchar(50),House_no int, City varchar(50),Sex enum('Male','Female'),Flight_ID varchar (50), FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID));

create table Transaction (Ts_ID int NOT NULL auto_increment primary key, Ts_type enum('GooglePay', 'PhonePe', 'Credit Card', 'Debit Card', 'Paytm'),Departure_date date,Booking_date date,Charged_amount decimal(8,2),  Flight_ID varchar (50),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),FOREIGN KEY (Charged_amount) REFERENCES Airfare (Charged_amount));

create table Countries(Country_code int primary key, Country_name varchar(50));

create table Airport( Air_code varchar (50) primary key, Name varchar(50),State varchar(50),City Varchar(50),Country_code int, Foreign key (Country_code) references Countries(Country_code));

create table can_land( Air_code varchar (50) , Flight_ID varchar (50),primary key(Air_code,Flight_ID),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),FOREIGN KEY (Air_code) REFERENCES Airport(Air_code));

create table travels_on(Route_ID int, Flight_ID varchar (50) ,primary key(Route_ID,Flight_ID),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),foreign key (Route_ID) references Route(Route_ID));

create table Passenger_contact(P_ID int, Contact int,primary key(P_ID,Contact),foreign key (P_ID) REFERENCES Passengers(P_ID));

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
INSERT INTO Aircraft_type (A_ID, Capacity, A_model, A_weight, Company)
VALUES
    (503, 220, 'Boeing 747', 394, 'Indigo'),
    (543, 270, 'Boeing 767', 380, 'Vistara'),
    (572, 245, 'Airbus A380', 364, 'AirIndia'),
    (610, 290, 'Boeing 787', 390, 'SpiceJet'),
    (529, 210, 'Airbus A330', 405, 'GoAir'),
    (567, 295, 'Boeing 747', 387, 'AirAsia'),
    (535, 225, 'Boeing 787', 355, 'TruJet'),
    (591, 250, 'Airbus A380', 410, 'Alliance Air'),
    (520, 215, 'Boeing 767', 380, 'Jet Airways'),
    (538, 280, 'Airbus A330', 372, 'Air France'),
    (512, 265, 'Boeing 787', 398, 'Lufthansa'),
    (546, 275, 'Airbus A330', 415, 'Emirates'),
    (527, 235, 'Boeing 767', 385, 'British Airways'),
    (501, 205, 'Boeing 747', 370, 'Qatar Airways');
select * from aircraft_type;
INSERT INTO Route VALUES(168806,'London','Delhi','Direct');
INSERT INTO Route VALUES(157306,'NewJersey','Mumbai','2Hr Layover');
INSERT INTO Route VALUES(178916,'Washington','Jodhpur','3Hr Layover');
INSERT INTO Route VALUES(324567,'Chennai','Denmark','Direct');
INSERT INTO Route VALUES(452368,'Chandigard','NewYork','3Hr Layover');
INSERT INTO Route VALUES(894521,'Daman','Delhi','Direct');
INSERT INTO Route VALUES(578425,'Beijing','Punjab','Direct');
INSERT INTO Route VALUES(421523,'Hyderabad','Jammu & Kashmir','Direct');
INSERT INTO Route VALUES(789456,'Paris','Bengaluru','2Hr Layover');
INSERT INTO Route VALUES(632147,'Los Angeles','Kolkata','Direct');
INSERT INTO Route VALUES(254789,'Sydney','Ahmedabad','2Hr Layover');
INSERT INTO Route VALUES(365214,'Tokyo','Jaipur','Direct');
INSERT INTO Route VALUES(874123,'Moscow','Goa','3Hr Layover');
INSERT INTO Route VALUES(985632,'Dubai','Chandigarh','Direct');
INSERT INTO Route VALUES(326598,'Seoul','Amritsar','2Hr Layover');
INSERT INTO Route VALUES(124789,'Singapore','Lucknow','Direct');
INSERT INTO Route VALUES(365264, 'Singapore', 'Lucknow', '1Hr Layover' );
select * from route;

-- Flight for Route 168806 (London to Delhi, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (1, 'London', 'Delhi', '2023-11-07', 168806);

-- Flight for Route 157306 (NewJersey to Mumbai, 2Hr Break)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (2, 'NewJersey', 'Mumbai', '2023-11-08', 157306);

-- Flight for Route 178916 (Washington to Jodhpur, 3Hr Break)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (3, 'Washington', 'Jodhpur', '2023-11-09', 178916);

-- Flight for Route 324567 (Chennai to Denmark, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (4, 'Chennai', 'Denmark', '2023-11-10', 324567);

-- Flight for Route 452368 (Chandigard to NewYork, 3Hr Break)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (5, 'Chandigard', 'NewYork', '2023-11-11', 452368);

-- Flight for Route 894521 (Daman to Delhi, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (6, 'Daman', 'Delhi', '2023-11-12', 894521);

-- Flight for Route 578425 (Beijing to Punjab, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (7, 'Beijing', 'Punjab', '2023-11-13', 578425);

-- Flight for Route 421523 (Hyderabad to Jammu & Kashmir, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (8, 'Hyderabad', 'Jammu & Kashmir', '2023-11-14', 421523);

-- Flight for Route 789456 (Paris to Bengaluru, 2Hr Break)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (9, 'Paris', 'Bengaluru', '2023-11-15', 789456);

-- Flight for Route 632147 (Los Angeles to Kolkata, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (10, 'Los Angeles', 'Kolkata', '2023-11-16', 632147);

-- Flight for Route 254789 (Sydney to Ahmedabad, 2Hr Break)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (11, 'Sydney', 'Ahmedabad', '2023-11-17', 254789);

-- Flight for Route 365214 (Tokyo to Jaipur, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (12, 'Tokyo', 'Jaipur', '2023-11-18', 365214);

-- Flight for Route 874123 (Moscow to Goa, 3Hr Break)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (13, 'Moscow', 'Goa', '2023-11-19', 874123);

-- Flight for Route 985632 (Dubai to Chandigarh, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (14, 'Dubai', 'Chandigarh', '2023-11-20', 985632);

-- Flight for Route 326598 (Seoul to Amritsar, 2Hr Break)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (15, 'Seoul', 'Amritsar', '2023-11-21', 326598);

-- Flight for Route 124789 (Singapore to Lucknow, Direct)
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (16, 'Singapore', 'Lucknow', '2023-11-22', 124789);
INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, Route_ID)
VALUES (17, 'Singapore', 'Lucknow', '2023-11-22', 365264);
select * from flight;
-- UPDATE Flight
-- JOIN Aircraft_type ON Flight.A_ID = Aircraft_type.A_ID
-- SET Flight.Departure = Aircraft_type.Company,
--     Flight.Arrival = Aircraft_type.A_model;

UPDATE Flight
JOIN Route ON Flight.Flight_ID = Route.Route_ID
SET Flight.Departure = Route.Departure, Flight.Arrival = Route.Destination;
select * from flight;

-- Flight 1 (London to Delhi, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (1, 'Economy', 30000, 'Economy class for London to Delhi', 1),
       (2, 'Business', 60000, 'Business class for London to Delhi', 1),
       (3, 'First class', 100000, 'First class for London to Delhi', 1);

-- Flight 2 (NewJersey to Mumbai, 2Hr Break)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (4, 'Economy', 25000, 'Economy class for NewJersey to Mumbai', 2),
       (5, 'Business', 55000, 'Business class for NewJersey to Mumbai', 2),
       (6, 'First class', 90000, 'First class for NewJersey to Mumbai', 2);

-- Flight 3 (Washington to Jodhpur, 3Hr Break)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (7, 'Economy', 35000, 'Economy class for Washington to Jodhpur', 3),
       (8, 'Business', 70000, 'Business class for Washington to Jodhpur', 3),
       (9, 'First class', 12000, 'First class for Washington to Jodhpur', 3);

-- Flight 4 (Chennai to Denmark, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (49, 'Economy', 320, 'Economy class for Chennai to Denmark', 4),
       (50, 'Business', 650, 'Business class for Chennai to Denmark', 4),
       (51, 'First class', 1100, 'First class for Chennai to Denmark', 4);

-- Flight 5 (Chandigard to NewYork, 3Hr Break)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (52, 'Economy', 340, 'Economy class for Chandigard to NewYork', 5),
       (53, 'Business', 680, 'Business class for Chandigard to NewYork', 5),
       (54, 'First class', 1150, 'First class for Chandigard to NewYork', 5);

-- Flight 6 (Daman to Delhi, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (55, 'Economy', 290, 'Economy class for Daman to Delhi', 6),
       (56, 'Business', 620, 'Business class for Daman to Delhi', 6),
       (57, 'First class', 1050, 'First class for Daman to Delhi', 6);

-- Flight 7 (Beijing to Punjab, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (58, 'Economy', 330, 'Economy class for Beijing to Punjab', 7),
       (59, 'Business', 660, 'Business class for Beijing to Punjab', 7),
       (60, 'First class', 1120, 'First class for Beijing to Punjab', 7);

-- Flight 8 (Hyderabad to Jammu & Kashmir, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (61, 'Economy', 270, 'Economy class for Hyderabad to Jammu & Kashmir', 8),
       (62, 'Business', 590, 'Business class for Hyderabad to Jammu & Kashmir', 8),
       (63, 'First class', 990, 'First class for Hyderabad to Jammu & Kashmir', 8);

-- Flight 9 (Paris to Bengaluru, 2Hr Break)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (64, 'Economy', 310, 'Economy class for Paris to Bengaluru', 9),
       (65, 'Business', 630, 'Business class for Paris to Bengaluru', 9),
       (66, 'First class', 1050, 'First class for Paris to Bengaluru', 9);

-- Flight 10 (Los Angeles to Kolkata, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (67, 'Economy', 280, 'Economy class for Los Angeles to Kolkata', 10),
       (68, 'Business', 600, 'Business class for Los Angeles to Kolkata', 10),
       (69, 'First class', 1000, 'First class for Los Angeles to Kolkata', 10);

-- Flight 11 (Sydney to Ahmedabad, 2Hr Break)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (70, 'Economy', 320, 'Economy class for Sydney to Ahmedabad', 11),
       (71, 'Business', 650, 'Business class for Sydney to Ahmedabad', 11),
       (72, 'First class', 1100, 'First class for Sydney to Ahmedabad', 11);

-- Flight 12 (Tokyo to Jaipur, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (73, 'Economy', 310, 'Economy class for Tokyo to Jaipur', 12),
       (74, 'Business', 630, 'Business class for Tokyo to Jaipur', 12),
       (75, 'First class', 1050, 'First class for Tokyo to Jaipur', 12);

-- Flight 13 (Moscow to Goa, 3Hr Break)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (76, 'Economy', 340, 'Economy class for Moscow to Goa', 13),
       (77, 'Business', 680, 'Business class for Moscow to Goa', 13),
       (78, 'First class', 1150, 'First class for Moscow to Goa', 13);

-- Flight 14 (Dubai to Chandigarh, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (79, 'Economy', 290, 'Economy class for Dubai to Chandigarh', 14),
       (80, 'Business', 620, 'Business class for Dubai to Chandigarh', 14),
       (81, 'First class', 1050, 'First class for Dubai to Chandigarh', 14);

-- Flight 15 (Seoul to Amritsar, 2Hr Break)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (82, 'Economy', 330, 'Economy class for Seoul to Amritsar', 15),
       (83, 'Business', 660, 'Business class for Seoul to Amritsar', 15),
       (84, 'First class', 1120, 'First class for Seoul to Amritsar', 15);

-- Flight 16 (Singapore to Lucknow, Direct)
INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (46, 'Economy', 20000, 'Economy class for Singapore to Lucknow', 16),
       (47, 'Business', 50000, 'Business class for Singapore to Lucknow', 16),
       (48, 'First class', 8000, 'First class for Singapore to Lucknow', 16);
       INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES (90, 'Economy', 20000, 'Economy class for Singapore to Lucknow', 17),
       (91, 'Business', 50000, 'Business class for Singapore to Lucknow', 17),
       (92, 'First class', 8000, 'First class for Singapore to Lucknow', 17);

select * from Airfare;
INSERT INTO Passengers (P_ID, P_fname, P_lname, Age, Street, House_no, City, Sex, Flight_ID)
VALUES
    (1, 'Steve', 'Smith', 30, '2230 Northside', 11, 'London', 'Male', 1),    -- Use valid Flight_ID (e.g., 1)
    (2, 'Ankita', 'Ahir', 26, '3456 Vikas Apts', 102, 'New Jersey', 'Female', 2);-- Use valid Flight_ID (e.g., 2)
    -- Continue with valid Flight_ID values for the other passengers

-- INSERT INTO Transaction (Ts_ID, Ts_type, Departure_date, Booking_date, Charged_amount, P_ID, Flight_ID)
-- VALUES
 
-- select * from Transaction;


INSERT INTO Countries VALUES (+44, 'England');
INSERT INTO Countries VALUES (+1, 'USA');
INSERT INTO Countries VALUES (+91, 'India');
INSERT INTO Countries VALUES (+45, 'Kingdom of Denmark');
INSERT INTO Countries VALUES (+64, 'New Zealand');
INSERT INTO Countries VALUES (+971, 'UAE');
INSERT INTO Countries VALUES (+213, 'Algeria');
INSERT INTO Countries VALUES (+55, 'Brazil');
INSERT INTO Countries VALUES (+33, 'France');
INSERT INTO Countries VALUES (+86, 'China');
INSERT INTO Countries VALUES (+81, 'Japan');
INSERT INTO Countries VALUES (+7, 'Russia');
INSERT INTO Countries VALUES (+49, 'Germany');
INSERT INTO Countries VALUES (+65, 'Republic of Singapore');
INSERT INTO Countries VALUES (+82, 'Republic of Korea');
select * from Countries;

INSERT INTO Airport (Air_code, Name, State, City, Country_code)
VALUES
    ('LHR', 'Heathrow Airport', 'London', 'London', 44),
    ('CDG', 'Charles de Gaulle Airport', 'Roissy-en-France', 'France', 33),
    ('PEK', 'Beijing Capital International Airport', 'Beijing', 'China', 86),
    ('NRT', 'Narita International Airport', 'Narita', 'Japan', 81),
    ('SVO', 'Sheremetyevo International Airport', 'Moscow', 'Russia', 7),
    ('FRA', 'Frankfurt Airport', 'Frankfurt', 'Germany', 49),
    ('SIN', 'Changi Airport', 'Singapore', 'Republic of Singapore', 65),
    ('ICN', 'Incheon International Airport', 'Incheon', 'Republic of Korea', 82),
    ('CCU', 'Netaji Subhas Chandra Bose International Airport', 'West Bengal', 'Kolkata', 91),
    ('MAA', 'Chennai International Airport', 'Tamil Nadu', 'Chennai', 91),
    ('BLR', 'Kempegowda International Airport', 'Karnataka', 'Bengaluru', 91),
    ('HYD', 'Rajiv Gandhi International Airport', 'Telangana', 'Hyderabad', 91),
    ('COK', 'Cochin International Airport', 'Kerala', 'Kochi', 91),
    ('AMD', 'Sardar Vallabhbhai Patel International Airport', 'Gujarat', 'Ahmedabad', 91);
select * from Airport;
INSERT INTO can_land (Air_code, Flight_ID) VALUES ('LHR', '1');
 INSERT INTO can_land (Air_code, Flight_ID) VALUES    ('CDG', '2');
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('PEK', '3');
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('NRT', '4');
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('SVO', '5');
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('FRA', '6');
   INSERT INTO can_land (Air_code, Flight_ID) VALUES  ('SIN', '7');
   INSERT INTO can_land (Air_code, Flight_ID) VALUES  ('ICN', '8');
   INSERT INTO can_land (Air_code, Flight_ID) VALUES  ('CCU', '9');
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('MAA', '10');
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('JFK', '11');
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('LAX', '12'); 
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('ORD', '13'); 
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('MUC', '14');  
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('DXB', '15');  
  INSERT INTO can_land (Air_code, Flight_ID) VALUES   ('HKG', '16');
   INSERT INTO can_land (Air_code, Flight_ID) VALUES  ('HKG', '17');  -- New entry with Flight_ID '16'

-- Insert sequential Flight_ID values from 1 to 16 in the travels_on table
INSERT INTO travels_on (Route_ID, Flight_ID) VALUES (168806, '1');
INSERT INTO travels_on (Route_ID, Flight_ID)VALUES    (157306, '2');
   INSERT INTO travels_on (Route_ID, Flight_ID)VALUES (178916, '3');
   INSERT INTO travels_on (Route_ID, Flight_ID)VALUES (324567, '4');
   INSERT INTO travels_on (Route_ID, Flight_ID)VALUES (452368, '5');
    INSERT INTO travels_on (Route_ID, Flight_ID)VALUES(894521, '6');
    INSERT INTO travels_on (Route_ID, Flight_ID)values(578425, '7');
  INSERT INTO travels_on (Route_ID, Flight_ID)VALUES  (421523, '8');
   INSERT INTO travels_on (Route_ID, Flight_ID)VALUES (789456, '9');
  INSERT INTO travels_on (Route_ID, Flight_ID)VALUES  (632147, '10');
  INSERT INTO travels_on (Route_ID, Flight_ID)VALUES  (254789, '11');  -- New entry with Flight_ID '11'
  INSERT INTO travels_on (Route_ID, Flight_ID)VALUES  (365214, '12');  -- New entry with Flight_ID '12'
   INSERT INTO travels_on (Route_ID, Flight_ID)VALUES (874123, '13');  -- New entry with Flight_ID '13'
   INSERT INTO travels_on (Route_ID, Flight_ID)VALUES (985632, '14');  -- New entry with Flight_ID '14'
   INSERT INTO travels_on (Route_ID, Flight_ID)VALUES (326598, '15');  -- New entry with Flight_ID '15'
  INSERT INTO travels_on (Route_ID, Flight_ID)VALUES  (124789, '16');
  INSERT INTO travels_on (Route_ID, Flight_ID)VALUES  (365264, '17');  -- New entry with Flight_ID '16'

select * from travels_on;
INSERT INTO Passenger_contact (P_ID, Contact)
VALUES
    (1, 987654321),
    (2, 123456789),


select *  from Passenger_contact;


-- DELIMITER $$

-- CREATE PROCEDURE UpdateFlightDates(IN newDate DATE)
-- BEGIN
--     UPDATE Flight
--     SET Flight_date = DATE_ADD(newDate, INTERVAL 1 DAY);
-- END $$

-- DELIMITER ;
