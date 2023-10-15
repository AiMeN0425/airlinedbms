create database airlines;
use airlines;
create table Aircraft_type( A_ID int NOT NULL auto_increment primary key, Capacity int, A_model varchar(50), A_weight int, Company varchar(50));

create table Route( Route_ID int NOT NULL auto_increment primary key, Departure varchar(50), Destination VARCHAR(50), R_type VARCHAR(20));

CREATE TABLE Flight (Flight_ID varchar(50) PRIMARY KEY, Departure varchar(50),Arrival varchar(50),Flight_date DATE,A_ID INT,FOREIGN KEY (A_ID) REFERENCES Aircraft_type (A_ID));

CREATE TABLE Airfare (Fare_ID INT NOT NULL auto_increment PRIMARY KEY,Class varchar(50),Charged_amount decimal(8,2),Description varchar(50),Flight_ID varchar (50),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID));
ALTER TABLE Airfare
ADD INDEX (Charged_amount);

create table Passengers(P_ID int NOT NULL auto_increment primary key, P_fname varchar(50),P_lname varchar(50),Age int, Street varchar(50),House_no int, City varchar(50),Sex enum('Male','Female'),Flight_ID varchar (50), FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID));

create table Transaction (Ts_ID int NOT NULL auto_increment primary key, Ts_type enum('GooglePay', 'PhonePe', 'Credit Card', 'Debit Card', 'Paytm'),Departure_date date,Booking_date date,Charged_amount decimal(8,2), P_ID int, Flight_ID varchar (50),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),FOREIGN KEY (Charged_amount) REFERENCES Airfare (Charged_amount),FOREIGN KEY (P_ID) REFERENCES Passengers(P_ID));

create table Countries(Country_code int primary key, Country_name varchar(50));

create table Airport( Air_code varchar (50) primary key, Name varchar(50),State varchar(50),City Varchar(50),Country_code int, Foreign key (Country_code) references Countries(Country_code));

create table can_land( Air_code varchar (50) , Flight_ID varchar (50),primary key(Air_code,Flight_ID),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),FOREIGN KEY (Air_code) REFERENCES Airport(Air_code));

create table travels_on(Route_ID int, Flight_ID varchar (50) ,primary key(Route_ID,Flight_ID),FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),foreign key (Route_ID) references Route(Route_ID));

create table Passenger_contact(P_ID int, Contact int,primary key(P_ID,Contact),foreign key (P_ID) REFERENCES Passengers(P_ID));

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
INSERT INTO Route VALUES(157306,'NewJersey','Mumbai','2Hr Break');
INSERT INTO Route VALUES(178916,'Washington','Jodhpur','3Hr Break');
INSERT INTO Route VALUES(324567,'Chennai','Denmark','Direct');
INSERT INTO Route VALUES(452368,'Chandigard','NewYork','3Hr Break');
INSERT INTO Route VALUES(894521,'Daman','Delhi','Direct');
INSERT INTO Route VALUES(578425,'Beijing','Punjab','Direct');
INSERT INTO Route VALUES(421523,'Hyderabad','Jammu & Kashmir','Direct');
INSERT INTO Route VALUES(789456,'Paris','Bengaluru','2Hr Break');
INSERT INTO Route VALUES(632147,'Los Angeles','Kolkata','Direct');
INSERT INTO Route VALUES(254789,'Sydney','Ahmedabad','2Hr Break');
INSERT INTO Route VALUES(365214,'Tokyo','Jaipur','Direct');
INSERT INTO Route VALUES(874123,'Moscow','Goa','3Hr Break');
INSERT INTO Route VALUES(985632,'Dubai','Chandigarh','Direct');
INSERT INTO Route VALUES(326598,'Seoul','Amritsar','2Hr Break');
INSERT INTO Route VALUES(124789,'Singapore','Lucknow','Direct');

select * from route;

INSERT INTO Flight (Flight_ID, Departure, Arrival, Flight_date, A_ID)
VALUES
    ('AI2020', '2022-10-15 10:00am', '2022-10-15 12:30pm', '2022-10-15', 503),
    ('EK4321', '2022-10-20 3:45pm', '2022-10-20 6:15pm', '2022-10-20', 543),
    ('SQ1234', '2022-10-25 8:30am', '2022-10-25 11:00am', '2022-10-25', 572),
    ('UA5678', '2022-11-05 2:15pm', '2022-11-05 4:45pm', '2022-11-05', 610),
    ('CX8765', '2022-11-10 7:00am', '2022-11-10 9:30am', '2022-11-10', 529),
    ('DL7890', '2022-11-15 11:30am', '2022-11-15 2:00pm', '2022-11-15', 567),
    ('TK4321', '2022-11-20 4:45pm', '2022-11-20 7:15pm', '2022-11-20', 535),
    ('BA4567', '2022-11-25 9:00am', '2022-11-25 11:30am', '2022-11-25', 591),
    ('AA9876', '2022-12-05 1:15pm', '2022-12-05 3:45pm', '2022-12-05', 520),
    ('LH5432', '2022-12-10 6:30am', '2022-12-10 9:00am', '2022-12-10', 538);
