/*
Derby DBMS Reserved Keywords
https://db.apache.org/derby/docs/10.2/ref/rrefkeywords29722.html
*/

CREATE TABLE CUSTOMER (
	CUST_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	USER_ID_CARD VARCHAR(31) UNIQUE,
	USERNAME VARCHAR(31) UNIQUE,
	EMAIL VARCHAR(50) UNIQUE,
	PASSWORD VARCHAR(30),
	CREDITPOINTS INTEGER NOT NULL WITH DEFAULT 0,
PRIMARY KEY (CUST_ID)
);

CREATE TABLE CATEGORY (
	CATEGORY_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	NAME VARCHAR (80) NOT NULL,
	DESCRIPTION VARCHAR(255),
	IMAGE BLOB,
PRIMARY KEY (CATEGORY_ID)
);

CREATE TABLE INGREDIENT (
	INGREDIENT_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	INGREDIENT_NAME VARCHAR(80) NOT NULL,
PRIMARY KEY (INGREDIENT_ID)
);

CREATE TABLE PAYMENT (
	PAYMENT_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	"DATE" DATE NOT NULL WITH DEFAULT CURRENT DATE,
	"TIME" TIME NOT NULL WITH DEFAULT CURRENT TIME,
	AMOUNT DOUBLE NOT NULL,
PRIMARY KEY (PAYMENT_ID)
);

CREATE TABLE COUPON (
	COUPON_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	"DATE" DATE,
	"TIME" TIME,
	STATUS VARCHAR(10) NOT NULL,
PRIMARY KEY (COUPON_ID),
CONSTRAINT CHK_COUPON_STUTUS CHECK (STATUS IN ('Redeemed','Expired')),
CONSTRAINT CHK_COUPON_TIME CHECK ("TIME" IN ('Breakfast','Lunch'))
);

CREATE TABLE MEAL (
	MEAL_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	NAME VARCHAR(80) NOT NULL,
	DESCRIPTION VARCHAR(255),
	PRICE DOUBLE NOT NULL,
	AVAILABILITY BOOLEAN NOT NULL,
	CALORIES INTEGER NOT NULL,
	IMAGE BLOB,
	CATEGORY_ID INTEGER NOT NULL,
PRIMARY KEY (MEAL_ID),
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
);

CREATE TABLE INGREDIENTLIST (
	MEAL_ID INTEGER NOT NULL,
	INGREDIENT_ID INTEGER NOT NULL,
	QUANTITY DOUBLE NOT NULL WITH DEFAULT 1,
PRIMARY KEY (MEAL_ID, INGREDIENT_ID),
FOREIGN KEY(MEAL_ID) REFERENCES MEAL(MEAL_ID),
FOREIGN KEY(INGREDIENT_ID) REFERENCES INGREDIENT(INGREDIENT_ID)
);

CREATE TABLE "ORDER" (
	ORDER_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	STUTUS VARCHAR(10) NOT NULL,
	REDEEM_DATE DATE,
	REDEEM_TIME VARCHAR(10) NOT NULL,
	PAYMENT_ID INTEGER NOT NULL,
	CUST_ID INTEGER NOT NULL,
PRIMARY KEY (ORDER_ID),
FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT(PAYMENT_ID),
FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID),
CONSTRAINT CHK_MEALORDER_REDEEM_TIME CHECK (REDEEM_TIME IN ('Breakfast','Lunch')),
CONSTRAINT CHK_MEALORDER_STUTUS CHECK (STUTUS IN ('Paid','Canceled'))
);

CREATE TABLE ORDERLIST (
	MEAL_ID INTEGER NOT NULL,
	ORDER_ID INTEGER NOT NULL,
	QUANTITY INTEGER NOT NULL WITH DEFAULT 1,
	PRICEEACH DOUBLE NOT NULL,
	COUPON_ID INTEGER NOT NULL,
PRIMARY KEY (MEAL_ID, ORDER_ID),
FOREIGN KEY(MEAL_ID) REFERENCES MEAL(MEAL_ID),
FOREIGN KEY(ORDER_ID) REFERENCES "ORDER"(ORDER_ID),
FOREIGN KEY(COUPON_ID) REFERENCES COUPON(COUPON_ID)
);

CREATE TABLE STAFF (
	STAFF_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	USER_ID_CARD VARCHAR(31) UNIQUE,
	USERNAME VARCHAR(31) UNIQUE,
	EMAIL VARCHAR(50) UNIQUE,
	PASSWORD VARCHAR(30),
	CATEGORY_ID INTEGER,
PRIMARY KEY (STAFF_ID),
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
);

CREATE TABLE RELOAD (
	RELOAD_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	"DATE" DATE NOT NULL WITH DEFAULT CURRENT DATE,
	"TIME" TIME NOT NULL WITH DEFAULT CURRENT TIME,
	AMOUNT DOUBLE NOT NULL,
	CUST_ID INTEGER,
	STAFF_ID INTEGER,
PRIMARY KEY (RELOAD_ID),
FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID),
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID)
);

CREATE TABLE TOKEN (
	TOKEN_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	TOKEN VARCHAR(16) NOT NULL,
	STUTUS VARCHAR(10) NOT NULL,
	"DATE" DATE NOT NULL WITH DEFAULT CURRENT DATE,
	"TIME" TIME NOT NULL WITH DEFAULT CURRENT TIME,
	ID INTEGER,
PRIMARY KEY (TOKEN_ID),
CONSTRAINT CHK_TOKEN_STUTUS CHECK (STUTUS IN ('Sent','Used','Expired'))
);

CREATE TABLE PACKAGE (
	PACKAGE_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	TYPE VARCHAR(10) NOT NULL,
	START_DATE DATE NOT NULL,
PRIMARY KEY (PACKAGE_ID),
CONSTRAINT CHK_PACKAGE_TYPE CHECK (TYPE IN ('WEEKLY','MONTHLY'))
);

CREATE TABLE PACKAGEIST (
	MEAL_ID INTEGER NOT NULL,
	PACKAGE_ID INTEGER NOT NULL,
	QUANTITY INTEGER NOT NULL WITH DEFAULT 1,
	PRICEEACH DOUBLE NOT NULL,
PRIMARY KEY (MEAL_ID, PACKAGE_ID),
FOREIGN KEY(MEAL_ID) REFERENCES MEAL(MEAL_ID),
FOREIGN KEY(PACKAGE_ID) REFERENCES PACKAGE(PACKAGE_ID)
);
