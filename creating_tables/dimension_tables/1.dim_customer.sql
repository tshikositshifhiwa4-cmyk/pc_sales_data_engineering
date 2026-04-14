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