--creating the fact table
drop table [pc_staging].[dbo].[pc_sales_fact]
create table [pc_staging].[dbo].[pc_sales_fact](
	[sales_id] int identity(1,1) primary key,

	[customer_id] int NOT NULL,
	[employee_id] int NOT NULL,
	[product_id] int NOT NULL,
	[location_id] int NOT NULL,
	[store_id] int NOT NULL,
	[payment_id] int NOT NULL,
	[channel_id] int NOT NULL ,
	[priority_id] int NOT NULL ,
	[date_id] int NOT NULL,

	[Cost_Price] decimal(10,2) NOT NULL,
	[Sale_Price] decimal(10,2) NOT NULL,
	[Discount_Amount] decimal(10,2) NOT NULL,
	[Finance_Amount] decimal(10,2) NOT NULL,
	[Cost_of_Repairs] decimal(10,2) NOT NULL,
	[Total_Sales_per_Employee] decimal(10,2) NOT NULL,
	[PC_Market_Price] decimal(10,2) NOT NULL,
	[Credit_Score] decimal(10,2) NOT NULL,
	[load_date] datetime default getdate()
)

insert into [pc_staging].[dbo].[pc_sales_fact] (customer_id, employee_id, product_id, location_id,store_id,
												payment_id, channel_id, priority_id, date_id,

												sale_price, cost_price, discount_amount, finance_amount,
												cost_of_repairs, total_sales_per_employee, pc_market_price,
												credit_score)

select
	c.customer_id,
	e.employee_id,
	p.product_id,
	l.location_id,
	s.store_id,
	pm.payment_id,
	ch.channel_id,
	pr.priority_id,
	d.date_id,

	cast(st.sale_price as decimal(10,2)),
	cast(st.cost_price as decimal(10,2)),
	cast(st.discount_amount as decimal(10,2)),
	cast(st.finance_amount as decimal(10,2)),
	cast(st.cost_of_repairs as decimal(10,2)),
	cast(st.total_sales_per_employee as decimal(10,2)),
	cast(st.pc_market_price as decimal(10,2)),
	st.credit_score


from [pc_staging].[dbo].[pc_data] as st

inner join [pc_staging].[dbo].[dim_customer] c
	on st.customer_name = c.first_name
	

inner join [pc_staging].[dbo].[dim_employee] e
	on st.sales_person_name = e.employee_name
	and st.Sales_Person_Department = e.department
	and st.Customer_Surname = c.last_name
	and st.Customer_Contact_Number = c.contact_number
	and st.Customer_Email_Address = c.email_address

inner join [pc_staging].[dbo]. [dim_product] p
	on st.pc_model = p.pc_model
	and st.pc_make = p.pc_make
	and st.Storage_Capacity = p.storage_capacity
	and st.Storage_Type = p.storage_type
	and st.ram = p.ram

inner join [pc_staging].[dbo].[dim_location] l
	on st.Continent = l.continent
	and st.province_or_city = l.province_or_city
	and st.Country_or_State = l.country_or_state

inner join [pc_staging].[dbo].[dim_store] s
	on st.shop_name = s.shop_name
	and st.Shop_Age = s.shop_age

inner join [pc_staging].[dbo].[dim_payment] pm
	on st.payment_method = pm.payment_method

inner join [pc_staging].[dbo].[dim_channel] ch
	on st.channel = ch.channel

inner join [pc_staging].[dbo].[dim_priority] pr
	on st.priority = pr.priority

inner join [pc_staging].[dbo].[dim_date] d
	on st.purchase_date = d.purchase_date
	and  coalesce(try_cast(st.ship_date as date), '9999-12-31') = d.ship_date;

	--validating the insert
		select * from [pc_staging].[dbo].[pc_sales_fact]