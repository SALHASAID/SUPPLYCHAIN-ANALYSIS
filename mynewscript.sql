CREATE TABLE temp_supply_chain (
    Customer_Id INT,
    Customer_Fullname VARCHAR(255),
    Category_Id INT,
    Category_Name VARCHAR(255),
    Sales_per_customer FLOAT,
    Benefit_per_order FLOAT,
    Payment_Type VARCHAR(255),
    Delivery_Status VARCHAR(255),
    Late_delivery_risk INT,
    Customer_City VARCHAR(255),
    Customer_Country VARCHAR(255),
    Customer_Segment VARCHAR(255),
    Customer_State VARCHAR(255),
    Customer_Street VARCHAR(255),
    Customer_Zipcode VARCHAR(10),
    Department_Id INT,
    Department_Name VARCHAR(255),
    Latitude FLOAT,
    Longitude FLOAT,
    Market VARCHAR(255),
    Order_Id INT,
    Order_Customer_Id INT,
    Order_Item_Cardprod_Id INT,
    order_date DATE,
    order_year INT,
    order_month VARCHAR(255),
    Order_City VARCHAR(255),
    Order_Country VARCHAR(255),
    Order_Zipcode VARCHAR(10),
    Order_Status VARCHAR(255),
    Order_State VARCHAR(255),
    Order_Region VARCHAR(255),
    Order_Profit_Per_Order FLOAT,
    Order_Item_Total FLOAT,
    Order_Item_Quantity INT,
    Order_Item_Profit_Ratio FLOAT,
    Order_Item_Product_Price FLOAT,
    Order_Item_Id INT,
    Order_Item_Discount_Rate FLOAT,
    Order_Item_Discount FLOAT,
    Sales FLOAT,
    Product_Card_Id INT,
    Product_Category_Id INT,
    Product_Name VARCHAR(255),
    Product_Price FLOAT,
    Product_Status VARCHAR(255),
    Days_for_shipping_real INT,
    Days_for_shipment_scheduled INT,
    Shipping_Mode VARCHAR(255),
    shipping_date DATE,
    Shipping_Year INT,
    Shipping_month VARCHAR(255)
);



-- Check for null values in important columns --

SELECT * 
FROM temp_supply_chain
WHERE customer_id IS NULL or Order_Id IS NULL;

-- check for duplicates
SELECT customer_id, count(*)
FROM temp_supply_chain
GROUP BY Customer_Id
HAVING COUNT(*) > 1;


-- handle null values--

SET SQL_SAFE_UPDATES = 0;

UPDATE temp_supply_chain
SET order_zipcode = '00000',
    customer_zipcode = '00000'
WHERE order_Zipcode IS NULL 
      OR customer_zipcode IS NULL
      OR TRIM(order_zipcode) = ''
      OR TRIM(customer_zipcode) = '';


-- update the column from abbreviations to the real name--
UPDATE temp_supply_chain
SET customer_country = 'United States Of America'
WHERE TRIM(customer_country) = 'EE. UU.';


select *
FROM temp_supply_chain
WHERE Customer_Country = 'United states of america';


-- state abbreviations --

