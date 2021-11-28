## row_number  -- row number is used with order by to create a ranking


## EX -- I want the Ranking of Players by most homeruns and the 
## tie breaker should be batting average


select Name, Team, HR, AVG, 
ROW_NUMBER() over(order by HR desc, AVG desc) ranking
from MLB.fangraphs_hitters
limit 100
;