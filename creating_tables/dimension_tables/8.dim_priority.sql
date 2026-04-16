--8.dim_priority
drop table [pc_staging].[dbo].[dim_priority]
create table [pc_staging].[dbo].[dim_priority](
	[priority_id] int identity(1,1) primary key,
	[Priority] [nvarchar](50) NOT NULL,
	[load_date] datetime default getdate()
)
insert into [pc_staging].[dbo].[dim_priority] (priority)
select distinct priority
from [pc_staging].[dbo].[pc_data];

	--validating the insert
		select * from [pc_staging].[dbo].[dim_priority];