UPDATE temp_supply_chain
SET customer_state = CASE
     WHEN customer_state = 'AL' THEN 'Alabama'
    WHEN customer_state = 'AK' THEN 'Alaska'
    WHEN customer_state = 'AZ' THEN 'Arizona'
    WHEN customer_state = 'AR' THEN 'Arkansas'
    WHEN customer_state = 'CA' THEN 'California'
    WHEN customer_state = 'CO' THEN 'Colorado'
    WHEN customer_state = 'CT' THEN 'Connecticut'
    WHEN customer_state = 'DE' THEN 'Delaware'
    WHEN customer_state = 'FL' THEN 'Florida'
    WHEN customer_state = 'GA' THEN 'Georgia'
    WHEN customer_state = 'HI' THEN 'Hawaii'
    WHEN customer_state = 'ID' THEN 'Idaho'
    WHEN customer_state = 'IL' THEN 'Illinois'
    WHEN customer_state = 'IN' THEN 'Indiana'
    WHEN customer_state = 'IA' THEN 'Iowa'
    WHEN customer_state = 'KS' THEN 'Kansas'
    WHEN customer_state = 'KY' THEN 'Kentucky'
    WHEN customer_state = 'LA' THEN 'Louisiana'
    WHEN customer_state = 'ME' THEN 'Maine'
    WHEN customer_state = 'MD' THEN 'Maryland'
    WHEN customer_state = 'MA' THEN 'Massachusetts'
    WHEN customer_state = 'MI' THEN 'Michigan'
    WHEN customer_state = 'MN' THEN 'Minnesota'
    WHEN customer_state = 'MS' THEN 'Mississippi'
    WHEN customer_state = 'MO' THEN 'Missouri'
    WHEN customer_state = 'MT' THEN 'Montana'
    WHEN customer_state = 'NE' THEN 'Nebraska'
    WHEN customer_state = 'NV' THEN 'Nevada'
    WHEN customer_state = 'NH' THEN 'New Hampshire'
    WHEN customer_state = 'NJ' THEN 'New Jersey'
    WHEN customer_state = 'NM' THEN 'New Mexico'
    WHEN customer_state = 'NY' THEN 'New York'
    WHEN customer_state = 'NC' THEN 'North Carolina'
    WHEN customer_state = 'ND' THEN 'North Dakota'
    WHEN customer_state = 'OH' THEN 'Ohio'
    WHEN customer_state = 'OK' THEN 'Oklahoma'
    WHEN customer_state = 'OR' THEN 'Oregon'
    WHEN customer_state = 'PA' THEN 'Pennsylvania'
    WHEN customer_state = 'RI' THEN 'Rhode Island'
    WHEN customer_state = 'SC' THEN 'South Carolina'
    WHEN customer_state = 'SD' THEN 'South Dakota'
    WHEN customer_state = 'TN' THEN 'Tennessee'
    WHEN customer_state = 'TX' THEN 'Texas'
    WHEN customer_state = 'UT' THEN 'Utah'
    WHEN customer_state = 'VT' THEN 'Vermont'
    WHEN customer_state = 'VA' THEN 'Virginia'
    WHEN customer_state = 'WA' THEN 'Washington'
    WHEN customer_state = 'WV' THEN 'West Virginia'
    WHEN customer_state = 'WI' THEN 'Wisconsin'
    WHEN customer_state = 'WY' THEN 'Wyoming'
    WHEN customer_state = 'PR' THEN 'Puerto Rico'
    ELSE customer_state
END;

-- Round the decimal numbers --
UPDATE temp_supply_chain
SET order_item_discount_rate = ROUND(order_item_discount_rate, 2);

-- clean the order_country column to the proper country names----

