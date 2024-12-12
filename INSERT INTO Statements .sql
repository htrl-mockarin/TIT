-- Team  : TIT
/* Team members:
    Oluwatoni Ademuyiwa
    Iris / Linh Ho
    Theodar Buyulu
*/
-- Class : CIS 205
-- Topic :  Computer Maintenance Store Database
-- INSERT INTO Statements for the Database

DROP DATABASE TIT;
CREATE DATABASE TIT;
USE TIT;

DROP TABLE IF EXISTS Company;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phonenum VARCHAR(15),
    email VARCHAR(255)
);

/* Data for the table 'Company'*/
INSERT INTO Company (CompanyID, name, address, phonenum, email) 
VALUES 
(1, 'TIT', '123 Main Street, Springfield, PA 19064', '555-1234', 'tit@techfix.com'),
(2,'Penguins','888 Powder Way,Bear, DE 19701','555-2143','peguins@techinnova.com');



DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phonenum VARCHAR(15) NOT NULL,
    email VARCHAR(255)
);
/* Data for the table 'Customer'*/
INSERT INTO Customer (CustomerID, name, phonenum, email) 
VALUES 
(101, 'John Doe', '267-328-5678', 'johndoe@gmail.com'),
(102,'Lilvania Miller','206-584-0183','lilmil@gmail.com'),
(103,'Kacem Jaeger','302-198-237','kajg@gmail.com'),
(104,'Samatha Garcia','215-465-0108','samcia@gmail.com'),
(105,'Anthony Rodriguez','610-697-1306','anrodri@gmail.com'),
(106,'Tom Wilson','682-328-1208','tomwilsn@email.com'),
(107,'Mathew Brown','317-123-5608','matbrn@email.com');


DROP TABLE IF EXISTS Technician;

CREATE TABLE Technician (
    TechnicianID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phonenum VARCHAR(15),
    email VARCHAR(255)
);

/* Data for the table 'Technician'*/
INSERT INTO Technician (TechnicianID, name, phonenum, email) 
VALUES 
(1, 'Alice Smith', '610-152-8765', 'as1@techfix.com'),
(2,'Beatrix Parker','215-898-452','bp2@techinnova.com'),
(3,'Brian Hayman','317-923-485','bh3@techfix.com'),
(4,'Ethen Norris II','680-931-0042','eno4@techinnova.com'),
(5,'Demond Williams','445-729-0182','dew5@techfox.com');



DROP TABLE IF EXISTS TechnicianSkills;

CREATE TABLE TechnicianSkills (
    TechSkillID INT PRIMARY KEY,
    CertificationName VARCHAR(255) NOT NULL,
    SkillName VARCHAR(255) NOT NULL,
    TechnicianID INT,
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);

/* Data for the table 'Technicianskills'*/
INSERT INTO TechnicianSkills (TechSkillID, CertificationName, SkillName, TechnicianID) 
VALUES 
(11, 'CompTIA A+', 'Hardware Troubleshooting', 1),
(12, 'CompTIA Network+', 'Networking Setup', 2),
(13, 'Microsoft Certified', 'Software Troubleshooting', 3),
(14, 'CompTIA Security+', 'Cybersecurity Solutions', 4),
(15, 'Cisco Certified Network Associate (CCNA)', 'Network Configuration', 5);


DROP TABLE IF EXISTS RepairServices;

CREATE TABLE RepairServices (
    ServiceID INT PRIMARY KEY,
    serviceType VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

/* Data for the table 'RepairServices'*/
INSERT INTO RepairServices (ServiceID, serviceType, price) 
VALUES 
(41, 'Virus Removal', 50.00),
(84, 'Hardware Replacement', 75.00),
(43, 'Data Recovery', 100.00),
(2, 'Screen Repair', 120.00),
(55,'Networking Setup',150.00);


DROP TABLE IF EXISTS ServicesSchedules;

CREATE TABLE ServiceSchedules (
    ScheduleID INT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    CustomerID INT,
    ServiceID INT,
    TechnicianID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ServiceID) REFERENCES RepairServices(ServiceID),
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);

/* Data for the table 'ServiceSchedules'*/
INSERT INTO ServiceSchedules (ScheduleID, date, time, CustomerID, ServiceID, TechnicianID) 
VALUES 
(22, '2024-12-02', '10:30:00', 101, 41, 1),
(33, '2024-12-03', '14:00:00', 102, 84, 2),
(42, '2024-12-04', '09:30:00', 103, 43, 3),
(55, '2024-12-05', '11:00:00', 104, 02, 4),
(66, '2024-12-06', '15:00:00', 105, 55, 5),
(411, '2024-12-11', '13:00:00', 106, 41, 2),
(512, '2024-12-12', '10:00:00', 107, 43, 4);


DROP TABLE IF EXISTS ToolsAndEquipment;

