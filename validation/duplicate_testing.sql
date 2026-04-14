--checking dimension tables duplicates

	--dim_customer
select first_name, last_name, contact_number, email_address, count (*) as duplicates
from [pc_staging].[dbo].[dim_customer]
group by first_name, last_name, contact_number, email_address
having count(*) >1;

	--dim_employee
select employee_name, department, count (*) as duplicates
from [pc_staging].[dbo].[dim_employee]
group by employee_name, department
having count (*) > 1;

	--dim_product
select pc_make, pc_model, storage_type, storage_capacity, ram, count (*) as duplicates
from [pc_staging].[dbo].[dim_product]
group by pc_make, pc_model, storage_type, storage_capacity, ram
having count (*) > 1;

	--dim_location
select continent, country_or_state, province_or_city, count (*) as duplicates
from [pc_staging].[dbo].[dim_location]
group by continent, country_or_state, province_or_city
having count (*) > 1;

	--dim_store
select shop_name, shop_age, count (*) as duplicates
from [pc_staging].[dbo].[dim_store]
group by shop_name, shop_age
having count (*) > 1;

	--dim_payment
select payment_method, count (*) as duplicates
from [pc_staging].[dbo].[dim_payment]
group by payment_method
having count (*) > 1;

	--dim_channel
select channel, count (*) as duplicates
from [pc_staging].[dbo].[dim_channel]
group by channel
having count (*) > 1;

	--dim_priority
select priority, count (*) as duplicates
from [pc_staging].[dbo].[dim_priority]
group by priority
having count (*) > 1;

	--dim_date
select purchase_date, ship_date, year, month, count (*) as duplicates
from [pc_staging].[dbo].[dim_date]
group by purchase_date, ship_date, year, month
having count (*) > 1;

	--pc_sales_fact
select sale_price, cost_price, discount_amount, finance_amount, cost_of_repairs,
		total_sales_per_employee, pc_market_price, credit_score, count (*) as duplicates
from [pc_staging].[dbo].[pc_sales_fact]
group by sale_price, cost_price, discount_amount, finance_amount,cost_of_repairs,
		total_sales_per_employee, pc_market_price, credit_score
having count (*) > 1;