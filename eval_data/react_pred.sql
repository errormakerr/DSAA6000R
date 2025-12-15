SELECT count(*) FROM club	soccer_3
SELECT COUNT(*) FROM club;	soccer_3
SELECT Name FROM club ORDER BY Name ASC;	soccer_3
SELECT Name FROM club ORDER BY Name;	soccer_3
SELECT Name, Manager, Captain FROM club;	soccer_3
SELECT Manager, Captain FROM club;	soccer_3
SELECT Name FROM club WHERE Manufacturer != 'Nike';	soccer_3
SELECT Name FROM club WHERE Manufacturer != 'Nike';	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC	soccer_3
SELECT Name FROM player ORDER BY Wins_count ASC;	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1;	soccer_3
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000;	soccer_3
SELECT Country FROM player WHERE Earnings > 1200000;	soccer_3
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1	soccer_3
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID;	soccer_3
SELECT T2.Name, T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID	soccer_3
SELECT DISTINCT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2	soccer_3
SELECT DISTINCT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2;	soccer_3
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce';	soccer_3
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce';	soccer_3
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY AVG(p.Earnings) DESC;	soccer_3
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC;	soccer_3
SELECT Manufacturer, count(*) FROM club GROUP BY Manufacturer;	soccer_3
SELECT Manufacturer, count(*) FROM club GROUP BY Manufacturer	soccer_3
SELECT Manufacturer, COUNT(*) AS Count FROM club GROUP BY Manufacturer ORDER BY Count DESC LIMIT 1;	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1;	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(DISTINCT Club_ID) > 1	soccer_3
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(DISTINCT Club_ID) > 1;	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1;	soccer_3
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1;	soccer_3
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player);	soccer_3
SELECT c.Name FROM club c LEFT JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Player_ID IS NULL;	soccer_3
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000;	soccer_3
SELECT DISTINCT p1.Country FROM player p1 WHERE p1.Earnings > 1400000 INTERSECT SELECT DISTINCT p2.Country FROM player p2 WHERE p2.Earnings < 1100000;	soccer_3
SELECT COUNT(DISTINCT Country) FROM player;	soccer_3
SELECT COUNT(DISTINCT Country) FROM player;	soccer_3
SELECT player.Earnings FROM player WHERE player.Country = 'Australia' OR player.Country = 'Zimbabwe';	soccer_3
SELECT player.Earnings FROM player WHERE player.Country IN ('Australia', 'Zimbabwe');	soccer_3
FAILED	e_commerce
FAILED	e_commerce
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.product_id) AS product_count FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code;	e_commerce
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.product_id) AS product_count FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code;	e_commerce
SELECT o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id HAVING o.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR COUNT(oi.order_item_id) > 1;	e_commerce
SELECT MIN(date_order_placed) AS earliest_order_date FROM Orders; SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1);	e_commerce
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders);	e_commerce
SELECT customer_first_name, customer_last_name, customer_middle_initial FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders);	e_commerce
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_item_id) < 2;	e_commerce
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products P LEFT JOIN Order_Items OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(DISTINCT OI.order_id) < 2;	e_commerce
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.product_id) >= 2;	e_commerce
SELECT o.order_id, o.date_order_placed FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id HAVING COUNT(DISTINCT oi.product_id) >= 2;	e_commerce
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(oi.order_item_id) DESC LIMIT 1;	e_commerce
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(oi.order_item_id) DESC;	e_commerce
SELECT Orders.order_id, SUM(Products.product_price) AS total_price FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY total_price ASC LIMIT 1;	e_commerce
SELECT T1.order_id, SUM(T3.product_price) AS total_cost FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id ORDER BY total_cost ASC LIMIT 1;	e_commerce
SELECT payment_method_code, COUNT(*) AS method_count FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY method_count DESC LIMIT 1;	e_commerce
SELECT payment_method_code, COUNT(payment_method_code) AS frequency FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY frequency DESC LIMIT 1;	e_commerce
SELECT C.gender_code, COUNT(OI.product_id) FROM Customers AS C JOIN Orders AS O ON C.customer_id = O.customer_id JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY C.gender_code;	e_commerce
SELECT T2.gender_code, COUNT(*) FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T1.order_id = T3.order_id GROUP BY T2.gender_code	e_commerce
SELECT c.gender_code, COUNT(o.order_id) AS order_count FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.gender_code;	e_commerce
SELECT c.gender_code, COUNT(o.order_id) AS order_count FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.gender_code;	e_commerce
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id;	e_commerce
SELECT Customers.customer_first_name, Customers.customer_middle_initial, Customers.customer_last_name, Customer_Payment_Methods.payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id;	e_commerce
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number;	e_commerce
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 LEFT JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number	e_commerce
SELECT P.product_name, S.shipment_date FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Shipment_Items AS SI ON OI.order_item_id = SI.order_item_id JOIN Shipments AS S ON SI.shipment_id = S.shipment_id	e_commerce
SELECT Products.product_name, Shipments.shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id;	e_commerce
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id;	e_commerce
SELECT Order_Items.order_item_status_code, Shipments.shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id;	e_commerce
SELECT Products.product_name, Products.product_color FROM Shipment_Items JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id JOIN Products ON Order_Items.product_id = Products.product_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id WHERE Shipments.shipment_date IS NOT NULL;	e_commerce
SELECT P.product_name, P.product_color FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Shipment_Items AS SI ON OI.order_item_id = SI.order_item_id JOIN Shipments AS S ON SI.shipment_id = S.shipment_id;	e_commerce
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'F';	e_commerce
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'F';	e_commerce
SELECT DISTINCT Invoices.invoice_status_code FROM Orders JOIN Invoices ON Orders.order_id = Invoices.invoice_number LEFT JOIN Shipments ON Orders.order_id = Shipments.order_id WHERE Shipments.order_id IS NULL;	e_commerce
SELECT DISTINCT i.invoice_status_code FROM Orders o LEFT JOIN Shipments s ON o.order_id = s.order_id JOIN Invoices i ON o.order_id = i.invoice_number WHERE s.shipment_id IS NULL;	e_commerce
FAILED	e_commerce
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price) AS total_amount_paid FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed;	e_commerce
SELECT COUNT(DISTINCT customer_id) FROM Orders;	e_commerce
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id;	e_commerce
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items	e_commerce
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items;	e_commerce
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods;	e_commerce
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods;	e_commerce
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'	e_commerce
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%';	e_commerce
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'	e_commerce
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'	e_commerce
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);	e_commerce
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)	e_commerce
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items);	e_commerce
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items);	e_commerce
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods);	e_commerce
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c LEFT JOIN Customer_Payment_Methods pm ON c.customer_id = pm.customer_id WHERE pm.payment_method_code IS NULL;	e_commerce
SELECT order_status_code, date_order_placed FROM Orders;	e_commerce
SELECT order_status_code, date_order_placed FROM Orders;	e_commerce
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA';	e_commerce
FAILED	e_commerce
SELECT c.customer_first_name, p.product_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id;	e_commerce
SELECT Customers.customer_first_name, Products.product_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id;	e_commerce
SELECT COUNT(*) FROM Shipment_Items;	e_commerce
SELECT COUNT(DISTINCT Order_Items.product_id) FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id;	e_commerce
SELECT AVG(product_price) FROM Products;	e_commerce
SELECT AVG(product_price) AS average_price FROM Products;	e_commerce
SELECT AVG(p.product_price) FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id;	e_commerce
SELECT AVG(product_price) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id;	e_commerce
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1);	e_commerce
FAILED	e_commerce
SELECT Orders.date_order_placed FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id GROUP BY Orders.order_id HAVING COUNT(DISTINCT Customer_Payment_Methods.payment_method_code) >= 2;	e_commerce
SELECT DISTINCT O.date_order_placed FROM Orders AS O JOIN Customer_Payment_Methods AS CPM ON O.customer_id = CPM.customer_id GROUP BY O.customer_id, O.date_order_placed HAVING COUNT(DISTINCT CPM.payment_method_code) >= 2;	e_commerce
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC LIMIT 1;	e_commerce
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1	e_commerce
SELECT p.product_id, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_description HAVING COUNT(oi.order_item_id) > 3;	e_commerce
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_item_id) > 3	e_commerce
SELECT i.invoice_number, i.invoice_date FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number, i.invoice_date HAVING COUNT(s.shipment_id) >= 2;	e_commerce
SELECT T1.invoice_date, T1.invoice_number FROM Invoices AS T1 WHERE T1.invoice_number IN (SELECT T2.invoice_number FROM Shipments AS T2 GROUP BY T2.invoice_number HAVING COUNT(T2.shipment_id) >= 2);	e_commerce
SELECT shipment_tracking_number, shipment_date FROM Shipments;	e_commerce
SELECT shipment_tracking_number, shipment_date FROM Shipments;	e_commerce
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products);	e_commerce
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products);	e_commerce
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director);	bbc_channels
SELECT Name FROM director ORDER BY Age DESC LIMIT 1	bbc_channels
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'	bbc_channels
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel;	bbc_channels
SELECT Title FROM program ORDER BY Start_Year DESC;	bbc_channels
SELECT director.Name, COUNT(program.Program_ID) AS Program_Count FROM director JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID ORDER BY Program_Count DESC LIMIT 1;	bbc_channels
SELECT d.Name, d.Age FROM director d JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID ORDER BY COUNT(p.Program_ID) DESC LIMIT 1;	bbc_channels
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1;	bbc_channels
SELECT c.Name, c.Internet FROM channel c JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID HAVING COUNT(p.Program_ID) > 1;	bbc_channels
SELECT channel.Name, COUNT(program.Program_ID) AS Program_Count FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Name;	bbc_channels
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT DISTINCT Channel_ID FROM program);	bbc_channels
SELECT director.Name FROM program JOIN director ON program.Director_ID = director.Director_ID WHERE program.Title = 'Dracula';	bbc_channels
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN director_admin AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID ORDER BY COUNT(T2.Director_ID) DESC LIMIT 1	bbc_channels
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60;	bbc_channels
SELECT DISTINCT c.Name FROM channel c JOIN director_admin da1 ON c.Channel_ID = da1.Channel_ID JOIN director d1 ON da1.Director_ID = d1.Director_ID JOIN director_admin da2 ON c.Channel_ID = da2.Channel_ID JOIN director d2 ON da2.Director_ID = d2.Director_ID WHERE d1.Age < 40 AND d2.Age > 60;	bbc_channels
SELECT Channel_ID, Name FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM director_admin WHERE Director_ID IN (SELECT Director_ID FROM director WHERE Name = 'Hank Baskett'))	bbc_channels
SELECT count(*) FROM radio	tv_shows
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC;	tv_shows
SELECT tv_show.tv_show_name, tv_show.Original_Airdate FROM tv_show;	tv_shows
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC';	tv_shows
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30	tv_shows
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1	tv_shows
SELECT AVG(ERP_kW) FROM radio;	tv_shows
SELECT Affiliation, COUNT(ID) AS channel_count FROM city_channel GROUP BY Affiliation;	tv_shows
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1	tv_shows
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(ID) > 3	tv_shows
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC	tv_shows
SELECT radio.Transmitter, city_channel.City FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID	tv_shows
SELECT radio.Transmitter, city_channel.Station_name FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID ORDER BY radio.ERP_kW DESC;	tv_shows
SELECT radio.Transmitter, COUNT(city_channel_radio.City_channel_ID) AS Number_of_City_Channels FROM radio LEFT JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID GROUP BY radio.Transmitter;	tv_shows
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio);	tv_shows
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1;	vehicle_driver
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1;	vehicle_driver
SELECT Name FROM driver WHERE Citizenship = 'United States';	vehicle_driver
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States';	vehicle_driver
SELECT Driver_ID, COUNT(Vehicle_ID) AS Vehicle_Count FROM vehicle_driver GROUP BY Driver_ID ORDER BY Vehicle_Count DESC LIMIT 1;	vehicle_driver
SELECT Driver_ID, COUNT(Vehicle_ID) AS Vehicle_Count FROM vehicle_driver GROUP BY Driver_ID ORDER BY Vehicle_Count DESC LIMIT 1	vehicle_driver
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou';	vehicle_driver
SELECT MAX(v.Power) AS Max_Power, AVG(v.Power) AS Avg_Power FROM vehicle v WHERE v.Builder = 'Zhuzhou';	vehicle_driver
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1	vehicle_driver
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1;	vehicle_driver
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996;	vehicle_driver
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996;	vehicle_driver
SELECT Build_Year, Model, Builder FROM vehicle;	vehicle_driver
SELECT Build_Year, Model, Builder FROM vehicle;	vehicle_driver
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = 2012;	vehicle_driver
SELECT COUNT(DISTINCT T2.Driver_ID) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Build_Year = 2012	vehicle_driver
FAILED	vehicle_driver
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR';	vehicle_driver
SELECT AVG(Top_Speed) FROM vehicle;	vehicle_driver
SELECT AVG(Top_Speed) FROM vehicle;	vehicle_driver
SELECT DISTINCT d.Name FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000;	vehicle_driver
SELECT DISTINCT d.Name FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000;	vehicle_driver
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150;	vehicle_driver
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150;	vehicle_driver
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'	vehicle_driver
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'	vehicle_driver
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver);	vehicle_driver
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver);	vehicle_driver
SELECT V.Vehicle_ID, V.Model FROM vehicle AS V WHERE V.Vehicle_ID IN (SELECT VD.Vehicle_ID FROM vehicle_driver AS VD GROUP BY VD.Vehicle_ID HAVING COUNT(VD.Driver_ID) = 2) OR V.Builder = 'Ziyang'	vehicle_driver
SELECT v.Vehicle_ID, v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID LEFT JOIN driver d ON vd.Driver_ID = d.Driver_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(DISTINCT vd.Driver_ID) = 2 OR v.Builder = 'Ziyang';	vehicle_driver
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID HAVING COUNT(T2.Driver_ID) > 2 OR T1.Vehicle_ID IN (SELECT T2.Vehicle_ID FROM vehicle_driver AS T2 JOIN driver AS T3 ON T2.Driver_ID = T3.Driver_ID WHERE T3.Name = 'Jeff Gordon')	vehicle_driver
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID JOIN driver d ON vd.Driver_ID = d.Driver_ID GROUP BY v.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) > 2 OR SUM(d.Name = 'Jeff Gordon') > 0;	vehicle_driver
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle);	vehicle_driver
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle);	vehicle_driver
SELECT Name FROM driver ORDER BY Name;	vehicle_driver
SELECT Name FROM driver ORDER BY Name ASC;	vehicle_driver
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS Number_of_Drivers FROM driver GROUP BY Racing_Series;	vehicle_driver
SELECT Racing_Series, COUNT(*) FROM driver GROUP BY Racing_Series	vehicle_driver
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1';	vehicle_driver
SELECT driver.Name, driver.Citizenship FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1';	vehicle_driver
SELECT count(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver);	vehicle_driver
SELECT COUNT(*) FROM driver LEFT JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE vehicle_driver.Vehicle_ID IS NULL;	vehicle_driver
SELECT COUNT(*) FROM Exams;	online_exams
SELECT COUNT(*) FROM Exams;	online_exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;	online_exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code;	online_exams
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != 'Database';	online_exams
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != 'Database';	online_exams
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC	online_exams
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC;	online_exams
SELECT Type_of_Question_Code, COUNT(Question_ID) AS Number_of_Questions FROM Questions GROUP BY Type_of_Question_Code;	online_exams
SELECT Type_of_Question_Code, COUNT(*) AS Occurrences FROM Questions GROUP BY Type_of_Question_Code;	online_exams
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal';	online_exams
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'	online_exams
SELECT COUNT(DISTINCT Comments) FROM Student_Answers;	online_exams
SELECT COUNT(DISTINCT Comments) FROM Student_Answers;	online_exams
SELECT Student_Answer_Text, COUNT(*) FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC;	online_exams
SELECT Student_Answer_Text, COUNT(*) AS Frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY Frequency DESC;	online_exams
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID;	online_exams
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID;	online_exams
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC;	online_exams
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC;	online_exams
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1	online_exams
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1	online_exams
SELECT DISTINCT s.First_Name FROM Students s JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID GROUP BY s.Student_ID HAVING COUNT(sa.Student_Answer_ID) >= 2;	online_exams
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2);	online_exams
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1	online_exams
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1;	online_exams
FAILED	online_exams
FAILED	online_exams
SELECT Gender_MFU, COUNT(Student_ID) AS Number_of_Students FROM Students GROUP BY Gender_MFU;	online_exams
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU	online_exams
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M');	online_exams
FAILED	online_exams
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers);	online_exams
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers);	online_exams
FAILED	online_exams
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent';	online_exams
SELECT q.Type_of_Question_Code FROM Questions q GROUP BY q.Type_of_Question_Code HAVING COUNT(q.Question_ID) >= 3;	online_exams
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3	online_exams
SELECT * FROM Students	online_exams
SELECT * FROM Students;	online_exams
SELECT COUNT(address_id) FROM Addresses;	customers_and_orders
SELECT COUNT(address_id) FROM Addresses;	customers_and_orders
SELECT address_id, address_details FROM Addresses;	customers_and_orders
SELECT address_id, address_details FROM Addresses;	customers_and_orders
SELECT count(*) FROM Products	customers_and_orders
SELECT COUNT(product_id) FROM Products;	customers_and_orders
SELECT product_id, product_type_code, product_name FROM Products;	customers_and_orders
SELECT product_id, product_type_code, product_name FROM Products;	customers_and_orders
SELECT product_price FROM Products WHERE product_name = 'Monitor';	customers_and_orders
SELECT product_price FROM Products WHERE product_name = 'Monitor';	customers_and_orders
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products	customers_and_orders
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products;	customers_and_orders
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes';	customers_and_orders
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes';	customers_and_orders
SELECT COUNT(*) FROM Products WHERE product_type_code = 'hardware';	customers_and_orders
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware';	customers_and_orders
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);	customers_and_orders
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')	customers_and_orders
FAILED	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1	customers_and_orders
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1;	customers_and_orders
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1;	customers_and_orders
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1;	customers_and_orders
SELECT product_name FROM Products ORDER BY product_price DESC	customers_and_orders
SELECT product_name FROM Products ORDER BY product_price DESC	customers_and_orders
FAILED	customers_and_orders
FAILED	customers_and_orders
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code;	customers_and_orders
SELECT product_type_code, COUNT(*) AS product_count FROM Products GROUP BY product_type_code;	customers_and_orders
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code;	customers_and_orders
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code;	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2;	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1;	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1;	customers_and_orders
SELECT COUNT(customer_id) FROM Customers;	customers_and_orders
SELECT COUNT(*) FROM Customers;	customers_and_orders
SELECT customer_id, customer_name FROM Customers;	customers_and_orders
SELECT customer_id, customer_name FROM Customers;	customers_and_orders
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy';	customers_and_orders
SELECT c.customer_address, c.customer_phone, c.customer_email FROM Customers c WHERE c.customer_name = 'Jeromy';	customers_and_orders
SELECT payment_method_code, COUNT(customer_id) AS number_of_customers FROM Customers GROUP BY payment_method_code;	customers_and_orders
SELECT payment_method_code, COUNT(*) AS customer_count FROM Customers GROUP BY payment_method_code;	customers_and_orders
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1;	customers_and_orders
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1	customers_and_orders
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1);	customers_and_orders
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1);	customers_and_orders
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy';	customers_and_orders
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy';	customers_and_orders
SELECT DISTINCT payment_method_code FROM Customers;	customers_and_orders
SELECT DISTINCT payment_method_code FROM Customers;	customers_and_orders
SELECT product_id, product_type_code FROM Products ORDER BY product_name;	customers_and_orders
SELECT product_id, product_type_code FROM Products ORDER BY product_name;	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_id) ASC LIMIT 1;	customers_and_orders
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1;	customers_and_orders
SELECT COUNT(order_id) FROM Customer_Orders;	customers_and_orders
SELECT COUNT(*) FROM Customer_Orders;	customers_and_orders
SELECT Customer_Orders.order_id, Customer_Orders.order_date, Customer_Orders.order_status_code FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id WHERE Customers.customer_name = 'Jeromy';	customers_and_orders
SELECT Customer_Orders.order_id, Customer_Orders.order_date, Customer_Orders.order_status_code FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customers.customer_name = 'Jeromy';	customers_and_orders
SELECT Customers.customer_name, Customers.customer_id, COUNT(Customer_Orders.order_id) AS number_of_orders FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id, Customers.customer_name;	customers_and_orders
SELECT Customers.customer_name, Customers.customer_id, COUNT(Customer_Orders.order_id) AS order_count FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id, Customers.customer_name;	customers_and_orders
SELECT T2.customer_id, T2.customer_name, T2.customer_phone, T2.customer_email FROM Customers AS T2 JOIN Customer_Orders AS T1 ON T2.customer_id = T1.customer_id GROUP BY T2.customer_id ORDER BY COUNT(T1.order_id) DESC LIMIT 1	customers_and_orders
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY COUNT(co.order_id) DESC LIMIT 1;	customers_and_orders
SELECT order_status_code, COUNT(*) AS order_count FROM Customer_Orders GROUP BY order_status_code;	customers_and_orders
SELECT order_status_code, COUNT(*) AS order_count FROM Customer_Orders GROUP BY order_status_code;	customers_and_orders
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1;	customers_and_orders
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1;	customers_and_orders
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders);	customers_and_orders
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders);	customers_and_orders
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items);	customers_and_orders
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items);	customers_and_orders
SELECT count(*) FROM Customer_Orders AS CO JOIN Order_Items AS OI ON CO.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id WHERE P.product_name = 'Monitor'	customers_and_orders
SELECT SUM(order_quantity) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE product_name = 'Monitor';	customers_and_orders
SELECT COUNT(DISTINCT co.customer_id) FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Customer_Orders co ON oi.order_id = co.order_id WHERE p.product_name = 'Monitor';	customers_and_orders
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor';	customers_and_orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders;	customers_and_orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders;	customers_and_orders
SELECT Customers.customer_id FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL;	customers_and_orders
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders);	customers_and_orders
SELECT DISTINCT T1.order_date, T1.order_id FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_date HAVING MAX(T2.order_quantity) > 6 OR COUNT(T2.product_id) > 3	customers_and_orders
SELECT T1.order_id, T1.order_date FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_date HAVING SUM(T2.order_quantity) > 6 OR COUNT(DISTINCT T2.product_id) > 3	customers_and_orders
SELECT COUNT(*) FROM building;	region_building
SELECT count(*) FROM building	region_building
SELECT Name FROM building ORDER BY Number_of_Stories ASC;	region_building
SELECT Name FROM building ORDER BY Number_of_Stories ASC	region_building
SELECT Address FROM building ORDER BY Completed_Year DESC;	region_building
SELECT Address FROM building ORDER BY Completed_Year DESC;	region_building
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year != 1980;	region_building
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year != 1980;	region_building
SELECT avg(Population) FROM region	region_building
SELECT AVG(Population) FROM region;	region_building
SELECT Name FROM region ORDER BY Name ASC;	region_building
SELECT Name FROM region ORDER BY Name;	region_building
SELECT r.Capital FROM region r WHERE r.Area > 10000	region_building
SELECT r.Capital FROM region r WHERE r.Area > 10000;	region_building
SELECT r.Capital FROM region r WHERE r.Population = (SELECT MAX(Population) FROM region);	region_building
SELECT r.Name, r.Capital FROM region r WHERE r.Population = (SELECT MAX(Population) FROM region);	region_building
SELECT Name FROM region ORDER BY Area DESC LIMIT 5;	region_building
SELECT Name FROM region ORDER BY Area DESC LIMIT 5;	region_building
SELECT building.Name, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID;	region_building
SELECT building.Name AS Building_Name, region.Name AS Region_Name FROM building JOIN region ON building.Region_ID = region.Region_ID;	region_building
SELECT r.Name FROM region r JOIN building b ON r.Region_ID = b.Region_ID GROUP BY r.Name HAVING COUNT(b.Building_ID) > 1;	region_building
FAILED	region_building
SELECT T2.Capital FROM region AS T2 JOIN building AS T1 ON T2.Region_ID = T1.Region_ID GROUP BY T2.Region_ID ORDER BY COUNT(T1.Building_ID) DESC LIMIT 1	region_building
SELECT r.Capital FROM region r JOIN building b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID ORDER BY COUNT(b.Building_ID) DESC LIMIT 1;	region_building
SELECT building.Address, region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID;	region_building
SELECT building.Address, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID;	region_building
SELECT building.Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo';	region_building
SELECT building.Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo';	region_building
SELECT Completed_Year, COUNT(*) FROM building GROUP BY Completed_Year;	region_building
SELECT Completed_Year, COUNT(*) FROM building GROUP BY Completed_Year	region_building
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1	region_building
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1	region_building
SELECT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Building_ID IS NULL;	region_building
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building);	region_building
SELECT DISTINCT b1.Completed_Year FROM building b1 JOIN building b2 ON b1.Completed_Year = b2.Completed_Year WHERE b1.Number_of_Stories > 20 AND b2.Number_of_Stories < 15;	region_building
SELECT DISTINCT b1.Completed_Year FROM building AS b1 JOIN building AS b2 ON b1.Completed_Year = b2.Completed_Year WHERE b1.Number_of_Stories > 20 AND b2.Number_of_Stories < 15;	region_building
SELECT DISTINCT Address FROM building;	region_building
SELECT DISTINCT Address FROM building;	region_building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC;	region_building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC;	region_building
FAILED	government_shift
SELECT Channel_Details FROM Channels ORDER BY Channel_Details;	government_shift
SELECT COUNT(Service_ID) FROM Services;	government_shift
SELECT COUNT(Service_ID) FROM Services;	government_shift
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	government_shift
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;	government_shift
SELECT T2.Service_Details FROM Customers AS T1 JOIN Customers_and_Services AS T3 ON T1.Customer_ID = T3.Customer_ID JOIN Services AS T2 ON T3.Service_ID = T2.Service_ID WHERE T1.Customer_Details = 'Hardy Kutch'	government_shift
SELECT S.Service_Details FROM Customers AS C JOIN Customers_and_Services AS CS ON C.Customer_ID = CS.Customer_ID JOIN Services AS S ON CS.Service_ID = S.Service_ID WHERE C.Customer_Details = 'Hardy Kutch'	government_shift
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID HAVING COUNT(*) > 3)	government_shift
SELECT s.Service_Details FROM Services s JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID GROUP BY s.Service_ID HAVING COUNT(cs.Customer_ID) > 3;	government_shift
SELECT Customer_Details FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID GROUP BY Customers.Customer_ID ORDER BY COUNT(Customer_Interactions.Service_ID) DESC LIMIT 1;	government_shift
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(Service_ID) DESC LIMIT 1)	government_shift
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1;	government_shift
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1;	government_shift
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services);	government_shift
SELECT c.Customer_Details FROM Customers c LEFT JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID WHERE cs.Customer_ID IS NULL;	government_shift
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID WHERE cs.Service_ID = (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)	government_shift
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID JOIN Services s ON cs.Service_ID = s.Service_ID WHERE s.Service_ID = ( SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1 );	government_shift
FAILED	government_shift
SELECT (SELECT COUNT(*) FROM Customers) AS Total_Customers, (SELECT COUNT(*) FROM Services) AS Total_Services;	government_shift
FAILED	government_shift
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'	government_shift
SELECT DISTINCT s.Service_Details FROM Services s JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID JOIN Customers c ON cs.Customer_ID = c.Customer_ID LEFT JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID WHERE c.Customer_Details = 'Hardy Kutch' OR ci.Status_Code = 'good';	government_shift
SELECT S.Service_Details FROM Services AS S JOIN Customers_and_Services AS CS ON S.Service_ID = CS.Service_ID JOIN Customers AS C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' UNION SELECT S.Service_Details FROM Services AS S JOIN Customer_Interactions AS CI ON S.Service_ID = CI.Service_ID WHERE CI.Status_Code = 'good';	government_shift
FAILED	government_shift
FAILED	government_shift
SELECT s.Service_Details FROM Services s JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID JOIN Channels ch ON ci.Channel_ID = ch.Channel_ID WHERE ch.Channel_Details = '15 ij';	government_shift
SELECT Services.Service_ID, Services.Service_Details FROM Services JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID WHERE Channels.Channel_Details = '15 ij';	government_shift
SELECT Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = 'Stuck' AND Customer_Interactions.Services_and_Channels_Details = 'bad';	government_shift
SELECT T2.Customer_Details FROM Customers AS T2 JOIN Customer_Interactions AS T4 ON T2.Customer_ID = T4.Customer_ID WHERE T4.Status_Code = 'Stuck' AND T4.Services_and_Channels_Details = 'bad'	government_shift
FAILED	government_shift
SELECT count(*) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'	government_shift
FAILED	government_shift
SELECT Customers.Customer_Details FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Integration_Platform.Integration_Platform_Details = 'Fail';	government_shift
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customer_Interactions);	government_shift
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customer_Interactions)	government_shift
SELECT Analytical_Layer.Analytical_Layer_Type_Code, COUNT(*) AS Usage_Count FROM Analytical_Layer JOIN Customers_and_Services ON Analytical_Layer.Customers_and_Services_ID = Customers_and_Services.Customers_and_Services_ID GROUP BY Analytical_Layer.Analytical_Layer_Type_Code;	government_shift
SELECT Analytical_Layer_Type_Code, COUNT(*) AS Usage_Count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code;	government_shift
FAILED	government_shift
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customers_and_Services_Details LIKE '%unsatisfied%'	government_shift
SELECT count(*) FROM Vehicles	vehicle_rent
SELECT COUNT(*) FROM Vehicles;	vehicle_rent
SELECT name FROM Vehicles ORDER BY Model_year DESC	vehicle_rent
SELECT name FROM Vehicles ORDER BY Model_year DESC;	vehicle_rent
SELECT DISTINCT Type_of_powertrain FROM Vehicles;	vehicle_rent
SELECT DISTINCT Type_of_powertrain FROM Vehicles;	vehicle_rent
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014);	vehicle_rent
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Vehicles WHERE Vehicles.Model_year IN (2013, 2014);	vehicle_rent
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Model_year IN (2013, 2014);	vehicle_rent
SELECT DISTINCT V1.Type_of_powertrain FROM Vehicles V1 JOIN Vehicles V2 ON V1.Type_of_powertrain = V2.Type_of_powertrain WHERE V1.Model_year = 2013 AND V2.Model_year = 2014;	vehicle_rent
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain;	vehicle_rent
SELECT Type_of_powertrain, COUNT(*) AS vehicle_count FROM Vehicles GROUP BY Type_of_powertrain;	vehicle_rent
SELECT Type_of_powertrain, COUNT(*) AS vehicle_count FROM Vehicles GROUP BY Type_of_powertrain ORDER BY vehicle_count DESC LIMIT 1;	vehicle_rent
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1	vehicle_rent
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles	vehicle_rent
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles;	vehicle_rent
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate;	vehicle_rent
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles WHERE Vehicles.City_fuel_economy_rate <= Vehicles.Highway_fuel_economy_rate;	vehicle_rent
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS average_annual_fuel_cost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) >= 2;	vehicle_rent
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS average_annual_fuel_cost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) >= 2;	vehicle_rent
SELECT name, age, membership_credit FROM Customers;	vehicle_rent
SELECT name, age, membership_credit FROM Customers;	vehicle_rent
SELECT name, age FROM Customers ORDER BY membership_credit DESC LIMIT 1	vehicle_rent
SELECT name, age FROM Customers ORDER BY membership_credit DESC LIMIT 1	vehicle_rent
SELECT AVG(Customers.age) FROM Customers WHERE Customers.membership_credit > (SELECT AVG(membership_credit) FROM Customers);	vehicle_rent
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers);	vehicle_rent
SELECT * FROM Discount;	vehicle_rent
SELECT * FROM Discount	vehicle_rent
SELECT Vehicles.name, SUM(Renting_history.total_hours) FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.name;	vehicle_rent
SELECT Vehicles.name, SUM(Renting_history.total_hours) AS total_rental_hours FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.name;	vehicle_rent
SELECT Vehicles.name FROM Vehicles LEFT JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Renting_history.vehicles_id IS NULL;	vehicle_rent
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history);	vehicle_rent
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(*) >= 2)	vehicle_rent
SELECT Customers.name FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id GROUP BY Customers.id HAVING COUNT(Renting_history.id) >= 2;	vehicle_rent
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1;	vehicle_rent
SELECT Vehicles.name, Vehicles.Model_year FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.id ORDER BY COUNT(Renting_history.id) DESC LIMIT 1;	vehicle_rent
SELECT Vehicles.name, Renting_history.total_hours FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id ORDER BY Renting_history.total_hours DESC;	vehicle_rent
SELECT Vehicles.name FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.name ORDER BY SUM(Renting_history.total_hours) DESC;	vehicle_rent
SELECT d.name FROM Discount d JOIN Renting_history rh ON d.id = rh.discount_id GROUP BY d.name ORDER BY COUNT(rh.id) DESC LIMIT 1;	vehicle_rent
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id = T2.id GROUP BY T2.id ORDER BY COUNT(T1.id) DESC LIMIT 1	vehicle_rent
SELECT Vehicles.name, Vehicles.Type_of_powertrain FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id WHERE Renting_history.total_hours > 30;	vehicle_rent
SELECT V.name, V.Type_of_powertrain FROM Vehicles AS V JOIN Renting_history AS R ON V.id = R.vehicles_id WHERE R.total_hours > 30	vehicle_rent
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS avg_city_fuel_economy_rate, AVG(Highway_fuel_economy_rate) AS avg_highway_fuel_economy_rate FROM Vehicles GROUP BY Type_of_powertrain;	vehicle_rent
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS avg_city_fuel_economy_rate, AVG(Highway_fuel_economy_rate) AS avg_highway_fuel_economy_rate FROM Vehicles GROUP BY Type_of_powertrain;	vehicle_rent
SELECT AVG(amount_of_loan) FROM Student_Loans;	cre_Students_Information_Systems
SELECT AVG(amount_of_loan) FROM Student_Loans	cre_Students_Information_Systems
SELECT s.student_id, s.bio_data FROM Students s JOIN Classes c ON s.student_id = c.student_id LEFT JOIN Detention d ON s.student_id = d.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT c.class_id) >= 2 AND COUNT(DISTINCT d.detention_id) < 2;	cre_Students_Information_Systems
SELECT S.bio_data, S.student_id FROM Students AS S WHERE S.student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) >= 2) OR S.student_id IN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(detention_id) < 2);	cre_Students_Information_Systems
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.class_details LIKE '%data%' AND t.teacher_id NOT IN (SELECT c2.teacher_id FROM Classes c2 WHERE c2.class_details LIKE 'net%');	cre_Students_Information_Systems
SELECT DISTINCT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.class_details LIKE '%data%' AND t.teacher_id NOT IN (SELECT c2.teacher_id FROM Classes c2 WHERE c2.class_details LIKE 'net%');	cre_Students_Information_Systems
FAILED	cre_Students_Information_Systems
FAILED	cre_Students_Information_Systems
SELECT T1.amount_of_loan, T1.date_of_loan FROM Student_Loans AS T1 WHERE T1.student_id IN (SELECT T2.student_id FROM Achievements AS T2 GROUP BY T2.student_id HAVING COUNT(T2.achievement_id) >= 2)	cre_Students_Information_Systems
SELECT T2.amount_of_loan, T2.date_of_loan FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id WHERE T1.student_id IN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2);	cre_Students_Information_Systems
SELECT teacher_id, teacher_details FROM Teachers WHERE teacher_id = (SELECT teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(class_id) DESC LIMIT 1);	cre_Students_Information_Systems
SELECT teacher_id, teacher_details FROM Teachers WHERE teacher_id = (SELECT teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(class_id) DESC LIMIT 1);	cre_Students_Information_Systems
FAILED	cre_Students_Information_Systems
SELECT DISTINCT rdt.detention_type_description FROM Detention d JOIN Ref_Detention_Type rdt ON d.detention_type_code = rdt.detention_type_code;	cre_Students_Information_Systems
SELECT Students.student_details, Ref_Address_Types.address_type_description FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code;	cre_Students_Information_Systems
SELECT Students.student_details, Ref_Address_Types.address_type_description FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code;	cre_Students_Information_Systems
SELECT Addresses.address_details, Students.bio_data FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id;	cre_Students_Information_Systems
SELECT Addresses.address_details, Students.bio_data FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id;	cre_Students_Information_Systems
SELECT Students.bio_data, Transcripts.date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id;	cre_Students_Information_Systems
SELECT Students.bio_data, Transcripts.date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id;	cre_Students_Information_Systems
SELECT behaviour_monitoring_details, COUNT(student_id) AS student_count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY student_count DESC LIMIT 1;	cre_Students_Information_Systems
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1	cre_Students_Information_Systems
SELECT S.bio_data, S.student_details FROM Students AS S JOIN Behaviour_Monitoring AS BM ON S.student_id = BM.student_id WHERE BM.behaviour_monitoring_details IN ( SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 OR COUNT(*) = ( SELECT MAX(count) FROM ( SELECT COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ) AS subquery ) )	cre_Students_Information_Systems
FAILED	cre_Students_Information_Systems
SELECT s.bio_data FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT bm.behaviour_monitoring_details) = 1 AND bm.behaviour_monitoring_details = ( SELECT bm2.behaviour_monitoring_details FROM Behaviour_Monitoring bm2 GROUP BY bm2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1);	cre_Students_Information_Systems
SELECT s.bio_data FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id WHERE bm.behaviour_monitoring_details = (SELECT bm.behaviour_monitoring_details FROM Behaviour_Monitoring bm GROUP BY bm.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1);	cre_Students_Information_Systems
SELECT S.bio_data, SE.event_date FROM Students AS S JOIN Student_Events AS SE ON S.student_id = SE.student_id	cre_Students_Information_Systems
SELECT Students.bio_data, Student_Events.event_date FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id;	cre_Students_Information_Systems
SELECT et.event_type_code, et.event_type_description, COUNT(DISTINCT se.student_id) AS student_count FROM Student_Events se JOIN Ref_Event_Types et ON se.event_type_code = et.event_type_code GROUP BY et.event_type_code, et.event_type_description ORDER BY student_count DESC LIMIT 1;	cre_Students_Information_Systems
SELECT T1.event_type_code, T2.event_type_description, COUNT(T1.student_id) AS number_of_students FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code, T2.event_type_description ORDER BY number_of_students DESC LIMIT 1;	cre_Students_Information_Systems
SELECT Achievements.achievement_details, Ref_Achievement_Type.achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code;	cre_Students_Information_Systems
SELECT Achievements.achievement_details, Ref_Achievement_Type.achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code;	cre_Students_Information_Systems
SELECT COUNT(DISTINCT t.teacher_id) FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id JOIN Students s ON c.student_id = s.student_id LEFT JOIN Achievements a ON s.student_id = a.student_id WHERE a.achievement_id IS NULL;	cre_Students_Information_Systems
SELECT COUNT(DISTINCT T1.teacher_id) FROM Classes AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id WHERE T2.student_id NOT IN (SELECT student_id FROM Achievements);	cre_Students_Information_Systems
SELECT date_of_transcript, transcript_details FROM Transcripts;	cre_Students_Information_Systems
SELECT date_of_transcript, transcript_details FROM Transcripts;	cre_Students_Information_Systems
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements;	cre_Students_Information_Systems
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements	cre_Students_Information_Systems
SELECT datetime_detention_start, datetime_detention_end FROM Detention;	cre_Students_Information_Systems
SELECT datetime_detention_start, datetime_detention_end FROM Detention;	cre_Students_Information_Systems
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'	cre_Students_Information_Systems
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'	cre_Students_Information_Systems
FAILED	cre_Students_Information_Systems
FAILED	cre_Students_Information_Systems
SELECT teacher_id, COUNT(class_id) AS course_count FROM Classes GROUP BY teacher_id ORDER BY course_count DESC LIMIT 1;	cre_Students_Information_Systems
SELECT teacher_id, COUNT(class_id) AS class_count FROM Classes GROUP BY teacher_id ORDER BY class_count DESC LIMIT 1	cre_Students_Information_Systems
SELECT student_id, COUNT(class_id) AS course_count FROM Classes GROUP BY student_id ORDER BY course_count DESC LIMIT 1	cre_Students_Information_Systems
SELECT student_id, COUNT(class_id) AS course_count FROM Classes GROUP BY student_id ORDER BY course_count DESC LIMIT 1;	cre_Students_Information_Systems
SELECT s.student_id, s.student_details FROM Students s JOIN Classes c ON s.student_id = c.student_id GROUP BY s.student_id, s.student_details HAVING COUNT(c.class_id) = 2;	cre_Students_Information_Systems
SELECT student_id, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) = 2);	cre_Students_Information_Systems
SELECT T2.detention_type_code, T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code = T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY COUNT(T1.detention_type_code) ASC LIMIT 1;	cre_Students_Information_Systems
SELECT d.detention_type_code, r.detention_type_description FROM Detention d JOIN Ref_Detention_Type r ON d.detention_type_code = r.detention_type_code GROUP BY d.detention_type_code ORDER BY COUNT(d.detention_type_code) ASC LIMIT 1;	cre_Students_Information_Systems
SELECT S.student_id, S.bio_data, S.student_details FROM Students AS S JOIN Student_Loans AS SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)	cre_Students_Information_Systems
SELECT S.bio_data, S.student_details FROM Students AS S JOIN Student_Loans AS SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)	cre_Students_Information_Systems
SELECT MIN(date_of_loan) FROM Student_Loans;	cre_Students_Information_Systems
SELECT MIN(date_of_loan) FROM Student_Loans;	cre_Students_Information_Systems
SELECT bio_data FROM Students WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan ASC LIMIT 1)	cre_Students_Information_Systems
SELECT s.bio_data FROM Students s JOIN Student_Loans sl ON s.student_id = sl.student_id ORDER BY sl.amount_of_loan ASC LIMIT 1;	cre_Students_Information_Systems
SELECT date_of_transcript FROM Transcripts WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan DESC LIMIT 1)	cre_Students_Information_Systems
SELECT date_of_transcript FROM Transcripts WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan DESC LIMIT 1);	cre_Students_Information_Systems
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE student_id = (SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1));	cre_Students_Information_Systems
SELECT T2.teacher_details FROM Classes AS T1 JOIN Teachers AS T2 ON T1.teacher_id = T2.teacher_id WHERE T1.student_id = (SELECT student_id FROM Transcripts ORDER BY date_of_transcript LIMIT 1)	cre_Students_Information_Systems
SELECT student_id, SUM(amount_of_loan) AS total_loan_amount FROM Student_Loans GROUP BY student_id;	cre_Students_Information_Systems
SELECT student_id, SUM(amount_of_loan) AS total_loan_amount FROM Student_Loans GROUP BY student_id;	cre_Students_Information_Systems
SELECT s.student_id, s.bio_data, COUNT(c.class_id) AS course_count FROM Students s LEFT JOIN Classes c ON s.student_id = c.student_id GROUP BY s.student_id, s.bio_data;	cre_Students_Information_Systems
SELECT Students.student_id, Students.bio_data, COUNT(Classes.class_id) AS number_of_courses FROM Students LEFT JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id, Students.bio_data;	cre_Students_Information_Systems
SELECT COUNT(DISTINCT student_id) FROM Detention	cre_Students_Information_Systems
SELECT COUNT(DISTINCT student_id) FROM Detention;	cre_Students_Information_Systems
SELECT s.address_type_code, r.address_type_description FROM Students_Addresses s JOIN Ref_Address_Types r ON s.address_type_code = r.address_type_code GROUP BY s.address_type_code ORDER BY COUNT(*) DESC LIMIT 1;	cre_Students_Information_Systems
SELECT T2.address_type_code, T2.address_type_description FROM Students_Addresses AS T1 JOIN Ref_Address_Types AS T2 ON T1.address_type_code = T2.address_type_code GROUP BY T2.address_type_code, T2.address_type_description ORDER BY COUNT(*) DESC LIMIT 1;	cre_Students_Information_Systems
FAILED	cre_Students_Information_Systems
SELECT s.bio_data FROM Students s JOIN Student_Events se ON s.student_id = se.student_id LEFT JOIN Student_Loans sl ON s.student_id = sl.student_id WHERE sl.student_id IS NULL;	cre_Students_Information_Systems
SELECT sa.date_from, sa.date_to FROM Students s JOIN Transcripts t ON s.student_id = t.student_id JOIN Students_Addresses sa ON s.student_id = sa.student_id GROUP BY s.student_id HAVING COUNT(t.transcript_id) = 2;	cre_Students_Information_Systems
SELECT sa.date_from, sa.date_to FROM Students s JOIN Transcripts t ON s.student_id = t.student_id JOIN Students_Addresses sa ON s.student_id = sa.student_id GROUP BY s.student_id HAVING COUNT(t.transcript_id) = 2;	cre_Students_Information_Systems
SELECT MIN(datetime_detention_start) FROM Detention	cre_Students_Information_Systems
SELECT datetime_detention_start FROM Detention;	cre_Students_Information_Systems
SELECT Name FROM Author;	book_1
SELECT Name FROM Author;	book_1
SELECT Name, Address FROM Client;	book_1
SELECT Name, Address FROM Client;	book_1
SELECT Title, ISBN, SalePrice FROM Book;	book_1
SELECT Book.Title, Book.ISBN, Book.SalePrice FROM Book;	book_1
SELECT COUNT(ISBN) FROM Book;	book_1
SELECT count(*) FROM Book	book_1
SELECT count(*) FROM Author	book_1
SELECT COUNT(idAuthor) FROM Author;	book_1
SELECT COUNT(IdClient) FROM Client;	book_1
SELECT COUNT(IdClient) FROM Client;	book_1
SELECT Name, Address FROM Client ORDER BY Name ASC	book_1
SELECT Name, Address FROM Client ORDER BY Name ASC	book_1
SELECT Book.Title, Author.Name FROM Author_Book JOIN Book ON Author_Book.ISBN = Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor;	book_1
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor;	book_1
SELECT Orders.IdOrder, Client.Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient;	book_1
SELECT T1.IdOrder, T2.Name FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient = T2.IdClient;	book_1
SELECT Author.Name, COUNT(Author_Book.ISBN) AS NumberOfBooks FROM Author JOIN Author_Book ON Author.idAuthor = Author_Book.Author GROUP BY Author.Name;	book_1
SELECT Author.Name, COUNT(Book.ISBN) AS BookCount FROM Author JOIN Author_Book ON Author.idAuthor = Author_Book.Author JOIN Book ON Author_Book.ISBN = Book.ISBN GROUP BY Author.Name;	book_1
SELECT Books_Order.ISBN, COUNT(Books_Order.IdOrder) AS NumberOfOrders FROM Books_Order GROUP BY Books_Order.ISBN;	book_1
FAILED	book_1
SELECT Books_Order.ISBN, SUM(Books_Order.amount) AS TotalAmountOrdered FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN GROUP BY Books_Order.ISBN;	book_1
SELECT ISBN, SUM(amount) FROM Books_Order GROUP BY ISBN;	book_1
SELECT Book.Title FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN GROUP BY Book.Title ORDER BY COUNT(Books_Order.IdOrder) DESC LIMIT 1;	book_1
SELECT Book.Title FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN GROUP BY Book.Title ORDER BY COUNT(Books_Order.IdOrder) DESC LIMIT 1;	book_1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1;	book_1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1;	book_1
SELECT DISTINCT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN;	book_1
SELECT DISTINCT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN;	book_1
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient;	book_1
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient	book_1
SELECT T1.Name, COUNT(T2.IdOrder) FROM Client AS T1 LEFT JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient	book_1
SELECT Client.Name, COUNT(Orders.IdOrder) AS OrderCount FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.Name;	book_1
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders GROUP BY IdClient ORDER BY COUNT(IdOrder) DESC LIMIT 1);	book_1
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.IdClient ORDER BY COUNT(T2.IdOrder) DESC LIMIT 1	book_1
SELECT Client.Name, SUM(Books_Order.amount) AS TotalBooksOrdered FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.Name;	book_1
SELECT Client.Name, SUM(Books_Order.amount) AS TotalBooksOrdered FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.Name;	book_1
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.Name ORDER BY SUM(Books_Order.amount) DESC LIMIT 1;	book_1
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.Name ORDER BY SUM(Books_Order.amount) DESC LIMIT 1;	book_1
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order);	book_1
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order);	book_1
SELECT Client.Name FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient WHERE Orders.IdOrder IS NULL;	book_1
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders);	book_1
SELECT MAX(SalePrice) AS MaxSalePrice, MIN(SalePrice) AS MinSalePrice FROM Book;	book_1
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book;	book_1
SELECT AVG(PurchasePrice) AS AvgPurchasePrice, AVG(SalePrice) AS AvgSalePrice FROM Book;	book_1
SELECT AVG(PurchasePrice) AS AvgPurchasePrice, AVG(SalePrice) AS AvgSalePrice FROM Book;	book_1
SELECT MAX(SalePrice - PurchasePrice) AS MaxPriceDifference FROM Book;	book_1
SELECT MAX(SalePrice - PurchasePrice) AS LargestDifference FROM Book;	book_1
SELECT Book.Title FROM Book WHERE Book.SalePrice > (SELECT AVG(SalePrice) FROM Book);	book_1
SELECT Book.Title FROM Book WHERE Book.SalePrice > (SELECT AVG(SalePrice) FROM Book);	book_1
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book);	book_1
SELECT Book.Title FROM Book WHERE Book.SalePrice = (SELECT MIN(SalePrice) FROM Book)	book_1
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book);	book_1
SELECT Title FROM Book ORDER BY PurchasePrice DESC LIMIT 1;	book_1
SELECT AVG(Book.SalePrice) FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell';	book_1
SELECT AVG(Book.SalePrice) FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell';	book_1
FAILED	book_1
FAILED	book_1
SELECT b.Title FROM Book b JOIN Author_Book ab ON b.ISBN = ab.ISBN JOIN Author a ON ab.Author = a.idAuthor WHERE a.Name = 'George Orwell' ORDER BY b.SalePrice ASC LIMIT 1;	book_1
SELECT b.Title FROM Book b JOIN Author_Book ab ON b.ISBN = ab.ISBN JOIN Author a ON ab.Author = a.idAuthor WHERE a.Name = 'George Orwell' ORDER BY b.SalePrice ASC LIMIT 1;	book_1
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato' AND Book.SalePrice < (SELECT AVG(SalePrice) FROM Book);	book_1
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato' AND Book.SalePrice < (SELECT AVG(SalePrice) FROM Book);	book_1
SELECT Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Book.Title = 'Pride and Prejudice';	book_1
FAILED	book_1
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%'	book_1
SELECT T1.Title FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name LIKE '%Plato%'	book_1
SELECT COUNT(*) FROM Orders AS O JOIN Books_Order AS BO ON O.IdOrder = BO.IdOrder JOIN Book AS B ON BO.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice'	book_1
SELECT COUNT(*) FROM Orders AS O JOIN Books_Order AS BO ON O.IdOrder = BO.IdOrder JOIN Book AS B ON BO.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice'	book_1
SELECT T1.IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN WHERE T2.Title = 'Pride and Prejudice' INTERSECT SELECT T1.IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN WHERE T2.Title = 'The Little Prince'	book_1
SELECT T1.IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN WHERE T2.Title = 'Pride and Prejudice' OR T2.Title = 'The Little Prince' GROUP BY T1.IdOrder HAVING COUNT(DISTINCT T2.Title) = 2	book_1
FAILED	book_1
FAILED	book_1
SELECT DISTINCT B.Title FROM Orders O JOIN Client C ON O.IdClient = C.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder JOIN Book B ON BO.ISBN = B.ISBN WHERE C.Name = 'Peter Doe' AND B.Title NOT IN ( SELECT B.Title FROM Orders O JOIN Client C ON O.IdClient = C.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder JOIN Book B ON BO.ISBN = B.ISBN WHERE C.Name = 'James Smith')	book_1
FAILED	book_1
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice';	book_1
SELECT C.Name FROM Client AS C JOIN Orders AS O ON C.IdClient = O.IdClient JOIN Books_Order AS BO ON O.IdOrder = BO.IdOrder JOIN Book AS B ON BO.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice'	book_1
SELECT count(*) FROM book	book_review
SELECT Title FROM book ORDER BY Title ASC;	book_review
SELECT Title FROM book ORDER BY Pages DESC;	book_review
SELECT Type, Release FROM book;	book_review
SELECT Title, MAX(Chapters) AS Max_Chapters, MIN(Chapters) AS Min_Chapters FROM book GROUP BY Title;	book_review
SELECT Title FROM book WHERE Type != 'Poet';	book_review
SELECT AVG(Rating) FROM review;	book_review
SELECT book.Title, review.Rating FROM book JOIN review ON book.Book_ID = review.Book_ID;	book_review
SELECT r.Rating FROM book b JOIN review r ON b.Book_ID = r.Book_ID WHERE b.Chapters = (SELECT MAX(Chapters) FROM book);	book_review
SELECT r.Rank FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY b.Pages ASC LIMIT 1;	book_review
SELECT b.Title FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Rank DESC LIMIT 1;	book_review
SELECT AVG(Readers_in_Million) FROM book JOIN review ON book.Book_ID = review.Book_ID WHERE Type = 'Novel';	book_review
SELECT Type, COUNT(*) AS Number_of_Books FROM book GROUP BY Type;	book_review
SELECT Type FROM book GROUP BY Type ORDER BY COUNT(*) DESC LIMIT 1	book_review
SELECT Type FROM book GROUP BY Type HAVING count(Book_ID) >= 3	book_review
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Rating ASC	book_review
SELECT T1.Title, T1.Audio FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Readers_in_Million DESC	book_review
SELECT count(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)	book_review
SELECT DISTINCT Type FROM book WHERE Chapters > 75 AND Type IN (SELECT Type FROM book WHERE Chapters < 50);	book_review
SELECT COUNT(DISTINCT Type) FROM book;	book_review
SELECT Type, Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review WHERE Rating IS NOT NULL)	book_review
SELECT COUNT(DISTINCT Customer_ID) FROM customer;	restaurant_bills
SELECT COUNT(Customer_ID) FROM customer;	restaurant_bills
SELECT Name FROM customer ORDER BY Level_of_Membership ASC;	restaurant_bills
SELECT Name FROM customer ORDER BY Level_of_Membership ASC;	restaurant_bills
SELECT Nationality, Card_Credit FROM customer;	restaurant_bills
SELECT Nationality, Card_Credit FROM customer;	restaurant_bills
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia');	restaurant_bills
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia');	restaurant_bills
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1;	restaurant_bills
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1;	restaurant_bills
SELECT Card_Credit FROM customer WHERE Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer);	restaurant_bills
SELECT Card_Credit FROM customer WHERE Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer);	restaurant_bills
SELECT Nationality, COUNT(Customer_ID) AS Number_of_Customers FROM customer GROUP BY Nationality;	restaurant_bills
SELECT Nationality, count(*) FROM customer GROUP BY Nationality;	restaurant_bills
SELECT Nationality, COUNT(*) AS count FROM customer GROUP BY Nationality ORDER BY count DESC LIMIT 1;	restaurant_bills
SELECT Nationality, COUNT(*) AS Customer_Count FROM customer GROUP BY Nationality ORDER BY Customer_Count DESC LIMIT 1;	restaurant_bills
FAILED	restaurant_bills
FAILED	restaurant_bills
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID;	restaurant_bills
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID;	restaurant_bills
SELECT customer.Name, customer_order.Dish_Name, customer_order.Quantity FROM customer_order JOIN customer ON customer_order.Customer_ID = customer.Customer_ID ORDER BY customer_order.Quantity DESC;	restaurant_bills
SELECT customer.Name, customer_order.Dish_Name FROM customer_order JOIN customer ON customer_order.Customer_ID = customer.Customer_ID ORDER BY customer_order.Quantity DESC;	restaurant_bills
SELECT customer.Name, SUM(customer_order.Quantity) AS Total_Quantity FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Name;	restaurant_bills
SELECT customer.Name, SUM(customer_order.Quantity) AS Total_Quantity FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Name;	restaurant_bills
SELECT customer.Name, SUM(customer_order.Quantity) AS Total_Quantity FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID HAVING Total_Quantity > 1;	restaurant_bills
SELECT Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY Name HAVING SUM(Quantity) > 1;	restaurant_bills
SELECT DISTINCT Manager FROM branch;	restaurant_bills
SELECT DISTINCT Manager FROM branch;	restaurant_bills
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order);	restaurant_bills
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)	restaurant_bills
SELECT count(*) FROM member	club_leader
SELECT Name FROM member ORDER BY Age ASC;	club_leader
SELECT Name, Nationality FROM member;	club_leader
SELECT Name FROM member WHERE Nationality != 'England';	club_leader
SELECT Name FROM member WHERE Age IN (19, 20);	club_leader
SELECT Name FROM member WHERE Age = (SELECT MAX(Age) FROM member)	club_leader
SELECT Nationality, COUNT(*) FROM member GROUP BY Nationality;	club_leader
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	club_leader
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(Member_ID) >= 2;	club_leader
FAILED	club_leader
SELECT Team_Leader FROM club WHERE Overall_Ranking > 100	club_leader
SELECT T1.Team_Leader FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Year_Join < 2018	club_leader
SELECT Team_Leader FROM club WHERE Club_Name = 'Houston'	club_leader
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader);	club_leader
SELECT DISTINCT m1.Nationality FROM member AS m1 WHERE m1.Age > 22 INTERSECT SELECT DISTINCT m2.Nationality FROM member AS m2 WHERE m2.Age < 19;	club_leader
SELECT AVG(T1.Age) FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID	club_leader
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%';	club_leader
SELECT Collection_Subset_ID, Collection_Subset_Name FROM Collection_Subsets;	cre_Doc_and_collections
SELECT Collection_Subset_Name FROM Collection_Subsets;	cre_Doc_and_collections
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection';	cre_Doc_and_collections
SELECT c.Collection_ID, c.Collection_Name, c.Collection_Description FROM Collection_Subsets cs JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID JOIN Collections c ON csm.Collection_ID = c.Collection_ID WHERE cs.Collection_Subset_Name = 'Top collection';	cre_Doc_and_collections
SELECT Document_Subset_ID, Document_Subset_Name FROM Document_Subsets;	cre_Doc_and_collections
SELECT Document_Subset_Name FROM Document_Subsets;	cre_Doc_and_collections
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000';	cre_Doc_and_collections
SELECT Document_Subset_Name, Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000';	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects;	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects;	cre_Doc_and_collections
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin';	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'	cre_Doc_and_collections
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection';	cre_Doc_and_collections
The 'Braeden Collection' does not exist in the Collections table, hence no document objects or owners can be retrieved.	cre_Doc_and_collections
SELECT d2.Owner FROM Document_Objects d1 JOIN Document_Objects d2 ON d1.Parent_Document_Object_ID = d2.Document_Object_ID WHERE d1.Owner = 'Marlin';	cre_Doc_and_collections
SELECT T2.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID = T2.Document_Object_ID WHERE T1.Owner = 'Marlin'	cre_Doc_and_collections
SELECT DISTINCT d1.Description FROM Document_Objects d1 JOIN Document_Objects d2 ON d1.Document_Object_ID = d2.Parent_Document_Object_ID;	cre_Doc_and_collections
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL;	cre_Doc_and_collections
SELECT count(*) FROM Document_Objects WHERE Owner = 'Marlin'	cre_Doc_and_collections
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin';	cre_Doc_and_collections
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects);	cre_Doc_and_collections
FAILED	cre_Doc_and_collections
SELECT d.Parent_Document_Object_ID, COUNT(c.Document_Object_ID) AS Number_of_Child_Documents FROM Document_Objects d LEFT JOIN Document_Objects c ON d.Document_Object_ID = c.Parent_Document_Object_ID GROUP BY d.Parent_Document_Object_ID;	cre_Doc_and_collections
SELECT d.Parent_Document_Object_ID, COUNT(d.Document_Object_ID) AS Child_Document_Count FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL GROUP BY d.Parent_Document_Object_ID;	cre_Doc_and_collections
SELECT Collection_Name FROM Collections;	cre_Doc_and_collections
SELECT Collection_Name FROM Collections;	cre_Doc_and_collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'	cre_Doc_and_collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best';	cre_Doc_and_collections
SELECT T2.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Parent_Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Nice'	cre_Doc_and_collections
SELECT T2.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Parent_Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Nice'	cre_Doc_and_collections
FAILED	cre_Doc_and_collections
SELECT c.Collection_Name FROM Collections c LEFT JOIN Collections pc ON c.Collection_ID = pc.Parent_Collection_ID WHERE pc.Parent_Collection_ID IS NULL;	cre_Doc_and_collections
SELECT d.Document_Object_ID FROM Document_Objects d JOIN Document_Objects c ON d.Document_Object_ID = c.Parent_Document_Object_ID GROUP BY d.Document_Object_ID HAVING COUNT(c.Document_Object_ID) > 1;	cre_Doc_and_collections
SELECT d1.Document_Object_ID FROM Document_Objects d1 JOIN Document_Objects d2 ON d1.Document_Object_ID = d2.Parent_Document_Object_ID GROUP BY d1.Document_Object_ID HAVING COUNT(d2.Document_Object_ID) > 1;	cre_Doc_and_collections
SELECT count(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')	cre_Doc_and_collections
SELECT COUNT(c2.Collection_ID) FROM Collections c1 JOIN Collections c2 ON c1.Collection_ID = c2.Parent_Collection_ID WHERE c1.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT DISTINCT dsm.Related_Document_Object_ID FROM Document_Objects AS do JOIN Document_Subset_Members AS dsm ON do.Document_Object_ID = dsm.Document_Object_ID WHERE do.Owner = 'Ransom'	cre_Doc_and_collections
SELECT DISTINCT dsm.Related_Document_Object_ID FROM Document_Objects AS do JOIN Document_Subset_Members AS dsm ON do.Document_Object_ID = dsm.Document_Object_ID WHERE do.Owner = 'Ransom';	cre_Doc_and_collections
SELECT cs.Collection_Subset_ID, cs.Collection_Subset_Name, COUNT(csm.Collection_ID) AS Number_of_Collections FROM Collection_Subsets cs LEFT JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID GROUP BY cs.Collection_Subset_ID, cs.Collection_Subset_Name;	cre_Doc_and_collections
SELECT cs.Collection_Subset_ID, cs.Collection_Subset_Name, COUNT(csm.Collection_ID) AS Number_of_Collections FROM Collection_Subsets cs LEFT JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID GROUP BY cs.Collection_Subset_ID, cs.Collection_Subset_Name;	cre_Doc_and_collections
SELECT Parent_Document_Object_ID, COUNT(*) AS Child_Count FROM Document_Objects GROUP BY Parent_Document_Object_ID ORDER BY Child_Count DESC LIMIT 1;	cre_Doc_and_collections
FAILED	cre_Doc_and_collections
SELECT dsm.Document_Object_ID, COUNT(dsm.Related_Document_Object_ID) AS Related_Document_Count FROM Document_Subset_Members dsm GROUP BY dsm.Document_Object_ID ORDER BY Related_Document_Count ASC LIMIT 1;	cre_Doc_and_collections
SELECT d.Document_Object_ID FROM Document_Objects d LEFT JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID GROUP BY d.Document_Object_ID ORDER BY COUNT(dc.Collection_ID) ASC LIMIT 1;	cre_Doc_and_collections
SELECT dsm.Document_Object_ID, COUNT(dsm.Related_Document_Object_ID) AS Related_Document_Count FROM Document_Subset_Members dsm JOIN Document_Objects do ON dsm.Document_Object_ID = do.Document_Object_ID GROUP BY dsm.Document_Object_ID HAVING Related_Document_Count BETWEEN 2 AND 4;	cre_Doc_and_collections
SELECT dsm.Document_Object_ID, COUNT(dsm.Related_Document_Object_ID) AS Related_Document_Count FROM Document_Subset_Members AS dsm JOIN Document_Objects AS do ON dsm.Document_Object_ID = do.Document_Object_ID GROUP BY dsm.Document_Object_ID HAVING Related_Document_Count BETWEEN 2 AND 4;	cre_Doc_and_collections
SELECT DISTINCT d2.Owner FROM Document_Objects d1 JOIN Document_Subset_Members dsm ON d1.Document_Object_ID = dsm.Related_Document_Object_ID JOIN Document_Objects d2 ON dsm.Document_Object_ID = d2.Document_Object_ID WHERE d1.Owner = 'Braeden';	cre_Doc_and_collections
SELECT DISTINCT d2.Owner FROM Document_Objects d1 JOIN Document_Subset_Members dsm ON d1.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subset_Members dsm2 ON dsm.Related_Document_Object_ID = dsm2.Document_Object_ID JOIN Document_Objects d2 ON dsm2.Document_Object_ID = d2.Document_Object_ID WHERE d1.Owner = 'Braeden';	cre_Doc_and_collections
SELECT DISTINCT T3.Document_Subset_Name FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID = T3.Document_Subset_ID WHERE T1.Owner = 'Braeden'	cre_Doc_and_collections
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID JOIN Document_Objects do ON dsm.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Braeden';	cre_Doc_and_collections
SELECT ds.Document_Subset_ID, ds.Document_Subset_Name, COUNT(DISTINCT dsm.Document_Object_ID) AS Document_Count FROM Document_Subsets ds LEFT JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID GROUP BY ds.Document_Subset_ID, ds.Document_Subset_Name;	cre_Doc_and_collections
SELECT ds.Document_Subset_ID, ds.Document_Subset_Name, COUNT(DISTINCT dsm.Document_Object_ID) AS Document_Count FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID GROUP BY ds.Document_Subset_ID, ds.Document_Subset_Name;	cre_Doc_and_collections
SELECT T1.Document_Subset_ID, T1.Document_Subset_Name, COUNT(DISTINCT T2.Document_Object_ID) AS Number_of_Documents FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID, T1.Document_Subset_Name ORDER BY Number_of_Documents DESC LIMIT 1;	cre_Doc_and_collections
SELECT T1.Document_Subset_ID, T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID ORDER BY COUNT(DISTINCT T2.Document_Object_ID) DESC LIMIT 1;	cre_Doc_and_collections
SELECT dsm.Document_Object_ID FROM Document_Subset_Members AS dsm JOIN Document_Subsets AS ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000';	cre_Doc_and_collections
SELECT dsm.Document_Object_ID FROM Document_Subset_Members AS dsm JOIN Document_Subsets AS ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000';	cre_Doc_and_collections
SELECT Document_Subset_Members.Document_Object_ID, Document_Subsets.Document_Subset_Name, Document_Subsets.Document_Subset_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID;	cre_Doc_and_collections
SELECT Document_Subsets.Document_Subset_Name, Document_Subset_Members.Document_Object_ID FROM Document_Subsets JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID;	cre_Doc_and_collections
SELECT DISTINCT T3.Collection_Name FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID = T3.Collection_ID WHERE T1.Owner = 'Ransom'	cre_Doc_and_collections
SELECT c.Collection_Name FROM Document_Objects d JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID JOIN Collections c ON dc.Collection_ID = c.Collection_ID WHERE d.Owner = 'Ransom'	cre_Doc_and_collections
SELECT Document_Object_ID, COUNT(Collection_ID) FROM Documents_in_Collections GROUP BY Document_Object_ID;	cre_Doc_and_collections
SELECT d.Document_Object_ID, COUNT(dc.Collection_ID) AS Collection_Count FROM Document_Objects d LEFT JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID GROUP BY d.Document_Object_ID;	cre_Doc_and_collections
SELECT COUNT(*) FROM Documents_in_Collections dc JOIN Collections c ON dc.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T2.Collection_Name = 'Best'	cre_Doc_and_collections
SELECT Documents_in_Collections.Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections dc JOIN Document_Objects d ON dc.Document_Object_ID = d.Document_Object_ID JOIN Collections c ON dc.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT c.Collection_ID, c.Collection_Name, COUNT(d.Document_Object_ID) AS Document_Count FROM Collections c JOIN Documents_in_Collections d ON c.Collection_ID = d.Collection_ID GROUP BY c.Collection_ID, c.Collection_Name ORDER BY Document_Count DESC LIMIT 1;	cre_Doc_and_collections
SELECT c.Collection_Name, c.Collection_ID, COUNT(d.Document_Object_ID) AS Document_Count FROM Collections c JOIN Documents_in_Collections d ON c.Collection_ID = d.Collection_ID WHERE c.Collection_Name = 'Best' GROUP BY c.Collection_ID ORDER BY Document_Count DESC LIMIT 1;	cre_Doc_and_collections
SELECT T5.Document_Object_ID FROM Document_Subset_Members AS T5 JOIN Document_Subsets AS T0 ON T5.Document_Subset_ID = T0.Document_Subset_ID JOIN Documents_in_Collections AS T4 ON T5.Document_Object_ID = T4.Document_Object_ID JOIN Collections AS T3 ON T4.Collection_ID = T3.Collection_ID WHERE T0.Document_Subset_Name = 'Best for 2000' AND T3.Collection_Name = 'Best'	cre_Doc_and_collections
SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T1.Document_Object_ID = T3.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID = T4.Collection_ID WHERE T2.Document_Subset_Name = 'Best for 2000' AND T4.Collection_Name = 'Best'	cre_Doc_and_collections
SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T2.Collection_Name = 'Best' AND T1.Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members AS T3 JOIN Document_Subsets AS T4 ON T3.Document_Subset_ID = T4.Document_Subset_ID WHERE T4.Document_Subset_Name = 'Best for 2000')	cre_Doc_and_collections
SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T2.Collection_Name = 'Best' AND T1.Document_Object_ID NOT IN (SELECT T3.Document_Object_ID FROM Document_Subset_Members AS T3 JOIN Document_Subsets AS T4 ON T3.Document_Subset_ID = T4.Document_Subset_ID WHERE T4.Document_Subset_Name = 'Best for 2000')	cre_Doc_and_collections
SELECT DISTINCT T5.Document_Object_ID FROM Document_Subset_Members AS T5 JOIN Document_Subsets AS T0 ON T5.Document_Subset_ID = T0.Document_Subset_ID WHERE T0.Document_Subset_Name = 'Best for 2000' UNION SELECT DISTINCT T4.Document_Object_ID FROM Documents_in_Collections AS T4 JOIN Collections AS T3 ON T4.Collection_ID = T3.Collection_ID WHERE T3.Collection_Name = 'Best'	cre_Doc_and_collections
SELECT DISTINCT dsm.Document_Object_ID FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000' UNION SELECT DISTINCT dic.Document_Object_ID FROM Collections c JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID WHERE c.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T2.Related_Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')	cre_Doc_and_collections
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T2.Related_Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')	cre_Doc_and_collections
SELECT COUNT(DISTINCT csm.Collection_ID) FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Collection_ID WHERE c.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT COUNT(DISTINCT csm.Collection_ID) FROM Collection_Subset_Members AS csm JOIN Collections AS c ON csm.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT cs.Collection_Subset_Name FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Collection_ID JOIN Collection_Subsets cs ON csm.Collection_Subset_ID = cs.Collection_Subset_ID WHERE c.Collection_Name = 'Best';	cre_Doc_and_collections
SELECT T2.Collection_Subset_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T3 ON T1.Collection_ID = T3.Collection_ID JOIN Collection_Subsets AS T2 ON T3.Collection_Subset_ID = T2.Collection_Subset_ID WHERE T1.Collection_Name = 'Best'	cre_Doc_and_collections
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%'	sing_contest
SELECT name FROM songs ORDER BY name ASC;	sing_contest
SELECT songs.name, songs.language FROM songs;	sing_contest
SELECT MAX(voice_sound_quality) AS max_voice_sound_quality, MIN(voice_sound_quality) AS min_voice_sound_quality FROM performance_score;	sing_contest
SELECT T3.voice_sound_quality, T3.rhythm_tempo, T3.stage_presence FROM participants AS T1 JOIN performance_score AS T3 ON T1.id = T3.participant_id WHERE T1.name = 'Freeway'	sing_contest
SELECT id, language, original_artist FROM songs WHERE name != 'Love'	sing_contest
SELECT songs.name, songs.original_artist FROM songs WHERE songs.english_translation = 'All the streets of love';	sing_contest
SELECT DISTINCT T3.stage_presence FROM songs AS T1 JOIN performance_score AS T3 ON T1.id = T3.songs_id WHERE T1.language = 'English'	sing_contest
SELECT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id, p.name HAVING COUNT(ps.songs_id) >= 2;	sing_contest
SELECT participants.id, participants.name, participants.popularity FROM participants JOIN performance_score ON participants.id = performance_score.participant_id GROUP BY participants.id ORDER BY COUNT(performance_score.songs_id) DESC;	sing_contest
SELECT participants.id, participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id WHERE performance_score.voice_sound_quality = 5 OR performance_score.rhythm_tempo = 5;	sing_contest
FAILED	sing_contest
SELECT T2.id, T2.name FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id = T2.id GROUP BY T1.songs_id ORDER BY COUNT(T1.participant_id) DESC LIMIT 1	sing_contest
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9;	sing_contest
SELECT COUNT(*) FROM songs LEFT JOIN performance_score ON songs.id = performance_score.songs_id WHERE performance_score.songs_id IS NULL;	sing_contest
SELECT s.language, AVG(ps.rhythm_tempo) AS average_rhythm_score FROM songs s JOIN performance_score ps ON s.id = ps.songs_id GROUP BY s.language;	sing_contest
SELECT DISTINCT p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English';	sing_contest
SELECT p.name, p.popularity FROM participants AS p JOIN performance_score AS ps ON p.id = ps.participant_id JOIN songs AS s ON ps.songs_id = s.id WHERE s.language = 'Croatian' INTERSECT SELECT p.name, p.popularity FROM participants AS p JOIN performance_score AS ps ON p.id = ps.participant_id JOIN songs AS s ON ps.songs_id = s.id WHERE s.language = 'English'	sing_contest
SELECT name FROM songs WHERE name LIKE '%Is%';	sing_contest
SELECT T2.original_artist FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id = T2.id WHERE T1.rhythm_tempo > 5 ORDER BY T1.voice_sound_quality DESC	sing_contest
SELECT COUNT(*) FROM City;	address_1
SELECT count(*) FROM City	address_1
SELECT DISTINCT state FROM City;	address_1
SELECT DISTINCT state FROM City;	address_1
SELECT COUNT(DISTINCT country) FROM City;	address_1
SELECT COUNT(DISTINCT country) FROM City;	address_1
SELECT city_name, city_code, state, country FROM City;	address_1
SELECT city_name, city_code, state, country FROM City;	address_1
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'	address_1
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore';	address_1
SELECT city_name FROM City WHERE state = 'PA';	address_1
FAILED	address_1
FAILED	address_1
FAILED	address_1
SELECT City.city_name FROM City WHERE City.country = 'USA' ORDER BY City.latitude;	address_1
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude	address_1
SELECT state, COUNT(city_code) FROM City GROUP BY state;	address_1
SELECT state, COUNT(city_code) AS city_count FROM City GROUP BY state;	address_1
SELECT country, COUNT(city_code) FROM City GROUP BY country	address_1
SELECT country, COUNT(DISTINCT city_code) AS city_count FROM City GROUP BY country;	address_1
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) >= 2;	address_1
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) >= 2;	address_1
SELECT state FROM City GROUP BY state ORDER BY COUNT(city_code) DESC LIMIT 1;	address_1
SELECT state, COUNT(city_code) AS city_count FROM City GROUP BY state ORDER BY city_count DESC LIMIT 1;	address_1
SELECT country FROM City GROUP BY country ORDER BY COUNT(city_code) ASC LIMIT 1	address_1
SELECT country FROM City GROUP BY country ORDER BY COUNT(city_code) ASC LIMIT 1	address_1
SELECT Fname, LName FROM Student AS S JOIN City AS C ON S.city_code = C.city_code WHERE C.state = 'MD'	address_1
SELECT CONCAT(T1.Fname, ' ', T1.LName) FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T2.state = 'MD'	address_1
SELECT COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China';	address_1
SELECT COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China';	address_1
SELECT Student.Fname, Student.Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore';	address_1
SELECT Student.Fname, Student.Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore';	address_1
SELECT City.country, COUNT(Student.StuID) AS student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.country;	address_1
SELECT T2.country, COUNT(T1.StuID) FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.country	address_1
SELECT T2.city_name, count(*) FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.city_name	address_1
SELECT city_name, COUNT(*) AS student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY city_name;	address_1
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state ORDER BY COUNT(T1.StuID) DESC LIMIT 1	address_1
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.state ORDER BY COUNT(T1.StuID) DESC LIMIT 1;	address_1
SELECT country, COUNT(*) AS student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country ORDER BY student_count ASC LIMIT 1;	address_1
SELECT T3.country FROM Student AS T1 JOIN City AS T3 ON T1.city_code = T3.city_code GROUP BY T3.country ORDER BY COUNT(T1.StuID) ASC LIMIT 1	address_1
SELECT T2.city_name FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T1.city_code HAVING COUNT(T1.StuID) >= 3;	address_1
SELECT city_name FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY city_name HAVING COUNT(StuID) >= 3;	address_1
SELECT state FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY state HAVING COUNT(Student.StuID) > 5;	address_1
SELECT City.state FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.state HAVING COUNT(Student.StuID) > 5;	address_1
SELECT Student.StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA';	address_1
SELECT Student.StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA';	address_1
SELECT Student.StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'F' AND City.state = 'PA';	address_1
FAILED	address_1
SELECT Student.StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'male' AND City.country != 'USA';	address_1
SELECT Student.StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'male' AND City.country != 'USA';	address_1
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI';	address_1
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI';	address_1
SELECT d.distance FROM Direct_distance d JOIN City c1 ON d.city1_code = c1.city_code JOIN City c2 ON d.city2_code = c2.city_code WHERE c1.city_name = 'Boston' AND c2.city_name = 'Newark';	address_1
SELECT distance FROM Direct_distance WHERE city1_code = 'BOS' AND city2_code = 'EWR';	address_1
SELECT AVG(distance) AS average_distance, MIN(distance) AS minimum_distance, MAX(distance) AS maximum_distance FROM Direct_distance;	address_1
SELECT AVG(distance) AS average_distance, MIN(distance) AS minimum_distance, MAX(distance) AS maximum_distance FROM Direct_distance;	address_1
SELECT city1_code, city2_code FROM Direct_distance ORDER BY distance DESC LIMIT 1;	address_1
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance);	address_1
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance);	address_1
SELECT DISTINCT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)	address_1
SELECT city1_code, city2_code FROM Direct_distance WHERE distance < 1000;	address_1
SELECT DISTINCT city1_code, city2_code FROM Direct_distance WHERE distance < 1000	address_1
FAILED	address_1
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'	address_1
SELECT AVG(distance) FROM Direct_distance JOIN City AS City1 ON Direct_distance.city1_code = City1.city_code JOIN City AS City2 ON Direct_distance.city2_code = City2.city_code WHERE City1.city_name = 'Boston' OR City2.city_name = 'Boston';	address_1
SELECT AVG(distance) FROM Direct_distance JOIN City ON Direct_distance.city1_code = City.city_code WHERE City.city_name = 'Boston';	address_1
SELECT c2.city_name FROM City c1 JOIN Direct_distance d ON c1.city_code = d.city1_code JOIN City c2 ON d.city2_code = c2.city_code WHERE c1.city_name = 'Chicago' ORDER BY d.distance ASC LIMIT 1;	address_1
SELECT c2.city_name FROM Direct_distance d JOIN City c1 ON d.city1_code = c1.city_code JOIN City c2 ON d.city2_code = c2.city_code WHERE c1.city_name = 'Chicago' ORDER BY d.distance ASC LIMIT 1;	address_1
SELECT c2.city_name FROM Direct_distance dd JOIN City c1 ON dd.city1_code = c1.city_code JOIN City c2 ON dd.city2_code = c2.city_code WHERE c1.city_name = 'Boston' ORDER BY dd.distance DESC LIMIT 1;	address_1
SELECT T2.city_name FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city2_code = T2.city_code WHERE T1.city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY T1.distance DESC LIMIT 1	address_1
SELECT city1_code, SUM(distance) AS total_distance FROM Direct_distance GROUP BY city1_code;	address_1
SELECT c.city_code, SUM(d.distance) AS total_distance FROM City c JOIN Direct_distance d ON c.city_code = d.city1_code OR c.city_code = d.city2_code GROUP BY c.city_code	address_1
SELECT C1.city_name, AVG(D.distance) AS average_distance FROM City C1 JOIN Direct_distance D ON C1.city_code = D.city1_code JOIN City C2 ON D.city2_code = C2.city_code GROUP BY C1.city_name;	address_1
SELECT City.city_name, AVG(Direct_distance.distance) AS average_distance FROM Direct_distance JOIN City ON Direct_distance.city1_code = City.city_code GROUP BY City.city_name;	address_1
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'HKG';	address_1
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'HKG';	address_1
SELECT s.StuID, s.LName, s.Fname, s.city_code, d.distance FROM Student s JOIN Direct_distance d ON s.city_code = d.city2_code WHERE d.city1_code = 'BAL' ORDER BY d.distance DESC LIMIT 1;	address_1
SELECT S1.Fname || ' ' || S1.LName AS full_name FROM Student S1 JOIN City C1 ON S1.city_code = C1.city_code JOIN Direct_distance D ON C1.city_code = D.city1_code JOIN City C2 ON D.city2_code = C2.city_code JOIN Student S2 ON S2.city_code = C2.city_code WHERE S2.Fname = 'Linda' AND S2.LName = 'Smith' ORDER BY D.distance DESC LIMIT 1;	address_1
SELECT City.state FROM Student JOIN City ON Student.city_code = City.city_code WHERE Student.Fname = 'Linda';	address_1
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'	address_1
SELECT * FROM Sailors WHERE age > 30;	boat_1
SELECT name FROM Sailors WHERE age > 30	boat_1
SELECT name, age FROM Sailors WHERE age < 30;	boat_1
SELECT Sailors.name, Sailors.age FROM Sailors WHERE Sailors.age < 30;	boat_1
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid = T2.bid WHERE T1.sid = 1	boat_1
SELECT bid FROM Reserves WHERE sid = 1	boat_1
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 102)	boat_1
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 102;	boat_1
SELECT DISTINCT Reserves.bid FROM Reserves;	boat_1
SELECT DISTINCT Boats.bid FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid;	boat_1
SELECT name FROM Sailors WHERE name LIKE '%e%'	boat_1
SELECT name FROM Sailors WHERE name LIKE '%e%';	boat_1
FAILED	boat_1
SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)	boat_1
SELECT DISTINCT S1.name FROM Sailors AS S1 WHERE S1.age > (SELECT MAX(S2.age) FROM Sailors AS S2 WHERE S2.rating > 7);	boat_1
FAILED	boat_1
SELECT DISTINCT T1.name, T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid;	boat_1
SELECT DISTINCT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid;	boat_1
SELECT s.sid, s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid GROUP BY s.sid, s.name HAVING COUNT(DISTINCT r.bid) > 1;	boat_1
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid GROUP BY s.sid HAVING COUNT(DISTINCT r.bid) >= 2;	boat_1
SELECT DISTINCT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue');	boat_1
SELECT DISTINCT R.sid FROM Reserves AS R JOIN Boats AS B ON R.bid = B.bid WHERE B.color IN ('red', 'blue')	boat_1
SELECT DISTINCT T1.name, T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color IN ('red', 'blue');	boat_1
SELECT DISTINCT T1.name, T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color IN ('red', 'blue')	boat_1
SELECT DISTINCT r1.sid FROM Reserves r1 JOIN Boats b1 ON r1.bid = b1.bid JOIN Reserves r2 ON r1.sid = r2.sid JOIN Boats b2 ON r2.bid = b2.bid WHERE b1.color = 'red' AND b2.color = 'blue';	boat_1
SELECT R1.sid FROM Reserves AS R1 JOIN Boats AS B1 ON R1.bid = B1.bid JOIN Reserves AS R2 ON R1.sid = R2.sid JOIN Boats AS B2 ON R2.bid = B2.bid WHERE B1.color = 'red' AND B2.color = 'blue'	boat_1
SELECT S.name, S.sid FROM Sailors AS S WHERE S.sid IN (SELECT R.sid FROM Reserves AS R JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red') AND S.sid IN (SELECT R.sid FROM Reserves AS R JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'blue')	boat_1
SELECT S.name, S.sid FROM Sailors AS S WHERE S.sid IN (SELECT R.sid FROM Reserves AS R JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red') AND S.sid IN (SELECT R.sid FROM Reserves AS R JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'blue')	boat_1
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves);	boat_1
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves);	boat_1
SELECT Sailors.name, Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL;	boat_1
SELECT Sailors.name, Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL;	boat_1
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves);	boat_1
SELECT name FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)	boat_1
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103	boat_1
SELECT DISTINCT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103;	boat_1
SELECT S1.name FROM Sailors S1 WHERE S1.rating > (SELECT MAX(S2.rating) FROM Sailors S2 WHERE S2.name = 'Luis');	boat_1
SELECT S1.name FROM Sailors S1 WHERE S1.rating > (SELECT MAX(S2.rating) FROM Sailors S2 WHERE S2.name = 'Luis');	boat_1
SELECT S1.name FROM Sailors AS S1 WHERE S1.rating > (SELECT MAX(S2.rating) FROM Sailors AS S2 WHERE S2.name = 'Luis')	boat_1
SELECT S1.name FROM Sailors S1 WHERE S1.rating > (SELECT MAX(S2.rating) FROM Sailors S2 WHERE S2.name = 'Luis');	boat_1
SELECT S.name, S.sid FROM Sailors AS S WHERE S.rating > 2 AND S.sid IN (SELECT R.sid FROM Reserves AS R);	boat_1
SELECT T1.name, T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T1.rating >= 3	boat_1
SELECT name, age FROM Sailors ORDER BY age DESC LIMIT 1;	boat_1
SELECT name, age FROM Sailors ORDER BY age DESC LIMIT 1;	boat_1
SELECT COUNT(*) FROM Sailors;	boat_1
SELECT COUNT(*) FROM Sailors;	boat_1
SELECT AVG(age) FROM Sailors WHERE rating = 7;	boat_1
SELECT AVG(age) FROM Sailors WHERE rating = 7;	boat_1
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%';	boat_1
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%';	boat_1
SELECT AVG(rating), MAX(age) FROM Sailors;	boat_1
SELECT AVG(rating) AS average_rating, MAX(age) AS largest_age FROM Sailors;	boat_1
SELECT bid, count(*) FROM Reserves GROUP BY bid;	boat_1
SELECT bid, count(*) FROM Reserves GROUP BY bid;	boat_1
SELECT Boats.bid, COUNT(Reserves.sid) AS reservation_count FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid WHERE Boats.bid > 50 GROUP BY Boats.bid;	boat_1
SELECT bid, count(*) FROM Reserves WHERE bid > 50 GROUP BY bid;	boat_1
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid HAVING COUNT(*) > 1	boat_1
SELECT Boats.bid, Boats.name, COUNT(Reserves.sid) AS reservation_count FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY Boats.bid, Boats.name HAVING COUNT(Reserves.sid) > 1;	boat_1
SELECT B.bid, COUNT(*) AS reservation_count FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE R.sid > 1 GROUP BY B.bid;	boat_1
SELECT T2.bid, COUNT(*) FROM Reserves AS T2 JOIN Sailors AS T1 ON T2.sid = T1.sid WHERE T1.sid > 1 GROUP BY T2.bid;	boat_1
SELECT S.rating, AVG(S.age) FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating;	boat_1
SELECT S.rating, AVG(S.age) FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating;	boat_1
SELECT name, rating, age FROM Sailors ORDER BY rating, age	boat_1
SELECT name, rating, age FROM Sailors ORDER BY rating, age;	boat_1
SELECT COUNT(*) FROM Boats;	boat_1
SELECT COUNT(bid) FROM Boats;	boat_1
SELECT COUNT(bid) FROM Boats WHERE color = 'red';	boat_1
SELECT COUNT(bid) FROM Boats WHERE color = 'red';	boat_1
SELECT DISTINCT Boats.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Sailors.age BETWEEN 20 AND 30;	boat_1
SELECT DISTINCT B.name FROM Boats AS B JOIN Reserves AS R ON B.bid = R.bid JOIN Sailors AS S ON R.sid = S.sid WHERE S.age BETWEEN 20 AND 30	boat_1
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(S1.rating) FROM Sailors S1 JOIN Reserves R ON S1.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red')	boat_1
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(S2.rating) FROM Sailors S2 JOIN Reserves R ON S2.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red')	boat_1
SELECT MAX(rating) FROM Sailors;	boat_1
SELECT MAX(rating) FROM Sailors;	boat_1
SELECT DISTINCT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon'	boat_1
SELECT DISTINCT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon';	boat_1
FAILED	boat_1
SELECT name, age FROM Sailors ORDER BY rating DESC;	boat_1
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1;	headphone_store
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1;	headphone_store
SELECT Model FROM headphone ORDER BY Model ASC;	headphone_store
SELECT DISTINCT Model FROM headphone ORDER BY Model;	headphone_store
SELECT Class, COUNT(*) AS Occurrences FROM headphone GROUP BY Class ORDER BY Occurrences DESC LIMIT 1;	headphone_store
SELECT Class, COUNT(Headphone_ID) AS Headphone_Count FROM headphone GROUP BY Class ORDER BY Headphone_Count DESC LIMIT 1;	headphone_store
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) > 2;	headphone_store
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) <= 2;	headphone_store
SELECT Class, COUNT(*) AS Headphone_Count FROM headphone WHERE Price > 200 GROUP BY Class;	headphone_store
SELECT h.Class, COUNT(*) AS headphone_count FROM headphone h WHERE h.Price > 200 GROUP BY h.Class;	headphone_store
SELECT COUNT(DISTINCT Earpads) FROM headphone;	headphone_store
SELECT COUNT(DISTINCT Earpads) FROM headphone;	headphone_store
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2	headphone_store
SELECT Earpads, COUNT(*) AS Headphone_Count FROM headphone GROUP BY Earpads ORDER BY Headphone_Count DESC LIMIT 2;	headphone_store
SELECT Model, Class, Construction FROM headphone ORDER BY Price ASC LIMIT 1;	headphone_store
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone);	headphone_store
SELECT Construction, AVG(Price) AS Average_Price FROM headphone GROUP BY Construction;	headphone_store
SELECT Construction, AVG(Price) AS Average_Price FROM headphone GROUP BY Construction;	headphone_store
SELECT DISTINCT Class FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class HAVING COUNT(DISTINCT Earpads) = 2	headphone_store
SELECT DISTINCT Class FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class HAVING COUNT(DISTINCT Earpads) = 2	headphone_store
SELECT Earpads FROM headphone WHERE Construction NOT LIKE '%plastic%'	headphone_store
SELECT Earpads FROM headphone WHERE Construction != 'plastic';	headphone_store
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone);	headphone_store
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone);	headphone_store
SELECT Name FROM store ORDER BY Date_Opened;	headphone_store
SELECT Name FROM store ORDER BY Date_Opened;	headphone_store
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana';	headphone_store
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana';	headphone_store
SELECT COUNT(DISTINCT Neighborhood) FROM store	headphone_store
SELECT COUNT(DISTINCT Neighborhood) FROM store;	headphone_store
SELECT Neighborhood, COUNT(Store_ID) AS Store_Count FROM store GROUP BY Neighborhood;	headphone_store
SELECT Neighborhood, COUNT(*) AS NumberOfStores FROM store GROUP BY Neighborhood;	headphone_store
SELECT s.Name, SUM(st.Quantity) AS Total_Headphones FROM store s JOIN stock st ON s.Store_ID = st.Store_ID GROUP BY s.Store_ID ORDER BY Total_Headphones DESC LIMIT 1;	headphone_store
SELECT store.Name, SUM(stock.Quantity) AS Total_Quantity FROM store JOIN stock ON store.Store_ID = stock.Store_ID JOIN headphone ON stock.Headphone_ID = headphone.Headphone_ID GROUP BY store.Name;	headphone_store
SELECT s.Name FROM store s LEFT JOIN stock st ON s.Store_ID = st.Store_ID WHERE st.Quantity IS NULL OR st.Quantity = 0;	headphone_store
FAILED	headphone_store
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock WHERE Quantity > 0)	headphone_store
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock);	headphone_store
SELECT h.Model FROM headphone h JOIN stock s ON h.Headphone_ID = s.Headphone_ID GROUP BY h.Model ORDER BY SUM(s.Quantity) DESC LIMIT 1;	headphone_store
SELECT Model FROM headphone AS H JOIN stock AS S ON H.Headphone_ID = S.Headphone_ID GROUP BY H.Headphone_ID ORDER BY SUM(S.Quantity) DESC LIMIT 1	headphone_store
SELECT stock.Quantity FROM headphone JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman';	headphone_store
SELECT SUM(stock.Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman';	headphone_store
FAILED	headphone_store
FAILED	headphone_store
SELECT COUNT(author_id) FROM Author;	aan_1
SELECT COUNT(author_id) FROM Author;	aan_1
SELECT COUNT(*) FROM Paper;	aan_1
SELECT COUNT(*) FROM Paper;	aan_1
SELECT count(*) FROM Affiliation	aan_1
SELECT COUNT(*) FROM Affiliation;	aan_1
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000;	aan_1
SELECT count(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000	aan_1
SELECT COUNT(*) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE p.year = 2009 AND a.name = 'Columbia University';	aan_1
SELECT COUNT(*) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year = 2009;	aan_1
SELECT name, address FROM Affiliation;	aan_1
SELECT name, address FROM Affiliation	aan_1
SELECT venue, year FROM Paper ORDER BY year	aan_1
FAILED	aan_1
SELECT T2.title, T2.paper_id FROM Affiliation AS T1 JOIN Author_list AS T3 ON T1.affiliation_id = T3.affiliation_id JOIN Paper AS T2 ON T3.paper_id = T2.paper_id WHERE T1.name = 'Harvard University'	aan_1
SELECT T4.title, T4.paper_id FROM Paper AS T4 JOIN Author_list AS T2 ON T4.paper_id = T2.paper_id JOIN Affiliation AS T1 ON T2.affiliation_id = T1.affiliation_id WHERE T1.name = 'Harvard University'	aan_1
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name LIKE 'Mckeown%';	aan_1
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name LIKE '%Mckeown%';	aan_1
SELECT DISTINCT p.title, p.paper_id FROM Paper p JOIN Author_list al1 ON p.paper_id = al1.paper_id JOIN Affiliation a1 ON al1.affiliation_id = a1.affiliation_id JOIN Author_list al2 ON al1.author_id = al2.author_id JOIN Affiliation a2 ON al2.affiliation_id = a2.affiliation_id WHERE a1.name = 'Stanford University' AND a2.name = 'Columbia University';	aan_1
SELECT DISTINCT p.title, p.paper_id FROM Paper p JOIN Author_list al1 ON p.paper_id = al1.paper_id JOIN Affiliation a1 ON al1.affiliation_id = a1.affiliation_id JOIN Author_list al2 ON p.paper_id = al2.paper_id JOIN Affiliation a2 ON al2.affiliation_id = a2.affiliation_id WHERE a1.name = 'Stanford University' AND a2.name = 'Columbia University';	aan_1
FAILED	aan_1
FAILED	aan_1
FAILED	aan_1
SELECT DISTINCT p.title, p.paper_id FROM Paper p JOIN Author_list al1 ON p.paper_id = al1.paper_id JOIN Author a1 ON al1.author_id = a1.author_id WHERE a1.name = 'Mckeown' AND p.paper_id NOT IN (SELECT al2.paper_id FROM Author_list al2 JOIN Author a2 ON al2.author_id = a2.author_id WHERE a2.name = 'Rambow')	aan_1
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('Mckeown, Kathleen', 'Rambow, Owen');	aan_1
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('Mckeown, Kathleen', 'Rambow, Owen');	aan_1
SELECT Author.name, COUNT(Paper.paper_id) AS number_of_papers FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Author.name ORDER BY number_of_papers DESC;	aan_1
SELECT T2.name, COUNT(T1.paper_id) AS paper_count FROM Author_list AS T1 JOIN Author AS T2 ON T1.author_id = T2.author_id GROUP BY T2.author_id ORDER BY paper_count DESC	aan_1
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.affiliation_id ORDER BY COUNT(T2.paper_id) ASC	aan_1
SELECT a.name FROM Affiliation a JOIN Author_list al ON a.affiliation_id = al.affiliation_id GROUP BY a.name ORDER BY COUNT(al.paper_id) DESC;	aan_1
SELECT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) > 50	aan_1
SELECT T2.name FROM Author AS T2 WHERE T2.author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) > 50)	aan_1
SELECT A.name FROM Author AS A WHERE A.author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) = 1);	aan_1
SELECT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id GROUP BY a.author_id HAVING COUNT(al.paper_id) = 1;	aan_1
SELECT venue, year, COUNT(*) AS publication_count FROM Paper GROUP BY venue, year ORDER BY publication_count DESC LIMIT 1;	aan_1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(paper_id) DESC LIMIT 1;	aan_1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(paper_id) ASC LIMIT 1;	aan_1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(paper_id) ASC LIMIT 1	aan_1
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002';	aan_1
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002';	aan_1
SELECT COUNT(*) FROM Citation WHERE paper_id = 'D12-1027';	aan_1
SELECT COUNT(*) FROM Citation WHERE paper_id = 'D12-1027';	aan_1
SELECT paper_id, COUNT(*) AS citation_count FROM Citation GROUP BY paper_id ORDER BY citation_count DESC LIMIT 1;	aan_1
SELECT Paper.paper_id, COUNT(Citation.cited_paper_id) AS citation_count FROM Paper JOIN Citation ON Paper.paper_id = Citation.cited_paper_id GROUP BY Paper.paper_id ORDER BY citation_count DESC LIMIT 1;	aan_1
SELECT p.title FROM Paper p JOIN Citation c ON p.paper_id = c.paper_id GROUP BY p.paper_id ORDER BY COUNT(c.cited_paper_id) DESC LIMIT 1;	aan_1
SELECT p.title FROM Paper p JOIN Citation c ON p.paper_id = c.paper_id GROUP BY p.paper_id ORDER BY COUNT(c.cited_paper_id) DESC LIMIT 1;	aan_1
SELECT p.title, COUNT(c.cited_paper_id) AS citation_count FROM Paper p JOIN Citation c ON p.paper_id = c.cited_paper_id GROUP BY p.paper_id ORDER BY citation_count DESC LIMIT 10;	aan_1
SELECT p.title, COUNT(c.cited_paper_id) AS citation_count FROM Paper p JOIN Citation c ON p.paper_id = c.cited_paper_id GROUP BY p.paper_id ORDER BY citation_count DESC LIMIT 10;	aan_1
FAILED	aan_1
FAILED	aan_1
FAILED	aan_1
FAILED	aan_1
SELECT T2.name, COUNT(T1.cited_paper_id) AS citation_count FROM Citation AS T1 JOIN Author_list AS T3 ON T1.paper_id = T3.paper_id JOIN Author AS T2 ON T3.author_id = T2.author_id GROUP BY T2.author_id ORDER BY citation_count DESC LIMIT 1	aan_1
SELECT a.name, COUNT(c.cited_paper_id) AS citation_count FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Paper p ON al.paper_id = p.paper_id JOIN Citation c ON p.paper_id = c.paper_id GROUP BY a.author_id ORDER BY citation_count DESC LIMIT 1;	aan_1
FAILED	aan_1
FAILED	aan_1
SELECT T4.venue, T4.year FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T4 ON T2.paper_id = T4.paper_id WHERE T1.name = 'Columbia University'	aan_1
SELECT T4.venue, T4.year FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T4 ON T2.paper_id = T4.paper_id WHERE T1.name = 'Columbia University'	aan_1
SELECT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Paper p ON al.paper_id = p.paper_id WHERE p.year = 2009 GROUP BY a.author_id ORDER BY COUNT(p.paper_id) DESC LIMIT 1;	aan_1
SELECT Author.name FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY Author.author_id ORDER BY COUNT(Paper.paper_id) DESC LIMIT 1;	aan_1
SELECT T2.name FROM Affiliation AS T2 JOIN Author_list AS T1 ON T2.affiliation_id = T1.affiliation_id JOIN Paper AS T3 ON T1.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T2.name ORDER BY COUNT(T3.paper_id) DESC LIMIT 3	aan_1
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.affiliation_id ORDER BY COUNT(T3.paper_id) DESC LIMIT 3	aan_1
SELECT count(*) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University' AND T1.year <= 2009	aan_1
SELECT COUNT(*) FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Affiliation AS A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University' AND P.year <= 2009	aan_1
SELECT count(*) FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Affiliation AS A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Stanford University' AND P.year BETWEEN 2000 AND 2009	aan_1
SELECT COUNT(*) FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Affiliation AS A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Stanford University' AND P.year BETWEEN 2000 AND 2009	aan_1
SELECT T4.title FROM Paper AS T4 JOIN Author_list AS T2 ON T4.paper_id = T2.paper_id GROUP BY T4.paper_id ORDER BY COUNT(T2.author_id) DESC LIMIT 1;	aan_1
SELECT P.title FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id GROUP BY P.paper_id ORDER BY COUNT(AL.author_id) DESC LIMIT 1;	aan_1
FAILED	aan_1
FAILED	aan_1
FAILED	aan_1
FAILED	aan_1
SELECT Paper.paper_id FROM Paper WHERE Paper.title LIKE '%translation%'	aan_1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'	aan_1
SELECT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL;	aan_1
SELECT Paper.paper_id, Paper.title FROM Paper LEFT JOIN Citation ON Paper.paper_id = Citation.cited_paper_id WHERE Citation.cited_paper_id IS NULL;	aan_1
SELECT a.name FROM Affiliation a JOIN Author_list al ON a.affiliation_id = al.affiliation_id JOIN Paper p ON al.paper_id = p.paper_id WHERE a.address LIKE '%China%' GROUP BY a.name ORDER BY COUNT(p.paper_id) DESC LIMIT 1;	aan_1
SELECT A.name FROM Affiliation AS A JOIN Author_list AS AL ON A.affiliation_id = AL.affiliation_id WHERE A.address LIKE '%China%' GROUP BY A.affiliation_id ORDER BY COUNT(AL.paper_id) DESC LIMIT 1	aan_1
SELECT year, venue, COUNT(DISTINCT paper_id) AS paper_count FROM Paper GROUP BY year, venue;	aan_1
SELECT Paper.venue, Paper.year, COUNT(Paper.paper_id) AS paper_count FROM Paper GROUP BY Paper.venue, Paper.year;	aan_1
SELECT a.name, COUNT(p.paper_id) AS paper_count FROM Affiliation a JOIN Author_list al ON a.affiliation_id = al.affiliation_id JOIN Paper p ON al.paper_id = p.paper_id GROUP BY a.name;	aan_1
SELECT a.name, COUNT(al.paper_id) AS paper_count FROM Affiliation a JOIN Author_list al ON a.affiliation_id = al.affiliation_id GROUP BY a.name;	aan_1
SELECT p.title FROM Paper p JOIN Citation c ON p.paper_id = c.paper_id GROUP BY p.paper_id HAVING COUNT(c.cited_paper_id) > 50;	aan_1
SELECT Paper.title FROM Paper JOIN Citation ON Paper.paper_id = Citation.paper_id GROUP BY Paper.paper_id HAVING COUNT(Citation.cited_paper_id) > 50;	aan_1
SELECT A.name FROM Author AS A WHERE A.author_id NOT IN (SELECT AL.author_id FROM Author_list AS AL JOIN Paper AS P ON AL.paper_id = P.paper_id JOIN Citation AS C ON P.paper_id = C.paper_id GROUP BY AL.author_id HAVING COUNT(C.cited_paper_id) > 50)	aan_1
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50))	aan_1
SELECT DISTINCT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Paper p ON al.paper_id = p.paper_id WHERE p.year = 2009 AND p.venue IN ('NAACL', 'ACL') GROUP BY a.name HAVING COUNT(DISTINCT p.venue) = 2;	aan_1
SELECT DISTINCT a.name FROM Author a JOIN Author_list al1 ON a.author_id = al1.author_id JOIN Paper p1 ON al1.paper_id = p1.paper_id JOIN Author_list al2 ON a.author_id = al2.author_id JOIN Paper p2 ON al2.paper_id = p2.paper_id WHERE p1.venue = 'NAACL' AND p1.year = 2009 AND p2.venue = 'ACL' AND p2.year = 2009;	aan_1
SELECT a.name FROM Author a WHERE a.author_id NOT IN (SELECT al.author_id FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue = 'ACL');	aan_1
SELECT DISTINCT a.name FROM Author a WHERE a.author_id NOT IN (SELECT al.author_id FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue = 'ACL')	aan_1
SELECT COUNT(*) FROM conference;	conference
SELECT COUNT(*) FROM conference;	conference
SELECT DISTINCT Conference_Name FROM conference;	conference
SELECT DISTINCT Conference_Name FROM conference;	conference
SELECT Conference_Name, Year, Location FROM conference	conference
SELECT Conference_Name, Year, Location FROM conference;	conference
SELECT c.Conference_Name, COUNT(cp.Conference_ID) AS Conference_Count FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name;	conference
SELECT Conference_Name, COUNT(*) AS Occurrences FROM conference GROUP BY Conference_Name;	conference
SELECT Year, COUNT(*) FROM conference GROUP BY Year	conference
SELECT Year, COUNT(*) AS Number_of_Conferences FROM conference GROUP BY Year;	conference
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(Conference_ID) ASC LIMIT 1	conference
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(Conference_ID) ASC LIMIT 1	conference
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2	conference
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2	conference
SELECT Institution_Name, Location, Founded FROM institution;	conference
SELECT Institution_Name, Location, Founded FROM institution;	conference
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900;	conference
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900;	conference
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1	conference
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1;	conference
SELECT i.Institution_Name, COUNT(s.staff_ID) AS Staff_Count FROM institution i LEFT JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_Name;	conference
SELECT i.Institution_Name, COUNT(s.staff_ID) AS Staff_Count, GROUP_CONCAT(s.name) AS Staff_Names FROM institution i LEFT JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_ID, i.Institution_Name;	conference
SELECT Institution_Name FROM institution LEFT JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE staff.staff_ID IS NULL;	conference
SELECT Institution_Name FROM institution LEFT JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE staff.staff_ID IS NULL;	conference
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff);	conference
SELECT s.name FROM staff s WHERE s.Age > (SELECT AVG(Age) FROM staff);	conference
SELECT max(Age), min(Age) FROM staff WHERE Nationality = 'United States'	conference
SELECT MAX(Age) AS Max_Age, MIN(Age) AS Min_Age FROM staff;	conference
SELECT DISTINCT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID WHERE s.Nationality = 'Canada';	conference
SELECT DISTINCT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T3.Nationality = 'Canada'	conference
SELECT s.name FROM staff s JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID JOIN conference_participation cp2 ON s.staff_ID = cp2.staff_ID WHERE cp1.Conference_ID = cp2.Conference_ID AND cp1.role = 'speaker' AND cp2.role = 'sponsor';	conference
SELECT s.name FROM staff s JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID JOIN conference_participation cp2 ON s.staff_ID = cp2.staff_ID WHERE cp1.Conference_ID = cp2.Conference_ID AND cp1.role = 'speaker' AND cp2.role = 'sponsor';	conference
SELECT s.name FROM staff s JOIN conference_participation cp1 ON s.staff_ID = cp1.staff_ID JOIN conference c1 ON cp1.Conference_ID = c1.Conference_ID JOIN conference_participation cp2 ON s.staff_ID = cp2.staff_ID JOIN conference c2 ON cp2.Conference_ID = c2.Conference_ID WHERE c1.Conference_Name = 'ACL' AND c2.Conference_Name = 'Naccl';	conference
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID = (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL')) AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID = (SELECT Conference_ID FROM conference WHERE Conference_Name = 'NACCL'));	conference
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year IN (2003, 2004);	conference
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_ID = T2.staff_ID JOIN conference AS T3 ON T1.Conference_ID = T3.Conference_ID WHERE T3.Year IN (2003, 2004);	conference
SELECT c.Conference_Name, c.Year, COUNT(cp.staff_ID) AS Participant_Count FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name, c.Year;	conference
SELECT c.Conference_ID, c.Conference_Name, c.Year, COUNT(cp.staff_ID) AS Number_of_Participants FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name, c.Year;	conference
SELECT Conference_Name FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID GROUP BY Conference_Name ORDER BY COUNT(DISTINCT staff_ID) DESC LIMIT 2;	conference
SELECT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID ORDER BY COUNT(cp.staff_ID) DESC LIMIT 2;	conference
SELECT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name LIKE '%ACL%')	conference
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))	conference
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year = 2004)));	conference
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT Institution_ID FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year = 2004)));	conference
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
FAILED	pilot_1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1;	pilot_1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1	pilot_1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1	pilot_1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(pilot_name) ASC LIMIT 1	pilot_1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) ASC LIMIT 1	pilot_1
SELECT count(*) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location = 'Chicago'	pilot_1
SELECT count(*) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location = 'Chicago'	pilot_1
SELECT T1.plane_name FROM PilotSkills AS T1 WHERE T1.pilot_name = 'Smith' AND T1.age = 41	pilot_1
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41	pilot_1
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills;	pilot_1
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills	pilot_1
SELECT COUNT(*) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name = 'Smith';	pilot_1
SELECT COUNT(*) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE PilotSkills.pilot_name = 'Smith';	pilot_1
SELECT COUNT(plane_name) FROM PilotSkills WHERE age > 40;	pilot_1
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40;	pilot_1
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC;	pilot_1
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC;	pilot_1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC	pilot_1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC;	pilot_1
SELECT Hangar.plane_name, Hangar.location FROM Hangar ORDER BY Hangar.plane_name;	pilot_1
SELECT Hangar.location, Hangar.plane_name FROM Hangar ORDER BY Hangar.plane_name;	pilot_1
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name;	pilot_1
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name;	pilot_1
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30;	pilot_1
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30;	pilot_1
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30);	pilot_1
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30);	pilot_1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber');	pilot_1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber');	pilot_1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber';	pilot_1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'	pilot_1
SELECT AVG(age) AS average_age, MIN(age) AS smallest_age FROM PilotSkills;	pilot_1
SELECT AVG(age), MIN(age) FROM PilotSkills	pilot_1
FAILED	pilot_1
SELECT DISTINCT p.pilot_name FROM PilotSkills p JOIN Hangar h ON p.plane_name = h.plane_name WHERE h.location = 'Austin' INTERSECT SELECT DISTINCT p.pilot_name FROM PilotSkills p JOIN Hangar h ON p.plane_name = h.plane_name WHERE h.location = 'Boston';	pilot_1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' OR plane_name = 'F-14 Fighter';	pilot_1
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')	pilot_1
SELECT plane_name, AVG(age) FROM PilotSkills GROUP BY plane_name	pilot_1
SELECT plane_name, AVG(age) FROM PilotSkills GROUP BY plane_name	pilot_1
SELECT plane_name, COUNT(*) FROM Hangar GROUP BY plane_name;	pilot_1
SELECT plane_name, COUNT(*) FROM PilotSkills GROUP BY plane_name;	pilot_1
SELECT p.plane_name, p.pilot_name FROM PilotSkills p JOIN (SELECT plane_name, MAX(age) AS max_age FROM PilotSkills GROUP BY plane_name) AS max_p ON p.plane_name = max_p.plane_name AND p.age = max_p.max_age ORDER BY p.plane_name;	pilot_1
FAILED	pilot_1
FAILED	pilot_1
SELECT p.plane_name, p.pilot_name FROM PilotSkills p JOIN (SELECT plane_name, MAX(age) AS max_age FROM PilotSkills GROUP BY plane_name) AS max_pilot ON p.plane_name = max_pilot.plane_name AND p.age = max_pilot.max_age;	pilot_1
SELECT pilot_name, MAX(age) AS max_age FROM PilotSkills GROUP BY pilot_name;	pilot_1
SELECT pilot_name, MAX(age) AS max_age FROM PilotSkills GROUP BY pilot_name;	pilot_1
SELECT Hangar.location, COUNT(DISTINCT PilotSkills.pilot_name) AS number_of_pilots, AVG(PilotSkills.age) AS average_age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY Hangar.location;	pilot_1
SELECT Hangar.location, COUNT(PilotSkills.pilot_name) AS number_of_pilots, AVG(PilotSkills.age) AS average_age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY Hangar.location;	pilot_1
SELECT plane_name, COUNT(pilot_name) AS num_pilots FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35;	pilot_1
SELECT ps.plane_name, COUNT(ps.pilot_name) AS pilot_count FROM PilotSkills ps GROUP BY ps.plane_name HAVING AVG(ps.age) < 35;	pilot_1
SELECT Hangar.location FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name ORDER BY PilotSkills.age ASC LIMIT 1;	pilot_1
SELECT location FROM Hangar WHERE plane_name = (SELECT plane_name FROM PilotSkills ORDER BY age ASC LIMIT 1)	pilot_1
SELECT pilot_name, age FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin');	pilot_1
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin';	pilot_1
FAILED	pilot_1
SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > (SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name;	pilot_1
SELECT COUNT(*) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter')	pilot_1
SELECT COUNT(*) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter');	pilot_1
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%';	pilot_1
SELECT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'	pilot_1
FAILED	pilot_1
SELECT COUNT(*) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub');	pilot_1
SELECT Name FROM district ORDER BY Area_km DESC LIMIT 1;	district_spokesman
SELECT Area_km, Government_website FROM district ORDER BY Population ASC LIMIT 1;	district_spokesman
SELECT district.Name, district.Population FROM district WHERE district.Area_km > (SELECT AVG(Area_km) FROM district);	district_spokesman
SELECT MAX(Area_km) AS Max_Area, AVG(Area_km) AS Avg_Area FROM district;	district_spokesman
SELECT SUM(Population) FROM district ORDER BY Area_km DESC LIMIT 3;	district_spokesman
SELECT district.District_ID, district.Name, district.Government_website FROM district ORDER BY district.Population;	district_spokesman
SELECT Name FROM district WHERE Government_website LIKE '%.gov%'	district_spokesman
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000;	district_spokesman
SELECT spokesman.Name, spokesman.Speach_title FROM spokesman;	district_spokesman
SELECT AVG(Points) AS Average_Points, AVG(Age) AS Average_Age FROM spokesman WHERE Rank_position = 1;	district_spokesman
SELECT spokesman.Name, spokesman.Points FROM spokesman WHERE spokesman.Age < 40;	district_spokesman
SELECT Name FROM spokesman ORDER BY Age DESC LIMIT 1	district_spokesman
SELECT Name, Points FROM spokesman WHERE Points < (SELECT AVG(Points) FROM spokesman);	district_spokesman
SELECT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.Name ORDER BY COUNT(sd.Spokesman_ID) DESC LIMIT 1;	district_spokesman
SELECT Name FROM spokesman WHERE Spokesman_ID IN (SELECT Spokesman_ID FROM spokesman_district WHERE Start_year < 2004)	district_spokesman
SELECT district.Name, COUNT(spokesman.Spokesman_ID) AS Spokesman_Count FROM district JOIN spokesman_district ON district.District_ID = spokesman_district.District_ID JOIN spokesman ON spokesman_district.Spokesman_ID = spokesman.Spokesman_ID GROUP BY district.Name;	district_spokesman
SELECT DISTINCT d.Name FROM district d JOIN spokesman_district sd1 ON d.District_ID = sd1.District_ID JOIN spokesman s1 ON sd1.Spokesman_ID = s1.Spokesman_ID JOIN spokesman_district sd2 ON d.District_ID = sd2.District_ID JOIN spokesman s2 ON sd2.Spokesman_ID = s2.Spokesman_ID WHERE s1.Rank_position = 1 AND s2.Rank_position = 2;	district_spokesman
SELECT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.Name HAVING COUNT(sd.Spokesman_ID) > 1;	district_spokesman
SELECT COUNT(DISTINCT district.District_ID) FROM district LEFT JOIN spokesman_district ON district.District_ID = spokesman_district.District_ID WHERE spokesman_district.Spokesman_ID IS NULL;	district_spokesman
SELECT s.Name FROM spokesman s LEFT JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.District_ID IS NULL;	district_spokesman
SELECT SUM(d.Population) AS Total_Population, AVG(d.Population) AS Average_Population FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID;	district_spokesman
SELECT title FROM Sculptures ORDER BY year DESC LIMIT 1;	art_1
SELECT title FROM Sculptures ORDER BY year DESC LIMIT 1;	art_1
SELECT title, location FROM Paintings ORDER BY year ASC LIMIT 1	art_1
SELECT title, location FROM Paintings ORDER BY year ASC LIMIT 1;	art_1
SELECT Sculptures.title FROM Sculptures WHERE Sculptures.location = 'Gallery 226';	art_1
SELECT Sculptures.title FROM Sculptures WHERE Sculptures.location = 'Gallery 226';	art_1
SELECT title, location FROM Paintings	art_1
SELECT title, location FROM Paintings;	art_1
SELECT title, location FROM Sculptures;	art_1
SELECT Sculptures.title, Sculptures.location FROM Sculptures;	art_1
SELECT medium FROM Paintings WHERE paintingID = 80;	art_1
SELECT medium FROM Paintings WHERE paintingID = 80	art_1
SELECT fname, lname FROM Artists WHERE birthYear > 1850;	art_1
SELECT fname, lname FROM Artists WHERE birthYear > 1850;	art_1
SELECT Sculptures.title, Sculptures.year FROM Sculptures WHERE Sculptures.location <> 'gallery 226';	art_1
SELECT Sculptures.title, Sculptures.year FROM Sculptures WHERE Sculptures.location != 'gallery 226';	art_1
SELECT DISTINCT fname, lname FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.year < 1900;	art_1
SELECT DISTINCT fname, lname FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.year < 1900;	art_1
SELECT DISTINCT Artists.birthYear FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.year > 1920;	art_1
SELECT DISTINCT Artists.birthYear FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.year > 1920;	art_1
SELECT fname, lname FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1;	art_1
SELECT fname, lname FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1	art_1
SELECT MIN(deathYear - birthYear) AS shortest_life_age FROM Artists;	art_1
SELECT MIN(deathYear - birthYear) AS shortest_life FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL;	art_1
SELECT fname, (deathYear - birthYear) AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists);	art_1
SELECT fname, (deathYear - birthYear) AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists);	art_1
SELECT COUNT(*) FROM Paintings WHERE location = 'Gallery 240';	art_1
FAILED	art_1
SELECT T1.fname, T1.lname, COUNT(T2.paintingID) FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID GROUP BY T1.artistID ORDER BY (T1.deathYear - T1.birthYear) DESC LIMIT 1	art_1
SELECT a.artistID, a.fname, a.lname, COUNT(p.paintingID) AS painting_count FROM Artists a LEFT JOIN Paintings p ON a.artistID = p.painterID GROUP BY a.artistID ORDER BY (a.deathYear - a.birthYear) DESC LIMIT 1;	art_1
SELECT Paintings.title, Paintings.year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary';	art_1
SELECT Paintings.title, Paintings.year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary';	art_1
SELECT Paintings.width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850;	art_1
SELECT Paintings.width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850;	art_1
SELECT T2.location, T2.medium FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T1.fname = 'Pablo'	art_1
SELECT Paintings.location, Paintings.medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo';	art_1
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID;	art_1
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID;	art_1
FAILED	art_1
FAILED	art_1
SELECT Artists.birthYear FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.mediumOn = 'canvas' AND Paintings.year = 1884;	art_1
SELECT Artists.birthYear FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year = 1884;	art_1
FAILED	art_1
FAILED	art_1
SELECT medium, COUNT(*) AS work_count FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) GROUP BY medium;	art_1
SELECT medium, COUNT(*) AS work_count FROM ( SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures ) AS combined_works GROUP BY medium;	art_1
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium	art_1
SELECT medium, AVG(height_mm) AS average_height FROM Paintings GROUP BY medium;	art_1
SELECT location, count(*) FROM Paintings WHERE year < 1900 GROUP BY location	art_1
SELECT location, COUNT(*) FROM Paintings WHERE year < 1900 GROUP BY location;	art_1
SELECT Paintings.title FROM Paintings WHERE Paintings.year > 1910 AND Paintings.medium = 'oil';	art_1
SELECT Paintings.title FROM Paintings WHERE Paintings.medium = 'oil' AND Paintings.year > 1910;	art_1
FAILED	art_1
FAILED	art_1
FAILED	art_1
FAILED	art_1
SELECT DISTINCT p1.paintingID FROM Paintings p1 WHERE p1.year < (SELECT MIN(p2.year) FROM Paintings p2 WHERE p2.location = 'gallery 240')	art_1
FAILED	art_1
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1;	art_1
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1;	art_1
SELECT A.fname, A.lname FROM Artists AS A JOIN Sculptures AS S ON A.artistID = S.sculptorID WHERE S.title LIKE '%female%'	art_1
SELECT CONCAT(T1.fname, ' ', T1.lname) FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.title LIKE '%female%'	art_1
SELECT DISTINCT title FROM Paintings ORDER BY title;	art_1
SELECT DISTINCT title FROM Paintings ORDER BY title;	art_1
FAILED	art_1
SELECT DISTINCT title FROM Paintings ORDER BY height_mm ASC;	art_1
SELECT Paintings.title FROM Paintings WHERE Paintings.year BETWEEN 1900 AND 1950 UNION SELECT Sculptures.title FROM Sculptures WHERE Sculptures.year BETWEEN 1900 AND 1950;	art_1
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950	art_1
SELECT Paintings.title, Sculptures.title FROM Artists LEFT JOIN Paintings ON Artists.artistID = Paintings.painterID LEFT JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Artists.artistID = 222;	art_1
SELECT Paintings.title, Sculptures.title FROM Artists LEFT JOIN Paintings ON Artists.artistID = Paintings.painterID LEFT JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Artists.artistID = 222;	art_1
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID ORDER BY COUNT(paintingID) DESC LIMIT 1;	art_1
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID ORDER BY COUNT(paintingID) DESC LIMIT 1;	art_1
SELECT fname FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID GROUP BY fname ORDER BY COUNT(Sculptures.sculptureID) DESC LIMIT 1;	art_1
SELECT fname FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) DESC LIMIT 1);	art_1
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800;	art_1
SELECT Paintings.title FROM Paintings WHERE width_mm < 600 OR height_mm > 800;	art_1
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930;	art_1
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930;	art_1
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000;	art_1
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000;	art_1
FAILED	art_1
SELECT DISTINCT p1.location FROM Paintings p1 JOIN Paintings p2 ON p1.location = p2.location WHERE p1.mediumOn = 'panel' AND p2.mediumOn = 'canvas';	art_1
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930;	art_1
FAILED	art_1
SELECT AVG(height_mm) AS avg_height, AVG(width_mm) AS avg_width FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241';	art_1
SELECT AVG(height_mm) AS average_height, AVG(width_mm) AS average_width FROM Paintings WHERE medium = 'oil' AND location = '241';	art_1
FAILED	art_1
SELECT height_mm, paintingID FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1;	art_1
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year;	art_1
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year;	art_1
SELECT T2.fname, T2.lname, AVG(T1.height_mm) AS avg_height, AVG(T1.width_mm) AS avg_width FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID GROUP BY T2.artistID ORDER BY T2.lname, T2.fname	art_1
SELECT T2.fname, T2.lname, AVG(T1.height_mm) AS avg_height, AVG(T1.width_mm) AS avg_width FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID GROUP BY T2.artistID ORDER BY T2.lname, T2.fname	art_1
SELECT fname, COUNT(paintingID) FROM Artists JOIN Paintings ON artistID = painterID GROUP BY artistID HAVING COUNT(paintingID) >= 2;	art_1
SELECT fname, COUNT(paintingID) AS painting_count FROM Artists JOIN Paintings ON artistID = painterID GROUP BY artistID HAVING COUNT(paintingID) >= 2;	art_1
SELECT A.deathYear FROM Artists AS A WHERE A.artistID IN (SELECT painterID FROM Paintings GROUP BY painterID HAVING COUNT(*) <= 3);	art_1
SELECT Artists.artistID, Artists.fname, Artists.lname, Artists.deathYear FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.artistID HAVING COUNT(Paintings.paintingID) < 4;	art_1
SELECT a.deathYear FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID GROUP BY a.artistID ORDER BY COUNT(s.sculptureID) ASC LIMIT 1;	art_1
SELECT A.artistID, A.lname, A.fname, A.deathYear FROM Artists A LEFT JOIN Sculptures S ON A.artistID = S.sculptorID GROUP BY A.artistID ORDER BY COUNT(S.sculptureID) ASC LIMIT 1;	art_1
FAILED	art_1
SELECT height_mm, paintingID FROM Paintings WHERE width_mm = (SELECT MAX(width_mm) FROM Paintings WHERE location = 'gallery 240') AND location = 'gallery 240'	art_1
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240');	art_1
FAILED	art_1
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)	art_1
SELECT paintingID FROM Paintings WHERE height_mm > 816;	art_1
SELECT T1.fname, T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' GROUP BY T1.artistID ORDER BY COUNT(T2.paintingID) DESC LIMIT 3	art_1
SELECT T1.fname, T1.lname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' GROUP BY T1.artistID ORDER BY COUNT(T2.paintingID) DESC LIMIT 1	art_1
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year;	art_1
SELECT Paintings.paintingID, Paintings.location, Paintings.title FROM Paintings WHERE Paintings.medium = 'oil' ORDER BY Paintings.year;	art_1
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title;	art_1
SELECT Paintings.year, Paintings.location, Paintings.title FROM Paintings WHERE Paintings.height_mm > 1000 ORDER BY Paintings.title;	art_1
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures);	art_1
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)	art_1
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas';	art_1
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas'	art_1
SELECT COUNT(*) FROM race;	car_road_race
SELECT COUNT(*) FROM race;	car_road_race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC;	car_road_race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team;	car_road_race
SELECT DISTINCT r.Winning_driver FROM race r JOIN driver d ON r.Driver_ID = d.Driver_ID WHERE r.Winning_driver = r.Pole_Position AND r.Winning_driver != 'Junior Strous';	car_road_race
SELECT Winning_driver FROM race WHERE Race_Name IN (SELECT Race_Name FROM race WHERE Pole_Position != 'Junior Strous')	car_road_race
SELECT Constructor FROM driver ORDER BY Age ASC	car_road_race
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC;	car_road_race
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20;	car_road_race
SELECT DISTINCT d.Entrant FROM driver d WHERE d.Age >= 20;	car_road_race
SELECT MAX(Age) AS Max_Age, MIN(Age) AS Min_Age FROM driver;	car_road_race
SELECT MAX(Age), MIN(Age) FROM driver	car_road_race
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20	car_road_race
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20;	car_road_race
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC;	car_road_race
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC;	car_road_race
SELECT T1.Driver_Name, T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID	car_road_race
FAILED	car_road_race
SELECT d.Driver_Name, COUNT(r.Race_Name) FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_Name;	car_road_race
SELECT driver.Driver_ID, driver.Driver_Name, COUNT(race.Race_Name) AS Race_Count FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID, driver.Driver_Name;	car_road_race
SELECT d.Age FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID ORDER BY COUNT(r.Race_Name) DESC LIMIT 1;	car_road_race
SELECT d.Age FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID ORDER BY COUNT(r.Race_Name) DESC LIMIT 1;	car_road_race
SELECT d.Driver_Name, d.Age FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID HAVING COUNT(r.Race_Name) >= 2;	car_road_race
SELECT Driver_Name, Age FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) >= 2)	car_road_race
SELECT DISTINCT r.Race_Name FROM race r JOIN driver d ON r.Driver_ID = d.Driver_ID WHERE d.Age >= 26;	car_road_race
SELECT DISTINCT T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T1.Age >= 26	car_road_race
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'	car_road_race
FAILED	car_road_race
SELECT Constructor, COUNT(Driver_ID) AS Driver_Count FROM driver GROUP BY Constructor;	car_road_race
SELECT Constructor, COUNT(DISTINCT Driver_ID) AS Number_of_Drivers FROM driver GROUP BY Constructor;	car_road_race
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1	car_road_race
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1;	car_road_race
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) >= 2;	car_road_race
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) >= 2	car_road_race
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race);	car_road_race
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race);	car_road_race
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30;	car_road_race
SELECT DISTINCT d1.Constructor FROM driver d1 JOIN driver d2 ON d1.Constructor = d2.Constructor WHERE d1.Age < 20 AND d2.Age > 30;	car_road_race
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*) > 1;	car_road_race
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*) > 1	car_road_race
SELECT DISTINCT d.Driver_Name FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Pole_Position IN ('James Hinchcliffe', 'Carl Skerlong') GROUP BY d.Driver_Name HAVING COUNT(DISTINCT r.Pole_Position) = 2;	car_road_race
SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe') AND Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong')	car_road_race
SELECT DISTINCT d.Driver_Name FROM driver d WHERE d.Driver_ID NOT IN (SELECT r.Driver_ID FROM race r WHERE r.Pole_Position = 'James Hinchcliffe');	car_road_race
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Pole_Position FROM race) AND Driver_Name != 'James Hinchcliffe';	car_road_race
SELECT count(*) FROM languages	country_language
SELECT COUNT(*) FROM languages;	country_language
SELECT name FROM languages ORDER BY name ASC;	country_language
SELECT name FROM languages ORDER BY name;	country_language
SELECT name FROM languages WHERE name LIKE '%ish%'	country_language
SELECT name FROM languages WHERE name LIKE '%ish%'	country_language
SELECT name FROM countries ORDER BY overall_score DESC;	country_language
SELECT countries.name FROM countries ORDER BY countries.overall_score DESC;	country_language
SELECT AVG(justice_score) FROM countries	country_language
SELECT AVG(justice_score) FROM countries;	country_language
SELECT MAX(health_score), MIN(health_score) FROM countries WHERE name != 'Norway'	country_language
SELECT MAX(c.health_score) AS max_health_score, MIN(c.health_score) AS min_health_score FROM countries c WHERE c.name != 'Norway';	country_language
SELECT COUNT(DISTINCT language_id) FROM official_languages;	country_language
SELECT COUNT(DISTINCT language_id) FROM official_languages;	country_language
SELECT countries.name FROM countries ORDER BY countries.education_score DESC;	country_language
SELECT countries.name FROM countries ORDER BY countries.education_score DESC;	country_language
SELECT c.name FROM countries c ORDER BY c.politics_score DESC LIMIT 1;	country_language
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1;	country_language
SELECT T2.name, T1.name FROM countries AS T2 JOIN official_languages AS T3 ON T2.id = T3.country_id JOIN languages AS T1 ON T3.language_id = T1.id;	country_language
SELECT T2.name, T1.name FROM countries AS T2 JOIN official_languages AS T3 ON T2.id = T3.country_id JOIN languages AS T1 ON T3.language_id = T1.id	country_language
SELECT T1.name, COUNT(T2.country_id) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id	country_language
SELECT l.name, COUNT(DISTINCT c.id) AS country_count FROM official_languages ol JOIN languages l ON ol.language_id = l.id JOIN countries c ON ol.country_id = c.id GROUP BY l.name;	country_language
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id ORDER BY COUNT(T2.country_id) DESC LIMIT 1	country_language
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id ORDER BY COUNT(T2.language_id) DESC LIMIT 1	country_language
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(DISTINCT country_id) >= 2)	country_language
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(DISTINCT country_id) >= 2)	country_language
SELECT AVG(countries.overall_score) FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English';	country_language
SELECT AVG(c.overall_score) FROM countries AS c JOIN official_languages AS ol ON c.id = ol.country_id JOIN languages AS l ON ol.language_id = l.id WHERE l.name = 'English'	country_language
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id ORDER BY COUNT(T2.language_id) DESC LIMIT 3	country_language
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id ORDER BY COUNT(T2.country_id) DESC LIMIT 3	country_language
SELECT l.name, AVG(c.overall_score) AS average_overall_score FROM official_languages ol JOIN languages l ON ol.language_id = l.id JOIN countries c ON ol.country_id = c.id GROUP BY l.name ORDER BY average_overall_score DESC;	country_language
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id JOIN countries AS T3 ON T2.country_id = T3.id GROUP BY T1.id ORDER BY AVG(T3.overall_score) DESC	country_language
SELECT c.name FROM countries c JOIN official_languages ol ON c.id = ol.country_id GROUP BY c.id ORDER BY COUNT(ol.language_id) DESC LIMIT 1;	country_language
SELECT c.name FROM countries c JOIN official_languages ol ON c.id = ol.country_id GROUP BY c.id ORDER BY COUNT(ol.language_id) DESC LIMIT 1;	country_language
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages);	country_language
FAILED	country_language
SELECT countries.name FROM countries LEFT JOIN official_languages ON countries.id = official_languages.country_id WHERE official_languages.country_id IS NULL;	country_language
SELECT countries.name FROM countries LEFT JOIN official_languages ON countries.id = official_languages.country_id WHERE official_languages.country_id IS NULL;	country_language
SELECT DISTINCT l.name FROM languages l JOIN official_languages ol1 ON l.id = ol1.language_id JOIN countries c1 ON ol1.country_id = c1.id JOIN official_languages ol2 ON l.id = ol2.language_id JOIN countries c2 ON ol2.country_id = c2.id WHERE c1.overall_score > 95 AND c2.overall_score < 90;	country_language
SELECT DISTINCT l.name FROM languages l JOIN official_languages ol1 ON l.id = ol1.language_id JOIN countries c1 ON ol1.country_id = c1.id JOIN official_languages ol2 ON l.id = ol2.language_id JOIN countries c2 ON ol2.country_id = c2.id WHERE c1.overall_score > 95 AND c2.overall_score < 90;	country_language
SELECT DISTINCT country, town_city FROM Addresses;	real_estate_rentals
SELECT Addresses.country, Addresses.town_city FROM Addresses;	real_estate_rentals
SELECT Properties.property_id, Addresses.county_state_province FROM Properties JOIN Addresses ON Properties.property_address_id = Addresses.address_id;	real_estate_rentals
SELECT T2.county_state_province FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id = T2.address_id	real_estate_rentals
SELECT feature_description FROM Features WHERE feature_name = 'rooftop';	real_estate_rentals
SELECT feature_description FROM Features WHERE feature_name = 'rooftop';	real_estate_rentals
SELECT f.feature_id, f.feature_name, f.feature_description FROM Features f JOIN ( SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1 ) pf ON f.feature_id = pf.feature_id;	real_estate_rentals
SELECT f.feature_name, f.feature_description FROM Features f JOIN Property_Features pf ON f.feature_id = pf.feature_id GROUP BY f.feature_id ORDER BY COUNT(pf.property_id) DESC LIMIT 1;	real_estate_rentals
SELECT MIN(room_count) FROM Properties	real_estate_rentals
SELECT MIN(room_count) FROM Properties;	real_estate_rentals
SELECT count(*) FROM Properties WHERE parking_lots = 1 OR garage_yn = 'Y'	real_estate_rentals
FAILED	real_estate_rentals
FAILED	real_estate_rentals
SELECT DISTINCT Ref_Age_Categories.age_category_description FROM Users JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE Users.other_user_details LIKE '%Mother%'	real_estate_rentals
SELECT u.first_name FROM Users u JOIN Properties p ON u.user_id = p.owner_user_id GROUP BY u.user_id ORDER BY COUNT(p.property_id) DESC LIMIT 1;	real_estate_rentals
SELECT first_name FROM Users WHERE user_id = (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1);	real_estate_rentals
SELECT AVG(P.room_count) FROM Properties AS P JOIN Property_Features AS PF ON P.property_id = PF.property_id JOIN Features AS F ON PF.feature_id = F.feature_id WHERE F.feature_name = 'garden'	real_estate_rentals
FAILED	real_estate_rentals
SELECT DISTINCT A.town_city FROM Properties AS P JOIN Addresses AS A ON P.property_address_id = A.address_id JOIN Property_Features AS PF ON P.property_id = PF.property_id JOIN Features AS F ON PF.feature_id = F.feature_id WHERE F.feature_name = 'swimming pool'	real_estate_rentals
FAILED	real_estate_rentals
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1;	real_estate_rentals
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1;	real_estate_rentals
SELECT AVG(room_count) FROM Properties	real_estate_rentals
SELECT AVG(room_count) FROM Properties;	real_estate_rentals
SELECT COUNT(DISTINCT room_size) FROM Rooms	real_estate_rentals
SELECT COUNT(DISTINCT room_size) FROM Rooms;	real_estate_rentals
FAILED	real_estate_rentals
SELECT user_id, search_seq FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2);	real_estate_rentals
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1;	real_estate_rentals
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1;	real_estate_rentals
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC;	real_estate_rentals
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC;	real_estate_rentals
SELECT A.zip_postcode FROM Properties AS P JOIN Addresses AS A ON P.property_address_id = A.address_id WHERE P.owner_user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) > 2);	real_estate_rentals
SELECT DISTINCT a.zip_postcode FROM Properties p JOIN Users u ON p.owner_user_id = u.user_id JOIN Addresses a ON p.property_address_id = a.address_id WHERE u.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) > 2)	real_estate_rentals
SELECT Users.user_id, Ref_User_Categories.user_category_description FROM Users JOIN Ref_User_Categories ON Users.user_category_code = Ref_User_Categories.user_category_code JOIN User_Searches ON Users.user_id = User_Searches.user_id GROUP BY Users.user_id HAVING COUNT(User_Searches.search_seq) = 1;	real_estate_rentals
SELECT u.user_id, u.user_category_code FROM Users u JOIN User_Searches us ON u.user_id = us.user_id GROUP BY u.user_id HAVING COUNT(us.search_seq) = 1;	real_estate_rentals
SELECT RAC.age_category_description FROM User_Searches US JOIN Users U ON US.user_id = U.user_id JOIN Ref_Age_Categories RAC ON U.age_category_code = RAC.age_category_code ORDER BY US.search_datetime ASC LIMIT 1;	real_estate_rentals
SELECT RAC.age_category_description FROM User_Searches AS US JOIN Users AS U ON US.user_id = U.user_id JOIN Ref_Age_Categories AS RAC ON U.age_category_code = RAC.age_category_code ORDER BY US.search_datetime ASC LIMIT 1	real_estate_rentals
FAILED	real_estate_rentals
FAILED	real_estate_rentals
SELECT COUNT(*) FROM User_Searches us JOIN Users u ON us.user_id = u.user_id WHERE u.is_buyer = 'Y'	real_estate_rentals
SELECT COUNT(*) FROM User_Searches us JOIN Users u ON us.user_id = u.user_id WHERE u.is_buyer = 1;	real_estate_rentals
SELECT date_registered FROM Users WHERE login_name = 'ratione';	real_estate_rentals
SELECT date_registered FROM Users WHERE login_name = 'ratione';	real_estate_rentals
FAILED	real_estate_rentals
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1;	real_estate_rentals
FAILED	real_estate_rentals
FAILED	real_estate_rentals
SELECT COUNT(DISTINCT p.property_id) FROM Properties p JOIN Property_Features pf ON p.property_id = pf.property_id GROUP BY p.property_id HAVING COUNT(pf.feature_id) >= 2;	real_estate_rentals
SELECT COUNT(DISTINCT p.property_id) FROM Properties p JOIN Property_Features pf ON p.property_id = pf.property_id GROUP BY p.property_id HAVING COUNT(pf.feature_id) >= 2;	real_estate_rentals
SELECT p.property_id, COUNT(pp.photo_seq) AS photo_count FROM Properties p LEFT JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY p.property_id;	real_estate_rentals
SELECT property_id, COUNT(photo_seq) AS photo_count FROM Property_Photos GROUP BY property_id;	real_estate_rentals
SELECT U.user_id, COUNT(PP.photo_seq) FROM Users AS U JOIN Properties AS P ON U.user_id = P.owner_user_id JOIN Property_Photos AS PP ON P.property_id = PP.property_id GROUP BY U.user_id	real_estate_rentals
SELECT p.owner_user_id, COUNT(pp.photo_seq) AS photo_count FROM Properties p JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY p.owner_user_id;	real_estate_rentals
SELECT SUM(p.price_max) AS total_max_price FROM Properties p JOIN Users u ON p.owner_user_id = u.user_id WHERE u.user_category_code IN (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description IN ('Single Mother', 'Student'));	real_estate_rentals
SELECT MAX(T1.vendor_requested_price) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id = T2.user_id WHERE T2.user_category_code IN (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description IN ('Single Mother', 'Student'))	real_estate_rentals
SELECT User_Property_History.datestamp, Properties.property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp;	real_estate_rentals
SELECT User_Property_History.datestamp, Properties.property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp;	real_estate_rentals
SELECT Ref_Property_Types.property_type_code, Ref_Property_Types.property_type_description FROM Properties JOIN Ref_Property_Types ON Properties.property_type_code = Ref_Property_Types.property_type_code GROUP BY Properties.property_type_code ORDER BY COUNT(Properties.property_type_code) DESC LIMIT 1;	real_estate_rentals
SELECT T2.property_type_description, COUNT(*) AS count FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_code ORDER BY count DESC LIMIT 1	real_estate_rentals
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60';	real_estate_rentals
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60';	real_estate_rentals
SELECT room_size, COUNT(*) AS size_count FROM Rooms GROUP BY room_size;	real_estate_rentals
SELECT room_size, COUNT(*) AS room_count FROM Rooms GROUP BY room_size;	real_estate_rentals
SELECT T2.country FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = 'Robbie'	real_estate_rentals
SELECT a.country FROM Users u JOIN Addresses a ON u.user_address_id = a.address_id WHERE u.first_name = 'Robbie';	real_estate_rentals
SELECT U.first_name, U.middle_name, U.last_name FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id;	real_estate_rentals
SELECT CONCAT(U.first_name, ' ', U.middle_name, ' ', U.last_name) AS full_name FROM Users AS U JOIN Properties AS P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id	real_estate_rentals
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties);	real_estate_rentals
SELECT us.search_string FROM Users u JOIN User_Searches us ON u.user_id = us.user_id LEFT JOIN Properties p ON u.user_id = p.owner_user_id WHERE p.property_id IS NULL;	real_estate_rentals
SELECT U.last_name, U.user_id FROM Users AS U JOIN Properties AS P ON U.user_id = P.owner_user_id JOIN User_Searches AS US ON U.user_id = US.user_id GROUP BY U.user_id HAVING COUNT(DISTINCT P.property_id) >= 2 AND COUNT(DISTINCT US.search_seq) <= 2	real_estate_rentals
FAILED	real_estate_rentals
SELECT COUNT(*) FROM bike WHERE weight > 780;	bike_racing
SELECT product_name, weight FROM bike ORDER BY price ASC;	bike_racing
SELECT heat, name, nation FROM cyclist;	bike_racing
SELECT MAX(weight), MIN(weight) FROM bike;	bike_racing
SELECT AVG(bike.price) FROM bike WHERE bike.material = 'Carbon CC';	bike_racing
SELECT cyclist.name, cyclist.result FROM cyclist WHERE cyclist.nation != 'Russia';	bike_racing
SELECT DISTINCT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id WHERE cyclists_own_bikes.purchase_year > 2015;	bike_racing
SELECT b.id, b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id WHERE b.product_name LIKE '%racing%' GROUP BY b.id, b.product_name HAVING COUNT(DISTINCT cob.cyclist_id) >= 4;	bike_racing
SELECT cyclist.id, cyclist.name FROM cyclist JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id GROUP BY cyclist.id, cyclist.name ORDER BY COUNT(cyclists_own_bikes.bike_id) DESC LIMIT 1;	bike_racing
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id = T3.id WHERE T3.nation IN ('Russia', 'Great Britain')	bike_racing
SELECT COUNT(DISTINCT heat) FROM cyclist;	bike_racing
SELECT COUNT(*) FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015)	bike_racing
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.result < '4:21.558';	bike_racing
There is no bike owned by both Bradley Wiggins and Antonio Tauler.	bike_racing
SELECT cyclist.name, cyclist.nation, cyclist.result FROM cyclist LEFT JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id WHERE cyclists_own_bikes.bike_id IS NULL;	bike_racing
SELECT product_name FROM bike WHERE material LIKE '%fiber%'	bike_racing
SELECT cyclists_own_bikes.cyclist_id, COUNT(cyclists_own_bikes.bike_id) AS bike_count FROM cyclists_own_bikes GROUP BY cyclists_own_bikes.cyclist_id ORDER BY cyclists_own_bikes.cyclist_id;	bike_racing
FAILED	bakery_1
SELECT Id, Flavor FROM goods WHERE Food = 'Cake' ORDER BY Price DESC LIMIT 1;	bakery_1
There are no entries with the food type 'cookie' in the goods table.	bakery_1
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' ORDER BY Price ASC LIMIT 1;	bakery_1
SELECT Id FROM goods WHERE LOWER(Flavor) = 'apple';	bakery_1
SELECT Id FROM goods WHERE Flavor = 'apple';	bakery_1
SELECT Id FROM goods WHERE Price < 3;	bakery_1
SELECT Id FROM goods WHERE Price < 3;	bakery_1
FAILED	bakery_1
SELECT DISTINCT receipts.CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Flavor = 'lemon' AND goods.Food = 'cake';	bakery_1
SELECT g.Food, COUNT(DISTINCT r.CustomerId) AS CustomerCount FROM goods g JOIN items i ON g.Id = i.Item JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food;	bakery_1
SELECT g.Food, COUNT(DISTINCT r.CustomerId) AS CustomerCount FROM goods g JOIN items i ON g.Id = i.Item JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food;	bakery_1
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) >= 15;	bakery_1
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) >= 15;	bakery_1
SELECT c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) > 10;	bakery_1
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(*) > 10);	bakery_1
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'cake';	bakery_1
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'Cake';	bakery_1
SELECT Flavor FROM goods WHERE Food = 'Croissant';	bakery_1
FAILED	bakery_1
SELECT DISTINCT items.Item FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt WHERE receipts.CustomerId = 15;	bakery_1
SELECT DISTINCT T2.Item FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt WHERE T1.CustomerId = 15	bakery_1
SELECT Food, AVG(Price) AS AveragePrice, MAX(Price) AS MaximumPrice, MIN(Price) AS MinimumPrice FROM goods GROUP BY Food;	bakery_1
SELECT Food, AVG(Price) AS AveragePrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food;	bakery_1
SELECT r.ReceiptNumber FROM receipts r JOIN items i1 ON r.ReceiptNumber = i1.Receipt JOIN goods g1 ON i1.Item = g1.Id JOIN items i2 ON r.ReceiptNumber = i2.Receipt JOIN goods g2 ON i2.Item = g2.Id WHERE g1.Food = 'Cake' AND g2.Food = 'Cookie';	bakery_1
FAILED	bakery_1
SELECT receipts.ReceiptNumber FROM receipts JOIN customers ON receipts.CustomerId = customers.Id JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE customers.LastName = 'LOGAN' AND goods.Food = 'Croissant';	bakery_1
SELECT receipts.ReceiptNumber FROM receipts JOIN customers ON receipts.CustomerId = customers.Id JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE customers.LastName = 'Logan' AND goods.Food = 'croissant';	bakery_1
SELECT T3.ReceiptNumber, T3.Date FROM receipts AS T3 JOIN items AS T2 ON T3.ReceiptNumber = T2.Receipt JOIN goods AS T1 ON T2.Item = T1.Id ORDER BY T1.Price DESC LIMIT 1	bakery_1
SELECT T3.ReceiptNumber, T3.Date FROM receipts AS T3 JOIN items AS T2 ON T3.ReceiptNumber = T2.Receipt JOIN goods AS T1 ON T2.Item = T1.Id ORDER BY T1.Price DESC LIMIT 1	bakery_1
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) ASC LIMIT 1;	bakery_1
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) ASC LIMIT 1	bakery_1
SELECT Food, COUNT(*) AS NumberOfGoods FROM goods GROUP BY Food;	bakery_1
SELECT Food, COUNT(*) FROM goods GROUP BY Food;	bakery_1
SELECT Food, AVG(Price) AS AveragePrice FROM goods GROUP BY Food;	bakery_1
SELECT Food, AVG(Price) AS AveragePrice FROM goods GROUP BY Food;	bakery_1
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5	bakery_1
SELECT goods.Id FROM goods WHERE goods.Flavor = 'Apricot' AND goods.Price < 5;	bakery_1
SELECT Flavor FROM goods WHERE Food = 'cake' AND Price > 10	bakery_1
SELECT Flavor FROM goods WHERE Food = 'cake' AND Price > 10;	bakery_1
SELECT DISTINCT g.Id, g.Price FROM goods g WHERE g.Price < (SELECT AVG(Price) FROM goods);	bakery_1
SELECT DISTINCT g.Id, g.Price FROM goods AS g WHERE g.Price < (SELECT AVG(Price) FROM goods);	bakery_1
FAILED	bakery_1
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT MIN(g2.Price) FROM goods g2 WHERE g2.Food = 'Tart')	bakery_1
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price > 13;	bakery_1
SELECT DISTINCT receipts.ReceiptNumber FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price > 13;	bakery_1
SELECT DISTINCT receipts.Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price > 15;	bakery_1
SELECT receipts.Date FROM receipts JOIN customers ON receipts.CustomerId = customers.Id JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price > 15;	bakery_1
SELECT Id FROM goods WHERE Id LIKE '%APP%'	bakery_1
SELECT Id FROM goods WHERE Id LIKE '%APP%'	bakery_1
SELECT Price FROM goods WHERE Id LIKE '%70%'	bakery_1
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'	bakery_1
SELECT LastName FROM customers ORDER BY LastName ASC	bakery_1
SELECT LastName FROM customers ORDER BY LastName;	bakery_1
SELECT Id FROM goods ORDER BY Id;	bakery_1
SELECT DISTINCT Id FROM goods ORDER BY Id	bakery_1
SELECT DISTINCT T3.ReceiptNumber FROM receipts AS T3 JOIN items AS T2 ON T3.ReceiptNumber = T2.Receipt JOIN goods AS T1 ON T2.Item = T1.Id WHERE (T1.Flavor = 'apple' AND T1.Food = 'pie') OR T3.CustomerId = 12;	bakery_1
SELECT DISTINCT T3.ReceiptNumber FROM receipts AS T3 JOIN items AS T2 ON T3.ReceiptNumber = T2.Receipt JOIN goods AS T1 ON T2.Item = T1.Id WHERE (T1.Flavor = 'apple' AND T1.Food = 'pie') OR T3.CustomerId = 12	bakery_1
SELECT receipts.ReceiptNumber, receipts.Date FROM receipts WHERE receipts.Date = (SELECT MAX(Date) FROM receipts);	bakery_1
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1;	bakery_1
SELECT receipts.ReceiptNumber, receipts.Date, goods.Id, goods.Flavor, goods.Food, goods.Price FROM receipts LEFT JOIN items ON receipts.ReceiptNumber = items.Receipt LEFT JOIN goods ON items.Item = goods.Id WHERE receipts.Date = (SELECT MIN(Date) FROM receipts) OR goods.Price > 10;	bakery_1
SELECT ReceiptNumber FROM receipts WHERE Date = (SELECT MIN(Date) FROM receipts) OR ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10))	bakery_1
SELECT Id FROM goods WHERE Food IN ('Cookies', 'Cakes') AND Price BETWEEN 3 AND 7;	bakery_1
SELECT Id FROM goods WHERE Food IN ('Cookies', 'Cakes') AND Price BETWEEN 3 AND 7;	bakery_1
SELECT FirstName, LastName FROM customers WHERE Id = (SELECT CustomerId FROM receipts ORDER BY Date ASC LIMIT 1)	bakery_1
SELECT CONCAT(T2.FirstName, ' ', T2.LastName) FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId = T2.Id ORDER BY T1.Date ASC LIMIT 1	bakery_1
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry');	bakery_1
FAILED	bakery_1
SELECT MIN(goods.Price) FROM goods WHERE goods.Flavor = 'cheese';	bakery_1
FAILED	bakery_1
SELECT Flavor, MAX(Price) AS HighestPrice, MIN(Price) AS LowestPrice, AVG(Price) AS AveragePrice FROM goods GROUP BY Flavor;	bakery_1
SELECT Flavor, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice, AVG(Price) AS AvgPrice FROM goods GROUP BY Flavor ORDER BY Flavor;	bakery_1
SELECT Food, MIN(Price) AS LowestPrice, MAX(Price) AS HighestPrice FROM goods GROUP BY Food ORDER BY Food;	bakery_1
SELECT Food, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food ORDER BY Food	bakery_1
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3	bakery_1
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3	bakery_1
SELECT c.FirstName, c.LastName, COUNT(r.ReceiptNumber) AS ReceiptCount FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id ORDER BY ReceiptCount DESC LIMIT 1;	bakery_1
SELECT r.CustomerId, COUNT(r.ReceiptNumber) AS NumberOfPurchases FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt GROUP BY r.CustomerId ORDER BY NumberOfPurchases DESC LIMIT 1;	bakery_1
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date;	bakery_1
SELECT receipts.Date, COUNT(DISTINCT receipts.CustomerId) AS NumberOfCustomers FROM receipts GROUP BY receipts.Date;	bakery_1
FAILED	bakery_1
FAILED	bakery_1
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price < (SELECT MIN(Price) FROM goods WHERE Food = 'Croissant');	bakery_1
SELECT g1.Id FROM goods AS g1 WHERE g1.Food = 'cookie' AND g1.Price < (SELECT MIN(g2.Price) FROM goods AS g2 WHERE g2.Food = 'croissant');	bakery_1
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')	bakery_1
SELECT g1.Id FROM goods AS g1 WHERE g1.Food = 'Cake' AND g1.Price >= (SELECT AVG(g2.Price) FROM goods AS g2 WHERE g2.Food = 'Tart')	bakery_1
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods);	bakery_1
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods);	bakery_1
SELECT Id, Flavor, Food FROM goods ORDER BY Price;	bakery_1
SELECT Id, Flavor, Food FROM goods ORDER BY Price;	bakery_1
SELECT Id, Flavor FROM goods WHERE Food = 'Cake' ORDER BY Flavor;	bakery_1
SELECT Id, Flavor FROM goods WHERE Food = 'cake' ORDER BY Flavor;	bakery_1
FAILED	bakery_1
SELECT g.Food, g.Flavor, COUNT(*) AS PurchaseCount FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'chocolate' GROUP BY g.Food, g.Flavor HAVING COUNT(*) <= 10;	bakery_1
SELECT DISTINCT g1.Flavor FROM goods AS g1 WHERE g1.Food = 'Cake' AND g1.Flavor NOT IN (SELECT g2.Flavor FROM goods AS g2 WHERE g2.Food = 'Tart');	bakery_1
FAILED	bakery_1
SELECT g.Food, g.Flavor, COUNT(i.Item) AS popularity FROM goods g JOIN items i ON g.Id = i.Item GROUP BY g.Id ORDER BY popularity DESC LIMIT 3;	bakery_1
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) DESC LIMIT 3	bakery_1
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150;	bakery_1
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150;	bakery_1
FAILED	bakery_1
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5;	bakery_1
SELECT receipts.Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY receipts.Date HAVING SUM(goods.Price) > 100;	bakery_1
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100;	bakery_1
SELECT COUNT(*) FROM driver;	car_racing
SELECT COUNT(Driver_ID) FROM driver;	car_racing
SELECT Make, COUNT(*) AS Driver_Count FROM driver WHERE Points > 150 GROUP BY Make;	car_racing
SELECT Make, COUNT(Driver_ID) AS Driver_Count FROM driver WHERE Points > 150 GROUP BY Make;	car_racing
SELECT Make, AVG(Age) AS Average_Age FROM driver GROUP BY Make;	car_racing
SELECT Make, AVG(Age) FROM driver GROUP BY Make	car_racing
SELECT AVG(Laps) FROM driver WHERE Age < 20;	car_racing
SELECT AVG(driver.Laps) FROM driver WHERE driver.Age < 20;	car_racing
SELECT Manager, Sponsor, Car_Owner FROM team ORDER BY Car_Owner;	car_racing
SELECT team.Manager, team.Sponsor, team.Car_Owner FROM team ORDER BY team.Car_Owner;	car_racing
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1	car_racing
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1;	car_racing
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington';	car_racing
SELECT t.Make FROM team t WHERE t.Car_Owner = 'Buddy Arrington'	car_racing
SELECT MAX(Points) AS Max_Points, MIN(Points) AS Min_Points FROM driver;	car_racing
SELECT MAX(Points) AS Highest_Points, MIN(Points) AS Lowest_Points FROM driver	car_racing
SELECT COUNT(*) FROM driver WHERE Points < 150;	car_racing
SELECT COUNT(*) FROM driver WHERE Points < 150;	car_racing
SELECT driver.Driver FROM driver ORDER BY driver.Age ASC;	car_racing
SELECT driver.Driver FROM driver ORDER BY driver.Age ASC	car_racing
SELECT Driver FROM driver ORDER BY Points DESC;	car_racing
SELECT Driver FROM driver ORDER BY Points DESC	car_racing
SELECT driver.Driver, driver.Country FROM driver;	car_racing
SELECT Driver, Country FROM driver;	car_racing
SELECT MAX(T2.Points) FROM driver AS T2 JOIN country AS T1 ON T2.Country = T1.Country WHERE T1.Capital = 'Dublin'	car_racing
FAILED	car_racing
FAILED	car_racing
FAILED	car_racing
SELECT DISTINCT country.Country FROM country JOIN driver ON country.Country = driver.Country WHERE driver.Points > 150;	car_racing
SELECT DISTINCT d.Country FROM driver d WHERE d.Points > 150;	car_racing
FAILED	car_racing
FAILED	car_racing
SELECT Make, COUNT(Driver_ID) AS Number_of_Drivers FROM driver GROUP BY Make;	car_racing
SELECT d.Make, COUNT(d.Driver_ID) AS Number_of_Drivers FROM driver d GROUP BY d.Make;	car_racing
SELECT Make, COUNT(Driver_ID) AS Driver_Count FROM driver GROUP BY Make ORDER BY Driver_Count DESC;	car_racing
SELECT Make, COUNT(Driver_ID) AS Driver_Count FROM driver GROUP BY Make ORDER BY Driver_Count DESC LIMIT 1;	car_racing
FAILED	car_racing
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3;	car_racing
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver);	car_racing
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver);	car_racing
SELECT DISTINCT d.Country FROM driver d WHERE d.Make IN ('Dodge', 'Chevrolet') GROUP BY d.Country HAVING COUNT(DISTINCT d.Make) = 2;	car_racing
FAILED	car_racing
SELECT SUM(driver.Points) AS Total_Points, AVG(driver.Points) AS Average_Points FROM driver;	car_racing
SELECT driver.Driver_ID, driver.Driver, SUM(driver.Points) AS Total_Points, AVG(driver.Points) AS Average_Points FROM driver GROUP BY driver.Driver_ID, driver.Driver;	car_racing
SELECT c.Country FROM country c WHERE NOT EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country);	car_racing
SELECT country.Country FROM country LEFT JOIN driver ON country.Country = driver.Country WHERE driver.Country IS NULL;	car_racing
SELECT t.Manager, t.Sponsor FROM team t JOIN team_driver td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID ORDER BY COUNT(td.Driver_ID) DESC LIMIT 1;	car_racing
SELECT Manager, Sponsor FROM team WHERE Team_ID = (SELECT Team_ID FROM team_driver GROUP BY Team_ID ORDER BY COUNT(Driver_ID) DESC LIMIT 1);	car_racing
SELECT t.Manager, t.Car_Owner FROM team t JOIN team_driver td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID HAVING COUNT(td.Driver_ID) >= 2;	car_racing
SELECT t.Manager, t.Car_Owner FROM team t JOIN team_driver td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID HAVING COUNT(td.Driver_ID) >= 2;	car_racing
SELECT COUNT(*) FROM institution;	institution_sports
SELECT COUNT(*) FROM institution;	institution_sports
SELECT Name FROM institution ORDER BY Name ASC;	institution_sports
SELECT Name FROM institution ORDER BY Name;	institution_sports
SELECT Name FROM institution ORDER BY Founded ASC	institution_sports
SELECT Name FROM institution ORDER BY Founded;	institution_sports
SELECT City, Province FROM institution;	institution_sports
SELECT City, Province FROM institution;	institution_sports
SELECT MAX(Enrollment) AS Max_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM institution;	institution_sports
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution;	institution_sports
SELECT Affiliation FROM institution WHERE City != 'Vancouver'	institution_sports
SELECT Affiliation FROM institution WHERE City != 'Vancouver';	institution_sports
SELECT Stadium, Capacity FROM institution ORDER BY Capacity DESC	institution_sports
SELECT Stadium, Capacity FROM institution ORDER BY Capacity DESC	institution_sports
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution);	institution_sports
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1;	institution_sports
SELECT institution.Name, Championship.Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID;	institution_sports
SELECT institution.Name, Championship.Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID;	institution_sports
SELECT c.Nickname FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID ORDER BY i.Enrollment ASC LIMIT 1;	institution_sports
SELECT Nickname FROM Championship AS C JOIN institution AS I ON C.Institution_ID = I.Institution_ID ORDER BY I.Enrollment ASC LIMIT 1	institution_sports
FAILED	institution_sports
SELECT i.Name, SUM(c.Number_of_Championships) AS Total_Championships FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID GROUP BY i.Name ORDER BY Total_Championships DESC;	institution_sports
SELECT DISTINCT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID WHERE c.Number_of_Championships >= 1;	institution_sports
SELECT DISTINCT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID WHERE c.Number_of_Championships >= 1;	institution_sports
SELECT SUM(Number_of_Championships) FROM Championship AS C JOIN institution AS I ON C.Institution_ID = I.Institution_ID WHERE I.Affiliation = 'Public'	institution_sports
SELECT SUM(Number_of_Championships) FROM Championship AS C JOIN institution AS I ON C.Institution_ID = I.Institution_ID WHERE I.Affiliation = 'Public'	institution_sports
SELECT Affiliation, COUNT(*) FROM institution GROUP BY Affiliation;	institution_sports
SELECT Affiliation, COUNT(*) FROM institution GROUP BY Affiliation;	institution_sports
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1	institution_sports
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1;	institution_sports
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1;	institution_sports
SELECT Founded, COUNT(Institution_ID) AS Number_of_Institutions_Founded FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1;	institution_sports
SELECT T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Capacity DESC	institution_sports
SELECT T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Capacity DESC	institution_sports
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary');	institution_sports
SELECT Enrollment FROM institution WHERE City IN ('Vancouver', 'Calgary')	institution_sports
SELECT DISTINCT i1.Province FROM institution AS i1 JOIN institution AS i2 ON i1.Province = i2.Province WHERE i1.Founded < 1920 AND i2.Founded > 1950;	institution_sports
SELECT DISTINCT i1.Province FROM institution AS i1 WHERE i1.Founded < 1920 AND i1.Province IN (SELECT i2.Province FROM institution AS i2 WHERE i2.Founded > 1950);	institution_sports
SELECT count(DISTINCT Province) FROM institution	institution_sports
SELECT COUNT(DISTINCT Province) FROM institution;	institution_sports
SELECT * FROM Warehouses	warehouse_1
SELECT * FROM Warehouses;	warehouse_1
SELECT DISTINCT Boxes.Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York';	warehouse_1
SELECT Boxes.Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York';	warehouse_1
SELECT Boxes.Contents FROM Boxes WHERE Boxes.Value > 150;	warehouse_1
SELECT Boxes.Contents FROM Boxes WHERE Boxes.Value > 150;	warehouse_1
SELECT Warehouses.Code, AVG(Boxes.Value) AS AverageValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code;	warehouse_1
SELECT Warehouse, AVG(Value) AS AverageValue FROM Boxes GROUP BY Warehouse;	warehouse_1
SELECT AVG(Boxes.Value) AS AverageValue, SUM(Boxes.Value) AS TotalValue FROM Boxes;	warehouse_1
SELECT AVG(Value) AS AverageValue, SUM(Value) AS TotalValue FROM Boxes;	warehouse_1
SELECT AVG(Capacity), SUM(Capacity) FROM Warehouses	warehouse_1
SELECT AVG(Capacity) AS AverageCapacity, SUM(Capacity) AS TotalCapacity FROM Warehouses;	warehouse_1
SELECT Contents, AVG(Value) AS AverageValue, MAX(Value) AS MaximumValue FROM Boxes GROUP BY Contents;	warehouse_1
SELECT Contents, AVG(Value) AS AverageValue, MAX(Value) AS MaximumValue FROM Boxes GROUP BY Contents;	warehouse_1
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY SUM(Value) DESC LIMIT 1	warehouse_1
SELECT Contents FROM Boxes ORDER BY Value DESC LIMIT 1;	warehouse_1
SELECT AVG(Boxes.Value) FROM Boxes;	warehouse_1
SELECT AVG(Boxes.Value) FROM Boxes;	warehouse_1
SELECT DISTINCT Contents FROM Boxes;	warehouse_1
SELECT DISTINCT Contents FROM Boxes;	warehouse_1
SELECT COUNT(DISTINCT Contents) FROM Boxes;	warehouse_1
SELECT COUNT(DISTINCT Contents) FROM Boxes;	warehouse_1
SELECT DISTINCT Location FROM Warehouses;	warehouse_1
SELECT DISTINCT Location FROM Warehouses	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
FAILED	warehouse_1
SELECT Boxes.Code, Boxes.Contents FROM Boxes ORDER BY Boxes.Value ASC LIMIT 1;	warehouse_1
SELECT Boxes.Code, Boxes.Contents FROM Boxes ORDER BY Boxes.Value ASC LIMIT 1;	warehouse_1
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes);	warehouse_1
SELECT b1.Contents FROM Boxes b1 WHERE b1.Value > (SELECT AVG(b2.Value) FROM Boxes b2);	warehouse_1
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents	warehouse_1
SELECT Contents FROM Boxes ORDER BY Contents ASC	warehouse_1
SELECT b1.Code FROM Boxes b1 WHERE b1.Value > (SELECT MAX(b2.Value) FROM Boxes b2 WHERE b2.Contents = 'Rocks')	warehouse_1
SELECT b1.Code FROM Boxes b1 WHERE b1.Value > (SELECT MAX(b2.Value) FROM Boxes b2 WHERE b2.Contents = 'Rocks')	warehouse_1
SELECT b1.Code, b1.Contents FROM Boxes b1 WHERE b1.Value > (SELECT MAX(b2.Value) FROM Boxes b2 WHERE b2.Contents = 'Scissors')	warehouse_1
SELECT Boxes.Code, Boxes.Contents FROM Boxes WHERE Boxes.Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Scissors');	warehouse_1
SELECT SUM(Boxes.Value) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Warehouses.Capacity = (SELECT MAX(Capacity) FROM Warehouses);	warehouse_1
SELECT SUM(Boxes.Value) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Warehouses.Capacity = (SELECT MAX(Capacity) FROM Warehouses);	warehouse_1
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse HAVING AVG(Value) > 150;	warehouse_1
SELECT Warehouses.Code, AVG(Boxes.Value) AS AverageValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING AVG(Boxes.Value) > 150;	warehouse_1
SELECT Contents, SUM(Value) AS TotalValue, COUNT(*) AS NumberOfBoxes FROM Boxes GROUP BY Contents;	warehouse_1
SELECT Contents, SUM(Value) AS TotalValue, COUNT(*) AS NumberOfBoxes FROM Boxes GROUP BY Contents;	warehouse_1
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaximumCapacity FROM Warehouses GROUP BY Location;	warehouse_1
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaximumCapacity FROM Warehouses GROUP BY Location;	warehouse_1
SELECT SUM(Capacity) FROM Warehouses;	warehouse_1
SELECT SUM(Capacity) FROM Warehouses;	warehouse_1
SELECT Warehouses.Location, MAX(Boxes.Value) AS MaxValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location;	warehouse_1
SELECT Warehouses.Location, MAX(Boxes.Value) AS MaxValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location;	warehouse_1
SELECT Warehouses.Code, COUNT(Boxes.Code) AS BoxCount FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code;	warehouse_1
SELECT Warehouses.Code, COUNT(Boxes.Code) AS BoxCount FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code;	warehouse_1
SELECT COUNT(DISTINCT T2.Location) FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T1.Contents = 'Rocks'	warehouse_1
SELECT COUNT(DISTINCT Warehouses.Code) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks';	warehouse_1
SELECT Boxes.Code, Warehouses.Location FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code;	warehouse_1
SELECT Boxes.Code, Warehouses.Location FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code;	warehouse_1
SELECT B.Code FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code WHERE W.Location = 'Chicago'	warehouse_1
SELECT Boxes.Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago';	warehouse_1
SELECT Warehouses.Code, COUNT(Boxes.Code) AS BoxCount FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code;	warehouse_1
SELECT Warehouse, count(*) FROM Boxes GROUP BY Warehouse;	warehouse_1
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) AS DistinctContentTypes FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code;	warehouse_1
SELECT Warehouse, COUNT(DISTINCT Contents) AS DistinctContentTypes FROM Boxes GROUP BY Warehouse;	warehouse_1
SELECT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING SUM(Boxes.Value) > Warehouses.Capacity;	warehouse_1
SELECT Warehouses.Code FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING COUNT(Boxes.Code) > Warehouses.Capacity;	warehouse_1
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')	warehouse_1
SELECT SUM(Boxes.Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location != 'Chicago';	warehouse_1
SELECT University_Name, City, State FROM university ORDER BY University_Name;	university_rank
SELECT University_Name, City, State FROM university ORDER BY University_Name;	university_rank
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio');	university_rank
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio');	university_rank
SELECT MAX(Enrollment) AS Max_Enrollment, AVG(Enrollment) AS Avg_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM university;	university_rank
SELECT MAX(Enrollment) AS Max_Enrollment, AVG(Enrollment) AS Avg_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM university;	university_rank
SELECT Team_Name FROM university WHERE Enrollment > (SELECT avg(Enrollment) FROM university);	university_rank
SELECT u.Team_Name FROM university u WHERE u.Enrollment > (SELECT AVG(Enrollment) FROM university);	university_rank
SELECT DISTINCT Home_Conference FROM university;	university_rank
SELECT DISTINCT Home_Conference FROM university;	university_rank
SELECT Home_Conference, count(*) FROM university GROUP BY Home_Conference	university_rank
SELECT Home_Conference, COUNT(University_ID) AS Number_of_Universities FROM university GROUP BY Home_Conference;	university_rank
SELECT State, COUNT(University_ID) AS University_Count FROM university GROUP BY State ORDER BY University_Count DESC LIMIT 1;	university_rank
SELECT State, COUNT(*) AS University_Count FROM university GROUP BY State ORDER BY University_Count DESC LIMIT 1;	university_rank
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000;	university_rank
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000;	university_rank
SELECT Home_Conference, SUM(Enrollment) AS Total_Enrollment FROM university GROUP BY Home_Conference ORDER BY Total_Enrollment ASC LIMIT 1;	university_rank
SELECT Home_Conference, SUM(Enrollment) AS Total_Enrollment FROM university GROUP BY Home_Conference ORDER BY Total_Enrollment ASC;	university_rank
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code	university_rank
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code	university_rank
SELECT major.Major_Name, major_ranking.Rank FROM university JOIN major_ranking ON university.University_ID = major_ranking.University_ID JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE university.University_Name = 'Augustana College';	university_rank
SELECT major_ranking.Rank, major.Major_Name FROM university JOIN major_ranking ON university.University_ID = major_ranking.University_ID JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE university.University_Name = 'Augustana College';	university_rank
SELECT u.University_Name, u.City, u.State FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE mr.Rank = 1 AND m.Major_Name = 'Accounting' LIMIT 1;	university_rank
SELECT u.University_Name, u.City, u.State FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE mr.Rank = 1 AND m.Major_Name = 'Accounting';	university_rank
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Rank = 1 GROUP BY T1.University_ID ORDER BY COUNT(T2.Major_ID) DESC LIMIT 1	university_rank
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID WHERE mr.Rank = 1 GROUP BY u.University_ID ORDER BY COUNT(mr.Major_ID) DESC LIMIT 1;	university_rank
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)	university_rank
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1);	university_rank
SELECT U.University_Name FROM university AS U JOIN major_ranking AS MR1 ON U.University_ID = MR1.University_ID JOIN major AS M1 ON MR1.Major_ID = M1.Major_ID JOIN major_ranking AS MR2 ON U.University_ID = MR2.University_ID JOIN major AS M2 ON MR2.Major_ID = M2.Major_ID WHERE M1.Major_Name = 'Accounting' AND M2.Major_Name = 'Urban Education'	university_rank
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID JOIN major AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.Major_Name = 'Accounting' INTERSECT SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID JOIN major AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.Major_Name = 'Urban Education'	university_rank
SELECT u.University_Name, o.Rank FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE u.State = 'Wisconsin';	university_rank
SELECT u.University_Name, o.Rank FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE u.State = 'Wisconsin';	university_rank
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Research_point DESC LIMIT 1	university_rank
SELECT u.University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Research_point DESC LIMIT 1;	university_rank
SELECT u.University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point ASC;	university_rank
SELECT u.University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point ASC;	university_rank
SELECT U.University_Name FROM university AS U JOIN major_ranking AS MR ON U.University_ID = MR.University_ID JOIN major AS M ON MR.Major_ID = M.Major_ID WHERE M.Major_Name = 'Accounting' AND MR.Rank >= 3	university_rank
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank <= 3;	university_rank
SELECT SUM(u.Enrollment) FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE o.Rank <= 5;	university_rank
SELECT SUM(Enrollment) FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE overall_ranking.Rank <= 5;	university_rank
SELECT T1.University_Name, T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3	university_rank
SELECT u.University_Name, o.Reputation_point, o.Citation_point FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point DESC LIMIT 3;	university_rank
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(University_ID) > 2;	university_rank
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(University_ID) > 2	university_rank
SELECT Title FROM Movies WHERE Rating IS NULL;	movie_2
SELECT Title FROM Movies WHERE Rating IS NULL;	movie_2
SELECT Title FROM Movies WHERE Rating = 'G';	movie_2
SELECT Title FROM Movies WHERE Rating = 'G';	movie_2
SELECT Movies.Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name = 'Odeon';	movie_2
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon'	movie_2
SELECT Movies.Title, MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;	movie_2
SELECT Movies.Title, MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;	movie_2
SELECT COUNT(*) FROM Movies WHERE Rating = 'G';	movie_2
SELECT COUNT(*) FROM Movies WHERE Rating = 'G';	movie_2
SELECT COUNT(DISTINCT Movies.Code) FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;	movie_2
SELECT COUNT(DISTINCT Movies.Code) FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;	movie_2
SELECT COUNT(DISTINCT Movies.Code) FROM Movies INNER JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;	movie_2
SELECT COUNT(DISTINCT Movies.Title) FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie;	movie_2
SELECT COUNT(DISTINCT Name) FROM MovieTheaters;	movie_2
SELECT count(DISTINCT Name) FROM MovieTheaters	movie_2
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'	movie_2
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'	movie_2
SELECT MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE Movies.Rating IN ('G', 'PG');	movie_2
SELECT MovieTheaters.Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating IN ('G', 'PG');	movie_2
SELECT DISTINCT Movies.Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name IN ('Odeon', 'Imperial');	movie_2
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name IN ('Odeon', 'Imperial'))	movie_2
SELECT DISTINCT m1.Title FROM Movies m1 JOIN MovieTheaters mt1 ON m1.Code = mt1.Movie JOIN MovieTheaters mt2 ON m1.Code = mt2.Movie WHERE mt1.Name = 'Odeon' AND mt2.Name = 'Imperial';	movie_2
SELECT DISTINCT m.Title FROM Movies m JOIN MovieTheaters mt1 ON m.Code = mt1.Movie JOIN MovieTheaters mt2 ON m.Code = mt2.Movie WHERE mt1.Name = 'Odeon' AND mt2.Name = 'Imperial';	movie_2
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon');	movie_2
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon');	movie_2
SELECT Title FROM Movies ORDER BY Title;	movie_2
SELECT Title FROM Movies ORDER BY Title ASC	movie_2
SELECT Title FROM Movies ORDER BY Rating DESC	movie_2
SELECT Title FROM Movies ORDER BY Rating DESC;	movie_2
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY COUNT(DISTINCT Movie) DESC LIMIT 1;	movie_2
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY COUNT(Movie) DESC LIMIT 1;	movie_2
SELECT Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie GROUP BY Title ORDER BY COUNT(Name) DESC LIMIT 1;	movie_2
SELECT Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie GROUP BY Title ORDER BY COUNT(MovieTheaters.Name) DESC LIMIT 1;	movie_2
SELECT Rating, COUNT(*) AS MovieCount FROM Movies GROUP BY Rating;	movie_2
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating	movie_2
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL;	movie_2
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL;	movie_2
SELECT Name FROM MovieTheaters WHERE Movie IS NOT NULL	movie_2
SELECT DISTINCT MovieTheaters.Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code;	movie_2
FAILED	movie_2
SELECT Name FROM MovieTheaters WHERE Movie IS NULL;	movie_2
SELECT MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE Movies.Rating = 'G';	movie_2
SELECT MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE Movies.Rating = 'G';	movie_2
SELECT Title FROM Movies;	movie_2
SELECT Title FROM Movies;	movie_2
SELECT DISTINCT Rating FROM Movies;	movie_2
SELECT DISTINCT Rating FROM Movies;	movie_2
SELECT * FROM Movies WHERE Rating IS NULL;	movie_2
SELECT * FROM Movies WHERE Rating IS NULL;	movie_2
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters);	movie_2
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters);	movie_2
SELECT p.Recipient FROM Package p WHERE p.Weight = (SELECT MAX(p2.Weight) FROM Package p2)	planet_1
SELECT c.Name FROM Package p JOIN Client c ON p.Recipient = c.AccountNumber WHERE p.Weight = (SELECT MAX(Weight) FROM Package);	planet_1
SELECT SUM(Package.Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
FAILED	planet_1
SELECT Position FROM Employee WHERE Name = 'Amy Wong';	planet_1
SELECT Position FROM Employee WHERE Name = 'Amy Wong';	planet_1
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela';	planet_1
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela';	planet_1
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern';	planet_1
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern';	planet_1
SELECT Has_Clearance.Level FROM Employee JOIN Has_Clearance ON Employee.EmployeeID = Has_Clearance.Employee WHERE Employee.Position = 'Physician'	planet_1
FAILED	planet_1
SELECT Package.PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
FAILED	planet_1
FAILED	planet_1
SELECT Package.PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
FAILED	planet_1
SELECT PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong';	planet_1
SELECT COUNT(*) FROM Package WHERE Sender = 'Ogden Wernstrom' AND Recipient = 'Leo Wong';	planet_1
SELECT COUNT(*) FROM Package WHERE Sender = 'Ogden Wernstrom' AND Recipient = 'Leo Wong';	planet_1
FAILED	planet_1
SELECT Package.Contents FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'John Zoidfarb';	planet_1
SELECT T1.PackageNumber, T1.Weight FROM Package AS T1 JOIN Client AS T2 ON T1.Sender = T2.AccountNumber WHERE T2.Name LIKE '%John%' ORDER BY T1.Weight DESC LIMIT 1	planet_1
SELECT T1.PackageNumber, T1.Weight FROM Package AS T1 JOIN Client AS T2 ON T1.Sender = T2.AccountNumber WHERE T2.Name LIKE '%John%' ORDER BY T1.Weight DESC LIMIT 1	planet_1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3;	planet_1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3;	planet_1
SELECT c.Name, COUNT(p.PackageNumber) AS PackageCount FROM Client c JOIN Package p ON c.AccountNumber = p.Sender GROUP BY c.Name ORDER BY PackageCount DESC LIMIT 1;	planet_1
SELECT c.Name, COUNT(p.PackageNumber) AS NumberOfPackages FROM Client c JOIN Package p ON c.AccountNumber = p.Sender GROUP BY c.Name ORDER BY NumberOfPackages DESC LIMIT 1;	planet_1
SELECT c.Name, COUNT(p.PackageNumber) AS NumberOfPackages FROM Client c JOIN Package p ON c.AccountNumber = p.Recipient GROUP BY c.Name ORDER BY NumberOfPackages ASC LIMIT 1;	planet_1
SELECT Recipient FROM Package GROUP BY Recipient ORDER BY count(*) ASC LIMIT 1	planet_1
SELECT c.Name FROM Client c JOIN Package p ON c.AccountNumber = p.Sender GROUP BY c.Name HAVING COUNT(p.PackageNumber) > 1;	planet_1
SELECT c.Name FROM Client c JOIN Package p ON c.AccountNumber = p.Sender GROUP BY c.Name HAVING COUNT(p.PackageNumber) > 1;	planet_1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'	planet_1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'	planet_1
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC	planet_1
SELECT Name, Coordinates FROM Planet ORDER BY Name;	planet_1
FAILED	planet_1
FAILED	planet_1
SELECT Date FROM Shipment;	planet_1
SELECT Date FROM Shipment	planet_1
SELECT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';	planet_1
SELECT ShipmentID FROM Shipment WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars');	planet_1
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars';	planet_1
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars';	planet_1
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars' OR Manager = 'Turanga Leela';	planet_1
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars';	planet_1
SELECT Planet.Name, COUNT(Shipment.ShipmentID) AS TotalShipments FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID GROUP BY Planet.Name;	planet_1
SELECT Planet.Name, COUNT(Shipment.ShipmentID) AS ShipmentCount FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.PlanetID;	planet_1
SELECT p.Name FROM Planet p JOIN Shipment s ON p.PlanetID = s.Planet GROUP BY p.PlanetID ORDER BY COUNT(s.ShipmentID) DESC LIMIT 1;	planet_1
SELECT p.Name FROM Planet p JOIN Shipment s ON p.PlanetID = s.Planet GROUP BY p.PlanetID ORDER BY COUNT(s.ShipmentID) DESC LIMIT 1;	planet_1
SELECT e.Name, COUNT(s.ShipmentID) AS ShipmentCount FROM Employee e JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.Name;	planet_1
SELECT e.Name, COUNT(s.ShipmentID) AS ShipmentCount FROM Employee e JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.Name;	planet_1
SELECT SUM(Package.Weight) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';	planet_1
SELECT SUM(Package.Weight) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';	planet_1
SELECT T2.Name, SUM(T1.Weight) AS TotalWeight FROM Package AS T1 JOIN Shipment AS T3 ON T1.Shipment = T3.ShipmentID JOIN Planet AS T2 ON T3.Planet = T2.PlanetID GROUP BY T2.PlanetID	planet_1
SELECT Planet.Name, SUM(Package.Weight) AS TotalWeight FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name;	planet_1
SELECT T2.Name FROM Planet AS T2 JOIN Shipment AS T1 ON T2.PlanetID = T1.Planet JOIN Package AS T3 ON T1.ShipmentID = T3.Shipment GROUP BY T2.PlanetID HAVING SUM(T3.Weight) > 30;	planet_1
SELECT T2.Name FROM Planet AS T2 JOIN Shipment AS T1 ON T2.PlanetID = T1.Planet GROUP BY T2.PlanetID HAVING SUM((SELECT Weight FROM Package WHERE Shipment = T1.ShipmentID)) > 30	planet_1
SELECT Package.PackageNumber FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Client AS SenderClient ON Package.Sender = SenderClient.AccountNumber WHERE Planet.Name = 'Omicron Persei 8' AND SenderClient.Name = 'Zapp Brannigan';	planet_1
SELECT COUNT(*) FROM Package p JOIN Shipment s ON p.Shipment = s.ShipmentID JOIN Planet pl ON s.Planet = pl.PlanetID WHERE p.Sender = 'Zapp Brannigan' AND pl.Name = 'Omicron Persei 8';	planet_1
SELECT T1.PackageNumber FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID WHERE T2.Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Omicron Persei 8') OR T1.Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan')	planet_1
SELECT COUNT(*) FROM Package p JOIN Shipment s ON p.Shipment = s.ShipmentID JOIN Planet pl ON s.Planet = pl.PlanetID JOIN Client c1 ON p.Sender = c1.AccountNumber JOIN Client c2 ON p.Recipient = c2.AccountNumber WHERE pl.Name = 'Omicron Persei 8' OR c1.Name = 'Zapp Brannigan';	planet_1
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30;	planet_1
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30;	planet_1
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))	planet_1
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))	planet_1
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee WHERE T2.Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Omega III')	planet_1
SELECT Employee.Name FROM Employee JOIN Has_Clearance ON Employee.EmployeeID = Has_Clearance.Employee JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Omega III';	planet_1
SELECT p.Name FROM Planet p JOIN Has_Clearance hc ON p.PlanetID = hc.Planet GROUP BY p.PlanetID HAVING COUNT(hc.Employee) = 1;	planet_1
SELECT p.Name FROM Planet p JOIN Has_Clearance hc ON p.PlanetID = hc.Planet GROUP BY p.Name HAVING COUNT(hc.Employee) = 1;	planet_1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000;	planet_1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000;	planet_1
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000;	planet_1
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000;	planet_1
SELECT count(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))	planet_1
SELECT count(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))	planet_1
SELECT COUNT(Game_ID) FROM game;	video_game
SELECT COUNT(*) FROM game;	video_game
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC;	video_game
SELECT game.Title, game.Developers FROM game ORDER BY game.Units_sold_Millions DESC;	video_game
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo';	video_game
SELECT AVG(game.Units_sold_Millions) FROM game WHERE game.Developers != 'Nintendo';	video_game
SELECT Platform_name, Market_district FROM platform;	video_game
SELECT Platform_name, Market_district FROM platform;	video_game
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1;	video_game
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1;	video_game
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player;	video_game
SELECT MAX(Rank_of_the_year) AS Max_Rank, MIN(Rank_of_the_year) AS Min_Rank FROM player;	video_game
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3;	video_game
SELECT COUNT(Player_ID) FROM player WHERE Rank_of_the_year <= 3;	video_game
SELECT Player_name FROM player ORDER BY Player_name ASC;	video_game
SELECT Player_name FROM player ORDER BY Player_name ASC	video_game
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC	video_game
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC;	video_game
SELECT T2.Player_name, T2.Rank_of_the_year FROM game AS T1 JOIN game_player AS T3 ON T1.Game_ID = T3.Game_ID JOIN player AS T2 ON T3.Player_ID = T2.Player_ID WHERE T1.Title = 'Super Mario World'	video_game
SELECT T2.Player_name, T2.Rank_of_the_year FROM game AS T1 JOIN game_player AS T3 ON T1.Game_ID = T3.Game_ID JOIN player AS T2 ON T3.Player_ID = T2.Player_ID WHERE T1.Title = 'Super Mario World'	video_game
SELECT DISTINCT g.Developers FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn';	video_game
SELECT DISTINCT g.Developers FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn'	video_game
SELECT AVG(g.Units_sold_Millions) FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard';	video_game
SELECT avg(T2.Units_sold_Millions) FROM game AS T2 JOIN game_player AS T3 ON T2.Game_ID = T3.Game_ID JOIN player AS T1 ON T3.Player_ID = T1.Player_ID WHERE T1.Position = 'Guard';	video_game
SELECT game.Title, platform.Platform_name FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID;	video_game
SELECT game.Title, platform.Platform_name FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID;	video_game
SELECT game.Title FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID WHERE platform.Market_district IN ('Asia', 'USA');	video_game
SELECT g.Title FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district IN ('Asia', 'USA');	video_game
SELECT Franchise, COUNT(Game_ID) AS Game_Count FROM game GROUP BY Franchise;	video_game
SELECT Franchise, COUNT(Game_ID) AS Number_of_Games FROM game GROUP BY Franchise;	video_game
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(Game_ID) DESC LIMIT 1	video_game
SELECT Franchise, COUNT(Game_ID) AS Game_Count FROM game GROUP BY Franchise ORDER BY Game_Count DESC LIMIT 1;	video_game
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2;	video_game
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2;	video_game
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player);	video_game
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player);	video_game
SELECT DISTINCT g.Title FROM game g JOIN game_player gp1 ON g.Game_ID = gp1.Game_ID JOIN player p1 ON gp1.Player_ID = p1.Player_ID JOIN game_player gp2 ON g.Game_ID = gp2.Game_ID JOIN player p2 ON gp2.Player_ID = p2.Player_ID WHERE p1.College = 'Oklahoma' AND p2.College = 'Auburn' AND p1.Player_ID <> p2.Player_ID;	video_game
SELECT DISTINCT g.Title FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College IN ('Oklahoma', 'Auburn')	video_game
SELECT DISTINCT Franchise FROM game;	video_game
SELECT DISTINCT Franchise FROM game;	video_game
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'));	video_game
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))	video_game
SELECT Name FROM press ORDER BY Year_Profits_billion DESC	book_press
SELECT Name FROM press ORDER BY Year_Profits_billion DESC;	book_press
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1;	book_press
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1;	book_press
SELECT AVG(Year_Profits_billion) AS Average_Yearly_Profits, MAX(Year_Profits_billion) AS Maximum_Yearly_Profits FROM press;	book_press
SELECT press.Name, AVG(press.Year_Profits_billion) AS Average_Yearly_Profit, MAX(press.Year_Profits_billion) AS Maximum_Yearly_Profit FROM press GROUP BY press.Press_ID;	book_press
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1;	book_press
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1;	book_press
SELECT p1.Name AS Highest_Profit_Publisher, p2.Name AS Lowest_Profit_Publisher FROM press p1, press p2 WHERE p1.Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) AND p2.Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press);	book_press
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)	book_press
SELECT COUNT(*) FROM author WHERE Age < 30;	book_press
SELECT COUNT(*) FROM author WHERE Age < 30;	book_press
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender;	book_press
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender;	book_press
SELECT Gender, count(*) FROM author WHERE Age > 30 GROUP BY Gender	book_press
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender	book_press
SELECT Title FROM book ORDER BY Release_date DESC;	book_press
SELECT Title FROM book ORDER BY Release_date DESC;	book_press
SELECT Book_Series, COUNT(*) FROM book GROUP BY Book_Series;	book_press
SELECT Book_Series, COUNT(Book_ID) AS Number_of_Books FROM book GROUP BY Book_Series;	book_press
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5;	book_press
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5	book_press
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500	book_press
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500	book_press
SELECT DISTINCT a.Name FROM author a JOIN book b1 ON a.Author_ID = b1.Author_ID JOIN book b2 ON a.Author_ID = b2.Author_ID WHERE b1.Book_Series = 'MM' AND b2.Book_Series = 'LT';	book_press
SELECT DISTINCT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Book_Series = 'MM' INTERSECT SELECT DISTINCT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Book_Series = 'LT';	book_press
SELECT Name, Age FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book);	book_press
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book);	book_press
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1;	book_press
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book GROUP BY Author_ID HAVING COUNT(Book_ID) > 1);	book_press
SELECT T2.Title, T1.Name AS Author_Name, T3.Name AS Publisher_Name FROM book AS T2 JOIN author AS T1 ON T2.Author_ID = T1.Author_ID JOIN press AS T3 ON T2.Press_ID = T3.Press_ID ORDER BY T2.Sale_Amount DESC LIMIT 3	book_press
SELECT T2.Title, T1.Name AS Author_Name, T3.Name AS Press_Name FROM book AS T2 JOIN author AS T1 ON T2.Author_ID = T1.Author_ID JOIN press AS T3 ON T2.Press_ID = T3.Press_ID ORDER BY T2.Sale_Amount DESC LIMIT 3	book_press
SELECT press.Name, SUM(book.Sale_Amount) AS Total_Sale_Amount FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Name;	book_press
SELECT press.Name, SUM(book.Sale_Amount) AS Total_Sale_Amount FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Name;	book_press
SELECT press.Name, COUNT(book.Book_ID) AS Number_of_Books FROM book JOIN press ON book.Press_ID = press.Press_ID WHERE book.Sale_Amount > 1000 GROUP BY press.Name;	book_press
SELECT T1.Name, COUNT(T2.Book_ID) FROM press AS T1 JOIN book AS T2 ON T1.Press_ID = T2.Press_ID WHERE T2.Sale_Amount > 1000 GROUP BY T1.Name;	book_press
SELECT a.Name FROM book b JOIN author a ON b.Author_ID = a.Author_ID ORDER BY b.Sale_Amount DESC LIMIT 1;	book_press
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1	book_press
SELECT a.Name, a.Gender FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID ORDER BY COUNT(b.Book_ID) DESC LIMIT 1;	book_press
SELECT a.Name, a.Gender FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID ORDER BY COUNT(b.Book_ID) DESC LIMIT 1;	book_press
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID = (SELECT Press_ID FROM press WHERE Name = 'Accor'))	book_press
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID = (SELECT Press_ID FROM press WHERE Name = 'Accor'))	book_press
SELECT press.Name, press.Year_Profits_billion FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID HAVING COUNT(book.Book_ID) > 2;	book_press
SELECT press.Name, press.Year_Profits_billion FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID HAVING COUNT(book.Book_ID) > 2;	book_press
SELECT COUNT(author_name) FROM Authors;	cre_Doc_Workflow
SELECT author_name FROM Authors	cre_Doc_Workflow
SELECT author_name, other_details FROM Authors;	cre_Doc_Workflow
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik';	cre_Doc_Workflow
SELECT COUNT(document_id) FROM Documents;	cre_Doc_Workflow
SELECT author_name FROM Documents WHERE document_id = 4;	cre_Doc_Workflow
SELECT author_name FROM Documents WHERE document_name = 'Travel to Brazil'	cre_Doc_Workflow
SELECT COUNT(document_id) FROM Documents WHERE author_name = 'Era Kerluke';	cre_Doc_Workflow
SELECT document_name, document_description FROM Documents;	cre_Doc_Workflow
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings'	cre_Doc_Workflow
SELECT Authors.author_name, Authors.other_details FROM Documents JOIN Authors ON Documents.author_name = Authors.author_name WHERE Documents.document_name = 'Travel to China';	cre_Doc_Workflow
FAILED	cre_Doc_Workflow
SELECT d.author_name FROM Documents d GROUP BY d.author_name ORDER BY COUNT(d.document_id) DESC LIMIT 1;	cre_Doc_Workflow
SELECT a.author_name FROM Authors a JOIN Documents d ON a.author_name = d.author_name GROUP BY a.author_name HAVING COUNT(d.document_id) >= 2;	cre_Doc_Workflow
SELECT count(*) FROM Business_Processes	cre_Doc_Workflow
SELECT bp.process_id, bp.process_name, bp.process_description FROM Business_Processes bp JOIN Business_Processes bp_next ON bp.process_id = bp_next.next_process_id WHERE bp_next.process_id = 9;	cre_Doc_Workflow
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT next_process_id FROM Business_Processes WHERE process_id = 9);	cre_Doc_Workflow
SELECT COUNT(DISTINCT process_outcome_code) FROM Process_Outcomes;	cre_Doc_Workflow
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes;	cre_Doc_Workflow
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working';	cre_Doc_Workflow
SELECT count(*) FROM Process_Status	cre_Doc_Workflow
SELECT process_status_code, process_status_description FROM Process_Status;	cre_Doc_Workflow
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct';	cre_Doc_Workflow
SELECT COUNT(staff_id) FROM Staff;	cre_Doc_Workflow
SELECT staff_id, staff_details FROM Staff;	cre_Doc_Workflow
SELECT * FROM Staff WHERE staff_id = 100;	cre_Doc_Workflow
SELECT COUNT(DISTINCT staff_role_code) FROM Ref_Staff_Roles;	cre_Doc_Workflow
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles;	cre_Doc_Workflow
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'	cre_Doc_Workflow
SELECT COUNT(DISTINCT document_id) FROM Documents_Processes;	cre_Doc_Workflow
SELECT DISTINCT process_id FROM Documents_Processes WHERE document_id IS NOT NULL;	cre_Doc_Workflow
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes);	cre_Doc_Workflow
SELECT bp.process_id FROM Business_Processes bp LEFT JOIN Documents_Processes dp ON bp.process_id = dp.process_id WHERE dp.document_id IS NULL;	cre_Doc_Workflow
SELECT T2.process_outcome_description, T3.process_status_description FROM Documents_Processes AS T1 JOIN Process_Outcomes AS T2 ON T1.process_outcome_code = T2.process_outcome_code JOIN Process_Status AS T3 ON T1.process_status_code = T3.process_status_code WHERE T1.document_id = 0	cre_Doc_Workflow
SELECT bp.process_name FROM Documents d JOIN Documents_Processes dp ON d.document_id = dp.document_id JOIN Business_Processes bp ON dp.process_id = bp.process_id WHERE d.document_name = 'Travel to Brazil';	cre_Doc_Workflow
SELECT process_id, COUNT(document_id) FROM Documents_Processes GROUP BY process_id	cre_Doc_Workflow
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9	cre_Doc_Workflow
SELECT s.staff_id, COUNT(dp.document_id) AS num_document_processes FROM Staff s LEFT JOIN Staff_in_Processes sip ON s.staff_id = sip.staff_id LEFT JOIN Documents_Processes dp ON sip.document_id = dp.document_id GROUP BY s.staff_id;	cre_Doc_Workflow
SELECT Ref_Staff_Roles.staff_role_code, COUNT(Documents_Processes.process_id) AS document_process_count FROM Ref_Staff_Roles LEFT JOIN Staff_in_Processes ON Ref_Staff_Roles.staff_role_code = Staff_in_Processes.staff_role_code LEFT JOIN Documents_Processes ON Staff_in_Processes.process_id = Documents_Processes.process_id GROUP BY Ref_Staff_Roles.staff_role_code;	cre_Doc_Workflow
SELECT COUNT(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id = 3	cre_Doc_Workflow
SELECT COUNT(agency_id) FROM Agencies;	advertising_agencies
SELECT COUNT(*) FROM Agencies;	advertising_agencies
SELECT agency_id, agency_details FROM Agencies;	advertising_agencies
SELECT agency_id, agency_details FROM Agencies	advertising_agencies
SELECT COUNT(*) FROM Clients;	advertising_agencies
SELECT COUNT(*) FROM Clients;	advertising_agencies
SELECT client_id, client_details FROM Clients;	advertising_agencies
SELECT client_id, client_details FROM Clients;	advertising_agencies
SELECT agency_id, COUNT(client_id) FROM Clients GROUP BY agency_id;	advertising_agencies
SELECT Agencies.agency_id, COUNT(DISTINCT Clients.client_id) AS client_count FROM Agencies LEFT JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id;	advertising_agencies
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(T2.client_id) DESC LIMIT 1	advertising_agencies
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(T2.client_id) DESC LIMIT 1	advertising_agencies
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)	advertising_agencies
SELECT a.agency_id, a.agency_details FROM Agencies a JOIN Clients c ON a.agency_id = c.agency_id GROUP BY a.agency_id, a.agency_details HAVING COUNT(c.client_id) >= 2;	advertising_agencies
SELECT T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id WHERE T2.client_details LIKE '%Mac%'	advertising_agencies
SELECT T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id WHERE T2.client_details = 'Mac'	advertising_agencies
FAILED	advertising_agencies
SELECT Clients.client_details, Agencies.agency_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id;	advertising_agencies
SELECT sic_code, COUNT(*) FROM Clients GROUP BY sic_code;	advertising_agencies
SELECT sic_code, COUNT(client_id) AS client_count FROM Clients GROUP BY sic_code;	advertising_agencies
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad';	advertising_agencies
SELECT client_details FROM Clients WHERE sic_code = 'Bad';	advertising_agencies
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT DISTINCT agency_id FROM Clients)	advertising_agencies
SELECT DISTINCT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id	advertising_agencies
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients);	advertising_agencies
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients);	advertising_agencies
SELECT COUNT(invoice_id) FROM Invoices;	advertising_agencies
SELECT COUNT(invoice_id) FROM Invoices;	advertising_agencies
SELECT invoice_id, invoice_status, invoice_details FROM Invoices WHERE client_id IS NOT NULL	advertising_agencies
SELECT invoice_id, invoice_status, invoice_details FROM Invoices;	advertising_agencies
SELECT client_id, COUNT(*) FROM Invoices GROUP BY client_id	advertising_agencies
SELECT client_id, COUNT(*) FROM Invoices GROUP BY client_id;	advertising_agencies
SELECT client_id, client_details FROM Clients WHERE client_id = (SELECT client_id FROM Invoices GROUP BY client_id ORDER BY COUNT(invoice_id) DESC LIMIT 1);	advertising_agencies
SELECT client_id, client_details FROM Clients WHERE client_id = (SELECT client_id FROM Invoices GROUP BY client_id ORDER BY COUNT(invoice_id) DESC LIMIT 1);	advertising_agencies
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2;	advertising_agencies
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2;	advertising_agencies
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status;	advertising_agencies
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status;	advertising_agencies
SELECT invoice_status, COUNT(*) AS invoice_count FROM Invoices GROUP BY invoice_status ORDER BY invoice_count DESC LIMIT 1;	advertising_agencies
SELECT invoice_status, COUNT(*) AS num_invoices FROM Invoices GROUP BY invoice_status ORDER BY num_invoices DESC LIMIT 1;	advertising_agencies
SELECT T3.invoice_status, T3.invoice_details, T3.client_id, T2.client_details, T2.agency_id, T1.agency_details FROM Invoices AS T3 JOIN Clients AS T2 ON T3.client_id = T2.client_id JOIN Agencies AS T1 ON T2.agency_id = T1.agency_id	advertising_agencies
SELECT Invoices.invoice_status, Invoices.invoice_details, Clients.client_id, Clients.client_details, Agencies.agency_id, Agencies.agency_details FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id JOIN Agencies ON Clients.agency_id = Agencies.agency_id;	advertising_agencies
SELECT meeting_type, other_details FROM Meetings;	advertising_agencies
SELECT meeting_type, other_details FROM Meetings;	advertising_agencies
SELECT meeting_outcome, purpose_of_meeting FROM Meetings;	advertising_agencies
SELECT meeting_outcome, purpose_of_meeting FROM Meetings;	advertising_agencies
SELECT Payments.payment_id, Payments.payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status = 'Working';	advertising_agencies
SELECT Payments.payment_id, Payments.payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status = 'Working';	advertising_agencies
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments);	advertising_agencies
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)	advertising_agencies
SELECT COUNT(payment_id) FROM Payments;	advertising_agencies
SELECT COUNT(payment_id) FROM Payments;	advertising_agencies
FAILED	advertising_agencies
SELECT payment_id, invoice_id, payment_details FROM Payments;	advertising_agencies
FAILED	advertising_agencies
SELECT DISTINCT Invoices.invoice_id, Invoices.invoice_status FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id;	advertising_agencies
FAILED	advertising_agencies
SELECT invoice_id, COUNT(*) AS payment_count FROM Payments GROUP BY invoice_id;	advertising_agencies
SELECT i.invoice_id, i.invoice_status, i.invoice_details FROM Invoices AS i JOIN Payments AS p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id ORDER BY COUNT(p.payment_id) DESC LIMIT 1;	advertising_agencies
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T1.invoice_id ORDER BY COUNT(T2.payment_id) DESC LIMIT 1	advertising_agencies
SELECT COUNT(staff_id) FROM Staff;	advertising_agencies
SELECT COUNT(staff_id) FROM Staff;	advertising_agencies
SELECT Agencies.agency_id, COUNT(Staff.staff_id) AS staff_count FROM Agencies LEFT JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id;	advertising_agencies
SELECT agency_id, COUNT(staff_id) FROM Staff GROUP BY agency_id;	advertising_agencies
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(T2.staff_id) DESC LIMIT 1	advertising_agencies
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(T2.staff_id) DESC LIMIT 1;	advertising_agencies
SELECT meeting_outcome, COUNT(*) AS meeting_count FROM Meetings GROUP BY meeting_outcome;	advertising_agencies
SELECT meeting_outcome, COUNT(*) AS meeting_count FROM Meetings GROUP BY meeting_outcome;	advertising_agencies
FAILED	advertising_agencies
SELECT client_id, COUNT(*) FROM Meetings GROUP BY client_id	advertising_agencies
SELECT Meetings.meeting_type, Clients.client_id, COUNT(Meetings.meeting_id) AS number_of_meetings FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id GROUP BY Meetings.meeting_type, Clients.client_id;	advertising_agencies
SELECT meeting_type, COUNT(*) AS meeting_count FROM Meetings GROUP BY meeting_type;	advertising_agencies
SELECT Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Clients.client_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id;	advertising_agencies
SELECT Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Clients.client_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id;	advertising_agencies
SELECT Meetings.meeting_id, COUNT(Staff_in_Meetings.staff_id) AS staff_count FROM Meetings LEFT JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id GROUP BY Meetings.meeting_id;	advertising_agencies
SELECT meeting_id, COUNT(staff_id) AS staff_count FROM Staff_in_Meetings GROUP BY meeting_id;	advertising_agencies
SELECT staff_id, COUNT(meeting_id) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id HAVING meeting_count = (SELECT MIN(meeting_count) FROM (SELECT staff_id, COUNT(meeting_id) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id) AS subquery);	advertising_agencies
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(meeting_id) = (SELECT MIN(meeting_count) FROM (SELECT staff_id, COUNT(meeting_id) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(meeting_id) > 0) AS subquery);	advertising_agencies
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings;	advertising_agencies
SELECT COUNT(DISTINCT Staff.staff_id) FROM Staff JOIN Staff_in_Meetings ON Staff.staff_id = Staff_in_Meetings.staff_id;	advertising_agencies
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings);	advertising_agencies
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings);	advertising_agencies
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients LEFT JOIN Meetings ON Clients.client_id = Meetings.client_id LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id WHERE Meetings.client_id IS NOT NULL OR Invoices.client_id IS NOT NULL;	advertising_agencies
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients LEFT JOIN Meetings ON Clients.client_id = Meetings.client_id LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id WHERE Meetings.client_id IS NOT NULL OR Invoices.client_id IS NOT NULL;	advertising_agencies
SELECT staff_id, staff_details FROM Staff WHERE staff_id IN (SELECT staff_id FROM Staff_in_Meetings) AND staff_details LIKE '%s%'	advertising_agencies
SELECT DISTINCT s.staff_id, s.staff_details FROM Staff s JOIN Staff_in_Meetings sm ON s.staff_id = sm.staff_id WHERE s.staff_details LIKE '%s%'	advertising_agencies
SELECT c.client_id, c.sic_code, c.agency_id FROM Clients c JOIN Meetings m ON c.client_id = m.client_id JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id HAVING COUNT(DISTINCT m.meeting_id) = 1 AND COUNT(DISTINCT i.invoice_id) >= 1;	advertising_agencies
SELECT c.client_id, c.sic_code, c.agency_id FROM Clients c JOIN Meetings m ON c.client_id = m.client_id JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id HAVING COUNT(m.meeting_id) = 1 AND COUNT(i.invoice_id) >= 1;	advertising_agencies
SELECT Meetings.start_date_time, Meetings.end_date_time, Clients.client_details, Staff.staff_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id;	advertising_agencies
SELECT Meetings.start_date_time, Meetings.end_date_time, Clients.client_details, Staff.staff_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id;	advertising_agencies
