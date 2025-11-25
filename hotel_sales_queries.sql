
----------------------------------------------------------------------------------------------------------------------------------------------
                                       
                                               -- Project Title: "Hotel Management System" 
                                               
-----------------------------------------------------------------------------------------------------------------------------------------------

-- Question - 1] The accounts team wants to check payments made via UPI to measure digital adoption. 
                    SELECT * FROM Payments WHERE PAYMENTMETHOD="UPI";

-- Question - 2] List all unique first names of customers for a duplicate check. 
                    SELECT DISTINCT FIRSTNAME FROM CUSTOMERS;
                    
-- Question - 3] Delete all rooms with Capacity = 1.
                 SET SQL_SAFE_UPDATES = 0;
                 DELETE FROM ROOMS WHERE CAPACITY = 1;
                
-- Question - 4] Display each customer’s name and phone number together using CONCAT.
			     SELECT CONCAT_WS("   ",FIRSTNAME,LASTNAME,PHONE) AS CUST_INFO FROM CUSTOMERS;
            
-- Question - 5] The booking office wants to see bookings where RoomID = 10 to check utilization of a specific room. 
                 SELECT * FROM BOOKINGS WHERE ROOMID=10;
                 
-- Question - 6] Identify rooms whose Capacity is greater than the average Capacity of all rooms.(Rooms subquery) Phone.
                 SELECT * FROM ROOMS
                 WHERE CAPACITY>(SELECT AVG(CAPACITY)FROM ROOMS);
                 
-- Question - 7] Create a VIEW StaffContact showing Staff FirstName, LastName, Role, and Phone.

-- Question - 8] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 
                  SELECT * FROM ROOMS WHERE ROOMTYPE='SUITE' AND PRICEPERNIGHT < 7000;
                  
-- Question - 9] The admin wants to see email addresses sorted by LastName from the Customers 
                 SELECT EMAIL FROM CUSTOMERS ORDER BY LASTNAME;
                 
-- Question - 10] Show staff full names combined into one column. 
                SELECT CONCAT(FIRSTNAME, "   ",LASTNAME)AS FULLNAME FROM STAFF;
                
-- Question - 11] Display all payment details in one line using CONCAT_WS. 
				SELECT CONCAT_WS(" , ",PAYMENTID,BOOKINGID,PAYMENTDATE,PAYMENTMETHOD,AMOUNT)
                AS PAYMENT_DETAILS FROM PAYMENTS;
                
-- Question - 12] The hotel wants to display the 2 most expensive rooms for VIP guests. 
                 select roomid,pricepernight
                 from rooms
                 order by pricepernight desc
                 limit 2;
                 
-- Question - 13] Show each BookingID with its CheckIn and CheckOut dates combined. 
                 SELECT CONCAT_WS("    ",BOOKINGID,CHECKINDATE,CHECKOUTDATE) AS BOOING_DETAILS FROM BOOKINGS;  
                 
-- Question - 14] Finance wants to calculate the average Amount per PaymentMethod. 
					SELECT PAYMENTMETHOD,AVG(AMOUNT) FROM PAYMENTS
                    GROUP BY PAYMENTMETHOD; 
                    
-- Question - 15] The analytics team wants to find the city where average CustomerID is greater than 50. 
				   SELECT CITY,COUNT(CUSTOMERID) FROM CUSTOMERS
                   GROUP BY CITY
                   HAVING COUNT(CUSTOMERID) > 50;

-- Question - 16] Find bookings where TotalAmount exceeds the average TotalAmount.(Bookings subquery) 
                  --  SELECT AVG(TOTALAMOUNT) FROM BOOKINGS;
                   SELECT * FROM BOOKINGS 
                   WHERE TOTALAMOUNT > (SELECT AVG(TOTALAMOUNT) FROM BOOKINGS);
                   
-- Question - 17] Display the last 2 added rooms from the Rooms table. 
				  SELECT * FROM ROOMS  ORDER BY ROOMID DESC LIMIT 2;
                  
-- Question - 18] The cashier wants a report of payments where Amount < ₹1500 for small transactions.
				  SELECT * FROM PAYMENTS  WHERE AMOUNT < 1500;
                  
-- Question - 19] Management wants to list all customers who have made more than 5 bookings. 
				  SELECT CUSTOMERID, COUNT(BOOKINGID) FROM BOOKINGS
                  GROUP BY CUSTOMERID
                  HAVING COUNT(BOOKINGID) > 5; 
                  
-- Question - 20] Identify customers who live in the same city. (Customers self join) 
                  SELECT C1.CUSTOMERID,C1.FIRSTNAME,C1.LASTNAME,C1.CITY,C2.CUSTOMERID,C2.FIRSTNAME,C2.LASTNAME,C2.CITY
                  FROM CUSTOMERS AS C1
                  JOIN CUSTOMERS AS C2
                  ON C1.CITY=C2.CITY AND C1.CUSTOMERID < C2.CUSTOMERID;
                  
-- Question - 21] Show the total revenue handled by each StaffID. 
                  SELECT StaffID, SUM(TotalAmount) AS Total_Revenue
                  FROM BOOKINGS
				  GROUP BY StaffID;

-- Question - 22] The manager wants to see all customers from Mumbai to check city-wise marketing campaigns
                   SELECT * FROM CUSTOMERS WHERE CITY="MUMBAI";
                   
-- Question - 23] Display the 3 lowest booking amounts. 
                SELECT * FROM BOOKINGS  ORDER BY TOTALAMOUNT LIMIT 3;

-- Question - 24] Insert 5 new room records with type, price, and capacity into the Rooms table. 
				 INSERT INTO ROOMS( RoomID,RoomType,PricePerNight,Capacity) VALUES
                      (101,'Single', 1200, 1),
					  ( 102,'Double', 2000, 2),
					  ( 103,'Deluxe', 3500, 2),
					  (104,'Suite', 5000, 4),
                      (105,'Family', 4000, 3);
                      
