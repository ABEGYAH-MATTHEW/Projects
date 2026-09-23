/* SQL CODE FOR ALL QUESTIONS IN THE TASK THAT REQUIRE SQL TO COMPLETE
THE CODE WAS WRITING IN QUESTIONS BASED ONLY. THAT IS, THE QUESTION NUMBER AND THE QUESTIONS ARE WRITTEN FIRST AT THE BEGINNING FOLLWED BY THE
SOLUTIONS WHICH IS THE SQL CODES SQL.

ONLY THE SQL CODES WERE PROVIDES HERE, THE REMAINING ANSWERS WHICH DO NOT REQURE SQL CODE ARE PROVIDED IN THE DOCUMENTATION
*/

-- BELOW ARE THE QUESTIONS AFTER WHICH FOLLOWED BY THE ANSWERS
                                
                                    -- TASKS

/*                                 QUESTION 1
Name the database as MotorsCertification. Design an ER model based on the following parameters:
Note: Build a ER diagram with proper entities, relationship etc.
▪Design a table/database object named orderdetails with the following attributes/columns:
•orderNumber int(), Primary Key
•productCode varchar()
•quantityOrdered int()
•priceEach float
•orderLineNumber smallint()
Foreign Key: orders (orderNumber → orderNumber) and products (productCode → productCode)
Index 1: PRIMARY, Type: BTREE, Unique Yes, Visible No, Columns orderNumber
Index 2: productCode, Type: BTREE, Unique: No, Visible: No, Columns productCode

▪Design a table/database object named customers with the following attributes/columns:
•customerNumber int(11) PK
•customerName varchar(50)
•contactLastName varchar(50)
•contactFirstName varchar(50)
•phone varchar(50)
•addressLine1 varchar(50)
•addressLine2 varchar(50)
•city varchar(50)
•state varchar(50)
•postalCode varchar(15)
•country varchar(50)
•salesRepEmployeeNumber int(11)
•creditLimit float
Foreign Key: employees (salesRepEmployeeNumber → employeeNumber).
Index: PRIMARY, Type: BTREE, Unique: Yes, Visible: No, Columns: customerNumber

▪Design a table/database object named employees with the following attributes/columns:
•employeeNumber int() PK
•lastName varchar()
•firstName varchar()
•extension varchar()
•email varchar()
•officeCode varchar()
•reportsTo int()
•jobTitle varchar()
Foreign Key: employees ( reportsTo → employeeNumber) and offices (officeCode → officeCode)
Index 1: PRIMARY, Type: BTREE, Unique: Yes, Visible No, Columns: employeeNumber
Index 2: reportsTo, Type: BTREE, Unique: No, Visible: No, Columns reportsTo
Index 3: officeCode, Type: BTREE, Unique: No, Visible: No, Columns officeCode

▪Design a table/database object named orders with the following attributes/columns:
•orderNumber int() PK
•orderDate date
•requiredDate date
•shippedDate date
•status varchar()
•comments text
•customerNumber int()
Foreign Key: customers (customerNumber → customerNumber).
Index 1: PRIMARY, Type: BTREE, Unique: Yes, Visible: No, Columns orderNumber
Index 2: customerNumber, Type: BTREE, Unique: No, Visible: No, Columns customerNumber

▪Design a table/database object named offices with the following attributes/columns:
•officeCode varchar() PK
•city varchar()
•phone varchar()
•addressLine1 varchar()
•addressLine2 varchar()
•state varchar()
•country varchar()
•postalCode varchar()
•territory varchar()
Index 1: PRIMARY, Type: BTREE, Unique: Yes, Visible No, Columns: officeCode

▪Design a table/database object named payments with the following attributes/columns:
•customerNumber int() PK
•checkNumber varchar(50)
•paymentDate date
•amount float
Foreign Key: customers (customerNumber → customerNumber)
Index: PRIMARY, Type: BTREE, Unique: Yes, Visible: No, Columns customerNumber and checkNumber

▪Design a table/database object named productlines with the following attributes/columns:
•productLine varchar(50) PK
•textDescription varchar(4000)
•htmlDescription NULL
•image NULL

▪Design a table/database object named products with the following attributes/columns:
•productCode varchar() PK
•productName varchar()
•productLine varchar()
•productScale varchar()
•productVendor varchar()
•productDescription text()
•quantityInStock smallint(6)
•buyPrice float
•MSRP float
Foreign Key: productlines (productLine → productLine).
Index 1: PRIMARY, Type: BTREE, Unique: Yes, Visible: No, Columns productCode
Index 2: productLine, Type: BTREE, Unique: No, Visible: No, Columns productLine
*/
 
                           -- SOLUTION TO QUESTION 1
