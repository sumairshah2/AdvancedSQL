### Lag / Lead -- lets find the change in velocity for the pitchers who threw multiple days and change in pitch count -- if it is the first time they are throwing return 0 


select x.*, 
case when x.change_velo = 0 then 0 else 
x.avg_velo - x.change_velo end as velo_diff,
case when x.change_pitch_count = 0 then 0 else x.pitch_count - x.change_pitch_count end as pitch_diff
from 
(select h.*,lag(h.avg_velo,1,0) over (PARTITION by h.Pitcher order by h.Pitcher,h.day) change_velo,lag(h.pitch_count,1,0) over (PARTITION by h.Pitcher order by h.Pitcher,h.day) change_pitch_count
from
(select lt.Pitcher, case when day(lt.Date) is null then 1 else day(lt.Date) end as day,avg(lt.RelSpeed) avg_velo,count(*) pitch_count
from lipscomb.trackmanv2 lt
group by lt.Pitcher,day(lt.Date)
order by lt.Pitcher) h) x