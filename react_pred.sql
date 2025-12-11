SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID JOIN conference_participation cp2 ON s.staff_ID = cp2.staff_ID AND cp1.Conference_ID = cp2.Conference_ID WHERE cp1.role = 'speaker' AND cp2.role = 'sponsor';	conference
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5;	bakery_1
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID;	art_1
SELECT d.distance FROM Direct_distance AS d JOIN City AS c1 ON d.city1_code = c1.city_code JOIN City AS c2 ON d.city2_code = c2.city_code WHERE c1.city_name = 'Boston' AND c2.city_name = 'Newark';	address_1
SELECT COUNT(*) FROM building;	region_building
SELECT p.Name FROM Planet p JOIN Shipment s ON p.PlanetID = s.Planet JOIN Package pk ON s.ShipmentID = pk.Shipment GROUP BY p.Name HAVING SUM(pk.Weight) > 30;	planet_1
SELECT c.Customer_ID, c.Name, SUM(co.Quantity) AS Total_Quantity FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID, c.Name HAVING SUM(co.Quantity) > 1;	restaurant_bills
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2;	customers_and_orders
SELECT MAX(Enrollment) AS Max_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM institution;	institution_sports
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1;	restaurant_bills
SELECT address_id, address_details FROM Addresses;	customers_and_orders
SELECT DISTINCT g1.Flavor FROM goods AS g1 WHERE g1.Food = 'cake' AND g1.Flavor NOT IN (SELECT g2.Flavor FROM goods AS g2 WHERE g2.Food = 'tart');	bakery_1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN WHERE Books_Order.amount = (SELECT MAX(amount) FROM Books_Order);	book_1
SELECT fname, COUNT(paintingID) AS num_paintings FROM Artists JOIN Paintings ON artistID = painterID GROUP BY artistID HAVING num_paintings >= 2;	art_1
SELECT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING COUNT(Boxes.Code) > Warehouses.Capacity;	warehouse_1
SELECT Student.StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'F' AND City.state = 'PA';	address_1
SELECT p.Name FROM press p ORDER BY p.Month_Profits_billion DESC LIMIT 1;	book_press
SELECT Planet.Name, COUNT(Shipment.ShipmentID) AS TotalShipments FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.PlanetID, Planet.Name;	planet_1
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender;	book_press
SELECT Students.bio_data, Student_Events.event_date FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id;	cre_Students_Information_Systems
FAILED	club_leader
SELECT a.fname, COUNT(p.paintingID) AS painting_count FROM Artists a JOIN Paintings p ON a.artistID = p.painterID GROUP BY a.artistID HAVING COUNT(p.paintingID) >= 2;	art_1
SELECT S1.name FROM Sailors S1 WHERE S1.rating > (SELECT MAX(S2.rating) FROM Sailors S2 WHERE S2.name = 'Luis');	boat_1
SELECT DISTINCT s.Name FROM spokesman s JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.Start_year < 2004;	district_spokesman
SELECT SUM(Package.Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Orders.order_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2;	e_commerce
SELECT SUM(P.Weight) AS TotalWeight FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet PL ON S.Planet = PL.PlanetID WHERE PL.Name = 'Mars';	planet_1
SELECT customer_id, customer_name FROM Customers;	customers_and_orders
FAILED	pilot_1
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices LEFT JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number;	e_commerce
SELECT u.University_Name FROM university u WHERE u.University_ID NOT IN (SELECT mr.University_ID FROM major_ranking mr WHERE mr.Rank = 1);	university_rank
SELECT Id, Flavor FROM goods WHERE Food = 'cake' ORDER BY Flavor;	bakery_1
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);	customers_and_orders
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI' OR city1_code = 'CHI' AND city2_code = 'BAL';	address_1
SELECT client_id, COUNT(*) AS meeting_count FROM Meetings GROUP BY client_id;	advertising_agencies
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce';	soccer_3
SELECT RAC.age_category_description FROM User_Searches US JOIN Users U ON US.user_id = U.user_id JOIN Ref_Age_Categories RAC ON U.age_category_code = RAC.age_category_code ORDER BY US.search_datetime ASC LIMIT 1;	real_estate_rentals
SELECT teacher_id, COUNT(class_id) AS course_count FROM Classes GROUP BY teacher_id ORDER BY course_count DESC LIMIT 1;	cre_Students_Information_Systems
SELECT p1.paintingID FROM Paintings p1 WHERE p1.year < (SELECT MIN(p2.year) FROM Paintings p2 WHERE p2.location = '240')	art_1
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order);	book_1
SELECT receipts.ReceiptNumber FROM receipts JOIN customers ON receipts.CustomerId = customers.Id JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE customers.LastName = 'Logan' AND goods.Food = 'croissant';	bakery_1
SELECT region.Name FROM region LEFT JOIN building ON region.Region_ID = building.Region_ID WHERE building.Region_ID IS NULL;	region_building
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1;	online_exams
SELECT DISTINCT player.Country FROM player WHERE player.Earnings > 1200000;	soccer_3
SELECT COUNT(client_id) FROM Clients;	advertising_agencies
SELECT Recipient, COUNT(*) AS PackageCount FROM Package GROUP BY Recipient ORDER BY PackageCount ASC LIMIT 1;	planet_1
SELECT d.Make FROM driver d JOIN team_driver td ON d.Driver_ID = td.Driver_ID GROUP BY d.Make HAVING COUNT(d.Driver_ID) >= 3;	car_racing
SELECT e.Name, COUNT(s.ShipmentID) AS ShipmentCount FROM Employee e JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.Name;	planet_1
SELECT fname FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID GROUP BY sculptorID ORDER BY COUNT(sculptureID) DESC LIMIT 1;	art_1
SELECT c.Country FROM country c LEFT JOIN driver d ON c.Country = d.Country WHERE d.Driver_ID IS NULL;	car_racing
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID;	restaurant_bills
SELECT DISTINCT Paper.venue, Paper.year FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University';	aan_1
SELECT Manufacturer, COUNT(DISTINCT club.Club_ID) AS Club_Count FROM club GROUP BY Manufacturer;	soccer_3
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods);	bakery_1
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30;	planet_1
SELECT Book_Series, COUNT(Book_ID) AS Number_of_Books FROM book GROUP BY Book_Series;	book_press
SELECT DISTINCT Warehouses.Location FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents IN ('Rocks', 'Scissors');	warehouse_1
SELECT l.name, COUNT(*) AS count FROM official_languages ol JOIN languages l ON ol.language_id = l.id GROUP BY l.name ORDER BY count DESC LIMIT 3;	country_language
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY COUNT(Movie) DESC LIMIT 1;	movie_2
SELECT DISTINCT p1.location FROM Paintings AS p1 JOIN Paintings AS p2 ON p1.location = p2.location WHERE p1.year < 1885 AND p2.year > 1930;	art_1
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3;	video_game
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC;	pilot_1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;	government_shift
SELECT COUNT(DISTINCT Movies.Code) FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;	movie_2
SELECT a.agency_id, a.agency_details FROM Agencies a JOIN Staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id ORDER BY COUNT(s.staff_id) DESC LIMIT 1;	advertising_agencies
SELECT COUNT(*) FROM Staff;	advertising_agencies
SELECT player.Earnings FROM player WHERE player.Country IN ('Australia', 'Zimbabwe');	soccer_3
FAILED	cre_Students_Information_Systems
SELECT FirstName || ' ' || LastName AS FullName FROM customers JOIN receipts ON customers.Id = receipts.CustomerId WHERE Date = (SELECT MIN(Date) FROM receipts);	bakery_1
SELECT name, rating, age FROM Sailors ORDER BY rating, age;	boat_1
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1;	book_press
SELECT Name FROM member ORDER BY Age ASC;	club_leader
SELECT B.Title FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN GROUP BY B.Title ORDER BY SUM(BO.amount) DESC LIMIT 1;	book_1
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes);	cre_Doc_Workflow
SELECT c.Collection_ID, c.Collection_Name, COUNT(d.Document_Object_ID) AS Document_Count FROM Collections c JOIN Documents_in_Collections d ON c.Collection_ID = d.Collection_ID GROUP BY c.Collection_ID, c.Collection_Name ORDER BY Document_Count DESC LIMIT 1;	cre_Doc_and_collections
SELECT DISTINCT Address FROM building;	region_building
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items;	e_commerce
SELECT t.teacher_id, t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id, t.teacher_details ORDER BY COUNT(c.class_id) DESC LIMIT 1;	cre_Students_Information_Systems
SELECT receipts.Date, SUM(goods.Price) AS TotalSales FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY receipts.Date HAVING TotalSales > 100;	bakery_1
SELECT Neighborhood, COUNT(DISTINCT Store_ID) AS Store_Count FROM store GROUP BY Neighborhood;	headphone_store
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice';	book_1
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1;	institution_sports
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills);	pilot_1
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order);	restaurant_bills
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaximumCapacity FROM Warehouses GROUP BY Location;	warehouse_1
SELECT Planet.Name, SUM(Package.Weight) AS TotalWeight FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.PlanetID, Planet.Name;	planet_1
SELECT COUNT(address_id) FROM Addresses;	customers_and_orders
SELECT state, COUNT(DISTINCT city_code) AS city_count FROM City GROUP BY state;	address_1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1;	e_commerce
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender;	book_press
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id JOIN Students s ON c.student_id = s.student_id JOIN Transcripts tr ON s.student_id = tr.student_id WHERE tr.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts);	cre_Students_Information_Systems
FAILED	art_1
SELECT teacher_id, COUNT(class_id) AS course_count FROM Classes GROUP BY teacher_id ORDER BY course_count DESC LIMIT 1;	cre_Students_Information_Systems
SELECT c.city_code, SUM(d.distance) AS total_distance FROM City c JOIN Direct_distance d ON c.city_code = d.city1_code OR c.city_code = d.city2_code GROUP BY c.city_code;	address_1
SELECT DISTINCT a.name FROM Author a WHERE a.author_id NOT IN (SELECT al.author_id FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue = 'ACL')	aan_1
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle);	vehicle_driver
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book);	book_1
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000';	cre_Doc_and_collections
SELECT COUNT(DISTINCT Contents) FROM Boxes;	warehouse_1
