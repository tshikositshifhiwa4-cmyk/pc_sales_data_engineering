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