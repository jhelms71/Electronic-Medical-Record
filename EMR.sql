/*
	Script to create EMR Database and insert data
*/

-- CREATE database EMR if not exists
DROP DATABASE IF EXISTS EMR;
CREATE DATABASE EMR;
USE EMR;

-- create department table
create table department (
	deptID int,
    dname varchar(45),
    primary key (deptID)
);

-- create employee table 
CREATE TABLE Employee (
	employeeid int NOT NULL auto_increment,
	ename varchar(45) DEFAULT NULL,
	deptID int DEFAULT NULL,
	empRole varchar(45),
    is_doc BOOLEAN NOT NULL DEFAULT 0,
	PRIMARY KEY (employeeID),
	CONSTRAINT departmen_fk
		FOREIGN KEY (deptID)
        REFERENCES department(deptID)
) ;

-- insurance company table
CREATE TABLE insuranceComp (
	companyID int,
    companyName varchar(45),
    primary key (companyID)
);

-- create address table (other tables can reference this to get the address, while they can just hold the addressID)
create table address (
	address_id         INT            PRIMARY KEY,
	street             VARCHAR(60)    NOT NULL,
	city               VARCHAR(40)    NOT NULL,
	state              VARCHAR(2)     NOT NULL,
	zip_code           VARCHAR(10)    NOT NULL,
	phone              VARCHAR(12)    NOT NULL
);

-- room table
CREATE TABLE rooms (
	roomNum int primary key,
    is_occupied BOOLEAN NOT NULL DEFAULT 0,
    deptID int,
    CONSTRAINT deptID_fk
		FOREIGN KEY (deptID)
        REFERENCES department(deptID)
);

-- create paitent table
create table patient (
	patientID int NOT NULL,
    pname varchar(50),
    addressID int,
    insuranceID int,
    docID int,
    roomNum int,
    primary key (patientID),
    CONSTRAINT insuranceName_fk
		FOREIGN KEY (insuranceID)
        REFERENCES insuranceComp (companyID),
	CONSTRAINT address_fk
		FOREIGN KEY(addressID)
        REFERENCES address(address_id)
        ON DELETE CASCADE,
	CONSTRAINT docID_fk_patient
		FOREIGN KEY (docID)
        REFERENCES employee(employeeid),
	CONSTRAINT room_fk
		FOREIGN KEY (roomNum)
        REFERENCES rooms(roomNum)
);

-- supplier table
CREATE TABLE supplier (
	supplierID INT PRIMARY KEY,
	companyName VARCHAR(45),
    addressID int,
    CONSTRAINT address_fk_supplier
		FOREIGN KEY(addressID)
        REFERENCES address(address_id)
);

-- supplies table
CREATE TABLE supplies (
	supplyID INT PRIMARY KEY,
    productName varchar(45),
    supplierID INT,
    unitPrice FLOAT,
    unitsLeft INT, 
    deptID int,
    CONSTRAINT supplierID_fk
		FOREIGN KEY (supplierID)
        REFERENCES supplier(supplierID),
	CONSTRAINT dept_fk_supply
		FOREIGN KEY (deptID)
        REFERENCES department(deptID)
);

-- create invoice table
CREATE TABLE invoice (
	invoiceNum int auto_increment primary key,
    date datetime,
    patientID int,
    amount float,
    CONSTRAINT patient_fk
		FOREIGN KEY (patientID)
        REFERENCES patient(patientID)
);

DELIMITER //
CREATE TRIGGER doc_fix BEFORE INSERT on employee FOR EACH ROW 
BEGIN
	IF NEW.empRole = 'Doctor' THEN
    SET NEW.is_doc = true;
    END IF;
END;// 

DELIMITER //
CREATE TRIGGER refill_supply BEFORE INSERT on supplies FOR EACH ROW 
BEGIN
	IF NEW.unitsLeft > 100 THEN
    SET NEW.unitsLeft = NEW.unitsLeft + 100;
    END IF;
END;// 


INSERT INTO department (deptID, dname) VALUES
(1, 'Surgery'), (2, 'Urgent Care'), (3, 'Cardiology'), 
(4, 'Pharmacy'), (5, 'Pathology'), (6, 'Radiology');