UPDATE temp_supply_chain
SET Order_Country = CASE
    WHEN Order_Country = 'Afganistan' THEN 'Afghanistan'
    WHEN Order_Country = 'Albania' THEN 'Albania'
    WHEN Order_Country = 'Alemania' THEN 'Germany'
    WHEN Order_Country = 'Angola' THEN 'Angola'
    WHEN Order_Country = 'Arabia Saudi' THEN 'Saudi Arabia'
    WHEN Order_Country = 'Argelia' THEN 'Algeria'
    WHEN Order_Country = 'Argentina' THEN 'Argentina'
    WHEN Order_Country = 'Armenia' THEN 'Armenia'
    WHEN Order_Country = 'Australia' THEN 'Australia'
    WHEN Order_Country = 'Austria' THEN 'Austria'
    WHEN Order_Country = 'Azerbaiyan' THEN 'Azerbaijan'
    WHEN Order_Country = 'Banglades' THEN 'Bangladesh'
    WHEN Order_Country = 'Barbados' THEN 'Barbados'
    WHEN Order_Country = 'Barein' THEN 'Bahrain'
    WHEN Order_Country = 'Belgica' THEN 'Belgium'
    WHEN Order_Country = 'Belice' THEN 'Belize'
    WHEN Order_Country = 'Benin' THEN 'Benin'
    WHEN Order_Country = 'Bielorrusia' THEN 'Belarus'
    WHEN Order_Country = 'Bolivia' THEN 'Bolivia'
    WHEN Order_Country = 'Bosnia y Herzegovina' THEN 'Bosnia and Herzegovina'
    WHEN Order_Country = 'Botsuana' THEN 'Botswana'
    WHEN Order_Country = 'Brasil' THEN 'Brazil'
    WHEN Order_Country = 'Bulgaria' THEN 'Bulgaria'
    WHEN Order_Country = 'Burkina Faso' THEN 'Burkina Faso'
    WHEN Order_Country = 'Burundi' THEN 'Burundi'
    WHEN Order_Country = 'Butan' THEN 'Bhutan'
    WHEN Order_Country = 'Camboya' THEN 'Cambodia'
    WHEN Order_Country = 'Camerun' THEN 'Cameroon'
    WHEN Order_Country = 'Canada' THEN 'Canada'
    WHEN Order_Country = 'Chad' THEN 'Chad'
    WHEN Order_Country = 'Chile' THEN 'Chile'
    WHEN Order_Country = 'China' THEN 'China'
    WHEN Order_Country = 'Chipre' THEN 'Cyprus'
    WHEN Order_Country = 'Colombia' THEN 'Colombia'
    WHEN Order_Country = 'Corea del Sur' THEN 'South Korea'
    WHEN Order_Country = 'Costa Rica' THEN 'Costa Rica'
    WHEN Order_Country = 'Costa de Marfil' THEN 'Ivory Coast'
    WHEN Order_Country = 'Croacia' THEN 'Croatia'
    WHEN Order_Country = 'Cuba' THEN 'Cuba'
    WHEN Order_Country = 'Dinamarca' THEN 'Denmark'
    WHEN Order_Country = 'Ecuador' THEN 'Ecuador'
    WHEN Order_Country = 'Egipto' THEN 'Egypt'
    WHEN Order_Country = 'El Salvador' THEN 'El Salvador'
    WHEN Order_Country = 'Emiratos arabes Unidos' THEN 'United Arab Emirates'
    WHEN Order_Country = 'Eritrea' THEN 'Eritrea'
    WHEN Order_Country = 'Eslovaquia' THEN 'Slovakia'
    WHEN Order_Country = 'Eslovenia' THEN 'Slovenia'
    WHEN Order_Country = 'Espana' THEN 'Spain'
    WHEN Order_Country = 'Estados Unidos' THEN 'United States'
    WHEN Order_Country = 'Estonia' THEN 'Estonia'
    WHEN Order_Country = 'Etiopia' THEN 'Ethiopia'
    WHEN Order_Country = 'Filipinas' THEN 'Philippines'
    WHEN Order_Country = 'Finlandia' THEN 'Finland'
    WHEN Order_Country = 'Francia' THEN 'France'
    WHEN Order_Country = 'Gabon' THEN 'Gabon'
    WHEN Order_Country = 'Georgia' THEN 'Georgia'
    WHEN Order_Country = 'Ghana' THEN 'Ghana'
    WHEN Order_Country = 'Grecia' THEN 'Greece'
    WHEN Order_Country = 'Guadalupe' THEN 'Guadeloupe'
    WHEN Order_Country = 'Guatemala' THEN 'Guatemala'
    WHEN Order_Country = 'Guayana Francesa' THEN 'French Guiana'
    WHEN Order_Country = 'Guinea' THEN 'Guinea'
    WHEN Order_Country = 'Guinea Ecuatorial' THEN 'Equatorial Guinea'
    WHEN Order_Country = 'Guinea-Bissau' THEN 'Guinea-Bissau'
    WHEN Order_Country = 'Guyana' THEN 'Guyana'
    WHEN Order_Country = 'Haiti' THEN 'Haiti'
    WHEN Order_Country = 'Honduras' THEN 'Honduras'
    WHEN Order_Country = 'Hong Kong' THEN 'Hong Kong'
    WHEN Order_Country = 'Hungria' THEN 'Hungary'
    WHEN Order_Country = 'India' THEN 'India'
    WHEN Order_Country = 'Indonesia' THEN 'Indonesia'
    WHEN Order_Country = 'Irak' THEN 'Iraq'
    WHEN Order_Country = 'Iran' THEN 'Iran'
    WHEN Order_Country = 'Irlanda' THEN 'Ireland'
    WHEN Order_Country = 'Israel' THEN 'Israel'
    WHEN Order_Country = 'Italia' THEN 'Italy'
    WHEN Order_Country = 'Jamaica' THEN 'Jamaica'
    WHEN Order_Country = 'Japon' THEN 'Japan'
    WHEN Order_Country = 'Jordania' THEN 'Jordan'
    WHEN Order_Country = 'Kazajistan' THEN 'Kazakhstan'
    WHEN Order_Country = 'Kenia' THEN 'Kenya'
    WHEN Order_Country = 'Kirguistan' THEN 'Kyrgyzstan'
    WHEN Order_Country = 'Kuwait' THEN 'Kuwait'
    WHEN Order_Country = 'Laos' THEN 'Laos'
    WHEN Order_Country = 'Lesoto' THEN 'Lesotho'
    WHEN Order_Country = 'Libano' THEN 'Lebanon'
    WHEN Order_Country = 'Liberia' THEN 'Liberia'
    WHEN Order_Country = 'Libia' THEN 'Libya'
    WHEN Order_Country = 'Lituania' THEN 'Lithuania'
    WHEN Order_Country = 'Luxemburgo' THEN 'Luxembourg'
    WHEN Order_Country = 'Macedonia' THEN 'North Macedonia'
    WHEN Order_Country = 'Madagascar' THEN 'Madagascar'
    WHEN Order_Country = 'Malasia' THEN 'Malaysia'
    WHEN Order_Country = 'Mali' THEN 'Mali'
    WHEN Order_Country = 'Marruecos' THEN 'Morocco'
    WHEN Order_Country = 'Martinica' THEN 'Martinique'
    WHEN Order_Country = 'Mauritania' THEN 'Mauritania'
    WHEN Order_Country = 'Mexico' THEN 'Mexico'
    WHEN Order_Country = 'Moldavia' THEN 'Moldova'
    WHEN Order_Country = 'Mongolia' THEN 'Mongolia'
    WHEN Order_Country = 'Montenegro' THEN 'Montenegro'
    WHEN Order_Country = 'Mozambique' THEN 'Mozambique'
    WHEN Order_Country = 'Myanmar (Birmania)' THEN 'Myanmar'
    WHEN Order_Country = 'Namibia' THEN 'Namibia'
    WHEN Order_Country = 'Nepal' THEN 'Nepal'
    WHEN Order_Country = 'Nicaragua' THEN 'Nicaragua'
    WHEN Order_Country = 'Niger' THEN 'Niger'
    WHEN Order_Country = 'Nigeria' THEN 'Nigeria'
    WHEN Order_Country = 'Noruega' THEN 'Norway'
    WHEN Order_Country = 'Nueva Zelanda' THEN 'New Zealand'
    WHEN Order_Country = 'Oman' THEN 'Oman'
    WHEN Order_Country = 'Paises Bajos' THEN 'Netherlands'
    WHEN Order_Country = 'Pakistan' THEN 'Pakistan'
    WHEN Order_Country = 'Panama' THEN 'Panama'
    WHEN Order_Country = 'Papua Nueva Guinea' THEN 'Papua New Guinea'
    WHEN Order_Country = 'Paraguay' THEN 'Paraguay'
    WHEN Order_Country = 'Peru' THEN 'Peru'
    WHEN Order_Country = 'Polonia' THEN 'Poland'
    WHEN Order_Country = 'Portugal' THEN 'Portugal'
    WHEN Order_Country = 'Qatar' THEN 'Qatar'
    WHEN Order_Country = 'Reino Unido' THEN 'United Kingdom'
    WHEN Order_Country = 'Republica Centroafricana' THEN 'Central African Republic'
    WHEN Order_Country = 'Republica Checa' THEN 'Czech Republic'
    WHEN Order_Country = 'Republica Democratica del Congo' THEN 'Democratic Republic of the Congo'
    WHEN Order_Country = 'Republica Dominicana' THEN 'Dominican Republic'
    WHEN Order_Country = 'Republica de Gambia' THEN 'Gambia'
    WHEN Order_Country = 'Republica del Congo' THEN 'Republic of the Congo'
    WHEN Order_Country = 'Ruanda' THEN 'Rwanda'
    WHEN Order_Country = 'Rumania' THEN 'Romania'
    WHEN Order_Country = 'Rusia' THEN 'Russia'
    WHEN Order_Country = 'Sahara Occidental' THEN 'Western Sahara'
    WHEN Order_Country = 'Senegal' THEN 'Senegal'
    WHEN Order_Country = 'Serbia' THEN 'Serbia'
    WHEN Order_Country = 'Sierra Leona' THEN 'Sierra Leone'
    WHEN Order_Country = 'Singapur' THEN 'Singapore'
    WHEN Order_Country = 'Siria' THEN 'Syria'
    WHEN Order_Country = 'Somalia' THEN 'Somalia'
    WHEN Order_Country = 'Sri Lanka' THEN 'Sri Lanka'
    WHEN Order_Country = 'Suazilandia' THEN 'Eswatini'
    WHEN Order_Country = 'SudAfrica' THEN 'South Africa'
    WHEN Order_Country = 'Sudan' THEN 'Sudan'
    WHEN Order_Country = 'Sudan del Sur' THEN 'South Sudan'
    WHEN Order_Country = 'Suecia' THEN 'Sweden'
    WHEN Order_Country = 'Suiza' THEN 'Switzerland'
    WHEN Order_Country = 'Surinam' THEN 'Suriname'
    WHEN Order_Country = 'Tailandia' THEN 'Thailand'
    WHEN Order_Country = 'Taiwan' THEN 'Taiwan'
    WHEN Order_Country = 'Tanzania' THEN 'Tanzania'
    WHEN Order_Country = 'Tayikistan' THEN 'Tajikistan'
    WHEN Order_Country = 'Togo' THEN 'Togo'
    WHEN Order_Country = 'Trinidad y Tobago' THEN 'Trinidad and Tobago'
    WHEN Order_Country = 'Tunez' THEN 'Tunisia'
    WHEN Order_Country = 'Turkmenistan' THEN 'Turkmenistan'
    WHEN Order_Country = 'Turquia' THEN 'Turkey'
    WHEN Order_Country = 'Ucrania' THEN 'Ukraine'
    WHEN Order_Country = 'Uganda' THEN 'Uganda'
    WHEN Order_Country = 'Uruguay' THEN 'Uruguay'
    WHEN Order_Country = 'Uzbekistan' THEN 'Uzbekistan'
    WHEN Order_Country = 'Venezuela' THEN 'Venezuela'
    WHEN Order_Country = 'Vietnam' THEN 'Vietnam'
    WHEN Order_Country = 'Yemen' THEN 'Yemen'
    WHEN Order_Country = 'Yibuti' THEN 'Djibouti'
    WHEN Order_Country = 'Zambia' THEN 'Zambia'
    WHEN Order_Country = 'Zimbabue' THEN 'Zimbabwe'
    ELSE Order_Country
