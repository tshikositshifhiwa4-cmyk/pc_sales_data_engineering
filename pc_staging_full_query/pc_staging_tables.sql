
--creating dimension tables
--1. dim_customers
drop table [pc_staging].[dbo].[dim_customer]
create table [pc_staging].[dbo].[dim_customer](
	[customer_id] int identity(1,1) primary key,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[contact_number] [nvarchar](50) NOT NULL,
	[email_address] [nvarchar](50) NOT NULL
)
insert into [pc_staging].[dbo].[dim_customer] (first_name, last_name, contact_number, email_address )
select distinct Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_customer];
			
			--checking duplicates
					select first_name, last_name, contact_number, email_address, count (*) as duplicates
					from [pc_staging].[dbo].[dim_customer] 
					group by first_name, last_name, contact_number, email_address
					having count(*) >1;

--2.dim_employee
drop table [pc_staging].[dbo].[dim_employee]
create table [pc_staging].[dbo].[dim_employee](
	[employee_id] int identity(1,1) primary key,
	[employee_name] [nvarchar](50) NOT NULL,
	[department] [nvarchar](50) NOT NULL
)
insert into [pc_staging].[dbo].[dim_employee] (employee_name, department)
select distinct Sales_Person_Name, Sales_Person_Department 
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_employee];
			
			--checking duplicates
				select employee_name, department, count (*) as duplicates
				from [pc_staging].[dbo].[dim_employee]
				group by employee_name, department
				having count (*) > 1;

--3.dim_product
drop table [pc_staging].[dbo].[dim_product]
create table [pc_staging].[dbo].[dim_product](
	[product_id] int identity(1,1) primary key,
	[pc_make] [nvarchar](50) NOT NULL,
	[pc_model] [nvarchar](50) NOT NULL,
	[storage_type] [nvarchar](50) NOT NULL,
	[storage_capacity] [nvarchar](50) NOT NULL,
	[ram] [nvarchar](50) NOT NULL
)
insert into [pc_staging].[dbo].[dim_product] (pc_make, pc_model, storage_type, storage_capacity, ram)
select distinct pc_make, pc_model, storage_type, storage_capacity, ram 
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_product];

			--checking  duplicates
				select pc_make, pc_model, storage_type, storage_capacity, ram, count (*) as duplicates
				from [pc_staging].[dbo].[dim_product]
				group by pc_make, pc_model, storage_type, storage_capacity, ram
				having count (*) > 1;

--4.dim_location
drop table [pc_staging].[dbo].[dim_location]
create table [pc_staging].[dbo].[dim_location](
	[location_id] int identity(1,1) primary key,
	[continent] [nvarchar](50) NOT NULL,
	[country_or_state] [nvarchar](50) NOT NULL,
	[province_or_city] [nvarchar](100) NOT NULL
)
insert into [pc_staging].[dbo].[dim_location] (continent, country_or_state, province_or_city)
select distinct continent, country_or_state, province_or_city
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_location];

			--checking duplicates
				select continent, country_or_state, province_or_city, count (*) as duplicates
				from [pc_staging].[dbo].[dim_location]
				group by continent, country_or_state, province_or_city
				having count (*) > 1;

--5.dim_store
drop table [pc_staging].[dbo].[dim_store]
create table [pc_staging].[dbo].[dim_store](
	[store_id] int identity(1,1) primary key,
	[shop_name] [nvarchar](50) NOT NULL,
	[shop_age] [nvarchar](50) NOT NULL,
)
insert into [pc_staging].[dbo].[dim_store] (shop_name, shop_age)
select distinct shop_name, shop_age
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_store];

				--checking duplicates
				select shop_name, shop_age, count (*) as duplicates
				from [pc_staging].[dbo].[dim_store]
				group by shop_name, shop_age
				having count (*) > 1;

--6.dim_payment
drop table [pc_staging].[dbo].[dim_payment]
create table [pc_staging].[dbo].[dim_payment](
	[payment_id] int identity(1,1) primary key,
	[Payment_Method] [nvarchar](50) NOT NULL,
)
insert into [pc_staging].[dbo].[dim_payment] (payment_method)
select distinct payment_method
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_payment];

			--checking duplicates
				select payment_method, count (*) as duplicates
				from [pc_staging].[dbo].[dim_payment]
				group by payment_method
				having count (*) > 1;

--7.dim_channel
drop table [pc_staging].[dbo].[dim_channel]
create table [pc_staging].[dbo].[dim_channel](
	[channel_id] int identity(1,1) primary key,
	[Channel] [nvarchar](50) NOT NULL,
)
insert into [pc_staging].[dbo].[dim_channel] (channel)
select distinct channel
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_channel];

			--checking duplicates
				select channel, count (*) as duplicates
				from [pc_staging].[dbo].[dim_channel]
				group by channel
				having count (*) > 1;

--8.dim_priority
drop table [pc_staging].[dbo].[dim_priority]
create table [pc_staging].[dbo].[dim_priority](
	[priority_id] int identity(1,1) primary key,
	[Priority] [nvarchar](50) NOT NULL,
)
insert into [pc_staging].[dbo].[dim_priority] (priority)
select distinct priority
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_priority];

			--checking duplicates
				select priority, count (*) as duplicates
				from [pc_staging].[dbo].[dim_priority]
				group by priority
				having count (*) > 1;