INSERT INTO employee (employeeid, ename, deptID, empRole) VALUES
(1, 'Vicenta Moen', 3, 'Doctor'),
(2, 'Magdalena Schmitt', 2, 'Nurse'),
(3, 'Tesenia Koss', 4, 'Pharmacist'),
(4, 'Ladarius Greenfelder', 1, 'Surgeon'),
(5, 'Angelo Bernhard', 2, 'Doctor'),
(6, 'Mateo Turcotte', 4, 'IT Specialist'),
(7, 'Kaylin Hackett', 6, 'Nurse'),
(8, 'Zaria Rolfson', 6, 'Doctor'),
(9, 'Hobart Lowe', 5, 'Respiratory Therapist'),
(10, 'Frederic Bergstrom', 1, 'Doctor'),
(11, 'Arjun Fisher', 3, 'Nurse'),
(12, 'Amara Beatty', 5, 'Doctor'),
(13, 'Terrell Miller', 1, 'Surgeon');

INSERT INTO insuranceComp (companyID, companyName) VALUES
(1, 'Aetna'), (2, 'BlueCross/BlueShield'), (3, 'Cigna'),
(4, 'Humana'), (5, 'Kaiser'), (6, 'United');

INSERT INTO address (address_id, street, city, state, zip_code, phone) VALUES
(0, '184 Ed Spring','Gulgowskiport', 'HI', '39253', '145-806-0306'),
(1, '3634 Myles Plains', 'West Dejuan', 'TX', '52619', '1-824-671-47'),
(2, '847 Ariel Mall', 'Haneshire', 'KY', '28146', '482.270.8469'),
(3, '27908 Bette Street', 'North Lavonland', 'MA', '99160', '1-406-761-41'),
(4, '3931 Gislason Prairie', 'Port Jadabury', 'VT', '73628', '(127)512-062'),
(5, '7075 Treva Ford', 'Abigaylemouth', 'DE', '27022', '+357648469'),
(6, '25691 Trantow Valleys', 'Port Jeniferborough', 'NC', '79841', '09362507043'),
(7, '84359 Everette Oval', 'North Bernitaland', 'AL', '31653', '338.206.3752'),
(8, '0393 Homenick Shoal', 'East Isabelshire', 'UT', '21419', '1-306-956-38'),
(9, '660 Bridget Hollow', 'East Autumnshire', 'OK', '48902', '01933628114');


INSERT INTO rooms (roomNum,deptID) VALUES
(101, 1), (102, 1), (103, 1), (104, 1), (105, 1),
(201, 2), (202, 2), (203, 2), (204, 2), (205, 2),
(301, 3), (302, 3), (303, 3), (304, 3), (305, 3),
(401, 4), (402, 4), (403, 4), (404, 4), (405, 4),
(501, 5), (502, 5), (503, 5), (504, 5), (505, 5),
(601, 6), (602, 6), (603, 6), (604, 6), (605, 6);

INSERT INTO patient (patientID, pname, addressID, insuranceID, docID, roomNum) VALUES
(1, 'Julieann Rhode', 7, 2, 8, 604),
(2, 'Carl Vega', 8, 1, 1, 302),
(3, 'Jani Schaper', 9, 1, 12, 505),
(4, 'Hugo Tibbs', 6, 5, 10, 104),
(5, 'Stephania Frary', 0, 3, 1, 303);

INSERT INTO supplier (supplierID, companyName, addressID) VALUES
(1, 'VNB Medical', 1),
(2, 'Bluedot Medical', 3),
(3, 'Silver Cross', 5),
(4, 'Pfizer', 2);

INSERT INTO supplies (supplyID, productName, supplierID, unitPrice, unitsLeft, deptID) VALUES
(1, 'Face maskes', 1, 24.99, 500, 1), (2, 'Gloves', 1, 13.99, 1000, 1),
(3, 'Bandages', 2, 0.59, 450, 2), (4, 'IV catheters', 2, 21.95, 600, 3),
(5, 'Syringes', 3, 10.59, 200, 5), (6, 'Splint', 3, 17.27, 100, 6),
(7, 'Hydrocodone', 4, 14.00, 70, 4), (8, 'Levothyroxine', 4, 11.00, 300, 4),
(9, 'Prednison', 4, 5.00, 100, 4), (10, 'Amoxicillin', 4, 9.00, 200, 4);

INSERT INTO invoice (invoiceNum, date, patientID, amount) VALUES
(1, '2020-08-17 11:34:14', 1, 64185.8),
(2, '2020-05-10 05:19:50', 2, 88085.7),
(3, '2020-10-27 10:47:12', 3, 5169.86);

