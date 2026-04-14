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