END;





-- create dif tables --

-- customer table --
CREATE TABLE customers (
      customer_id INT PRIMARY KEY,
      customer_fullname VARCHAR(255),
      customer_city VARCHAR(255),
      customer_country VARCHAR(255),
      customer_segment VARCHAR(255),
      customer_state VARCHAR (255),
      customer_street VARCHAR (255),
      customer_zopcode VARCHAR (20),
      latitude FLOAT,
      Longitude FLOAT,
      sales_per_customer FLOAT
);

ALTER TABLE customers
ADD COLUMN sales_per_customer FLOAT;

ALTER TABLE customers
CHANGE COLUMN customer_zopcode customer_zipcode VARCHAR(20);


-- order table ---
CREATE TABLE orders (
      order_id INT PRIMARY KEY,
      order_customer_id INT,
      order_date DATE,
      order_year INT,
      order_month VARCHAR (255),
      order_city VARCHAR (255),
      order_country VARCHAR(255),
      order_zipcode VARCHAR (255),
      order_status VARCHAR (255),
      order_state VARCHAR (255),
      order_region VARCHAR (255),
      order_profit_Per_order FLOAT,
      sales FLOAT,
      FOREIGN KEY (order_customer_id) REFERENCES customers(customer_id)
);

ALTER TABLE Orders
ADD COLUMN benefit_per_order FLOAT;


