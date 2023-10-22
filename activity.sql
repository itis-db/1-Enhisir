with recursive cte as (
	select 1 as level, act.parentid, crt.areaid, act.name as path
	from activity as act
		join point as pt
            on act.activityid = pt.pointid
		join 
		(
			select act.activityid, crt.areaid
			from activity as act
				join contract as crt
					on act.activityid = crt.contractid
		) as crt
			on act.parentid = crt.activityid
	where activitytypeid = 5
	
	union
	
	select cte.level + 1 as level, act.parentid, cte.areaid,
		case
			when level = 2 
				then (select name from area where cte.areaid = area.areaid) || ' -> '
					 || act.name || ' -> '
					 || (select act2.name
						 from activity as act2
						 join point as pt
						 	on act2.activityid = pt.pointid
						 where act2.parentid = act.activityid
						) || ' -> '
					 || cte.path
			else act.name || ' -> ' || cte.path
		end
	from activity as act
		join cte
			on act.activityid = cte.parentid
)
select path
from cte
where level = 5;