-- Question - 25] Show all unique CustomerIDs from bookings. 
                 SELECT DISTINCT CUSTOMERID FROM BOOKINGS;
                 
-- Question - 26] Create a trigger to automatically delete a payment when its corresponding 
                  
-- Question - 27] The marketing team wants to update the FirstName of CustomerID = 30 to "RAHUL"
                   UPDATE CUSTOMERS
                   SET  FIRSTNAME="Rahul" 
					WHERE CUSTOMERID=30;
                  
-- Question - 28] List all bookings ordered by CheckInDate. 
				SELECT * FROM BOOKINGS ORDER BY CHECKINDATE;
                
-- Question - 29] Show all rooms where capacity is greater than 2. 
                   SELECT * FROM ROOMS WHERE CAPACITY > 2;
                   
-- Question - 30] List staff emails ordered by their roles.    
				  SELECT ROLE,EMAIL FROM STAFF ORDER BY ROLE;
                  
-- Question - 31] Display each customer’s full name and city using CONCAT_WS. 
                  SELECT CONCAT_WS("   ",FIRSTNAME,LASTNAME) AS FULL_NAME, CITY FROM CUSTOMERS;
                  
-- Question - 32] Show the first 4 customers’ full names only. 
                  SELECT CONCAT(FIRSTNAME,"  ",LASTNAME) AS FULL_NAME FROM CUSTOMERS LIMIT 4;
                  
-- Question - 33] Show each staff’s role with their full name. 
                   SELECT CONCAT_WS ("  ",FIRSTNAME,LASTNAME)AS FULL_NAME,ROLE FROM STAFF;
                   
-- Question - 34] Management wants to find the average StaffID per role. 
				  SELECT ROLE,AVG(STAFFID)
                  FROM STAFF
                  GROUP BY ROLE;
                 
-- Question - 35] List all bookings handled by StaffID = 2. 
                   SELECT * FROM BOOKINGS
                   WHERE STAFFID=2;
                   
-- Question - 36] Display the first 3 staff alphabetically by their first names. 
				  SELECT * FROM STAFF ORDER BY FIRSTNAME LIMIT 3;
                  
-- Question - 37] The front desk manager wants to see customers where FirstName = 'Amit' AND City = 'Nagpur' for personal attention. 
                   SELECT * FROM CUSTOMERS WHERE FIRSTNAME="Amit" AND CITY="Nagpur";
                   
-- Question - 38] Show all unique payment methods in descending order. 
                  SELECT DISTINCT PAYMENTMETHOD FROM PAYMENTS ORDER BY PAYMENTMETHOD DESC;
                  
-- Question - 39] Insert 5 staff members into the Staff table with their role, phone, and email. 
			        INSERT INTO STAFF (StaffID,FIRSTNAME,LASTNAME,ROLE,PHONE,EMAIL)VALUES
                    (101,"ROHAN","MANE","CHEF",9876543210,"rohan2@gmail.com"),
                    (102,"maya","naik","waiter",9878943210,"mayanaik2@gmail.com"),
                    (103,"kavita","auti","waiter",9856543210,"kavitaauti3@gmail.com"),
                    (104,"gaurav","roy","CHEF",9876576210,"		gaurav@gmail.com"),
                    (105,"navya","patil","waiter",9876547210,"navyaty3@gmail.com");
                    
-- Question - 40] The hotel manager wants to review bookings where CheckInDate is after '2024-01-01' to analyze recent occupancy.
				  SELECT * FROM BOOKINGS WHERE CHECKINDATE > '2024-01-01';

-- Question - 41] List all customers whose FirstName is 'Rahul' for a loyalty program. 
                  SELECT  * FROM CUSTOMERS WHERE FIRSTNAME="Rahul";
                  
-- Question - 42] Show all unique room types offered by the hotel.
                   SELECT DISTINCT ROOMTYPE FROM ROOMS;
                   
-- Question - 43] Identify customers who spent more than 50,000 in total. 
                  SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 50000;
                  
-- Question - 44] Delete all customers from the city 'TestCity'.
                   SET SQL_SAFE_UPDATES = 0; 
                 DELETE FROM CUSTOMERS WHERE CITY="TESTCITY";
                 
-- Question - 45] Find rooms that have the same PricePerNight. (Rooms self join) 
                  SELECT r.roomid,r.roomtype,r1.roomid,r1.roomtype,r.pricepernight
                  FROM ROOMS AS r
                  JOIN ROOMS AS r1 
                  ON r.pricepernight=r1.pricepernight and r.roomid<r1.roomid ;
                  
-- Question - 46] The manager wants to see staff whose Email ends with '@tcs.in' for corporate tie
                 SELECT * FROM STAFF WHERE EMAIL LIKE '%@tcs.in';
                 
-- Question - 47] The analytics team wants to list all cities where maximum CustomerID is more than 100.
				SELECT CITY FROM CUSTOMERS 
				GROUP BY CITY
                HAVING MAX(CUSTOMERID)> 100;
                
-- Question - 48] Show all unique capacities in descending order.
                   SELECT DISTINCT Capacity FROM ROOMS ORDER BY Capacity DESC;
                   
-- Question - 49] List staff working as Managers. 
                 SELECT * FROM STAFF WHERE ROLE="MANAGER";
                 
-- Question - 50] Display each payment’s ID, Method, Amount in one line. 
			    SELECT CONCAT(PAYMENTID,"  ",PAYMENTMETHOD,"  ",AMOUNT) AS PAYMENTINFO FROM PAYMENTS;
                
-- Question - 51] Show the first 4 payments only. 
                  SELECT * FROM PAYMENTS ORDER BY PAYMENTID;

-- Question - 52] The hotel manager wants to review rooms where PricePerNight is between ₹2000 and ₹4000 to offer discounts.
                  SELECT * FROM ROOMS 
                  WHERE PRICEPERNIGHT BETWEEN 2000 AND 4000;
                  