-- categories table----
CREATE TABLE Categories (
     categories_id INT PRIMARY KEY,
     category_name VARCHAR (255)
);



-- product table---
CREATE TABLE products (
      product_card_id INT PRIMARY KEY,
      Product_category_id INT,
      product_name VARCHAR (255),
      product_price DECIMAL (10, 2),
      product_status VARCHAR(255),
      FOREIGN KEY (product_category_id) REFERENCES categories(categories_id)
);


-- order items table ---
CREATE TABLE OrderItems (
      order_item_id INT PRIMARY KEY,
      order_id INT,
      product_card_id INT,
      order_item_cardprod_id INT,
      order_item_quantity INT,
      order_item_profit_ratio FLOAT,
      order_item_product_price FLOAT,
      order_item_discount_rate FLOAT,
      order_item_discount FLOAT,
      order_item_total FLOAT,
      FOREIGN KEY (order_id) REFERENCES orders(order_id),
	  FOREIGN KEY (product_card_id) REFERENCES products(product_card_id)
);



-- shipment table --
CREATE TABLE shipments (
      shipment_id INT PRIMARY KEY AUTO_INCREMENT,
      order_id INT,
      Days_for_shipping_real INT,
      days_for_shipment_scheduled INT,
      Shipping_mode VARCHAR(255),
      shipping_date DATE,
      shipping_year INT,
      shipping_month VARCHAR(255),
      delivery_status VARCHAR(255),
      late_delivery_risk INT,
      FOREIGN KEY (order_id) REFERENCES orders(order_id)
);