-- Create the database
CREATE DATABASE MotorsCertification; -- Creates the database named MotorsCertification
USE MotorsCertification; -- Switches to the MotorsCertification database

-- Create orderdetails table
CREATE TABLE orderdetails (
    orderNumber INT PRIMARY KEY, -- Primary key for the orderdetails table
    productCode VARCHAR(50), -- Product code associated with the order
    quantityOrdered INT, -- Quantity of the product ordered
    priceEach FLOAT, -- Price of each product
    orderLineNumber SMALLINT, -- Line number of the order
    FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber), -- Foreign key referencing orders table
    FOREIGN KEY (productCode) REFERENCES products(productCode), -- Foreign key referencing products table
    INDEX (productCode) -- Index on productCode for faster queries
);

-- Create customers table
CREATE TABLE customers (
    customerNumber INT(11) PRIMARY KEY, -- Primary key for the customers table
    customerName VARCHAR(50), -- Name of the customer
    contactLastName VARCHAR(50), -- Last name of the contact person
    contactFirstName VARCHAR(50), -- First name of the contact person
    phone VARCHAR(50), -- Phone number of the customer
    addressLine1 VARCHAR(50), -- First line of the address
    addressLine2 VARCHAR(50), -- Second line of the address
    city VARCHAR(50), -- City of the customer
    state VARCHAR(50), -- State of the customer
    postalCode VARCHAR(15), -- Postal code of the customer
    country VARCHAR(50), -- Country of the customer
    salesRepEmployeeNumber INT(11), -- Employee number of the sales representative
    creditLimit FLOAT, -- Credit limit of the customer
    FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber) -- Foreign key referencing employees table
);

-- Create employees table
CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY, -- Primary key for the employees table
    lastName VARCHAR(50), -- Last name of the employee
    firstName VARCHAR(50), -- First name of the employee
    extension VARCHAR(50), -- Extension number of the employee
    email VARCHAR(50), -- Email of the employee
    officeCode VARCHAR(50), -- Office code where the employee works
    reportsTo INT, -- Employee number of the manager
    jobTitle VARCHAR(50), -- Job title of the employee
    FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber), -- Foreign key referencing employees table (self-referencing)
    FOREIGN KEY (officeCode) REFERENCES offices(officeCode), -- Foreign key referencing offices table
    INDEX (reportsTo), -- Index on reportsTo for faster queries
    INDEX (officeCode) -- Index on officeCode for faster queries
);

-- Create orders table
CREATE TABLE orders (
    orderNumber INT PRIMARY KEY, -- Primary key for the orders table
    orderDate DATE, -- Date the order was placed
    requiredDate DATE, -- Date the order is required
    shippedDate DATE, -- Date the order was shipped
    status VARCHAR(50), -- Status of the order
    comments TEXT, -- Comments related to the order
    customerNumber INT, -- Customer number associated with the order
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber), -- Foreign key referencing customers table
    INDEX (customerNumber) -- Index on customerNumber for faster queries
);

-- Create offices table
CREATE TABLE offices (
    officeCode VARCHAR(50) PRIMARY KEY, -- Primary key for the offices table
    city VARCHAR(50), -- City where the office is located
    phone VARCHAR(50), -- Phone number of the office
    addressLine1 VARCHAR(50), -- First line of the office address
    addressLine2 VARCHAR(50), -- Second line of the office address
    state VARCHAR(50), -- State where the office is located
    country VARCHAR(50), -- Country where the office is located
    postalCode VARCHAR(50), -- Postal code of the office
    territory VARCHAR(50) -- Territory of the office
);

-- Create payments table
CREATE TABLE payments (
    customerNumber INT, -- Customer number associated with the payment
    checkNumber VARCHAR(50), -- Check number of the payment
    paymentDate DATE, -- Date of the payment
    amount FLOAT, -- Amount of the payment
    PRIMARY KEY (customerNumber, checkNumber), -- Composite primary key
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber) -- Foreign key referencing customers table
);

-- Create productlines table
CREATE TABLE productlines (
    productLine VARCHAR(50) PRIMARY KEY, -- Primary key for the productlines table
    textDescription VARCHAR(4000), -- Text description of the product line
    htmlDescription TEXT, -- HTML description of the product line (can be NULL)
    image BLOB -- Image of the product line (can be NULL)
);