CREATE TABLE ToolsAndEquipment (
    ToolID INT PRIMARY KEY,
    ToolName VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

/* Data for the table 'ToolsAndEquipment'*/
INSERT INTO ToolsAndEquipment (ToolID, ToolName, quantity, price) 
VALUES 
(1, 'Screwdriver Set', 8, 25.00),
(2, 'Anti-static Wrist Strap', 15, 5.00),
(3, 'Thermal Paste', 25, 8.00),
(4, 'Multimeter', 10, 50.00),
(5, 'Compressed Air Duster', 30, 15.00);

DROP TABLE IF EXISTS 'Vendor';

CREATE TABLE Vendor (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255)
);

/* Data for the table 'Vendor'*/
INSERT INTO Vendor (VendorID, VendorName, ContactInfo) 
VALUES 
(1, 'TechCo Supplies', '1234 Sunset Boulevard, Los Angeles, CA 90026, techco@gmail.com, 213-555-7890'),
(2, 'RepairTools Inc.', '5678 Pacific Coast Highway, Malibu, CA 90265, rtools@gmail.com, 310-555-1234');



DROP TABLE IF EXISTS 'Miscellaneous';

CREATE TABLE Miscellaneous (
    MiscID INT PRIMARY KEY,
    ItemName VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

/* Data for the table 'Miscellaneous'*/
INSERT INTO Miscellaneous (MiscID, ItemName, quantity) 
VALUES 
(1, 'Screws', 200),
(10, 'Isopropyl Alcohol', 50),
(5, 'Compressed Air Duster', 30);


DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductType VARCHAR(255) NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);

/* Data for the table 'Products'*/
INSERT INTO Products (ProductID, ProductType, ProductName, price, quantity) 
VALUES 
(12, 'Laptop', 'Dell Inspiron 15', 600.00, 20),
(13, 'Monitor', 'Samsung 24-inch', 150.00, 10),
(1, 'Accessory', 'Wireless Mouse', 20.00, 30),
(19, 'Software', 'Microsoft Office 365', 100.00, 50),
(14, 'Networking', 'WiFi Router', 80.00, 25);


DROP TABLE IF EXISTS SpareParts;

CREATE TABLE SpareParts (
    SparePartID INT PRIMARY KEY,
    SPartName VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

/* Data for the table 'SpareParts'*/
INSERT INTO SpareParts (SparePartID, SPartName, quantity) 
VALUES 
(1, 'RAM 8GB', 15),
(2, 'SSD 256GB', 20),
(3, 'Motherboard ATX', 10),
(4, 'Power Supply 500W', 15),
(5,'Graphics Card GTX 1660', 8),
(6,'Cooling Fan 120mm', 15);


DROP TABLE IF EXISTS Inventory;

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    quantity INT NOT NULL,
    ProductID INT,
    ToolID INT,
    SparePartID INT,
    MiscID INT,
    VendorID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (ToolID) REFERENCES ToolsAndEquipment(ToolID),
    FOREIGN KEY (SparePartID) REFERENCES SpareParts(SparePartID),
    FOREIGN KEY (MiscID) REFERENCES Miscellaneous(MiscID),
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
);

/* Data for the table 'Inventory'*/
INSERT INTO Inventory (InventoryID, quantity, ProductID, ToolID, SparePartID, MiscID, VendorID) 
VALUES 
(1, 5, NULL, NULL, NULL, NULL, 1),
(2, 10, 13, 1, 3, NULL, 2),
(3, 8, NULL, 4, 5, NULL, 1);

DROP TABLE IF EXISTS TechnicianProducts;

CREATE TABLE TechnicianProducts (
    TechProductsID INT PRIMARY KEY,
    UsageDetails VARCHAR(255) NOT NULL,
    ProductID INT,
    TechnicianID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);

/* Data for the table 'TechnicianProducts'*/
INSERT INTO TechnicianProducts (TechProductsID, UsageDetails, ProductID, TechnicianID) 
VALUES 
(1, 'Used for diagnostics', 12, 1),
(2, 'Sold to customer during repair', 1, 2),
(3, 'Installed as part of repair', 19, 3),
(4, 'Recommended for networking', 14, 5);


DROP TABLE IF EXISTS TechnicianTools;

CREATE TABLE TechnicianTools (
    TechToolID INT PRIMARY KEY,
    UsageDetails VARCHAR(255) NOT NULL,
    ToolID INT,
    TechnicianID INT,
    FOREIGN KEY (ToolID) REFERENCES ToolsAndEquipment(ToolID),
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);

/* Data for the table 'TechnicianTools'*/
INSERT INTO TechnicianTools (TechToolID, UsageDetails, ToolID, TechnicianID) 
VALUES 
(1, 'Used for opening devices', 1, 1),
(2, 'Prevents static discharge', 2, 2),
(3, 'Applied thermal paste', 3, 3),
(4, 'Multimeter for diagnostics', 4, 4),
(5, 'Air duster for cleaning', 5, 5);