-- Question - 53] List all bookings ordered by CheckInDate. 
                 SELECT * FROM BOOKINGS ORDER BY CHECKINDATE;
                 
-- Question - 54] Display all unique CustomerIDs from bookings. 
				SELECT DISTINCT  CUSTOMERID FROM BOOKINGS;
                
-- Question - 55] The hotel manager wants to add new customer details. Insert 5 records with full details into the Customers table. 
                  INSERT INTO CUSTOMERS (CustomerID, FirstName, LastName, Email, Phone, Address, City, Zipcode, Country)
                  VALUES
					(101, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', 'jm road', 'sometown', 411001, 'India'),
					(102, 'Anita', 'Kale', 'anita.kale@gmail.com', '9123456780', '45 Park Street', 'anytown', 400001, 'India'),
					(103, 'Suresh', 'Patil', 'suresh.patil@gmail.com', '9988776655', '12 Main Road', 'anytown', 440001, 'India'),
					(104, 'Neha', 'Deshmukh', 'neha.deshmukh@gmail.com', '9871234567', '56 Lake Avenue', 'cityX', 422001, 'India'),
					(105, 'Rohan', 'Joshi', 'rohan.joshi@gmail.com', '9012345678', '78 Hill Street', 'newcity',432345,'india');

-- Question - 56] Show the last 2 staff hired. 
                  SELECT * FROM STAFF ORDER BY STAFFID DESC LIMIT 2;
                  
-- Question - 57] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. 
                  -- (Rooms subquery) 
                  SELECT * FROM ROOMS WHERE PRICEPERNIGHT >
                  (SELECT MAX(PRICEPERNIGHT) WHERE CAPACITY=2);
                  
-- Question - 58] The HR team wants to see staff whose Role is not 'Chef' for role reallocation.
                   SELECT * FROM STAFF WHERE ROLE != 'CHEF';
                   
-- Question - 59] Show all unique cities in descending order from the Customers table. 
				 SELECT DISTINCT CITY FROM CUSTOMERS ORDER BY  CITY DESC;
                 
-- Question - 60] Display the phone number of the Waiter only. 
                 SELECT STAFFID,PHONE FROM STAFF WHERE ROLE='WAITER';
                 
-- Question - 61] Display the last 2 bookings in the table. 
                   SELECT * FROM BOOKINGS ORDER BY BOOKINGID DESC LIMIT 2;
                   
-- Question - 62] The marketing team wants to see customers living in Delhi or Chennai for  targeted promotions. 
                  SELECT* FROM CUSTOMERS WHERE  CITY='DELHI' OR CITY='CHENNAI';
                  
-- Question - 63] Show all rooms where RoomType != 'Family' to plan renovations. 
                 SELECT * FROM ROOMS WHERE ROOMTYPE != 'FAMILY';
                 
-- Question - 64] List staff emails ordered by their roles. 
				 SELECT EMAIL FROM STAFF ORDER BY ROLE;
                 
-- Question - 65] Display all unique payment methods. 
				 SELECT DISTINCT PAYMENTMETHOD FROM PAYMENTS;
                 
-- Question - 66] The receptionist wants a list of customers whose Phone starts with '98' for mobile offers. 
                  SELECT * FROM CUSTOMERS WHERE PHONE LIKE '98%';
                  
-- Question - 67] Show the 3 cheapest rooms available for budget travelers.  
                  SELECT * FROM ROOMS ORDER BY PRICEPERNIGHT LIMIT 3;
               
-- Question - 68] Display the last 2 payments. 
                 SELECT * FROM PAYMENTS ORDER BY PAYMENTID DESC LIMIT 2;
                 
-- Question - 69] Management wants to know which unique cities customers come from. 
                  SELECT DISTINCT CITY FROM CUSTOMERS;
                  
-- Question - 70] List all bookings where TotalAmount > 5000. 
                 SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 5000;
                 
-- Question - 71] Display each staff’s Role with their Email in one column. 
                  SELECT CONCAT(ROLE," -->",EMAIL)AS STAFF_INFO FROM STAFF; 
                  
-- Question - 72] Show the first 4 staff full names. 
                  SELECT CONCAT(FIRSTNAME,"   ",LASTNAME)AS FULL_NAME FROM STAFF;
                  
-- Question - 73] Find bookings where TotalAmount is greater than all bookings made by CustomerID = 10. (Bookings subquery) 
                 SELECT * FROM BOOKINGS WHERE totalamount > (SELECT max(TOTALAMOUNT) FROM BOOKINGS where CUSTOMERID=10) AND CUSTOMERID=10; 
                 
                 
-- Question - 74] List rooms with capacity >= 3 for family bookings. 
                 SELECT * FROM ROOMS WHERE CAPACITY >=3 ;
                 
-- Question - 75] Display the RoomType and Price of only Suite rooms.
                 SELECT ROOMTYPE,PRICEPERNIGHT FROM ROOMS WHERE ROOMTYPE='SUITE';
                 
-- Question - 76] The cashier wants to see payments with Amount between ₹2000 and ₹7000 for mid-range billing checks. 
                 SELECT * FROM PAYMENTS WHERE AMOUNT BETWEEN 2000 AND 7000;
                 
