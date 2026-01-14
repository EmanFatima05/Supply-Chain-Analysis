Create database Supply_chain

Create table Supply_chain(
	Product_Type varchar(50),
	SKU varchar(20) primary key not null,
	Price float,
	Availabile_for_sale smallint,
	Number_of_Products_sold smallint,
	Revenue_generated float,
	Customer_Gender varchar(50),
	stock_levels smallint,
	Customer_Lead_time tinyint,
	Order_quantities smallint,
	Shipping_times tinyint,
	Shipping_Carriers varchar(50),
	Shipping_Costs float,
	supplier_Name varchar(50),
	Location varchar(50),
	Supplier_Lead_time tinyint,
	Production_Volumes smallint,
	Manufacturing_lead_time tinyint,
	Manufacturing_costs float,
	Inspection_results varchar(50),
	Defect_rates float,
	Transportation_modes varchar(10),
	Routes varchar(20),
	Total_Cost float
)

BULK INSERT dbo.supply_chain
FROM 'D:\Work\Data Analyst Specialist DEPI\Final
Project\Edit\supply_chain_data.csv'
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

select *
from Supply_chain_data

--Changing Column

EXEC sp_rename 'supply_chain_data.Customer_demographics', 'Customer_Gender','COLUMN'
EXEC sp_rename 'supply_chain_data.Availability', 'Availabile_for_sale', 'COLUMN'
EXEC sp_rename 'supply_chain_data.Lead_times', 'Customer_Lead_time', 'COLUMN'
EXEC sp_rename 'supply_chain_data.Lead_time', 'Supplier_Lead_time', 'COLUMN'
EXEC sp_rename 'supply_chain_data.Costs', 'Total_Cost', 'COLUMN'

/* Change Float column to DECIMAL(�,2)*/

alter table Supply_chain alter column price decimal(10,2)

alter table Supply_chain alter column Shipping_costs decimal(10,2)

alter table Supply_chain alter column Manufacturing_costs decimal(10,2)

alter table Supply_chain alter column Defect_rates decimal(10,1)

alter table Supply_chain alter column Total_cost decimal(10,2)

alter table Supply_chain alter column Revenue_generated decimal(10,2)

/* add Constraint to Check all money_-related columns*/

alter table Supply_chain add constraint check_price Check ( Price >= 0)

alter table Supply_chain add constraint checks_Shipping_cost check (Shipping_costs >=0)

alter table Supply_chain add constraint checks_Manufacturing_Costs check (Manufacturing_Costs >=0 )

alter table Supply_chain add constraint checks_Total_cost check (Total_Cost >=0) 

/* Calculated Warehousing Cost */

alter table Supply_chain add Warehousing_cost as (Total_Cost -(Manufacturing_costs + Shipping_costs) )

/* Calculated Profit */
alter table Supply_chain add Profit as ( Revenue_generated - Total_Cost)

/* Calculated Stockout Risk */

alter table Supply_chain add Stock_out_risk int null

UPDATE dbo.Supply_chain
SET [Stock_out_risk] = CAST( ROUND(( stock_levels * 100.0) / NULLIF(Order_quantities * 1.0, 0), 0) AS int);


select *
from Supply_chain_data

/* Calculated Defective Units */

alter table Supply_chain_data add Defective_units int

UPDATE Supply_chain_data SET Defective_units = Production_Volumes *(Defect_rates / 100);

/* Calculated Defecrive Units */

alter table Supply_chain_data add Accepted_units int

UPDATE Supply_chain_data SET Accepted_units = Production_Volumes - CAST( Production_Volumes * (Defect_rates / 100) As int);

/* Check columns are not null */

Select *
from Supply_chain
where Product_type is null

Select *
from Supply_chain
where SKU is null

Select *
from Supply_chain
where Price is null

Select *
from Supply_chain
where Availabile_for_sale is null

Select *
from Supply_chain
where Number_of_Products_sold is null

Select *
from Supply_chain
where Customer_Gender is null

Select *
from Supply_chain
where stock_levels is null

Select *
from Supply_chain
where Customer_Lead_time is null

Select *
from Supply_chain
where Order_quantities is null

Select *
from Supply_chain
where Shipping_times is null

Select *
from Supply_chain
where Shipping_carriers is null

Select *
from Supply_chain
where Shipping_Costs is null

Select *
from Supply_chain
where supplier_Name is null

Select *
from Supply_chain
where Location is null

Select *
from Supply_chain
where Supplier_Lead_time is null

Select *
from Supply_chain
where Production_Volumes is null

Select *
from Supply_chain
where Manufacturing_lead_time is null

Select *
from Supply_chain
where Manufacturing_costs is null

Select *
from Supply_chain
where Inspection_results is null

Select *
from Supply_chain
where Defect_rates is null

Select *
from Supply_chain
where Transportation_modes is null

