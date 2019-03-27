--  WARNING !!! RUN THIS FILE WILL ERASE ALL THE RECORDS YOU HAVE MADE 
DELETE FROM CATEGORY;
DELETE FROM INGREDIENT;
DELETE FROM MEAL;

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