-- Question - 77] Insert 5 booking records into the Bookings table with all details. 
                  INSERT INTO CUSTOMERS(CUSTOMERID,FIRSTNAME,LASTNAME,EMAIL,PHONE,CITY)
                  VALUES
				 (201, 'Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', 'Delhi'),
				(202, 'Priya', 'Verma', 'priya.verma@example.com', '9876543211', 'Chennai'),
				(203, 'Rahul', 'Kumar', 'rahul.kumar@example.com', '9876543212', 'Mumbai'),
				(204, 'Sneha', 'Patel', 'sneha.patel@example.com', '9876543213', 'Bangalore'),
				(205, 'Ankit', 'Singh', 'ankit.singh@example.com', '9876543214', 'Hyderabad');
                INSERT INTO ROOMS(ROOMID,ROOMTYPE,PRICEPERNIGHT,CAPACITY)
                  VALUES(86, 'Single', 2000.00, 1),
						(87, 'Double', 3500.00, 2),
						(88, 'Suite', 6000.00, 4),
						(89, 'Deluxe', 4500.00, 3),
						(90, 'Single', 2200.00, 1);
				 INSERT INTO STAFF(STAFFID,FIRSTNAME,LASTNAME ,ROLE,PHONE,EMAIL)
                  VALUES
                  (41, 'Ramesh', 'Kumar', 'Manager', '9876543210', 'ramesh.kumar@example.com'),
					(42, 'Sita', 'Patel', 'Receptionist', '9876543211', 'sita.patel@example.com'),
					(43, 'Amit', 'Sharma', 'Housekeeping', '9876543212', 'amit.sharma@example.com'),
					(44, 'Priya', 'Verma', 'Chef', '9876543213', 'priya.verma@example.com'),
					(45, 'Rahul', 'Singh', 'Security', '9876543214', 'rahul.singh@example.com');
				 INSERT INTO BOOKINGS(BOOKINGID,CUSTOMERID,ROOMID,STAFFID,CHECKINDATE,CHECKOUTDATE,TOTALAMOUNT)
                 VALUES
                    (2211, 201, 86, 41, '2025-10-05', '2025-10-07', 5000.00),
					(2202, 202, 87, 42, '2025-10-06', '2025-10-08', 6000.00),
					(2203, 203, 88, 43, '2025-10-07', '2025-10-09', 4500.00),
					(2204, 204, 89, 44, '2025-10-08', '2025-10-10', 7000.00),
					(2305, 205, 90, 45, '2025-10-09', '2025-10-11', 5500.00);
                    SELECT * FROM BOOKINGS;
                    
-- Question - 78] Display the 3 lowest payments made by customers. 
                SELECT * FROM PAYMENTS ORDER BY AMOUNT ;

-- Question - 80] Show all unique RoomIDs in descending order.
                 SELECT DISTINCT ROOMID FROM ROOMS ORDER BY ROOMID DESC;
 
-- Question - 79] Show each booking’s BookingID with TotalAmount using CONCAT. 
                  SELECT CONCAT(BOOKINGID,'    ',TOTALAMOUNT) AS BOOKINGS_DETAILS FROM BOOKINGS; 

-- Question - 81] Display each room’s RoomType and Price using CONCAT_WS. 
                   SELECT CONCAT_WS(" --> ",ROOMTYPE,PRICEPERNIGHT)AS ROOM_DETAILS FROM ROOMS;

-- Question - 82] The admin wants to delete all bookings handled by StaffID = 3.
                     SET SQL_SAFE_UPDATES = 0;
                     DELETE FROM STAFF WHERE STAFFID=3;
                 DELETE FROM BOOKINGS WHERE STAFFID = 3;

-- Question - 83] Show customers whose FirstName length > 5 characters for a name-pattern study.
                  SELECT * FROM CUSTOMERS WHERE LENGTH(FIRSTNAME) > 5;

-- Question - 84] Show all unique roles available in the hotel. 
                 SELECT DISTINCT ROLE FROM STAFF;

-- Question - 85] List all rooms where capacity is greater than 2. 
                SELECT * FROM ROOMS WHERE CAPACITY>2;

-- Question - 86] Display each payment’s ID with Amount using CONCAT. 
                 SELECT CONCAT(PAYMENTID,"     ",AMOUNT)AS PAYMENT_INFO FROM PAYMENTS;
                 
-- Question - 87] List all Card payments from the Payments table.
                SELECT * FROM PAYMENTS WHERE PAYMENTMETHOD="CARD";                    

-- Question - 88] Delete all customers whose Email ends with '@test.com' as invalid. 
                  DELETE FROM CUSTOMERS WHERE EMAIL LIKE "%@TEST.COM";
                  
-- Question - 89] The hotel manager wants to review bookings where CheckOutDate before '2023-12-31' to measure old occupancy. 
                  SELECT * FROM BOOKINGS WHERE CHECKOUTDATE  < '2023-12-31';
                  
-- Question - 90] The front office manager needs to list rooms with capacity = 2 for couples.
                 SELECT * FROM ROOMS WHERE CAPACITY = 2;
                 
-- Question - 91] Show all unique capacities in descending order. 
                  SELECT DISTINCT CAPACITY FROM ROOMS ORDER BY CAPACITY DESC;
                  
-- Question - 92] The operations team wants to find the minimum TotalAmount in bookings. 
                 SELECT  MIN(TOTALAMOUNT) FROM BOOKINGS;
                 
-- Question - 93] Display all rooms by capacity in ascending order. 
				SELECT * FROM ROOMS ORDER BY CAPACITY ;
                
-- Question - 94] Show each booking’s BookingID with TotalAmount using CONCAT.
                  SELECT CONCAT(BOOKINGID,"   ",TOTALAMOUNT)AS BOOKING FROM BOOKINGS;
                  
-- Question - 95] The operations head wants to see rooms with Capacity = 4 AND PricePerNight > ₹6000 for
             -- premium family packages. 
             SELECT * FROM ROOMS WHERE 
             CAPACITY=4 AND PRICEPERNIGHT>6000;
             
-- Question - 96] Show staff full names combined into one column. 
                 SELECT CONCAT(FIRSTNAME,"  ",LASTNAME)AS FULL_NMAE FROM STAFF;
                 
-- Question - 97] The accounts team wants to see bookings where the TotalAmount is greater than 
               -- ₹10,000 to track high-value customers. 
               SELECT * FROM BOOKINGS WHERE
               TOTALAMOUNT > 10000;
               
-- Question - 98] Show all unique payment methods in descending order. 
                  SELECT DISTINCT PAYMENTMETHOD FROM PAYMENTS ORDER BY PAYMENTMETHOD DESC;
                