Select *
from Supply_chain
where Routes is null

Select *
from Supply_chain
where Total_Cost is null

/*Find duplicate records*/

WITH DuplicateCheck AS (
SELECT *,
ROW_NUMBER() OVER (
	PARTITION BY SKU, Product_type, Price ,Number_of_Products_sold,
	Customer_Gender,
	Availabile_for_sale,stock_levels,Customer_Lead_time,Order_quantities,
	Shipping_times,Shipping_carriers,supplier_Name,Location,
	Supplier_Lead_time,Production_Volumes,
	Manufacturing_lead_time,Inspection_results,Defect_rates,
	Transportation_modes,Routes,Total_Cost
	ORDER BY SKU
) AS rn
FROM dbo.Supply_chain
)

SELECT *
FROM DuplicateCheck
WHERE rn > 1;/*Checking for Min Max of each columns*/SELECT
	MIN(Price) AS MinPrice,
	MAX(Price) AS MaxPrice,
	MIN(Shipping_Costs) AS MinShippingCost,
	MAX(Shipping_Costs) AS MaxShippingCost,
	MIN(Manufacturing_costs) AS MinManufacturingCost,
	MAX(Manufacturing_costs) AS MaxManufacturingCost,
	MIN(stock_levels) AS MinStock,
	MAX(stock_levels) AS MaxStock,
	MIN(Defect_rates) AS MinDefectRate,
	MAX(Defect_rates) AS MaxDefectRate
FROM Supply_chain;


SELECT Shipping_Carriers, COUNT(*) AS CountRows
FROM Supply_chain
GROUP BY Shipping_Carriers

SELECT 
	Location,
	COUNT(*) AS CountRows
FROM Supply_chain
GROUP BY Location
ORDER BY CountRows DESC;

SELECT
	Product_Type,
	COUNT(*) AS CountRows
FROM Supply_chain
GROUP BY Product_Type
ORDER BY CountRows DESC;

SELECT 
	supplier_Name,
	COUNT(*) AS CountRows
FROM Supply_chain
GROUP BY supplier_Name
ORDER BY CountRows DESC;

SELECT 
	Location,
	COUNT(*) AS CountRows
FROM Supply_chain
GROUP BY Location
ORDER BY CountRows DESC;

SELECT
	Routes,
	COUNT(*) AS CountRows
FROM Supply_chain
GROUP BY Routes
ORDER BY CountRows DESC;

SELECT 
	Customer_Gender,
	COUNT(*) AS CountRows
FROM Supply_chain
GROUP BY Customer_Gender
ORDER BY CountRows DESC;

select *
from Supply_chain_data

--Top 5 Most Profitable Products (SKUs)

select top 5 
	Sku ,
	round(Profit , 2)
from Supply_chain
order by Profit desc

--Top Performing Product Categories

select 
	Product_Type ,
	sum(Order_Quantities) as[ total orders]
from Supply_chain
group by Product_Type
order by Product_Type desc

-- Revenue Performance by Product Type

select 
	Product_Type ,
	round(sum(Revenue_generated) , 2) as [Total revenue]
from Supply_chain
group by Product_Type
order by Product_Type desc

-- Average Supplier Lead Time

select 
	Supplier_Name ,
	AVG(Supplier_Lead_Time) as [average time by each supplier]
from Supply_chain
group by Supplier_Name

--Defect Rate vs Supplier Lead Time per Supplier

select 
	supplier_Name ,
	round(avg(Defect_Rates) , 2) as [total defect rates by each supplier] ,
	Cast(Avg(Supplier_Lead_time) as float) as AVG_SupLead
from Supply_chain
group by Supplier_Name
order by sum(Supplier_Lead_Time) asc

Select distinct Supplier_Name
from Supply_chain-- Average Shipping Time by Carrier
select
	Shipping_Carriers ,
	avg(Shipping_Times * 1.0) as [average shipping time by each carrier]
from Supply_chain
group by Shipping_Carriers-- Comparison of Shipping Costs Across Transport Modes

select
	Transportation_Modes ,
	avg(Shipping_Costs) as [average cost / transportation mode]
from Supply_chain
group by Transportation_Modes--Route Efficiency (Time / Cost)

select
	Routes ,
	avg((Shipping_Times)/(Shipping_Costs)) as [route effeciency]
from Supply_chain
group by routes-- Carrier Performance (Time vs Cost):
select 
	Shipping_carriers ,
	cast(avg(Shipping_times) as decimal(10,2)) as AVG_Shiptime,
	Cast (avg(Shipping_costs)as decimal(10,2) ) as	AVG_Shipcost
