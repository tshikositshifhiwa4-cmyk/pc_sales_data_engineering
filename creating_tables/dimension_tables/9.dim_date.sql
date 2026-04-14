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