--  Question - 99] List staff members who share the same Role. (Staff self join) 
				 SELECT * FROM STAFF;
                 SELECT S1.STAFFID,S1.FIRSTNAME,S1.LASTNAME,S1.ROLE,S.STAFFID,S.ROLE
                 FROM STAFF AS S
                 JOIN STAFF AS S1
                 ON S1.ROLE=S.ROLE;

-- Question - 100] Show customer first name, last name, and TotalAmount of their bookings using 
                   -- JOIN between Customers and Bookings. 
                   SELECT  C.FIRSTNAME ,C.LASTNAME,B.TOTALAMOUNT
                   FROM CUSTOMERS AS C
                   JOIN BOOKINGS AS B
                   ON C.CUSTOMERID=B.CUSTOMERID;

-- Question - 101] Display the first 4 bookings only. 
                 SELECT * FROM BOOKINGS  LIMIT 4;
                 
-- Question - 102] Show all unique staff first names. 
                   SELECT DISTINCT FIRSTNAME FROM STAFF;
                   
-- Question - 103] Insert 5 new room records with type, price, and capacity into the Rooms table. 
                 INSERT INTO ROOMS(ROOMID,ROOMTYPE,PRICEPERNIGHT,CAPACITY)
                 VALUES
				(81, 'Single', 1500, 1),
				(82, 'Double', 2500, 2),
				(83, 'Suite', 5000, 4),
				(84, 'Deluxe', 3500, 3),
				(85, 'Family', 6000, 6);
								 
-- Question - 104] Display each customer’s full name and city using CONCAT_WS. 
                   SELECT CONCAT_WS("   ",FIRSTNAME,CITY)AS CUSTOMER_INFO FROM CUSTOMERS;
                   
-- Question - 105] Show all unique cities in descending order from the Customers table                
                 SELECT DISTINCT CITY FROM CUSTOMERS ORDER BY CITY DESC;
                 
-- Question - 106] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
                   SELECT CITY, COUNT(CUSTOMERID)FROM CUSTOMERS
                   GROUP BY CITY
                   HAVING COUNT(CUSTOMERID) > 100;
                   
-- Question - 107] The HR team wants to see staff whose FirstName is 'Priya' for employee recognition.
                  SELECT * FROM STAFF WHERE FIRSTNAME='PRIYA';
                  
-- Question - 108] Display the last 2 staff members from the Staff table. 
                  SELECT * FROM STAFF ORDER BY STAFFID DESC LIMIT 2;

-- Question - 109] Create a VIEW BookingSummary showing BookingID, CustomerID, RoomID, and TotalAmount. 
                  

-- Question - 110] Show all unique RoomIDs in descending order. 
                 SELECT DISTINCT ROOMID FROM ROOMS ORDER BY ROOMID DESC;

-- Question - 111] Display each staff’s role with their full name. 
                 SELECT CONCAT (FIRSTNAME,"    ",LASTNAME )AS FULLNAME,ROLE FROM STAFF;

-- Question - 112] The receptionist wants to offer Suite rooms under ₹7000 to business travelers. 
					SELECT * FROM ROOMS WHERE ROOMTYPE ='SUITE' AND PRICEPERNIGHT=7000;

-- Question - 113] Display the first 3 staff alphabetically by their first names. 
                   SELECT * FROM STAFF ORDER BY FIRSTNAME LIMIT 3;
                   
-- Question - 114] List all bookings ordered by CheckInDate. 
                   SELECT * FROM BOOKINGS ORDER BY CHECKINDATE ;
                   
-- Question - 115] Show all unique StaffIDs from the bookings. 
				  SELECT DISTINCT STAFFID FROM BOOKINGS;
                  
-- Question - 116] Display the first 4 customers’ full names only.
                   SELECT CONCAT(FIRSTNAME,'  ',LASTNAME)AS FULLNAME FROM CUSTOMERS 
                   ORDER BY CUSTOMERID
                   LIMIT 4;
               
-- Question - 117] Show all unique room types offered by the hotel. 
                  SELECT DISTINCT ROOMTYPE FROM ROOMS;
                  
-- Question - 118] Display the phone number of the Waiter only. 
                   SELECT PHONE FROM STAFF WHERE ROLE='WAITER';
                   
-- Question - 119] Show all bookings where TotalAmount > 5000. 
                 SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 5000;

-- Question - 120] The HR team wants to update Role = 'Senior Manager' where StaffID = 12. 
                  UPDATE STAFF
                  SET ROLE='SENIOR MANAGER'
                  WHERE STAFFID=12;

-- Question - 121] List all staff working as Managers. 
               SELECT * FROM STAFF WHERE ROLE='MANAGER';

-- Question - 122] Show the last 2 registered customers for follow-up. 
                 SELECT * FROM CUSTOMERS ORDER BY CUSTOMERID DESC LIMIT 2;
                 
-- Question - 123] Display each booking’s BookingID with TotalAmount using CONCAT. 
                    SELECT CONCAT(BOOKINGID,"    ",TOTALAMOUNT)AS BOOKING FROM BOOKINGS;

-- Question - 124] Insert 5 staff members into the Staff table with their role, phone, and email. 
                    INSERT INTO STAFF( STAFFID,FIRSTNAME,LASTNAME,ROLE, PHONE, EMAIL)
					VALUES
					(46,'RAHUL','AHIRE','Manager', '9876543210', 'manager@hotel.com'),
					(47,'DIPALI ','KALE','Receptionist', '9123456780', 'reception@hotel.com'),
					(48,'ROHAN','BHORE','Chef', '9988776655', 'chef@hotel.com'),
					(49,'MADHU','NAIK','Housekeeping', '9876501234', 'housekeeping@hotel.com'),
					(50,'MEENA','DESAI','Waiter', '9765432109', 'waiter@hotel.com');
                    
