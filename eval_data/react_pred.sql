FAILED	conference
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5;	bakery_1
SELECT DISTINCT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID JOIN Sculptures S ON A.artistID = S.sculptorID;	art_1
SELECT d.distance FROM Direct_distance d JOIN City c1 ON d.city1_code = c1.city_code JOIN City c2 ON d.city2_code = c2.city_code WHERE c1.city_name = 'Boston' AND c2.city_name = 'Newark';	address_1
SELECT COUNT(*) FROM building;	region_building
SELECT Planet.Name FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.PlanetID HAVING SUM(Package.Weight) > 30;	planet_1
SELECT customer.Name, SUM(customer_order.Quantity) AS Total_Quantity FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID HAVING Total_Quantity > 1;	restaurant_bills
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2;	customers_and_orders
SELECT MAX(Enrollment) AS Max_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM institution;	institution_sports
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
SELECT AVG(Card_Credit) AS Average_Card_Credit FROM customer WHERE Level_of_Membership > 1;	restaurant_bills
SELECT address_id, address_details FROM Addresses;	customers_and_orders
SELECT DISTINCT g1.Flavor FROM goods AS g1 WHERE g1.Food = 'Cake' AND g1.Flavor NOT IN (SELECT g2.Flavor FROM goods AS g2 WHERE g2.Food = 'Tart');	bakery_1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1;	book_1
SELECT fname, COUNT(paintingID) AS num_paintings FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.artistID HAVING COUNT(paintingID) >= 2;	art_1