-- department table --
CREATE TABLE department (
      department_id INT PRIMARY KEY,
      department_name VARCHAR (255)
);


ALTER TABLE orders
ADD COLUMN market VARCHAR (255);

-- customer purchasetable --
CREATE TABLE customer_purchases (
	   customer_id INT,
       order_id INT,
       product_id INT,
       order_date DATE,
       sales FLOAT,
       PRIMARY KEY (customer_id, order_id, product_id),
       FOREIGN KEY (Customer_id) REFERENCES customers(customer_id)

);



-- time to insert cleaned data ----


ALTER TABLE customers
ADD COLUMN total_sales FLOAT,
ADD COLUMN purchase_frequency INT;

-- INSERT DATA IN CUSTOMER TABLE--

INSERT INTO Customers (Customer_Id, Customer_Fullname, Customer_City, Customer_Country, 
                       Customer_Segment, Customer_State, Customer_Street, Customer_Zipcode, 
                       Latitude, Longitude, Sales_per_customer, Total_Sales, Purchase_Frequency)
SELECT Customer_Id, Customer_Fullname, Customer_City, Customer_Country, 
       Customer_Segment, Customer_State, Customer_Street, Customer_Zipcode, 
       Latitude, Longitude, Sales_per_customer,
       SUM(Sales_per_customer) AS Total_Sales, 
       COUNT(*) AS Purchase_Frequency
FROM (
     SELECT Customer_Id, Customer_Fullname, Customer_City, Customer_Country, 
           Customer_Segment, Customer_State, Customer_Street, Customer_Zipcode, 
           Latitude, Longitude, Sales_per_customer,
           ROW_NUMBER() OVER (PARTITION BY Customer_Id ORDER BY Order_Date) as row_num
     
     FROM temp_supply_chain
     WHERE Customer_Id IS NOT NULL
     
)subquery
WHERE row_num = 1
GROUP BY Customer_Id, Customer_Fullname, Customer_City, Customer_Country, 
         Customer_Segment, Customer_State, Customer_Street, Customer_Zipcode, 
         Latitude, Longitude, Sales_per_customer;



-- INSERT DATA INTO CUSTOMER PURCHASES TABLE USING ROW_NUMBER() TO HANDLE DUPLICATES --
INSERT INTO customer_purchases (Customer_Id, Order_Id, Product_Id, Order_Date, Sales)
SELECT Customer_Id, Order_Id, Order_Item_Cardprod_Id, order_date, Sales
FROM (
    SELECT Customer_Id, Order_Id, Order_Item_Cardprod_Id, order_date, Sales,
           ROW_NUMBER() OVER (PARTITION BY Customer_Id, Order_Id, Order_Item_Cardprod_Id ORDER BY order_date) as row_num
    FROM temp_supply_chain
    WHERE Customer_Id IS NOT NULL
) subquery
WHERE row_num = 1;



-- INSERT DATA INTO ORDERS --
INSERT INTO orders (order_Id, Order_Customer_Id, Order_Date, Order_Year, Order_Month, 
                    Order_City, Order_Country, Order_Zipcode, Order_Status, Order_State, 
                    Order_Region, Order_Profit_Per_Order, Sales, benefit_per_order, market)
                    
SELECT Order_Id, Order_Customer_Id, order_date, order_year, order_month, 
       Order_City, Order_Country, Order_Zipcode, Order_Status, Order_State, 
       Order_Region, Order_Profit_Per_Order, Sales, Benefit_per_order, market
FROM (
     SELECT Order_Id, Order_Customer_Id, order_date, order_year, order_month, 
           Order_City, Order_Country, Order_Zipcode, Order_Status, Order_State, 
           Order_Region, Order_Profit_Per_Order, Sales, Benefit_per_order, market,
           ROW_NUMBER() OVER (PARTITION BY Order_Id ORDER BY order_date) as row_num
           
      FROM temp_supply_chain
      WHERE Order_Id IS NOT NULL
) subquery
WHERE row_num = 1;