from Supply_chain
group by Shipping_carriers--Manufactor
-- manufactur lead time cost production volumeSELECT
CASE
	WHEN Manufacturing_Lead_Time BETWEEN 1 AND 5 THEN '1-5'
	WHEN Manufacturing_Lead_Time BETWEEN 6 AND 10 THEN '6-10'
	WHEN Manufacturing_Lead_Time BETWEEN 11 AND 15 THEN '11-15'
	WHEN Manufacturing_Lead_Time BETWEEN 16 AND 20 THEN '16-20'
	WHEN Manufacturing_Lead_Time BETWEEN 21 AND 25 THEN '21-25'
	WHEN Manufacturing_Lead_Time BETWEEN 26 AND 30 THEN '26-30'
	ELSE 'Above 30'
END
AS
	LeadTime_Range,
	AVG(Manufacturing_Costs) AS Avg_Manufacturing_Cost,
	avg(Production_Volumes) as avg_production_vol
FROM Supply_chain
GROUP BY
CASE
	WHEN Manufacturing_Lead_Time BETWEEN 1 AND 5 THEN '1-5'
	WHEN Manufacturing_Lead_Time BETWEEN 6 AND 10 THEN '6-10'
	WHEN Manufacturing_Lead_Time BETWEEN 11 AND 15 THEN '11-15'
	WHEN Manufacturing_Lead_Time BETWEEN 16 AND 20 THEN '16-20'
	WHEN Manufacturing_Lead_Time BETWEEN 21 AND 25 THEN '21-25'
	WHEN Manufacturing_Lead_Time BETWEEN 26 AND 30 THEN '26-30'
	ELSE 'Above 30'
END--Defect Rate vs Production Volume
SELECT
CASE
	WHEN Production_Volumes BETWEEN 100 AND 250 THEN '100�250'
	WHEN Production_Volumes BETWEEN 251 AND 500 THEN '251�500'
	WHEN Production_Volumes BETWEEN 501 AND 750 THEN '501�750'
	WHEN Production_Volumes BETWEEN 751 AND 1000 THEN '751�1000'
	ELSE 'Above 1000'
END 
AS
	Production_Volume_Group,
	ROUND(AVG(Defect_Rates), 2) AS Avg_Defect_Rate
FROM Supply_chain
GROUP BY
CASE
	WHEN Production_Volumes BETWEEN 100 AND 250 THEN '100�250'
	WHEN Production_Volumes BETWEEN 251 AND 500 THEN '251�500'
	WHEN Production_Volumes BETWEEN 501 AND 750 THEN '501�750'
	WHEN Production_Volumes BETWEEN 751 AND 1000 THEN '751�1000'
	ELSE 'Above 1000'
END
ORDER BY
MIN(Production_Volumes);--Sales by Customer Gender

SELECT
	Customer_Gender,
	ROUND(SUM(Revenue_generated), 2) AS [Sales per Gender],
	ROUND((SUM(Revenue_generated) * 100.0 / SUM(SUM(Revenue_generated)) OVER ()),2) AS [Percentage of Total (%)]
FROM Supply_chain
GROUP BY Customer_Gender
ORDER BY [Sales per Gender] DESC;SELECT
	Supplier_name,
	ROUND(AVG([Stock_out_risk]), 2) *100 AS Avg_Stockout_Risk,
	ROUND(AVG(Supplier_Lead_time), 2)AS Avg_Supplier_Lead_Time
FROM Supply_chain
GROUP BY Supplier_name
ORDER BY
Avg_Stockout_Risk DESC;Select * from Supply_chain--Manufacturing Lead Time / Production Volume

select top 15
	Sku ,
	sum(Manufacturing_Lead_Time * 1.0)/sum(Production_Volumes*1.0) as  [production effeciency]
from Supply_chain
group by Sku

--Cross-Functional Analysis
--cost break down

select 
	Product_Type,
	sum(Warehousing_cost) as [Warehousing_Costs],
	sum(Manufacturing_Costs) AS [manufacturing cost] ,
	sum(Shipping_Costs) as [shipping cost]
from Supply_chain
group by Product_Type-- time breakdownSELECT
-- Percentage contribution of Customer Lead Time
(
	(SUM(Supplier_Lead_Time) * 100.0) / (SUM(Customer_Lead_Time) + SUM(Manufacturing_Lead_Time) + SUM(Shipping_Times))
) AS [supplier Lead Time %],
-- Percentage contribution of Manufacturing Lead Time
(
	(SUM(Manufacturing_Lead_Time) * 100.0) / (SUM(Customer_Lead_Time) + SUM(Manufacturing_Lead_Time) + SUM(Shipping_Times))
) AS [Manufacturing Lead Time %],
-- Percentage contribution of Shipping Time
(
	(SUM(Shipping_Times) * 100.0) / (SUM(Customer_Lead_Time) + SUM(Manufacturing_Lead_Time) + SUM(Shipping_Times))
) AS [Shipping Time %]
FROM Supply_chain

