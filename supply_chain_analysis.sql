select*
from `supply data`;

create table supply_data2
like `supply data`;

INSERT INTO supply_data2
select*
from `supply data`;

select*
from supply_data2;


select*, row_number()over(partition by `Product Type`, SKU, Price, Availability, `Number of Products Sold`, `Revenue Generated`, `Customer Demographics`, `Stock Levels`, `Lead Times`, `Order Quantities`, `Shipping Times`, `Shipping Carriers`, `Shipping Costs`, `Supplier Name`, Location, `Lead Time`, `Production Volumes`, `Manufacturing Lead Time`, `Manufacturing Costs`, `Inspection Results`, `Defect Rates`, `Transportation Modes`, Routes, Costs order by  SKU ) AS `row number`
from supply_data2;


CREATE TABLE `supply_data3` (
  `Product type` text,
  `SKU` text,
  `Price` double DEFAULT NULL,
  `Availability` int DEFAULT NULL,
  `Number of products sold` int DEFAULT NULL,
  `Revenue generated` double DEFAULT NULL,
  `Customer demographics` text,
  `Stock levels` int DEFAULT NULL,
  `Lead times` int DEFAULT NULL,
  `Order quantities` int DEFAULT NULL,
  `Shipping times` int DEFAULT NULL,
  `Shipping carriers` text,
  `Shipping costs` double DEFAULT NULL,
  `Supplier name` text,
  `Location` text,
  `Lead time` int DEFAULT NULL,
  `Production volumes` int DEFAULT NULL,
  `Manufacturing lead time` int DEFAULT NULL,
  `Manufacturing costs` double DEFAULT NULL,
  `Inspection results` text,
  `Defect rates` double DEFAULT NULL,
  `Transportation modes` text,
  `Routes` text,
  `Costs` double DEFAULT NULL,
  `row number` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from supply_data3;

insert into supply_data3
select*, row_number()over(partition by `Product Type`, SKU, Price, Availability, `Number of Products Sold`, `Revenue Generated`, `Customer Demographics`, `Stock Levels`, `Lead Times`, `Order Quantities`, `Shipping Times`, `Shipping Carriers`, `Shipping Costs`, `Supplier Name`, Location, `Lead Time`, `Production Volumes`, `Manufacturing Lead Time`, `Manufacturing Costs`, `Inspection Results`, `Defect Rates`, `Transportation Modes`, Routes, Costs order by  SKU ) AS `row number`
from supply_data2;

select*
from supply_data3
where `row number`>1;


delete
from supply_data3
where `row number`>1;

select*
from supply_data3;

with cte_dublicated AS (
select*, row_number()over(partition by `Product_Type`, SKU ) AS `row number2`
from supply_data3)
select*
from cte_dublicated
where `row number2`>1;

select*
from supply_data3;

SELECT
    TRIM(`Product Type`) AS `Product Type`,
    TRIM(`Customer Demographics`) AS `Customer Demographics`,
    TRIM(`Shipping Carriers`) AS `Shipping Carriers`,
    TRIM(`Supplier Name`) AS `Supplier Name`,
    TRIM(Location) AS Location,
    TRIM(`Inspection Results`) AS `Inspection Results`,
    TRIM(`Transportation Modes`) AS `Transportation Modes`,
    TRIM(Routes) AS Routes
FROM supply_data3;

UPDATE supply_data3
SET
    `Product Type` = TRIM(`Product Type`),
    `Customer Demographics` = TRIM(`Customer Demographics`),
    `Shipping Carriers` = TRIM(`Shipping Carriers`),
    `Supplier Name` = TRIM(`Supplier Name`),
    Location = TRIM(Location),
    `Inspection Results` = TRIM(`Inspection Results`),
    `Transportation Modes` = TRIM(`Transportation Modes`),
    Routes = TRIM(Routes);
    
    select*
    FROM supply_data3;
    
   SELECT 
    SUM(`Product Type` IS NULL) AS product_type_null,
    SUM(SKU IS NULL) AS sku_null,
    SUM(Price IS NULL) AS price_null,
    SUM(Availability IS NULL) AS availability_null,
    SUM(`Number of Products Sold` IS NULL) AS products_sold_null,
    SUM(`Revenue Generated` IS NULL) AS revenue_null,
    SUM(`Customer Demographics` IS NULL) AS demographics_null,
    SUM(`Stock Levels` IS NULL) AS stock_null
FROM supply_data3;

SELECT COUNT(*) AS total_rows
FROM supply_data3;

SELECT*
FROM supply_data3;

alter table supply_data3
drop column `row number`;

SELECT*
FROM supply_data3;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        CASE
            WHEN ABS(
                `Revenue_Generated`
                - (`Price` * `number_of_Products_Sold`)
            ) > 0.01
            THEN 1
            ELSE 0
        END
    ) AS mismatched_rows
FROM supply_data3;
  

SELECT*
FROM supply_data3;