-- Question - 125] Display the RoomType and Price of only Suite rooms. 
                   SELECT ROOMTYPE,PRICEPERNIGHT  FROM ROOMS WHERE ROOMTYPE='SUITE';
                   
-- Question - 126] The admin wants to delete all payments linked to BookingID = 15.      
                   DELETE FROM PAYMENTS WHERE BOOKINGID=15;
                   
-- Question - 127] Display all unique capacities in descending order. 
		        	SELECT DISTINCT CAPACITY FROM ROOMS ORDER BY CAPACITY DESC;

-- Question - 128] Show the first 4 rooms sorted alphabetically by RoomType. 
                   SELECT * FROM ROOMS ORDER BY ROOMTYPE LIMIT 4;
                   
-- Question - 129] The cashier wants a report of payments where Amount < ₹1500 for small transactions. 
				    SELECT * FROM PAYMENTS WHERE AMOUNT < 1500;
                    
-- Question - 130] Show each booking’s BookingID with TotalAmount using CONCAT. 
                   SELECT CONCAT(BOOKINGID,'   ',TOTALAMOUNT) FROM BOOKINGS;
                   
-- Question - 131] Display the last 2 added rooms from the Rooms table. 
				   SELECT * FROM ROOMS ORDER BY ROOMID DESC LIMIT 2;
                   
-- Question - 132] List all customers whose FirstName = 'Amit' AND City = 'Nagpur' for personal attention. 
                   SELECT * FROM CUSTOMERS WHERE FIRSTNAME='AMIT' AND CITY='NAGPUR';
                   
-- Question - 133] Insert 5 new customer details into the Customers table. 
                   INSERT INTO Customers (FirstName, LastName, Email, Phone, City)
					VALUES
					('Rahul', 'Patel', 'rahul.patel@example.com', '9876543210', 'Mumbai'),
					('Sneha', 'Sharma', 'sneha.sharma@example.com', '9823456789', 'Pune'),
					('Amit', 'Kumar', 'amit.kumar@example.com', '9898989898', 'Delhi'),
					('Priya', 'Joshi', 'priya.joshi@example.com', '9765432109', 'Bangalore'),
					('Rohan', 'Desai', 'rohan.desai@example.com', '9812345678', 'Ahmedabad');

-- Question - 134] Show staff full names combined into one column. 
                   SELECT CONCAT(FIRSTNAME,'   ',LASTNAME)AS FULLNAME FROM CUSTOMERS;
                   
-- Question - 135] Show all room details separated by commas using CONCAT_WS. 
                   SELECT CONCAT_WS("  ,  ",ROOMID,ROOMTYPE,PRICEPERNIGHT,CAPACITY)AS ROOM_DETAILS FROM ROOMS;
                   
-- Question - 136] Display each customer’s name and phone number together using CONCAT. 
                   SELECT CONCAT(FIRSTNAME,'  ,  ',LASTNAME)AS FULLNAME,PHONE FROM CUSTOMERS ;
                   
-- Question - 137] Display all payment details in one line using CONCAT_WS. 
                   SELECT CONCAT_WS("   ",PAYMENTID,BookingID,PAYMENTDATE,PaymentMethod,AMOUNT)AS PAYMENT_DETAILS FROM PAYMENTS;
                   
-- Question - 138] Show the last 2 bookings in the table. 
                  SELECT * FROM BOOKINGS  ORDER BY BOOKINGID DESC LIMIT 2;

-- Question - 139] List all payments ordered by PaymentDate. 
                   SELECT * FROM PAYMENTS ORDER BY PAYMENTDATE;

-- Question - 140] Show the 2 highest payments received .
                   SELECT *  FROM PAYMENTS ORDER BY AMOUNT DESC LIMIT 2;
				
-- Question - 141] The marketing team wants to check customers whose FirstName is 'Rahul' for a loyality checking.
                  SELECT * FROM CUSTOMERS ;-- HERE FIRSTNAME='RAHUL'; 

-- Question - 142] Display each PaymentID with its method using CONCAT. 
                    SELECT CONCAT(PAYMENTID,"     ",PAYMENTMETHOD)AS PAYMENT_INFO FROM PAYMENTS;

-- Question - 143] The operations team wants to list all PaymentMethods used more than 5 times. 
				   SELECT PAYMENTMETHOD,COUNT(PAYMENTMETHOD)FROM PAYMENTS
                   GROUP BY PAYMENTMETHOD
                   HAVING COUNT(PAYMENTMETHOD) > 5;

-- Question - 144] Show the 2 most expensive rooms for VIP guests.
                 SELECT * FROM ROOMS ORDER BY PRICEPERNIGHT DESC LIMIT 2;
 
-- Question - 145] Show each room’s RoomType and Price using CONCAT_WS. 
                   SELECT CONCAT_WS("   ",ROOMTYPE,PRICEPERNIGHT)AS ROOM_DETAILS FROM ROOMS;

-- Question - 146] Display the first 3 staff alphabetically by their first names.    
                    SELECT * FROM STAFF ORDER BY FIRSTNAME LIMIT 3;
                           
-- Question - 147] List all bookings handled by StaffID = 2. 
                  SELECT * FROM BOOKINGS WHERE STAFFID=2;

-- Question - 148] The analytics team wants to find the city where average CustomerID is greater than 50. 
				   SELECT CITY,COUNT(CUSTOMERID) FROM CUSTOMERS
                   GROUP BY CITY
                   HAVING COUNT(CUSTOMERID) > 50;
     
-- Question - 149] The hotel wants to display the 2 most expensive rooms for VIP guests. 
                  SELECT * FROM ROOMS  ORDER BY PRICEPERNIGHT DESC LIMIT 2;

-- Question - 150] Show all unique first names of customers for a duplicate check. 
                  SELECT DISTINCT FIRSTNAME FROM CUSTOMERS;
                  
