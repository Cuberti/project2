execute as @a unless score @s game_start = @s game_start run scoreboard players set @s game_start 0

execute if entity @a[scores={game_start=0}] run function defeners:lobby

execute if entity @a[scores={game_start=1}] run function defeners:game