-- Team  : TIT 
-- Class : CIS 205
-- Professor: Craig Nelson
-- Topic :  Computer Maintenance Store Database
-- Part 2: Invididual Project - Iris / Linh Ho

-- 1. Using UNION Operation
SELECT SparePartID 
    AS ID, SPartName AS name, quantity 
    FROM SpareParts
    UNION
SELECT SparePartID 
    AS ID, NULL AS name, quantity 
    FROM Inventory;

-- 2. Using an INTERSECTION
SELECT SparePartID, quantity 
    FROM SpareParts
    WHERE SparePartID IN (SELECT SparePartID FROM Inventory);

-- 3. Using DIFFERENCE Operation:
-- SpareParts that do not exist in Inventory
SELECT SparePartID, SPartName, quantity 
    FROM SpareParts
    WHERE SparePartID NOT IN (SELECT SparePartID FROM Inventory);

-- Inventory rows that do not exist in SpareParts
SELECT SparePartID, quantity 
    FROM Inventory
    WHERE SparePartID NOT IN (SELECT SparePartID FROM SpareParts);

-- 4. JOIN Query
SELECT 
    tp.TechProductsID, tp.UsageDetails, p.ProductName, p.price, t.name 
    AS TechnicianName
    FROM TechnicianProducts tp
    JOIN Products p 
        ON tp.ProductID = p.ProductID
    JOIN Technician t 
        ON tp.TechnicianID = t.TechnicianID;

-- 5. ALTER TABLE Commands
-- Add new Column
DESCRIBE SpareParts;

ALTER TABLE SpareParts 
ADD COLUMN Supplier VARCHAR(255);

DESCRIBE SpareParts;
-- Modify quantity in Inventory to allow NULL values
DESCRIBE Inventory;

ALTER TABLE Inventory MODIFY Quantity INT NULL;

DESCRIBE Inventory;

-- 6. UPDATE Queries
UPDATE SpareParts
    SET Supplier = 'Tech Supplies Co.'
    WHERE SparePartID = 1;

UPDATE TechnicianTools
    SET UsageDetails = 'Advanced diagnostics'
    WHERE TechToolID = 4;

-- 7. DELETE Queries
DELETE FROM SpareParts
    WHERE Quantity < 10;

DELETE FROM Inventory
    WHERE VendorID = 2;

-- 8. AGGREGATE functions
SELECT SUM(quantity) 
    AS TotalSpareParts 
    FROM SpareParts;

SELECT AVG(price) 
    AS AverageToolPrice 
    FROM ToolsAndEquipment;

-- 9. HAVING Clause
SELECT SparePartID, quantity 
    FROM SpareParts
    GROUP BY SparePartID, quantity
    HAVING quantity > 10;

SELECT InventoryID, quantity 
FROM Inventory
GROUP BY InventoryID, quantity
HAVING quantity > 5;

-- 10. GROUP BY and HAVING
SELECT VendorID, 
    SUM(quantity) AS Totalquantity 
    FROM Inventory
    GROUP BY VendorID
    HAVING Totalquantity > 10;

SELECT ProductID, COUNT(*) 
    AS InventoryCount
    FROM Inventory
    GROUP BY ProductID
    HAVING InventoryCount > 0;

-- 11. Sorting Results
SELECT ProductID, ProductName, price 
    FROM Products
    ORDER BY price ASC;

SELECT ToolID, ToolName, quantity 
    FROM ToolsAndEquipment
    ORDER BY quantity DESC;

-- 12. VIEWS
-- Create a view for spare parts with quantity above 10
CREATE VIEW HighStockSpareParts AS
    SELECT * 
    FROM SpareParts 
    WHERE quantity > 10;

SELECT * 
FROM HighStockSpareParts;

-- Create a view for tools used by technicians
CREATE VIEW TechnicianToolUsage AS
    SELECT tt.TechToolID, tt.UsageDetails, te.ToolName 
    FROM TechnicianTools tt
    JOIN ToolsAndEquipment te ON tt.ToolID = te.ToolID;

SELECT * 
FROM TechnicianToolUsage;

-- 13. Creating New Users
CREATE USER 'u1'@'localhost' 
    IDENTIFIED BY '12345';
CREATE USER 'u2'@'localhost' 
    IDENTIFIED BY '67890';

GRANT SELECT, INSERT, UPDATE ON SpareParts TO 'u1'@'localhost';
REVOKE INSERT ON SpareParts FROM 'u1'@'localhost';

SHOW GRANTS FOR 'u1'@'localhost';

-- 14. STORED Procedures
-- Procedure with IN and OUT parameters
DELIMITER //

CREATE PROCEDURE GetSparePartQuantity(IN sparePartID INT, OUT totalQuantity INT)
    BEGIN
    SELECT SUM(Quantity) INTO totalQuantity
    FROM SpareParts
    WHERE SparePartID = sparePartID;
    END //

DELIMITER ;

CALL GetSparePartQuantity(1, @quantity1);
SELECT @quantity1;

-- Procedure with conditional logic
DELIMITER //

CREATE PROCEDURE CheckInventory(IN toolID INT)
BEGIN
    IF EXISTS (SELECT * FROM Inventory WHERE ToolID = toolID) THEN
        SELECT 'Tool is available in inventory' AS Message;
    ELSE
        SELECT 'Tool not found in inventory' AS Message;
    END IF;
END //

DELIMITER ;

CALL CheckInventory(3);

-- 15. Triggers
-- Trigger to backup row before update
CREATE TABLE InventoryBackup 
    LIKE Inventory;

    CREATE TRIGGER BackupBeforeUpdate
    BEFORE UPDATE ON Inventory
    FOR EACH ROW
    INSERT INTO InventoryBackup 
        SELECT * 
        FROM Inventory 
        WHERE InventoryID = OLD.InventoryID;

-- Trigger to backup rows before delete
CREATE TRIGGER BackupBeforeDelete
    BEFORE DELETE ON Inventory
    FOR EACH ROW
    INSERT INTO InventoryBackup 
    SELECT * 
    FROM Inventory 
    WHERE InventoryID = OLD.InventoryID;




