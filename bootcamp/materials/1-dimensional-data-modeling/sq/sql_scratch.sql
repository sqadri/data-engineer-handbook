with names as (select player_name
               from player_seasons
                        limit 10)
   , names2 as (select player_name,
    split_part(player_name, ' ', 1),
    reverse(split_part(reverse(player_name), ' ', 1)),
    string_to_array(player_name, ' ') as player_arr
from names)
select
    player_name,
    player_arr[cardinality(player_arr)]
from names2