-- Question - 151] Show all unique roles in descending order.
                   SELECT DISTINCT ROLE FROM STAFF ORDER BY ROLE DESC;
 
-- Question - 152] Identify rooms whose Capacity is greater than the average Capacity of all rooms. (Rooms subquery)
                  SELECT * FROM ROOMS WHERE CAPACITY >
                  (SELECT AVG(CAPACITY) FROM ROOMS); 

-- Question - 153] Display all rooms by capacity in ascending order. 
                   SELECT * FROM ROOMS ORDER BY CAPACITY ;

-- Question - 154] Display the first 4 payments only. 
				SELECT * FROM PAYMENTS LIMIT 4;
                
-- Question - 155] Show each payment’s ID, Method, Amount in one line. 
                   SELECT CONCAT_WS("   ",PAYMENTID,PAYMENTMETHOD,AMOUNT)AS PAYMENT_INFO FROM PAYMENTS; 
                   
-- Question - 156] List all bookings where TotalAmount > 5000. 
			      SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 5000;

-- Question - 157] Find all customers whose CustomerID is greater than the average CustomerID. (Customers subquery) 
                    SELECT * FROM CUSTOMERS WHERE CUSTOMERID > 
                    (SELECT AVG(CUSTOMERID)FROM CUSTOMERS);
                    
-- Question - 158] The HR manager wants to see staff whose Role is not 'Chef' for role reallocation. 
                  SELECT * FROM STAFF WHERE ROLE != 'CHEF';

-- Question - 159] The accounts team wants to check bookings where TotalAmount is greater than 10000.
                   SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 10000;

-- Question - 160] Display each staff’s role with their full name. 
                   SELECT CONCAT(FIRSTNAME,'  ',LASTNAME)AS FULLNAME,ROLE FROM STAFF;

--  Question - 161] List staff members who share the same Role. (Staff self join) 
                  SELECT * FROM STAFF;
                  SELECT S1.STAFFID,S1.FIRSTNAME,S1.LASTNAME,S1.ROLE,S2.STAFFID,S2.ROLE
				   FROM STAFF AS S1
                   JOIN STAFF AS S2
                   ON S1.ROLE=S2.ROLE AND S1.STAFFID < S2.STAFFID;
                   
 -- Question - 162] Show Customer Name and Payment Amount by joining Customers, Bookings, and Payments. 
					SELECT C.FIRSTNAME,C.LASTNAME,P.AMOUNT
                    FROM CUSTOMERS AS C
                    JOIN BOOKINGS AS B
                    ON C.CUSTOMERID=B.CUSTOMERID 
					JOIN PAYMENTS AS P
                    ON B.BOOKINGID=P.BOOKINGID;

-- Question - 163] Display all bookings where TotalAmount > 5000.      
				   SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 5000;

-- Question - 164] The front desk wants to see customers whose Phone starts with '98'.
                   SELECT * FROM CUSTOMERS WHERE PHONE LIKE '98%';
 
-- Question - 165] Identify customers who live in the same city. (Customers self join) 
				  SELECT C1.CUSTOMERID,C1.FIRSTNAME,C1.LASTNAME,C1.CITY,C2.CUSTOMERID,C2.FIRSTNAME,C2.LASTNAME,C2.CITY
                  FROM CUSTOMERS AS C1
                  JOIN CUSTOMERS AS C2
                  ON C1.CITY=C2.CITY AND C1.CUSTOMERID < C2.CUSTOMERID;

-- Question - 166] The operations manager wants to check bookings with CheckOutDate before '2023-12-31'. 
                  SELECT * FROM BOOKINGS WHERE CHECKOUTDATE < '2023-12-31';
                  
-- Question - 167] Display all unique StaffIDs from the bookings. 
                  SELECT DISTINCT STAFFID FROM BOOKINGS;
                  
-- Question - 168] Create a VIEW OnlinePayments showing all payments made by PaymentMethod = 'Online'. 
              
-- Question - 169] Display all unique payment methods in descending order. 
			       SELECT DISTINCT PAYMENTMETHOD FROM PAYMENTS ORDER BY PAYMENTMETHOD DESC;
                   
-- Question - 170] Display each payment’s ID with Amount using CONCAT. 
                   SELECT CONCAT(PAYMENTID,'   ',AMOUNT)FROM PAYMENTS;

-- Question - 171] Show all unique RoomIDs in descending order. 
                   SELECT DISTINCT ROOMID FROM ROOMS ORDER BY ROOMID DESC;
                   
-- Question - 172] The analytics team wants to list all cities where maximum CustomerID is more than 100. 
                  SELECT CITY,COUNT(CUSTOMERID) FROM CUSTOMERS
                  GROUP BY CITY
                  HAVING COUNT(CUSTOMERID) > 100;
                  
-- Question - 173] List staff emails ordered by their roles. 
                  SELECT EMAIL FROM STAFF ORDER BY ROLE ;
                  
-- Question - 174] Find bookings where TotalAmount exceeds the average TotalAmount. 
                   SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 
                   (SELECT AVG(TOTALAMOUNT) FROM BOOKINGS);
                   
-- Question - 175] Show all rooms where PricePerNight > ₹5000 for premium customer 
					SELECT * FROM ROOMS WHERE PRICEPERNIGHT > 5000;
                    
-- Question - 176] Show all unique capacities in descending order. 
                   SELECT DISTINCT CAPACITY FROM ROOMS ORDER BY CAPACITY DESC;
                   
-- Question - 177] Display the first 4 rooms sorted alphabetically by RoomType. 
                   SELECT * FROM ROOMS ORDER BY ROOMTYPE LIMIT 4;
                   
-- Question - 178] Show all unique staff first names. 
                    SELECT DISTINCT FIRSTNAME FROM STAFF;
                    
-- Question - 179] Identify rooms with PricePerNight higher than the maximum PricePerNight of rooms with Capacity = 2. (Rooms subquery) 
                   SELECT * FROM ROOMS WHERE PRICEPERNIGHT > (SELECT MAX(PRICEPERNIGHT) FROM ROOMS WHERE CAPACITY=2) ; 