ALTER TABLE supply_data3
    RENAME COLUMN `Product Type` TO product_type,
    RENAME COLUMN SKU TO sku,
    RENAME COLUMN Price TO price,
    RENAME COLUMN Availability TO availability,
    RENAME COLUMN `Number of Products Sold` TO number_of_products_sold,
    RENAME COLUMN `Revenue Generated` TO revenue_generated,
    RENAME COLUMN `Customer Demographics` TO customer_demographics,
    RENAME COLUMN `Stock Levels` TO stock_levels,
    RENAME COLUMN `Lead Times` TO business_lead_time,
    RENAME COLUMN `Order Quantities` TO order_quantities,
    RENAME COLUMN `Shipping Times` TO shipping_times,
    RENAME COLUMN `Shipping Carriers` TO shipping_carriers,
    RENAME COLUMN `Shipping Costs` TO shipping_costs,
    RENAME COLUMN `Supplier Name` TO supplier_name,
    RENAME COLUMN Location TO location,
    RENAME COLUMN `Lead Time` TO supplier_lead_time,
    RENAME COLUMN `Production Volumes` TO production_volumes,
    RENAME COLUMN `Manufacturing Lead Time` TO manufacturing_lead_time,
    RENAME COLUMN `Manufacturing Costs` TO manufacturing_costs,
    RENAME COLUMN `Inspection Results` TO inspection_results,
    RENAME COLUMN `Defect Rates` TO defect_rates,
    RENAME COLUMN `Transportation Modes` TO transportation_modes,
    RENAME COLUMN Routes TO routes,
    RENAME COLUMN Costs TO transportation_costs;
    
    UPDATE supply_data3
SET
    `Product_Type` = LOWER(`Product_Type`),
    SKU = LOWER(SKU),
    `Customer_Demographics` = LOWER(`Customer_Demographics`),
    `Shipping_Carriers` = LOWER(`Shipping_Carriers`),
    `Supplier_name` = LOWER(`Supplier_name`),
    Location = LOWER(Location),
    `Inspection_Results` = LOWER(`Inspection_Results`),
    `Transportation_Modes` = LOWER(`Transportation_Modes`),
    Routes = LOWER(Routes);

    select*
    from supply_data3;
    
  describe supply_data3;

 Analysis 
 

SELECT*
FROM supply_data3;

SELECT
    product_type,
    SUM(revenue_generated),
        SUM(number_of_products_sold) AS total_units_sold,
    COUNT(SKU) AS number_of_product,
    AVG(number_of_products_sold) AS avg_units_sold,
    AVG(revenue_generated) AS avg_revenue_per_product,
    AVG(price) AS avg_price
FROM supply_data3
GROUP BY product_type
ORDER BY total_units_sold DESC;

SELECT
    product_type,
    sku,
    number_of_products_sold,
    price
    FROM supply_data3
ORDER BY product_type, number_of_products_sold DESC;


SELECT
    product_type,
    customer_demographics,
    sum(number_of_products_sold) as unit_sold,
   CONCAT(
    ROUND( 100.0 * SUM(number_of_products_sold)
        / SUM(SUM(number_of_products_sold))
          OVER (PARTITION BY product_type),
        2), '%'
) AS percentage_of_sales
FROM supply_data3
GROUP BY product_type, customer_demographics;

SELECT
    customer_demographics,
    SUM(number_of_products_sold) AS total_units_sold,
   sum( revenue_generated)AS total_revenue,
    AVG(price) AS avg_price
FROM supply_data3
GROUP BY customer_demographics
ORDER BY avg_price DESC;



SELECT
    sku,
    number_of_products_sold,
    stock_levels,
    business_lead_time,

    CASE
        WHEN number_of_products_sold >= 500
             AND stock_levels < 100
             AND business_lead_time > 10
            THEN 'High Risk'

        WHEN number_of_products_sold >= 500
             AND stock_levels < 100
            THEN 'Medium Risk'

        WHEN stock_levels < 100
             AND business_lead_time > 10
            THEN 'Medium Risk'

        WHEN stock_levels < 100
            THEN 'Low Stock'

        ELSE 'Normal'
    END AS inventory_risk,

    manufacturing_lead_time,

    CASE
        WHEN manufacturing_lead_time <= 5 THEN 'Short'
        WHEN manufacturing_lead_time <= 10 THEN 'Medium'
        ELSE 'Long'
    END AS manufacturing_lead_time_status
FROM supply_data3
ORDER BY number_of_products_sold DESC;



SELECT
    shipping_carriers,
    COUNT(*) AS shipment_records,
    AVG(shipping_times) AS avg_shipping_time,
    AVG(shipping_costs) AS avg_shipping_cost
FROM supply_data3
GROUP BY shipping_carriers
ORDER BY avg_shipping_time ASC;

SELECT
    inspection_results,
    COUNT(*) AS number_of_products,
    SUM(number_of_products_sold) AS total_units_sold,
    ROUND(AVG(defect_rates), 2) AS avg_defect_rate
FROM supply_data3
GROUP BY inspection_results
ORDER BY avg_defect_rate DESC;



SELECT
    location,
    supplier_name,
    COUNT(*) AS number_of_records,
    ROUND(AVG(supplier_lead_time), 2) AS avg_supplier_lead_time,
    MAX(supplier_lead_time) AS max_supplier_lead_time
FROM supply_data3
GROUP BY location, supplier_name
ORDER BY avg_supplier_lead_time DESC;

 SELECT*
from Supply_data3;
 