--9.dim_date
drop table [pc_staging].[dbo].[dim_date]
create table [pc_staging].[dbo].[dim_date](
	[date_id] int identity(1,1) primary key,
	[purchase_date] [date] NOT NULL,
	[ship_date] [date] NULL,
	[year] int NOT NULL,
	[month] int NOT NULL
)
insert into [pc_staging].[dbo].[dim_date] (purchase_date, ship_date, year, month)
select distinct purchase_date, coalesce(try_cast(ship_date as date), '9999-12-31'), 
				year(purchase_date), month(purchase_date)
from [pc_staging].[dbo].[pc_data];

	--validating the insert
			select * from  [pc_staging].[dbo].[dim_date];

				--checking duplicates
					select purchase_date, ship_date, year, month, count (*) as duplicates
					from [pc_staging].[dbo].[dim_date]
					group by purchase_date, ship_date, year, month
					having count (*) > 1;

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
	[Credit_Score] decimal(10,2) NOT NULL
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

from [pc_staging].[dbo].[pc_data] st

inner join dim_customer c
	on st.customer_name = c.first_name
	and st.Customer_Surname = c.last_name
	and st.Customer_Contact_Number = c.contact_number
	and st.Customer_Email_Address = c.email_address

inner join dim_employee e
	on st.sales_person_name = e.employee_name
	and st.Sales_Person_Department = e.department

inner join dim_product p
	on st.pc_model = p.pc_model
	and st.pc_make = p.pc_make
	and st.Storage_Capacity = p.storage_capacity
	and st.Storage_Type = p.storage_type
	and st.ram = p.ram

inner join dim_location l
	on st.Continent = l.continent
	and st.province_or_city = l.province_or_city
	and st.Country_or_State = l.country_or_state

inner join dim_store s
	on st.shop_name = s.shop_name
	and st.Shop_Age = s.shop_age

inner join dim_payment pm
	on st.payment_method = pm.payment_method

inner join  dim_channel ch
	on st.channel = ch.channel

inner join dim_priority pr
	on st.priority = pr.priority

inner join dim_date d
	on st.purchase_date = d.purchase_date
	and  coalesce(try_cast(st.ship_date as date), '9999-12-31') = d.ship_date;

	--validating the insert
		select * from [pc_staging].[dbo].[pc_sales_fact]

			--checking duplicates
				select sale_price, cost_price, discount_amount, finance_amount, cost_of_repairs,
						total_sales_per_employee, pc_market_price, credit_score, count (*) as duplicates
				from [pc_staging].[dbo].[pc_sales_fact]
				group by sale_price, cost_price, discount_amount, finance_amount,cost_of_repairs,
							total_sales_per_employee, pc_market_price, credit_score
				having count (*) > 1;

--------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------
--validating JOIN explosion
	--checking tables that duplicate/drop the rows
		 select count (*) as row_numbers
		 from [pc_staging].[dbo].[pc_data]; 

	-- + dim_customer
		select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

	-- + dim_employee
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

	-- + dim_product
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join dim_product p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

	-- + dim_location
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join dim_product p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram
		inner join dim_location l
			on st.Continent = l.continent
			and st.province_or_city = l.province_or_city
			and st.Country_or_State = l.country_or_state

	-- + dim_store
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join dim_product p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

		inner join dim_location l
			on st.Continent = l.continent
			and st.province_or_city = l.province_or_city
			and st.Country_or_State = l.country_or_state

		inner join dim_store s
			on st.shop_name = s.shop_name
			and st.Shop_Age = s.shop_age

	-- + dim_payment
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join dim_product p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

		inner join dim_location l
			on st.Continent = l.continent
			and st.province_or_city = l.province_or_city
			and st.Country_or_State = l.country_or_state

		inner join dim_store s
			on st.shop_name = s.shop_name
			and st.Shop_Age = s.shop_age

		inner join dim_payment pm
			on st.payment_method = pm.payment_method

	-- + dim_channel
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join dim_product p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

		inner join dim_location l
			on st.Continent = l.continent
			and st.province_or_city = l.province_or_city
			and st.Country_or_State = l.country_or_state

		inner join dim_store s
			on st.shop_name = s.shop_name
			and st.Shop_Age = s.shop_age

		inner join dim_payment pm
			on st.payment_method = pm.payment_method

		inner join  dim_channel ch
			on st.channel = ch.channel

	-- + dim_priority
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join dim_product p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

		inner join dim_location l
			on st.Continent = l.continent
			and st.province_or_city = l.province_or_city
			and st.Country_or_State = l.country_or_state

		inner join dim_store s
			on st.shop_name = s.shop_name
			and st.Shop_Age = s.shop_age

		inner join dim_payment pm
			on st.payment_method = pm.payment_method

		inner join  dim_channel ch
			on st.channel = ch.channel

		inner join dim_priority pr
			on st.priority = pr.priority

	-- + dim_date
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join dim_customer c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join dim_employee e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join dim_product p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

		inner join dim_location l
			on st.Continent = l.continent
			and st.province_or_city = l.province_or_city
			and st.Country_or_State = l.country_or_state

		inner join dim_store s
			on st.shop_name = s.shop_name
			and st.Shop_Age = s.shop_age

		inner join dim_payment pm
			on st.payment_method = pm.payment_method

		inner join  dim_channel ch
			on st.channel = ch.channel

		inner join dim_priority pr
			on st.priority = pr.priority

		inner join dim_date d
			on st.purchase_date = d.purchase_date
			and  coalesce(try_cast(st.ship_date as date), '9999-12-31') = d.ship_date;