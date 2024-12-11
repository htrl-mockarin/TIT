-- Team  : TIT
/* Team members:
    Oluwatoni Ademuyiwa
    Iris / Linh Ho
    Theodar Buyulu
*/
-- Class : CIS 205
-- Topic :  Computer Maintenance Store Database

CREATE DATABASE TIT;
USE TIT;

CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phonenum VARCHAR(15),
    email VARCHAR(255)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phonenum VARCHAR(15) NOT NULL,
    email VARCHAR(255)
);

CREATE TABLE Technician (
    TechnicianID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phonenum VARCHAR(15),
    email VARCHAR(255)
);

CREATE TABLE TechnicianSkills (
    TechSkillID INT PRIMARY KEY,
    CertificationName VARCHAR(255) NOT NULL,
    SkillName VARCHAR(255) NOT NULL,
    TechnicianID INT,
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);

CREATE TABLE RepairServices (
    ServiceID INT PRIMARY KEY,
    serviceType VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

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

CREATE TABLE ToolsAndEquipment (
    ToolID INT PRIMARY KEY,
    ToolName VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Vendor (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255)
);

CREATE TABLE Miscellaneous (
    MiscID INT PRIMARY KEY,
    ItemName VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductType VARCHAR(255) NOT NULL,
    ProductName VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE SpareParts (
    SparePartID INT PRIMARY KEY,
    SPartName VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);


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


CREATE TABLE TechnicianProducts (
    TechProductsID INT PRIMARY KEY,
    UsageDetails VARCHAR(255) NOT NULL,
    ProductID INT,
    TechnicianID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);


CREATE TABLE TechnicianTools (
    TechToolID INT PRIMARY KEY,
    UsageDetails VARCHAR(255) NOT NULL,
    ToolID INT,
    TechnicianID INT,
    FOREIGN KEY (ToolID) REFERENCES ToolsAndEquipment(ToolID),
    FOREIGN KEY (TechnicianID) REFERENCES Technician(TechnicianID)
);