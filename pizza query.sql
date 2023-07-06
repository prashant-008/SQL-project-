select * from pizza_sales

--Total revenue 

select sum(total_price)as Total_Revenue from pizza_sales 

--Average Order value

select sum(total_price)/count(distinct order_id) as Average_order_value from pizza_sales

--Total Pizzzas Sold

select sum(quantity) as Total_pizzas_sold from pizza_sales

--Total Orders

select count(distinct order_id)as Total_orders from pizza_sales

--Average pizzas per order 

select cast(sum(quantity)as decimal(10,2)) /count(distinct order_id) as Pizzas_Per_order from pizza_sales

--Daily trend for total orders 

select DATENAME(DW,order_date)as order_day, count(distinct order_id) as Total_orders from pizza_sales
group by  DATENAME(DW,order_date)

--Hourly trend
select datepart(HOUR,order_time)as order_hour, count(distinct order_id) as Total_orders from pizza_sales
group by datepart(HOUR,order_time)
order by datepart(HOUR,order_time)

-- % of sales by pizza category

select pizza_category,sum(total_price)*100/(select sum(total_price) from pizza_sales)as total_sales_by_percent
from pizza_sales 
group by  pizza_category

--% of sales by pizza size

select pizza_size, sum(total_price)*100/ (select sum(total_price) from pizza_sales) as Percentage_sales
from pizza_sales
group by pizza_size

--Total pizzas sold by pizza category

select pizza_category ,sum(quantity)as total_pizzas from pizza_sales
group by pizza_category

-- top 5 best sellers by  total pizzas sold 

select top (5) sum(quantity)AS quantity, pizza_name from pizza_sales
group by pizza_name
order by quantity desc

--botttom 5 best sellers

select top(5) sum(quantity)AS quantity, pizza_name from pizza_sales
group by pizza_name
order by quantity 