-- Create products table
CREATE TABLE products (
    productCode VARCHAR(50) PRIMARY KEY, -- Primary key for the products table
    productName VARCHAR(70), -- Name of the product
    productLine VARCHAR(50), -- Product line associated with the product
    productScale VARCHAR(10), -- Scale of the product
    productVendor VARCHAR(50), -- Vendor of the product
    productDescription TEXT, -- Description of the product
    quantityInStock SMALLINT(6), -- Quantity of the product in stock
    buyPrice FLOAT, -- Buy price of the product
    MSRP FLOAT, -- Manufacturer's suggested retail price
    FOREIGN KEY (productLine) REFERENCES productlines(productLine), -- Foreign key referencing productlines table
    INDEX (productLine) -- Index on productLine for faster queries
);


/*                           
                                                   QUESTION 2
After designing the table insert records in the following orderdetails, employees, payments, products, customers, offices and orders table.
Note: Refer to the CSV files provided on the LMS.
*/

                                                    -- SOLUTION TO QUESTION 2 


-- Insert records in orderdetails table
-- The INSERT INTO statement was used to add new rows of data into the orderdetails table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
insert into orderdetails values
	(10100,'S18_1749',30,'136.00',3),
	(10101,'S18_2248',50,'55.09',2),
	(10102,'S18_4409',22,'75.46',4),
	(10103,'S24_3969',49,'35.29',1),
	(10104,'S18_2325',25,'108.06',4),
	(10105,'S18_2795',26,'167.06',1),
	(10106,'S24_1937',45,'32.53',3),
	(10107,'S24_2022',46,'44.35',2),
	(10108,'S18_1342',39,'95.55',2),
	(10109,'S18_1367',41,'43.13',1),
	(10110,'S10_1949',26,'214.30',11),
	(10111,'S10_4962',42,'119.67',4),
	(10112,'S12_1666',27,'121.64',8),
	(10113,'S18_1097',35,'94.50',10),
	(10114,'S18_2432',22,'58.34',2),
	(10115,'S18_2949',27,'92.19',12),
	(10116,'S18_2957',35,'61.84',14),
	(10117,'S18_3136',25,'86.92',13),
	(10118,'S18_3320',46,'86.31',16),
	(10119,'S18_4600',36,'98.07',5);
select * from orderdetails; /* The select * statement was used to retrieve records from the orderdetails table
from was used to specify the king of table to retrieve the data from, thus, orderdetails table*/


