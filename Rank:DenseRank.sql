
##### ranking / rank() or dense rank() similair to row number, get the rank 
## of ny sorted columns
select Name,Age,Team, rank() over(order by Age) league_age, 
rank() over(partition by team order by Age) team_age
from MLB.fangraphs_pitchers;