gamerule doMobSpawning false
gamerule logAdminCommands false
gamerule doImmediateRespawn true
gamerule doFireTick false
gamerule commandBlockOutput false

setworldspawn 1001 33 -3
tp @a 1001 33 -3

kill @e[type=villager]
clear @a

team add red
team add blue
team modify red color red
team modify blue color blue
team modify red friendlyFire false
team modify blue friendlyFire false

scoreboard objectives add red_choose dropped:red_concrete
scoreboard objectives add blue_choose dropped:blue_concrete
scoreboard objectives add change_team_choose dropped:orange_concrete
scoreboard objectives add timer dummy
scoreboard objectives add increase dummy
scoreboard objectives add players_not_in_team dummy
scoreboard objectives add class dummy
scoreboard objectives add class_choose dropped:book
scoreboard objectives add class_warrior_choose dropped:netherite_sword
scoreboard objectives add class_medic_choose dropped:totem_of_undying
scoreboard objectives add class_shooter_choose dropped:bow
scoreboard objectives add class_magician_choose dropped:potion
scoreboard objectives add class_spy_choose dropped:ender_pearl
scoreboard objectives add team_choose dropped:white_concrete
scoreboard objectives add game_start dummy
scoreboard objectives add timer_start dummy

scoreboard objectives add mana dummy
scoreboard objectives add coins dummy
scoreboard objectives add souls dummy
scoreboard objectives add shop_choose custom:talked_to_villager
scoreboard objectives add damage_dealt custom:damage_dealt
scoreboard objectives add damage_taken custom:damage_taken
scoreboard objectives add health health
scoreboard objectives add killed totalKillCount
scoreboard objectives add died deathCount
scoreboard objectives add timer_death dummy

scoreboard objectives add blood_of_enemies_choose dropped:redstone
scoreboard objectives add warrior_kills totalKillCount
scoreboard objectives add warrior_sword_hit dummy

effect give @a saturation infinite 100 true

item replace entity @a hotbar.0 with book
item modify entity @a hotbar.0 defeners:set_name_classes

item replace entity @a hotbar.3 with red_concrete
item modify entity @a hotbar.3 defeners:set_name_red_team

item replace entity @a hotbar.5 with blue_concrete
item modify entity @a hotbar.5 defeners:set_name_blue_team