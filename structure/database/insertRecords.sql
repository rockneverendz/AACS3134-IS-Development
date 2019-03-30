--  WARNING !!! RUN THIS FILE WILL ERASE ALL THE RECORDS YOU HAVE MADE 
DELETE FROM MEAL;
DELETE FROM INGREDIENT;
DELETE FROM CATEGORY;

ALTER TABLE CUSTOMER ALTER COLUMN CUST_ID RESTART WITH 1;
ALTER TABLE CATEGORY ALTER COLUMN CATEGORY_ID RESTART WITH 1;
ALTER TABLE INGREDIENT ALTER COLUMN INGREDIENT_ID RESTART WITH 1;
ALTER TABLE PAYMENT ALTER COLUMN PAYMENT_ID RESTART WITH 1;
ALTER TABLE COUPON ALTER COLUMN COUPON_ID RESTART WITH 1;
ALTER TABLE MEAL ALTER COLUMN MEAL_ID RESTART WITH 1;
ALTER TABLE "ORDER" ALTER COLUMN ORDER_ID RESTART WITH 1;
ALTER TABLE STAFF ALTER COLUMN STAFF_ID RESTART WITH 1;
ALTER TABLE RELOAD ALTER COLUMN RELOAD_ID RESTART WITH 1;
ALTER TABLE TOKEN ALTER COLUMN TOKEN_ID RESTART WITH 1;
ALTER TABLE PACKAGE ALTER COLUMN PACKAGE_ID RESTART WITH 1;

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
	VALUES ('Whole chicken');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Whole duck');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Packet of Shimeji Mushrooms');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Packet of Indo Mee');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Whole salmon');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Loaf of bread');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Packet of tofu');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Packet of prawns');
INSERT INTO NBUSER.INGREDIENT (INGREDIENT_NAME) 
	VALUES ('Packet of Wantan Mee');


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


