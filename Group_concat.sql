
## Oracle calls it List_AGG //

## I am not sure how often / when I would use this but if you want to concatanate a list of column
## we can use group_concat to add them up into one group

select Name,HR,Team,
GROUP_CONCAT(NAME) Roster
from MLB.fangraphs_hitters
group by Team
having HR > 10;
