--3.dim_product
drop table [pc_staging].[dbo].[dim_product]
create table [pc_staging].[dbo].[dim_product](
	[product_id] int identity(1,1) primary key,
	[pc_make] [nvarchar](50) NOT NULL,
	[pc_model] [nvarchar](50) NOT NULL,
	[storage_type] [nvarchar](50) NOT NULL,
	[storage_capacity] [nvarchar](50) NOT NULL,
	[ram] [nvarchar](50) NOT NULL,
	[load_date] datetime default getdate()
)
insert into [pc_staging].[dbo].[dim_product] (pc_make, pc_model, storage_type, storage_capacity, ram)
select distinct pc_make, pc_model, storage_type, storage_capacity, ram 
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_product];