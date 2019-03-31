--  WARNING !!! RUN THIS FILE WILL ERASE ALL THE RECORDS YOU HAVE MADE 
-- DELETE FROM PACKAGEIST;
-- DELETE FROM PACKAGE;
-- DELETE FROM TOKEN;
DELETE FROM RELOAD; 
DELETE FROM STAFF;
DELETE FROM ORDERLIST; 
DELETE FROM ORDERMEAL;
DELETE FROM INGREDIENTLIST;
DELETE FROM MEAL;
DELETE FROM COUPON;
DELETE FROM PAYMENT;
DELETE FROM INGREDIENT;
DELETE FROM CATEGORY;
DELETE FROM CUSTOMER;

ALTER TABLE CUSTOMER ALTER COLUMN CUST_ID RESTART WITH 1;
ALTER TABLE CATEGORY ALTER COLUMN CATEGORY_ID RESTART WITH 1;
ALTER TABLE INGREDIENT ALTER COLUMN INGREDIENT_ID RESTART WITH 1;
ALTER TABLE PAYMENT ALTER COLUMN PAYMENT_ID RESTART WITH 1;
ALTER TABLE COUPON ALTER COLUMN COUPON_ID RESTART WITH 1;
ALTER TABLE MEAL ALTER COLUMN MEAL_ID RESTART WITH 1;
ALTER TABLE ORDERMEAL ALTER COLUMN ORDER_ID RESTART WITH 1;
ALTER TABLE STAFF ALTER COLUMN STAFF_ID RESTART WITH 1;
ALTER TABLE RELOAD ALTER COLUMN RELOAD_ID RESTART WITH 1;
ALTER TABLE TOKEN ALTER COLUMN TOKEN_ID RESTART WITH 1;
ALTER TABLE PACKAGE ALTER COLUMN PACKAGE_ID RESTART WITH 1;

INSERT INTO NBUSER.CUSTOMER (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CREDITPOINTS) 
	VALUES ('1705651', 'Strange', 'strange@mail.com', 'Strange123456', 500);
INSERT INTO NBUSER.CUSTOMER (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CREDITPOINTS) 
	VALUES ('1705652', 'Steve', 'steve@mail.com', 'Steve123456', 200);
INSERT INTO NBUSER.CUSTOMER (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CREDITPOINTS) 
	VALUES ('1705653', 'Ali', 'ali@mail.com', 'Ali123456', 300);
INSERT INTO NBUSER.CUSTOMER (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CREDITPOINTS) 
	VALUES ('1705654', 'Abu', 'abu@mail.com', 'Abu123456', 300);
INSERT INTO NBUSER.CUSTOMER (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CREDITPOINTS) 
	VALUES ('1705655', 'Lim', 'lim@mail.com', 'Lim123456', 500);

INSERT INTO NBUSER.CATEGORY ("NAME", DESCRIPTION) 
	VALUES ('Masakan Malaysia', 'Malaysian cuisine consists of cooking traditions and practices found in Malaysia, and reflects the multiethnic makeup of its population.
This resulted in a symphony of flavours, making Malaysian cuisine highly complex and diverse.');
INSERT INTO NBUSER.CATEGORY ("NAME", DESCRIPTION) 
	VALUES ('Noodles', 'Wheat noodles in Japan were adapted from a Chinese recipe by a Buddhist monk as early as the 9th century. 
Ramen noodles, based on Chinese noodles, became popular in Japan by 1900.');
INSERT INTO NBUSER.CATEGORY ("NAME", DESCRIPTION) 
	VALUES ('Chicken Rice', 'Chicken rice is a dish adapted from early Chinese immigrants originally from Hainan province in southern China.
The original dish was adapted by the overseas Chinese population.');
INSERT INTO NBUSER.CATEGORY ("NAME", DESCRIPTION) 
	VALUES ('Indo Deli', 'Some popular Indonesian dishes such as nasi goreng, gado-gado,] Satay,] and soto, are ubiquitous in the country and are considered national dishes.
5 national dish of Indonesia; they are soto, rendang, satay, nasi goreng, and gado-gado.');
INSERT INTO NBUSER.CATEGORY ("NAME", DESCRIPTION) 
	VALUES ('Vegetarian cuisine', 'Abstaining from the use of animal products, particularly in diet, and an associated philosophy that rejects the commodity status of animals.
Not including meat and animal tissue products.');

INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Chicken');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Duck');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Rice');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Peanut');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Anchovy');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Fish Ball');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Mushroom');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Pasta');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Cheese');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Minced Meat');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Laksa Mee');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Chili');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Indo Mee');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Minced Veggie Chicken');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Tofu');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Cabbage');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Egg');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Bihun');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Ramen');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Eggplant');

INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-01', '19:10:23', 50.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-02', '19:10:23', 30.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-04', '19:10:23', 20.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-05', '19:10:23', 10.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-07', '19:10:23', 20.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-07', '19:10:23', 50.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-07', '19:10:23', 30.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-08', '19:10:23', 15.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-08', '19:10:23', 25.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-09', '19:10:23', 35.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-09', '19:10:23', 40.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-09', '19:10:23', 10.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-25', '19:10:23', 50.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-25', '19:10:23', 50.0);
INSERT INTO NBUSER.PAYMENT ("DATE", "TIME", AMOUNT) 
	VALUES ('2019-03-25', '19:10:23', 30.0);

	INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-29', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-29', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-29', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-29', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-29', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-29', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-01', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-01', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-01', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-01', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-01', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-01', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-10', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-10', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-10', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-11', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-11', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-11', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-12', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-12', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-12', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-13', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-13', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-13', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-15', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-15', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-15', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-15', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-15', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-15', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-16', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-16', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-04-16', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-17', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-17', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-17', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-18', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-18', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-18', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-19', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-19', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-19', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-20', 'Breakfast', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-20', 'Lunch', 'Redeemed');
INSERT INTO NBUSER.COUPON (REDEEM_DATE, REDEEM_TIME, "STATUS") 
	VALUES ('2019-03-20', 'Breakfast', 'Redeemed');

	INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Roasted Chicken Rice', 'Roasted Chicken Rice, as the name suggests, is traditionally made by roasting the chicken in a wood-fired brick oven.', 5.0, true, 550, NULL, 3);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Drumstick Chicken Rice', 'Drumstick Chicken Rice, as the name suggests, rice with drumstick', 6.0, true, 600, NULL, 3);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Kampung Chicken Rice', 'Chicken live in kampung with rice', 5.0, true, 500, NULL, 3);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Smooke Duck Rice', 'Smooke Duck Rice', 6.0, true, 600, NULL, 3);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Chicken Chop Rice', 'Chicken Chop with Rice', 6.0, true, 550, NULL, 3);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Steam Chicken Rice', 'Steam Chicken Rice', 5.0, true, 500, NULL, 3);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Nasi Lemak', 'Traditional Local Nasi Lemak', 3.0, true, 500, NULL, 1);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Rendang Curry', 'Best Rendang Curry in Malaysia', 5.0, true, 600, NULL, 1);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Nasi Goreng Kampung', 'Spicy Nasi Goreng', 4.0, true, 500, NULL, 1);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Fish Ball Bihun', 'Fish Ball and Bihun', 4.0, true, 450, NULL, 2);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Mushroom Ramen', 'Ramen with Mushroom', 5.0, true, 450, NULL, 2);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Smooked Duck Ramen', 'Ramen with Smooked Duck', 6.0, true, 600, NULL, 2);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Hakka Ramen', 'Traditional Hakka Sauce with Ramen', 5.0, true, 500, NULL, 2);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Cheese spaghetti', 'Pasta with delicious cheese sauce', 6.0, true, 500, NULL, 2);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Penang Laksa', 'Original Laksa from Penang', 6.0, true, 600, NULL, 2);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Indo Mee ', 'Indo Mee original', 4.0, true, 500, NULL, 4);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Indo Mee Spicy', 'Indo Mee super hot', 5.0, true, 550, NULL, 4);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Spicy Chicken Rice', 'Fried Spicy Chicken with Rice', 6.0, true, 600, NULL, 4);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Vegetarian chicken rendang', 'Vegetarian chicken rendang', 5.0, true, 450, NULL, 5);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Eggplant with minced veggie chicken', 'Eggplant with minced veggie chicken', 4.0, true, 450, NULL, 5);
INSERT INTO NBUSER.MEAL ("NAME", DESCRIPTION, PRICE, AVAILABILITY, CALORIES, IMAGE, CATEGORY_ID) 
	VALUES ('Tofu with minced veggie chicken', 'Tofu with minced veggie chicken', 4.0, true, 450, NULL, 5);

INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (1, 1, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (1, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (2, 1, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (2, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (3, 1, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (3, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (4, 2, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (4, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (5, 1, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (5, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (6, 1, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (6, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (7, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (7, 4, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (7, 5, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (8, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (8, 1, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (8, 12, 0.2);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (9, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (9, 5, 0.2);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (9, 17, 1.0);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (10, 6, 3.0);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (10, 18, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (11, 7, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (11, 19, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (12, 2, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (12, 19, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (13, 10, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (13, 19, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (14, 8, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (14, 9, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (15, 11, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (15, 12, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (16, 13, 1.0);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (17, 13, 1.0);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (17, 12, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (18, 1, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (18, 12, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (18, 3, 0.1);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (19, 12, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (19, 14, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (20, 20, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (20, 14, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (20, 16, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (21, 15, 1.0);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (21, 14, 0.25);
INSERT INTO NBUSER.INGREDIENTLIST (MEAL_ID, INGREDIENT_ID, QUANTITY) 
	VALUES (21, 16, 0.25);

	INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Single', 1, 1);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Single', 2, 1);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 3, 1);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 4, 2);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 5, 2);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Single', 6, 2);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Single', 7, 3);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 8, 3);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Single', 9, 3);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 10, 4);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 11, 4);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Single', 12, 4);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 13, 5);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Weekly', 14, 5);
INSERT INTO NBUSER.ORDERMEAL ("STATUS", "TYPE", PAYMENT_ID, CUST_ID) 
	VALUES ('Paid', 'Single', 15, 5);

INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (1, 1, 1, 5.0, 1);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (2, 1, 1, 5.0, 3);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (7, 1, 1, 5.0, 2);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (9, 2, 1, 5.0, 4);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (11, 2, 1, 5.0, 5);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (12, 2, 1, 5.0, 6);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (15, 3, 1, 5.0, 7);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (20, 3, 1, 5.0, 8);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (21, 3, 1, 5.0, 9);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (18, 4, 1, 5.0, 10);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (13, 4, 1, 5.0, 11);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (16, 4, 1, 5.0, 12);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (16, 5, 1, 5.0, 13);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (17, 5, 1, 5.0, 14);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (19, 5, 1, 5.0, 15);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (2, 6, 1, 5.0, 16);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (3, 6, 1, 5.0, 17);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (8, 6, 1, 5.0, 18);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (10, 7, 1, 5.0, 19);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (11, 7, 1, 5.0, 20);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (16, 7, 1, 5.0, 21);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (20, 8, 1, 5.0, 22);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (21, 8, 1, 5.0, 23);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (5, 8, 1, 5.0, 24);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (5, 9, 1, 5.0, 25);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (6, 9, 1, 5.0, 26);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (8, 9, 1, 5.0, 27);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (9, 10, 1, 5.0, 28);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (10, 10, 1, 5.0, 29);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (16, 10, 1, 5.0, 30);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (15, 11, 1, 5.0, 31);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (17, 11, 1, 5.0, 32);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (11, 11, 1, 5.0, 33);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (16, 12, 1, 5.0, 34);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (19, 12, 1, 5.0, 35);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (5, 12, 1, 5.0, 36);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (6, 13, 1, 5.0, 37);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (1, 13, 1, 5.0, 38);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (12, 13, 1, 5.0, 39);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (2, 14, 1, 5.0, 40);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (7, 14, 1, 5.0, 41);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (9, 14, 1, 5.0, 42);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (10, 15, 1, 5.0, 43);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (5, 15, 1, 5.0, 44);
INSERT INTO NBUSER.ORDERLIST (MEAL_ID, ORDER_ID, QUANTITY, PRICEEACH, COUPON_ID) 
	VALUES (6, 15, 1, 5.0, 45);

INSERT INTO NBUSER.STAFF (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CATEGORY_ID) 
	VALUES ('0001', 'Goose', 'goose@mail.com', 'Goose123456', 1);
INSERT INTO NBUSER.STAFF (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CATEGORY_ID) 
	VALUES ('0002', 'Groot', 'groot@mail.com', 'Groot123456', 2);
INSERT INTO NBUSER.STAFF (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CATEGORY_ID) 
	VALUES ('0003', 'R2D2', 'r2d2@mail.com', 'R2D2123456', 3);
INSERT INTO NBUSER.STAFF (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CATEGORY_ID) 
	VALUES ('0004', 'BB8', 'bb8@mail.com', 'BB8123456', 4);
INSERT INTO NBUSER.STAFF (USER_ID_CARD, USERNAME, EMAIL, PASSWORD, CATEGORY_ID) 
	VALUES ('0005', 'Antman', 'antman@mail.com', 'Antman123456', 5);

INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-01', '01:11:55', 10.0, 1, 1);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-06', '02:22:44', 15.0, 1, 1);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-14', '03:33:33', 30.0, 1, 2);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-02', '04:44:22', 30.0, 1, 5);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-06', '05:55:11', 15.0, 2, 3);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-13', '06:11:55', 30.0, 2, 3);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-08', '07:22:44', 50.0, 2, 5);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-15', '08:33:33', 30.0, 2, 4);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-22', '09:44:22', 50.0, 3, 4);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-18', '10:55:11', 100.0, 3, 4);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-25', '11:11:55', 30.0, 3, 5);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-03-04', '12:22:44', 50.0, 3, 5);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-28', '13:33:33', 30.0, 4, 2);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-03-07', '14:44:22', 30.0, 4, 2);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-03-14', '15:55:11', 15.0, 4, 1);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-02-22', '16:11:55', 15.0, 4, 1);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-03-01', '17:22:44', 10.0, 5, 3);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-03-08', '18:33:33', 10.0, 5, 3);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-03-12', '19:44:22', 10.0, 5, 4);
INSERT INTO NBUSER.RELOAD ("DATE", "TIME", AMOUNT, CUST_ID, STAFF_ID) 
	VALUES ('2019-03-21', '20:55:11', 15.0, 5, 1);