select * from flight;
UPDATE Flight
JOIN Aircraft_type ON Flight.A_ID = Aircraft_type.A_ID
SET Flight.Departure = Aircraft_type.Company,
    Flight.Arrival = Aircraft_type.A_model;

UPDATE Flight
JOIN Route ON Flight.Flight_ID = Route.Route_ID
SET Flight.Departure = Route.Departure, Flight.Arrival = Route.Destination;
select * from flight;

INSERT INTO AirFare (Fare_ID, Class, Charged_amount, Description, Flight_ID)
VALUES
    (1, 'Standard ', 27341, 'Standard Single', 'AI2020'),
    (4, 'Standard ', 34837, 'Standard Return', 'EK4321'),
    (2, 'Key Fare ', 42176, 'Key Fare Single', 'SQ1234'),
    (3, 'Business ', 27373, 'Business Return', 'UA5678'),
    (6, 'Advanced Purchase', 44592, 'Advanced Purchase', 'CX8765'),
    (5, 'Superpex ', 8777, 'Superpex Return', 'DL7890'),
    (7, 'Standard ', 9578, 'Standard Return', 'TK4321'),
    (8, 'Superpex ', 4459, 'Superpex Return', 'BA4567'),
    (9, 'Premium ', 53245, 'Premium Single', 'AA9876'),
    (10, 'Economy ', 29834, 'Economy Single', 'LH5432'),
    (11, 'Business ', 39451, 'Business Single', 'AI2020'),
    (12, 'Economy ', 26437, 'Economy Single', 'EK4321'),
    (13, 'Premium ', 62479, 'Premium Return', 'SQ1234');
select * from Airfare;
INSERT INTO Passengers (P_ID, P_fname, P_lname, Age, Street, House_no, City, Sex, Flight_ID)
VALUES
    (1, 'Steve', 'Smith', 30, '2230 Northside', 11, 'London', 'Male', 'AI2020'),
    (2, 'Ankita', 'Ahir', 26, '3456 Vikas Apts', 102, 'New Jersey', 'Female', 'EK4321'),
    (4, 'Akhilesh', 'Joshi', 29, '345 Chatam courts',  678, 'Chennai', 'Male', 'SQ1234'),
    (3, 'Khyati', 'Mishra', 30, '7820 Mccallum courts', 234, 'Washington', 'Female', 'UA5678'),
    (5, 'Rom', 'Solanki', 60, '1234 Baker Apts',  208, 'Chandigarh', 'Male', 'CX8765'),
    (6, 'Lakshmi', 'Sharma', 30, '1110 Fir hills',  90, 'Daman', 'Female', 'DL7890'),
    (7, 'Ria', 'Gupta', 34, 'B402, Aditya Apt', 345, 'Hyderabad', 'Female', 'BA4567'),
    (9, 'Amit', 'Singh', 28, '405 Park View, Apt 5', 33, 'Delhi', 'Male', 'AI2020'),
    (10, 'Pooja', 'Patel', 32, '126 Riverdale, Apt 3', 3, 'Mumbai', 'Female', 'EK4321'),
    (8, 'Rajesh', 'Verma', 25, '567 Pine Street, Apt 12', 12, 'Bangalore', 'Male', 'SQ1234');
select * from passengers;
INSERT INTO Transaction (Ts_ID, Ts_type, Departure_date, Booking_date, Charged_amount, P_ID, Flight_ID)
VALUES
    (12345678, 'GooglePay', '2021-02-21', '2021-02-22', 27341, 1, 'AI2020'),
    (45612789, 'Credit Card', '2021-01-12', '2021-01-14', 34837, 2, 'EK4321'),
    (56987123, 'Paytm', '2020-12-05', '2020-12-02', 42176, 4, 'SQ1234'),
    (45321879, 'PhonePe', '2021-03-15', '2021-03-16', 27373, 3, 'UA5678'),
    (75145863, 'Paytm', '2021-04-22', '2021-04-25', 44592, 5, 'CX8765'),
    (17892455, 'Paytm', '2021-02-05', '2021-02-08', 8777, 6, 'DL7890'),
    (24517852, 'PhonePe', '2021-03-06', '2021-03-08', 9578, 8, 'TK4321'),
    (32548525, 'Credit Card', '2021-01-20', '2021-01-25', 4459, 7, 'BA4567');
select * from Transaction;


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

