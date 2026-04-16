--validating JOIN explosion
	--checking tables that duplicate/drop the rows
		 select count (*) as row_numbers
		 from [pc_staging].[dbo].[pc_data]; 

	-- + dim_customer
		select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

	-- + dim_employee
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join [pc_staging].[dbo]. [dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

	-- + dim_product
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join [pc_staging].[dbo].[dim_product] p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

	-- + dim_location
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join [pc_staging].[dbo].[dim_product] p
			on st.pc_model = p.pc_model
			and st.pc_make = p.pc_make
			and st.Storage_Capacity = p.storage_capacity
			and st.Storage_Type = p.storage_type
			and st.ram = p.ram

		inner join [pc_staging].[dbo].[dim_location] l
			on st.Continent = l.continent
			and st.province_or_city = l.province_or_city
			and st.Country_or_State = l.country_or_state

	-- + dim_store
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join [pc_staging].[dbo].[dim_product] p
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

	-- + dim_payment
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

		inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join [pc_staging].[dbo].[dim_product] p
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

	-- + dim_channel
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

			inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join [pc_staging].[dbo].[dim_product] p
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

	-- + dim_priority
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

			inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join [pc_staging].[dbo].[dim_product] p
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

	-- + dim_date
	select count (*) as row_numbers
		from [pc_staging].[dbo].[pc_data] st

			inner join [pc_staging].[dbo].[dim_customer] c
			on st.customer_name = c.first_name
			and st.Customer_Surname = c.last_name
			and st.Customer_Contact_Number = c.contact_number
			and st.Customer_Email_Address = c.email_address

		inner join [pc_staging].[dbo].[dim_employee] e
			on st.sales_person_name = e.employee_name
			and st.Sales_Person_Department = e.department

		inner join [pc_staging].[dbo].[dim_product] p
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