select *
from orders;


-- INSERT DATA INTO ORDERITEMS TABLE USING ROW_NUMBER() TO HANDLE DUPLICATES --
INSERT INTO OrderItems (order_item_id, order_id, product_card_id, order_item_cardprod_id, order_item_quantity, 
                        order_item_profit_ratio, order_item_product_price, order_item_discount_rate, 
                        order_item_discount, order_item_total)
SELECT order_item_id, order_id, product_card_id, order_item_cardprod_id, order_item_quantity, 
       order_item_profit_ratio, order_item_product_price, order_item_discount_rate, 
       order_item_discount, order_item_total
FROM (
    SELECT order_item_id, order_id, product_card_id, order_item_cardprod_id, order_item_quantity, 
           order_item_profit_ratio, order_item_product_price, order_item_discount_rate, 
           order_item_discount, order_item_total,
           ROW_NUMBER() OVER (PARTITION BY order_id, order_item_cardprod_id ORDER BY order_date) AS row_num
    FROM temp_supply_chain
    WHERE order_id IS NOT NULL
) Subquery
WHERE row_num = 1;


-- INSERT DATA INTO PRODUCTS TABLE --
INSERT INTO Products (product_card_id, product_name, product_category_id, product_price, product_status)
SELECT DISTINCT Product_Card_Id, Product_Name, Product_Category_Id, Product_Price, Product_Status
FROM temp_supply_chain
WHERE Product_Card_Id IS NOT NULL;



-- INSERT DATA INTO CATEGORIES TABLE USING ROW_NUMBER() TO HANDLE DUPLICATES --
INSERT INTO Categories (Categories_Id, Category_Name)
SELECT Category_Id, Category_Name
FROM (
    SELECT Category_Id, Category_Name,
           ROW_NUMBER() OVER (PARTITION BY Category_Id ORDER BY Category_Name) AS row_num
    FROM temp_supply_chain
    WHERE Category_Id IS NOT NULL
) Subquery
WHERE row_num = 1;

-- INSERT INTO SHIPMENT TABLE --
INSERT INTO shipments ( order_id, Days_for_shipping_real, days_for_shipment_scheduled, Shipping_mode,
      shipping_date, shipping_year, shipping_month, delivery_status, late_delivery_risk )
      
SELECT  order_id, Days_for_shipping_real, days_for_shipment_scheduled, Shipping_mode,
      shipping_date, shipping_year, shipping_month, delivery_status, late_delivery_risk 
      
FROM (
     SELECT order_id, Days_for_shipping_real, days_for_shipment_scheduled, Shipping_mode,
      shipping_date, shipping_year, shipping_month, delivery_status, late_delivery_risk ,
      ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY shipping_date) AS row_num
     FROM temp_supply_chain
     WHERE Order_Id IS NOT NULL
) subquery

WHERE row_num = 1;

select *
from shipments;


-- INSERT INTO DEPARTMENT TABLE --



INSERT INTO department (department_id, department_name)
SELECT department_id, department_name
FROM (
      SELECT department_id, department_name,
             ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY department_name) AS row_num
      from temp_supply_chain
      WHERE Department_Id IS NOT NULL
) subquery
WHERE row_num = 1;



-- ANASLYSIS OF THE DATA ----

-- 1 CUSTOMER ANALYSIS --

-- THE TOP 20 CUSTOMERS BY TOTAL SALES 

SELECT c.customer_id, c.customer_fullname, SUM(o.sales) AS Total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.order_customer_id
GROUP BY c.customer_id, c.customer_fullname
ORDER BY total_sales DESC
LIMIT 20;



-- WHICH CUSTOMER MADE THE MOST ORDER --
SELECT c.customer_id, c.customer_fullname, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.order_customer_id
GROUP BY c.customer_id, c.customer_fullname
ORDER BY order_count desc
LIMIT 2;



-- AVERAGE ORDR VALUE PER CUSTOMER SEGMENT --
SELECT c.customer_segment, AVG(o.sales) AS avg_order_value
FROM Customers c
JOIN orders o ON c.customer_id = o.order_customer_id
GROUP BY c.customer_segment;



-- MONTHLY SALES TRENDS OVER THE YEARS--
 SELECT order_year, order_month, SUM(sales) AS monthly_sales
 FROM orders
 GROUP BY order_year, order_month
 ORDER BY order_year, order_month;