-- Question - 180] Show all unique cities in descending order from the Customers table.      
                   SELECT DISTINCT CITY FROM CUSTOMERS ORDER BY CITY DESC;
                       
-- Question - 181] List all bookings where TotalAmount > 5000. 
                   SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 5000;

-- Question - 182] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'. 
                 SELECT PAYMENTID,BOOKINGID FROM PAYMENTS WHERE PAYMENTMETHOD=' CARD';

-- Question - 183] Display each booking’s BookingID with TotalAmount using CONCAT.
					SELECT CONCAT(BOOKINGID,'   ',TOTALAMOUNT)AS BOOKINGS FROM BOOKINGS;
 
-- Question - 184] Show all bookings handled by StaffID = 2. 
                  SELECT * FROM BOOKINGS WHERE STAFFID=2;

-- Question - 185] Display the last 2 added rooms from the Rooms table. 
                   SELECT * FROM ROOMS ORDER BY ROOMID DESC LIMIT 2;

-- Question - 186] List all rooms where capacity is greater than 2. 
                   SELECT * FROM ROOMS WHERE CAPACITY > 2;

-- Question - 187] Display the last 2 staff members from the Staff table. 
				SELECT * FROM STAFF ORDER BY STAFFID DESC LIMIT 2;

-- Question - 188] Show all unique roles available in the hotel. 
                  SELECT DISTINCT ROLE FROM STAFF;

-- Question - 189] Display the last 2 payments. 
                  SELECT * FROM PAYMENTS ORDER BY PAYMENTID DESC LIMIT 2;

-- Question - 190] The manager wants to see bookings where CustomerID IN (2,4,6,8) to track repeat guests. 
                   SELECT * FROM BOOKINGS WHERE CUSTOMERID IN (2,4,6,8);

-- Question - 191] Show all unique first names of customers for a duplicate check.
                   SELECT DISTINCT FIRSTNAME FROM CUSTOMERS;
 
-- Question - 192] Display all bookings where TotalAmount > 5000. 
                    SELECT * FROM BOOKINGS WHERE TOTALAMOUNT > 5000;

-- Question - 193] The admin wants to delete all payments where Amount < 1000. 
                  SET SQL_SAFE_UPDATES = 0;
				  DELETE FROM PAYMENTS WHERE AMOUNT < 1000;

-- Question - 194] Display all unique RoomIDs in descending order. 
                   SELECT DISTINCT  ROOMID FROM ROOMS ORDER BY ROOMID DESC;

-- Question - 195] List customers who made more than 5 bookings. 
                    SELECT CUSTOMERID,COUNT(BOOKINGID)
                    FROM BOOKINGS
                    GROUP BY CUSTOMERID
                    HAVING COUNT(BOOKINGID)> 5;

-- Question - 196] Display all rooms by capacity in ascending order. 
                   SELECT * FROM ROOMS ORDER BY CAPACITY;

-- Question - 197] Show each booking’s BookingID with TotalAmount using CONCAT. 
                    SELECT CONCAT(BOOKINGID,'    ',TOTALAMOUNT)AS BOOKINGS FROM BOOKINGS;

-- Question - 198] List all staff working as Managers. 
                SELECT * FROM STAFF WHERE ROLE='MANAGER';

-- Question - 199] Show customers whose FirstName length > 5 characters for a name-pattern study.
                SELECT CUSTOMERID,FIRSTNAME FROM CUSTOMERS WHERE LENGTH(FIRSTNAME) > 5;
 
-- Question - 200] Display all unique capacities in descending order. 
                  SELECT DISTINCT CAPACITY FROM ROOMS ORDER BY CAPACITY DESC;       
                  
-- Question - 201] List staff members who share the same Role. (Staff self join) 
                   SELECT S.STAFFID,S.FIRSTNAME,S.LASTNAME,S.ROLE,S1.STAFFID,S1.FIRSTNAME,S1.LASTNAME
                   FROM STAFF AS S
                   JOIN STAFF AS S1
                   ON S.ROLE=S1.ROLE AND S.STAFFID < S1.STAFFID;
				
-- Question - 202] Show PaymentID, Customer Name, and BookingID for payments made using 'Credit Card'. 
                  SELECT PAYMENTID,BOOKINGID FROM PAYMENTS
                  WHERE PAYMENTMETHOD='CREDIT CARD';
                  
-- Question - 203] Display the first 4 payments only. 
                   SELECT * FROM PAYMENTS LIMIT 4;
                   
-- Question - 204] Show each payment’s ID, Method, Amount in one line. 
				  SELECT CONCAT_WS("  ,   ",PAYMENTID,PAYMENTMETHOD,AMOUNT)AS PAYMENT_DETAILS FROM PAYMENTS;
                
-- Question - 205] Create a VIEW HighValueBookings showing all bookings with TotalAmount > 20,000. 
					
-- Question - 206] Create a trigger to automatically delete a payment when its corresponding booking is deleted.
					DELIMETERS//
                    CREATE TRIGGER DEL_PAYMENT_AFTER_BOOKING
                    AFTER DELETE ON BOOKING
                    FOR EACH ROW
                    BEGIN
                             DELETE FROM PAYMENTS
                             WHERE BOOKINGID=OLD.BOOKINGID
                    END//         
                    
-- Question - 207] Create a trigger to prevent insertion of a booking where CheckOutDate < CheckInDate. 
                    DELIMETERS//
                   CREATE TRIGGER PREVENT_INVALID_BOOKING
                   BEFORE INSERT ON BOOKINGS
                   FOR EACH ROW
                   BEGIN
                            IF CHECKOUTDATE < CHECKINDATE 
                            ELSE ERROR
                   END//         

-- Question - 208] Create a trigger to automatically update TotalAmount in Bookings when a payment is inserted in Payments. 
                   