-- Insert records in employees table
-- The INSERT INTO statement was used to add new rows of data into the employees table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
insert into employees values
	(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
    (1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
	(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing'),
	(1088,'Patterson','William','x4871','wpatterson@classicmodelcars.com','6',1056,'Sales Manager (APAC)'),
	(1102,'Bondur','Gerard','x5408','gbondur@classicmodelcars.com','4',1056,'Sale Manager (EMEA)'),
	(1143,'Bow','Anthony','x5428','abow@classicmodelcars.com','1',1056,'Sales Manager (NA)'),
	(1165,'Jennings','Leslie','x3291','ljennings@classicmodelcars.com','1',1143,'Sales Rep'),
	(1166,'Thompson','Leslie','x4065','lthompson@classicmodelcars.com','1',1143,'Sales Rep'),
	(1188,'Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com','2',1143,'Sales Rep'),
	(1216,'Patterson','Steve','x4334','spatterson@classicmodelcars.com','2',1143,'Sales Rep'),
	(1286,'Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com','3',1143,'Sales Rep'),
	(1323,'Vanauf','George','x4102','gvanauf@classicmodelcars.com','3',1143,'Sales Rep'),
	(1337,'Bondur','Loui','x6493','lbondur@classicmodelcars.com','4',1102,'Sales Rep'),
	(1370,'Hernandez','Gerard','x2028','ghernande@classicmodelcars.com','4',1102,'Sales Rep'),
	(1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com','4',1102,'Sales Rep'),
	(1501,'Bott','Larry','x2311','lbott@classicmodelcars.com','7',1102,'Sales Rep'),
	(1504,'Jones','Barry','x102','bjones@classicmodelcars.com','7',1102,'Sales Rep'),
	(1611,'Fixter','Andy','x101','afixter@classicmodelcars.com','6',1088,'Sales Rep'),
	(1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com','6',1088,'Sales Rep'),
	(1619,'King','Tom','x103','tking@classicmodelcars.com','6',1088,'Sales Rep');
select * from employees;  /* The select * statement was used to retrieve records from the employees table
from was used to specify the king of table to retrieve the data from, thus, employees table*/


-- Insert records in payments table
-- The INSERT INTO statement was used to add new rows of data into the payments table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
insert into payments values
(101,'HQ336336','2004-10-19','6066.78'),
(102,'JM555205','2003-06-05','14571.44'),
(103,'OM314933','2004-12-18','1676.14'),
(104,'BO864823','2004-12-17','14191.12'),
(105,'HQ55022','2003-06-06','32641.98'),
(106,'ND748579','2004-08-20','33347.88'),
(107,'GG31455','2003-05-20','45864.03'),
(108,'MA765515','2004-12-15','82261.22'),
(109,'NP603840','2003-05-31','7565.08'),
(110,'NR27552','2004-03-10','44894.74'),
(111,'DB933704','2004-11-14','19501.82'),
(112,'LN373447','2004-08-08','47924.19'),
(113,'NG94694','2005-02-22','49523.67'),
(114,'DB889831','2003-02-16','50218.95'),
(115,'FD317790','2003-10-28','1491.38'),
(116,'KI831359','2004-11-04','17876.32'),
(117,'MA302151','2004-11-28','34638.14'),
(118,'AE215433','2005-03-05','101244.59'),
(119,'BG255406','2004-08-28','85410.87'),
(120,'CQ287967','2003-04-11','11044.30');
select * from payments; /* The select * statement was used to retrieve records from the payments table
from was used to specify the king of table to retrieve the data from, thus, payments table*/


-- Insert records in products table
-- The INSERT INTO statement was used to add new rows of data into the products table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
insert  into products values 
('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',7933,'48.81','95.70'),
('S10_1949','1952 Alpine Renault 1300','Classic Cars','1:10','Classic Metal Creations','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',7305,'98.58','214.30'),
('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','1:10','Highway 66 Mini Classics','Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',6625,'68.99','118.94'),
('S10_4698','2003 Harley-Davidson Eagle Drag Bike','Motorcycles','1:10','Red Start Diecast','Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine',5582,'91.02','193.66'),
('S10_4757','1972 Alfa Romeo GTA','Classic Cars','1:10','Motor City Art Classics','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3252,'85.68','136.00'),
('S10_4962','1962 LanciaA Delta 16V','Classic Cars','1:10','Second Gear Diecast','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',6791,'103.42','147.74'),
('S12_1099','1968 Ford Mustang','Classic Cars','1:12','Autoart Studio Design','Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.',68,'95.34','194.57'),
('S12_1108','2001 Ferrari Enzo','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3619,'95.59','207.80'),
('S12_1666','1958 Setra Bus','Trucks and Buses','1:12','Welly Diecast Productions','Model features 30 windows, skylights & glare resistant glass, working steering system, original logos',1579,'77.90','136.67'),
('S12_2823','2002 Suzuki XREO','Motorcycles','1:12','Unimax Art Galleries','Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',9997,'66.27','150.62'),
('S12_3148','1969 Corvair Monza','Classic Cars','1:18','Welly Diecast Productions','1:18 scale die-cast about 10\" long doors open, hood opens, trunk opens and wheels roll',6906,'89.14','151.08'),
('S12_3380','1968 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black',9123,'75.16','117.44'),
('S12_3891','1969 Ford Falcon','Classic Cars','1:12','Second Gear Diecast','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',1049,'83.05','173.02'),
('S12_3990','1970 Plymouth Hemi Cuda','Classic Cars','1:12','Studio M Art Models','Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.',5663,'31.92','79.80'),
('S12_4473','1957 Chevy Pickup','Trucks and Buses','1:12','Exoto Designs','1:12 scale die-cast about 20\" long Hood opens, Rubber wheels',6125,'55.70','118.50'),
('S12_4675','1969 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.',7323,'58.73','115.16'),
('S18_1097','1940 Ford Pickup Truck','Trucks and Buses','1:18','Studio M Art Models','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box',2613,'58.33','116.67'),
('S18_1129','1993 Mazda RX-7','Classic Cars','1:18','Highway 66 Mini Classics','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.',3975,'83.51','141.54'),
('S18_1342','1937 Lincoln Berline','Vintage Cars','1:18','Motor City Art Classics','Features opening engine cover, doors, trunk, and fuel filler cap. Color black',8693,'60.62','102.74'),
('S18_1367','1936 Mercedes-Benz 500K Special Roadster','Vintage Cars','1:18','Studio M Art Models','This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.',8635,'24.26','53.91');
select * from products; /* The select * statement was used to retrieve records from the productlines table
from was used to specify the king of table to retrieve the data from, thus, productlines table*/


-- Inserting records in customers table
-- The INSERT INTO statement was used to add new rows of data into the CUSTOMERS table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
INSERT INTO customers VALUES  
	(103,'Atelier graphique','Schmitt','Carine ','40.32.2555','54, rue Royale',NULL,'Nantes',NULL,'44000','France',1370,'21000.00'),
	(112,'Signal Gift Stores','King','Jean','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA',1166,'71800.00'),
	(114,'Australian Collectors, Co.','Ferguson','Peter','03 9520 4555','636 St Kilda Road','Level 3','Melbourne','Victoria','3004','Australia',1611,'117300.00'),
	(119,'La Rochelle Gifts','Labrune','Janine ','40.67.8555','67, rue des Cinquante Otages',NULL,'Nantes',NULL,'44000','France',1370,'118200.00'),
	(121,'Baane Mini Imports','Bergulfsen','Jonas ','07-98 9555','Erling Skakkes gate 78',NULL,'Stavern',NULL,'4110','Norway',1504,'81700.00'),
	(124,'Mini Gifts Distributors Ltd.','Nelson','Susan','4155551450','5677 Strong St.',NULL,'San Rafael','CA','97562','USA',1165,'210500.00'),
	(125,'Havel & Zbyszek Co','Piestrzeniewicz','Zbyszek ','(26) 642-7555','ul. Filtrowa 68',NULL,'Warszawa',NULL,'01-012','Poland',NULL,'0.00'),
	(128,'Blauer See Auto, Co.','Keitel','Roland','+49 69 66 90 2555','Lyonerstr. 34',NULL,'Frankfurt',NULL,'60528','Germany',1504,'59700.00'),
	(129,'Mini Wheels Co.','Murphy','Julie','6505555787','5557 North Pendale Street',NULL,'San Francisco','CA','94217','USA',1165,'64600.00'),
	(131,'Land of Toys Inc.','Lee','Kwai','2125557818','897 Long Airport Avenue',NULL,'NYC','NY','10022','USA',1323,'114900.00'),
	(141,'Euro+ Shopping Channel','Freyre','Diego ','(91) 555 94 44','C/ Moralzarzal, 86',NULL,'Madrid',NULL,'28034','Spain',1370,'227600.00'),
	(144,'Volvo Model Replicas, Co','Berglund','Christina ','0921-12 3555','Berguvsvägen  8',NULL,'Luleå',NULL,'S-958 22','Sweden',1504,'53100.00'),
	(145,'Danish Wholesale Imports','Petersen','Jytte ','31 12 3555','Vinbæltet 34',NULL,'Kobenhavn',NULL,'1734','Denmark',1401,'83400.00'),
	(146,'Saveley & Henriot, Co.','Saveley','Mary ','78.32.5555','2, rue du Commerce',NULL,'Lyon',NULL,'69004','France',1337,'123900.00'),
	(148,'Dragon Souveniers, Ltd.','Natividad','Eric','+65 221 7555','Bronz Sok.','Bronz Apt. 3/6 Tesvikiye','Singapore',NULL,'079903','Singapore',1621,'103800.00'),
	(151,'Muscle Machine Inc','Young','Jeff','2125557413','4092 Furth Circle','Suite 400','NYC','NY','10022','USA',1286,'138500.00'),
	(157,'Diecast Classics Inc.','Leong','Kelvin','2155551555','7586 Pompton St.',NULL,'Allentown','PA','70267','USA',1216,'100600.00'),
	(161,'Technics Stores Inc.','Hashimoto','Juri','6505556809','9408 Furth Circle',NULL,'Burlingame','CA','94217','USA',1165,'84600.00'),
	(166,'Handji Gifts& Co','Victorino','Wendy','+65 224 1555','106 Linden Road Sandown','2nd Floor','Singapore',NULL,'069045','Singapore',1612,'97900.00'),
	(167,'Herkku Gifts','Oeztan','Veysel','+47 2267 3215','Brehmen St. 121','PR 334 Sentrum','Bergen',NULL,'N 5804','Norway  ',1504,'96800.00');
select * from customers; /* The select * statement was used to retrieve records from the customers table
from was used to specify the king of table to retrieve the data from, thus, customers table*/


-- Insert records in offices table
-- The INSERT INTO statement was used to add new rows of data into the offices table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
insert into offices values
('1','San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA'),
('2','Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','02107','NA'),
('3','NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA'),
('4','Paris','+33 14 723 4404','43 Rue Jouffroy Dabbans',NULL,NULL,'France','75017','EMEA'),
('5','Tokyo','+81 33 224 5000','4-1 Kioicho',NULL,'Chiyoda-Ku','Japan','102-8578','Japan'),
('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2',NULL,'Australia','NSW 2010','APAC'),
('7','London','+44 20 7877 2041','25 Old Broad Street','Level 7',NULL,'UK','EC2N 1HN','EMEA');
select * from offices; /* The select * statement was used to retrieve records from the offices table
from was used to specify the king of table to retrieve the data from, thus, offices table*/

-- Insert records in orders table
-- The INSERT INTO statement was used to add new rows of data into the orders table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
insert into orders values
(10100,'2003-01-06','2003-01-13','2003-01-10','Shipped',NULL,363),
(10101,'2003-01-09','2003-01-18','2003-01-11','Shipped','Check on availability.',128),
(10102,'2003-01-10','2003-01-18','2003-01-14','Shipped',NULL,181),
(10103,'2003-01-29','2003-02-07','2003-02-02','Shipped',NULL,121),
(10104,'2003-01-31','2003-02-09','2003-02-01','Shipped',NULL,141),
(10105,'2003-02-11','2003-02-21','2003-02-12','Shipped',NULL,145),
(10106,'2003-02-17','2003-02-24','2003-02-21','Shipped',NULL,278),
(10107,'2003-02-24','2003-03-03','2003-02-26','Shipped','Difficult to negotiate with customer. We need more marketing materials',131),
(10108,'2003-03-03','2003-03-12','2003-03-08','Shipped',NULL,385),
(10109,'2003-03-10','2003-03-19','2003-03-11','Shipped','Customer requested that FedEx Ground is used for this shipping',486),
(10110,'2003-03-18','2003-03-24','2003-03-20','Shipped',NULL,187),
(10111,'2003-03-25','2003-03-31','2003-03-30','Shipped',NULL,129),
(10112,'2003-03-24','2003-04-03','2003-03-29','Shipped','Customer requested that ad materials (such as posters, pamphlets) be included in the shippment',144),
(10113,'2003-03-26','2003-04-02','2003-03-27','Shipped',NULL,124),
(10114,'2003-04-01','2003-04-07','2003-04-02','Shipped',NULL,172),
(10115,'2003-04-04','2003-04-12','2003-04-07','Shipped',NULL,424),
(10116,'2003-04-11','2003-04-19','2003-04-13','Shipped',NULL,381),
(10117,'2003-04-16','2003-04-24','2003-04-17','Shipped',NULL,148),
(10118,'2003-04-21','2003-04-29','2003-04-26','Shipped','Customer has worked with some of our vendors in the past and is aware of their MSRP',216),
(10119,'2003-04-28','2003-05-05','2003-05-02','Shipped',NULL,382);
select * from orders; /* The select * statement was used to retrieve records from the orderdetails table
from was used to specify the king of table to retrieve the data from, thus, orderdetails table*/


-- Insert records in productlines table
-- The INSERT INTO statement was used to add new rows of data into the productlines table within the MOTORSCERTIFICATION Database.
-- The VALUES was used to provide the actual data to be inserted into the table. 
-- The NULL values in the data shows that no value was assigned to that column
insert into productlines values
('Classic Cars','Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',NULL,NULL),
('Motorcycles','Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.',NULL,NULL),
('Planes','Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.',NULL,NULL),
('Ships','The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.',NULL,NULL),
('Trains','Model trains are a rewarding hobby for enthusiasts of all ages. Whether you are looking for collectible wooden trains, electric streetcars or locomotives, you will find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.',NULL,NULL),
('Trucks and Buses','The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.',NULL,NULL),
('Vintage Cars','Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',NULL,NULL);
select * from productlines; /* The select * statement was used to retrieve records from the productlines table
from was used to specify the king of table to retrieve the data from, thus, productlines table*/


/*
                                                    QUESTION 3
Provide comments before every task that is performed describing the operation that is being performed and attach a screenshot of ER diagram from SSMS.
*/

-- The Question 3 has been answered in the documentation


/*
                                                    QUESTION 4
Delete the columns in productlines which are useless that do not infer anything.
*/
                                        -- SOLUTIONS TO QUESTION 4
-- The useless columns in the product line table is are the htmlDescription and image
-- to delete thses columns, the ALTER TABLE and the DROP COLUMN Statement was used
-- ALTER TABLE Statement ensures that the already exixting table, productlines, can be modified
-- DROP COLUMN statement ensures that the a specific colunm can be modified / removed 
-- Drop htmlDescription column
ALTER TABLE productlines DROP COLUMN htmlDescription; -- Removes the htmlDescription column 
-- Drop image column
ALTER TABLE productlines DROP COLUMN image; -- Removes the image column

select * from productlines;


/* 
                                        QUESTION 5
Use a select statement to verify all insertions as well as updates.
*/           
									-- SOLUTION TO QUESTION 5 
 /* To verify all insertions and updates, you can use the SELECT statement to query the tables and check the results.
 Below are the SQL queries to perform the verification for each operation:
*/
 -- Verify orderdetails table
SELECT * FROM orderdetails; -- Displays all records in the orderdetails table

-- Verify customers table
SELECT * FROM customers; -- Displays all records in the customers table

-- Verify employees table
SELECT * FROM employees; -- Displays all records in the employees table

-- Verify offices table
SELECT * FROM offices; -- Displays all records in the offices table

-- Verify orders table
SELECT * FROM orders; -- Displays all records in the orders table

-- Verify payments table
SELECT * FROM payments; -- Displays all records in the payments table
-- Verify productlines table
SELECT * FROM productlines; -- Displays all records in the productlines table
-- Verify products table
SELECT * FROM products; -- Displays all records in the products table


/* 
                                        QUESTION 6
Find out the highest and the lowest amount.
*/           

                                  -- SOLUTION TO QUESTION 6
-- Highest amount
SELECT MAX(amount) AS HighestAmount FROM payments; -- Finds the highest payment amount

-- Lowest amount
SELECT MIN(amount) AS LowestAmount FROM payments; -- Finds the lowest payment amount



/* 
                                        QUESTION 7
Give the unique count of customerName from customers.
*/        

                                 -- SOLUTION TO QUESTION 7 

-- Unique count of customerName
-- The SELECT statement retrieves data from the database
--  COUNT(DISTINCT customerName) function counts the distinct customer names, ensuring that duplicates are not included in the count. 
-- The DISTINCT keyword ensures that only unique values in the customerName column are considered. 
SELECT COUNT(DISTINCT customerName) AS UniqueCustomerCount FROM customers; -- Counts unique customer names


/* 
                                        QUESTION 8
Create a view from customers and payments named cust_payment and select customerName, amount, contactLastName, contactFirstName who have paid.
Truncate and Drop the view after operation.
*/   


                                     -- SOLUTION TO QUESTION 8

-- Create view
-- The CREATE VIEW statement defines a virtual table that includes selected columns from the customers and payments tables.
--  The SELECT statement within the view extracts customerName, amount, contactLastName, and contactFirstName, ensuring that only customers who have made payments are included. 
-- The JOIN operation links both tables using customerNumber, a common field in both tables
CREATE VIEW cust_payment AS
SELECT c.customerName, p.amount, c.contactLastName, c.contactFirstName -- retrieve columns needed to create the view
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber; -- Combines customer and payment data

-- Select from view
SELECT * FROM cust_payment; -- Displays data from the view

-- Drop view
DROP VIEW cust_payment; -- Deletes the view


/* 
                                        QUESTION 9
Create a stored procedure on products which displays productLine for Classic Cars.
*/   
									-- SOLUTION TO QUESTION 9
							
-- Create stored procedure
-- The DELIMITER // statement changes the default delimiter to //, ensuring that the procedure body is correctly interpreted without conflicts from semicolons inside the procedure. 
-- The CREATE PROCEDURE GetClassicCars() statement defines the procedure, and within the BEGIN ... END block
-- SELECT * FROM products WHERE productLine = 'Classic Cars'; query is used to fetch all relevant records. 
-- After defining the procedure, the DELIMITER; resets the delimiter back to its default.
-- CALL GetClassicCars(); executes the stored procedure, displaying all products that fall under the Classic Cars category.
DELIMITER //
CREATE PROCEDURE GetClassicCars()
BEGIN
    SELECT * FROM products WHERE productLine = 'Classic Cars'; -- Selects products from Classic Cars
END //
DELIMITER ;
-- Call stored procedure
CALL GetClassicCars(); -- Executes the stored procedure   
                                 
                                 
/* 
                                        QUESTION 10
Create a function to get the creditLimit of customers less than 96800.
*/   
									-- SOLUTION TO QUESTION 10

-- Create function
-- This SQL script below defines and utilizes a function named GetCreditLimit to retrieve the credit limit of a specific customer from the customers table
-- it takes a parameter customer_id of type INT, representing the unique customer number. It returns a FLOAT value, which corresponds to the customer's credit limit
-- DECLARE credit_limit FLOAT; statement initializes a variable to store the retrieved credit limit
-- SELECT creditLimit INTO credit_limit FROM customers WHERE customerNumber = customer_id; query fetches the credit limit for the specified customer
-- the function returns the stored value using RETURN credit_limit
-- the SELECT GetCreditLimit(103) AS CreditLimit; statement is executed, retrieving the credit limit of the customer with customerNumber = 103
DELIMITER //
CREATE FUNCTION GetCreditLimit(customer_id INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE credit_limit FLOAT;
    SELECT creditLimit INTO credit_limit FROM customers WHERE customerNumber = customer_id; -- Retrieves credit limit
    RETURN credit_limit; -- Returns the credit limit
END //
DELIMITER ;

-- Use function
SELECT GetCreditLimit(103) AS CreditLimit; -- Calls the function for customer 103



/* 
                                        QUESTION 11
Create Trigger to store transaction record for employee table which displays employeeNumber, lastName, FirstName and office code upon insertion
*/   
									-- SOLUTION TO QUESTION 11
                                    
-- Create trigger
-- creates a trigger named AfterEmployeeInsert that automatically records transaction details when a new employee is inserted into the employees table
-- The trigger is defined using the CREATE TRIGGER statement and is set to execute new employees row is added
-- FOR EACH ROW clause ensures that the trigger executes for every new employee entry
-- an INSERT INTO employee_transactions statement is used to store the newly inserted employee's details (employeeNumber, lastName, firstName, and officeCode) in the employee_transactions table
-- NEW keyword is used to reference the newly inserted row’s values
-- DELIMITER // is used to handle the multi-statement block and is reset after the trigger definition
DELIMITER //
CREATE TRIGGER AfterEmployeeInsert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_transactions (employeeNumber, lastName, firstName, officeCode)
    VALUES (NEW.employeeNumber, NEW.lastName, NEW.firstName, NEW.officeCode); -- Inserts transaction record
END //
DELIMITER ;


/* 
                                        QUESTION 12
Create a Trigger to display customer number if the amount is greater than 10,000
*/   
									-- SOLUTION TO QUESTION 12
-- Create a trigger to display customer number if the amount is greater than 10,000
DELIMITER // -- manages the trigger definition 
CREATE TRIGGER AfterPaymentInsert -- Trigger name
AFTER INSERT ON payments      -- Ensures trigger executes AFTER INSERT on the payments table
FOR EACH ROW        -- ensures the trigger runs for every new row inserted
BEGIN
    IF NEW.amount > 10000 THEN -- checks if the amount of the newly inserted payment exceeds 10,000
        INSERT INTO high_value_payments (customerNumber, amount) -- identifys the colunm to be used for the insertion
        VALUES (NEW.customerNumber, NEW.amount); -- Inserts record if amount > 10000
    END IF;
END //
DELIMITER ; -- reset the delimiter to default (;).


/*
                                        QUESTION 13
Create Users, Roles and Logins according to 3 Roles: Admin, HR, and Employee. Admin can view full database and has full access, HR can view 
and access only employee and offices table. Employee can view all tables only.
Note: work from Admin role for any changes to be made for database*/ 
									-- SOLUTION TO QUESTION 13
-- CREATE ROLES FOR USER TYPES
CREATE ROLE Admin; -- Create Admin role (Has full access to the database)
CREATE ROLE HR; -- Create HR role (Can access only employees and offices tables)
CREATE ROLE Employee; -- Create Employee role (Can view all tables but cannot modify them)
-- ASSIGN PERMISSIONS TO EACH ROLE
GRANT ALL PRIVILEGES ON MotorsCertification.* TO Admin; -- Grant full access to Admin (Can read, write, update, delete everything)
GRANT SELECT, INSERT, UPDATE, DELETE ON MotorsCertification.employees TO HR;-- Grant HR role permission to manage employees tables
GRANT SELECT, INSERT, UPDATE, DELETE ON MotorsCertification.offices TO HR;-- Grant HR role permission to manage offices tables
GRANT SELECT ON MotorsCertification.* TO Employee; -- Grant Employee role read-only access to all tables
-- CREATE USERS AND SET ROLES
CREATE USER 'admin_user'@'%' IDENTIFIED WITH mysql_native_password BY 'admin_password'; -- Create Admin user with password (Modify as needed)
CREATE USER 'hr_user'@'%' IDENTIFIED WITH mysql_native_password BY 'hr_password'; -- Create HR user with password (This is the HR login credentials)
CREATE USER 'employee_user'@'%' IDENTIFIED WITH mysql_native_password BY 'employee_password';-- Create Employee user with password
GRANT Admin TO 'admin_user'@'%';-- Assign Admin role to 'admin_user' (Gives full access)
GRANT HR TO 'hr_user'@'%';-- Assign HR role to 'hr_user' (Grants limited access)
-- Assign Employee role to 'employee_user' (Grants read-only access)
GRANT Employee TO 'employee_user'@'%';
-- SET DEFAULT ROLE FOR USERS (Ensures users activate their assigned roles automatically)
SET DEFAULT ROLE Admin FOR 'admin_user'@'%';
SET DEFAULT ROLE HR FOR 'hr_user'@'%';
SET DEFAULT ROLE Employee FOR 'employee_user'@'%';


-- The answers for QUESTION 14 to 16 are provided in the DOCUMENTATION
