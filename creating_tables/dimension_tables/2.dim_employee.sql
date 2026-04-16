--2.dim_employee
drop table [pc_staging].[dbo].[dim_employee]
create table [pc_staging].[dbo].[dim_employee](
	[employee_id] int identity(1,1) primary key,
	[employee_name] [nvarchar](50) NOT NULL,
	[department] [nvarchar](50) NOT NULL,
	[load_date] datetime default getdate()
)
insert into [pc_staging].[dbo].[dim_employee] (employee_name, department)
select distinct Sales_Person_Name, Sales_Person_Department 
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_employee];