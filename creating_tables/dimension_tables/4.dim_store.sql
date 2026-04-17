--5.dim_store
drop table [pc_staging].[dbo].[dim_store] create table [pc_staging].[dbo].[dim_store](
	[store_id] int identity(1, 1) primary key,
	[shop_name] [nvarchar](50) NOT NULL,
	[shop_age] [nvarchar](50) NOT NULL,
	[load_date] datetime default getdate()
)
insert into
	[pc_staging].[dbo].[dim_store] (shop_name, shop_age)
select
	distinct shop_name,
	shop_age
from
	[pc_staging].[dbo].[pc_data];

--validating the insert
select
	*
from
	[pc_staging].[dbo].[dim_store];