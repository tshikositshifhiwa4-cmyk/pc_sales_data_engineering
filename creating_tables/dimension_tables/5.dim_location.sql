--4.dim_location drop TABLE [pc_staging].[dbo].[dim_location]
drop table [pc_staging].[dbo].[dim_location]
create table [pc_staging].[dbo].[dim_location](
	[location_id] int identity(1, 1) primary key,
	[continent] [nvarchar](50) NOT NULL,
	[country_or_state] [nvarchar](50) NOT NULL,
	[province_or_city] [nvarchar](100) NOT NULL,
	[load_date] datetime default getdate()
)
insert into
	[pc_staging].[dbo].[dim_location] (continent, country_or_state, province_or_city)
select
	distinct continent,
	country_or_state,
	province_or_city
from
	[pc_staging].[dbo].[pc_data];

--validating the insert
select
	*
from
	[pc_staging].[dbo].[dim_location];