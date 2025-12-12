SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID JOIN conference_participation cp2 ON s.staff_ID = cp2.staff_ID AND cp1.Conference_ID = cp2.Conference_ID WHERE cp1.role = 'speaker' AND cp2.role = 'sponsor';	conference
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5;	bakery_1
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID;	art_1
SELECT d.distance FROM Direct_distance d JOIN City c1 ON d.city1_code = c1.city_code JOIN City c2 ON d.city2_code = c2.city_code WHERE c1.city_name = 'Boston' AND c2.city_name = 'Newark';	address_1
SELECT COUNT(*) FROM building;	region_building
SELECT P.Name FROM Planet AS P JOIN Shipment AS S ON P.PlanetID = S.Planet JOIN Package AS PK ON S.ShipmentID = PK.Shipment GROUP BY P.PlanetID HAVING SUM(PK.Weight) > 30	planet_1
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID HAVING SUM(T2.Quantity) > 1	restaurant_bills
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2;	customers_and_orders
SELECT MAX(Enrollment) AS Max_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM institution;	institution_sports
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1;	restaurant_bills
SELECT address_id, address_details FROM Addresses;	customers_and_orders
SELECT Flavor FROM goods WHERE Food = 'cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'tart')	bakery_1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1	book_1
SELECT fname, COUNT(paintingID) FROM Artists JOIN Paintings ON artistID = painterID GROUP BY artistID HAVING COUNT(paintingID) >= 2;	art_1
