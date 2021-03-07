-- DELETE FROM employee 
-- WHERE deptID = 2 and empRole != 'Doctor';


-- UPDATE rooms
-- SET roomNum = roomNum + 10
-- WHERE roomNum > 400 AND roomNum < 500;

-- SELECT pname as Name, patientID as ID, phone as Phone 
-- FROM patient, address
-- WHERE patient.addressID = address.address_id and pname LIKE 'J%';

-- SELECT pname as Name, P.patientID as ID, amount as Total
-- FROM patient P JOIN invoice I
-- ON P.patientID = I.patientID and pname LIKE 'J%';

-- SELECT ename as Name, empRole as Role, dname as Department
-- FROM employee E, department D
-- WHERE E.deptID = D.deptID and E.is_doc = true;

-- SELECT companyName as Company, city as City, state as State
-- FROM supplier S, address A
-- WHERE A.address_ID = S.addressID 
-- UNION
-- SELECT companyName as Company, unitPrice as Price, productName as Product
-- FROM supplier S, supplies U
-- WHERE U.supplierID = S.supplierID and U.unitPrice < 20;

-- UPDATE supplies S, supplier 
-- SET unitPrice = unitPrice + 50
-- WHERE S.supplierID = supplier.supplierID and supplier.companyName LIKE 'P%';

-- SELECT productName as Product, unitsLeft as Units, unitPrice as Price, companyName as Company
-- FROM supplies RIGHT JOIN supplier 
-- ON supplies.supplierID = supplier.supplierID
-- ORDER BY unitsLeft DESC;

-- SELECT pname as Patient, patient.roomNum as Room, employeeID 
-- FROM patient, rooms, employee
-- WHERE rooms.is_occupied = true AND patient.roomNum = rooms.roomNum 
-- 	AND patient.docID = employee.employeeID;

-- DELETE FROM address 
-- WHERE address_id = 0 and state = 'HI';