-- MONTH WITH THE HIGHEST SALES AND TOTAL AMOUNT --
SELECT order_year, order_month, SUM(sales) AS monthly_sales
FROM orders
GROUP BY order_year, order_month
ORDER BY monthly_sales DESC
LIMIT 1;


-- DISTRIBUTION OF ORDER STATUSES IF PENDING OR COMPLETE OR IN PROCESS --
SELECT order_status, COUNT(order_id) AS status_count
FROM orders
GROUP BY order_status;

-- MARKET THAT GENERATED THE HIGHEST TOTAL SALES --
SELECT market, SUM(sales) AS total_sales
FROM orders
GROUP BY market
ORDER BY total_sales DESC
limit 1;



-- TOP 10 SELLING PRODUCTS BY TOTAL SALES --
SELECT p.product_name, SUM(oi.order_item_total) AS total_sales
FROM orderitems oi
JOIN products p ON oi.product_card_id = p.product_card_id
GROUP BY p.product_name 
ORDER BY total_sales DESC
LIMIT 10;

-- PRODUCT CATEGORY THAT GENERATES THE MOST REVENUE --
SELECT cat.category_name, SUM(oi.order_item_total) AS total_sales
FROM orderitems oi
JOIN products p ON oi.product_card_id = p.product_card_id
JOIN categories cat ON p.product_category_id = cat.categories_id
GROUP BY cat.category_name 
ORDER BY total_sales DESC 
LIMIT 2;

-- AVERAGE DELIVERY TIME PER SHIPPING MODE --
SELECT shipping_mode, AVG(days_for_shipping_real) AS Avg_delivery_time
FROM shipments
GROUP BY Shipping_mode;



-- SHIPPING MODE WITH THE HIGHEST LATE DELIVERY RISK --
SELECT shipping_mode, AVG(late_delivery_risk) AS avg_late_risk
FROM shipments
GROUP BY Shipping_mode
ORDER BY avg_late_risk
LIMIT 1;


-- COUNT OF ORDERS WITH LATE DELIV RISK --
SELECT COUNT(*) AS late_deliveries
FROM shipments
WHERE late_delivery_risk = 1;



-- DEPARTMENT WITH THE MOST SALES --
SELECT d.department_name, SUM(oi.order_item_total) AS Total_sales
FROM orderitems oi
JOIN products p ON oi.product_card_id = p.product_card_id 
JOIN department d ON p.Product_category_id = d.department_id
GROUP BY d.department_name 
ORDER BY total_sales
LIMIT 1;


-- AVERAGE ORDER VALUE PER DEPARTMENT --
SELECT d.department_name, AVG(oi.order_item_total) AS avg_order_value 
FROM orderitems oi
JOIN products p ON oi.product_card_id = p.product_card_id 
JOIN department d ON p.Product_category_id = d.department_id 
GROUP BY d.department_name;


-- DISTRIBUTION OF ORDERS BY COUNTRY --
SELECT order_country, COUNT(order_id) AS order_count
FROM orders
GROUP BY order_country
ORDER BY order_count DESC;


-- REGION THAT GENERATES THE MOST REVENUE --
SELECT order_region, SUM(sales) AS total_sales
FROM orders
GROUP BY order_region
ORDER BY Total_Sales DESC
LIMIT 1;


-- TOTAL BENEFIT GENERATED PER ORDER --
SELECT order_id, SUM(benefit_per_order) AS total_benefit
FROM orders
GROUP BY order_id
ORDER BY total_benefit DESC;


-- PRODUCTS THAT GENERATE HIGHEST PROFIT MARGIN --
SELECT p.product_name, AVG(oi.order_item_profit_ratio) AS Avg_profit_ratio
FROM orderitems oi 
JOIN products p ON oi.product_card_id = p.product_card_id
GROUP BY p.product_name
ORDER BY Avg_profit_ratio DESC
LIMIT 1;

-- AVERAGE ORDER QUANTITY PER PRODUCT --
SELECT p.product_name, AVG(oi.order_item_quantity) AS  Avg_quantity
FROM orderitems oi 
JOIN products p ON oi.product_card_id = p.product_card_id
GROUP BY p.product_name
ORDER BY Avg_quantity DESC;



-- THE MARKET THAT GENERATES HIGHEST TOTAL SALES --
SELECT market, SUM(sales) AS total_sales
FROM orders
GROUP BY market
ORDER BY total_sales DESC
LIMIT 2


















































