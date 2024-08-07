execute as @a unless score @s blue_choose = @s blue_choose run scoreboard players set @s blue_choose 0
execute as @a unless score @s red_choose = @s red_choose run scoreboard players set @s red_choose 0
execute as @a unless score @s change_team_choose = @s change_team_choose run scoreboard players set @s change_team_choose 0
execute as @a unless score @s timer = @s timer run scoreboard players set @s timer 0
execute as @a unless score @s increase = @s increase run scoreboard players set @s increase 1
execute as @a unless score @s players_not_in_team = @s players_not_in_team run scoreboard players set @s players_not_in_team 0
execute as @a unless score @s class = @s class run scoreboard players set @s class 0
execute as @a unless score @s class_choose = @s class_choose run scoreboard players set @s class_choose 0
execute as @a unless score @s class_warrior_choose = @s class_warrior_choose run scoreboard players set @s class_warrior_choose 0
execute as @a unless score @s class_medic_choose = @s class_medic_choose run scoreboard players set @s class_medic_choose 0
execute as @a unless score @s class_shooter_choose = @s class_shooter_choose run scoreboard players set @s class_shooter_choose 0
execute as @a unless score @s class_magician_choose = @s class_magician_choose run scoreboard players set @s class_magician_choose 0
execute as @a unless score @s class_spy_choose = @s class_spy_choose run scoreboard players set @s class_spy_choose 0
execute as @a unless score @s team_choose = @s team_choose run scoreboard players set @s team_choose 0
execute as @a unless score @s timer_start = @s timer_start run scoreboard players set @s timer_start 0
execute as @a unless score @s timer_death = @s timer_death run scoreboard players set @s timer_death 0
execute as @a unless score @s died = @s died run scoreboard players set @s died 0
execute as @a unless score @s game_start = @s game_start run scoreboard players set @s game_start 0
execute as @a unless score @s health = @s health run scoreboard players set @s health 0
execute as @a unless score @s killed = @s killed run scoreboard players set @s killed 0
execute as @a unless score @s damage_dealt = @s damage_dealt run scoreboard players set @s damage_dealt 0
execute as @a unless score @s damage_taken = @s damage_taken run scoreboard players set @s damage_taken 0
execute as @a unless score @s shop_choose = @s shop_choose run scoreboard players set @s shop_choose 0
execute as @a unless score @s coins = @s coins run scoreboard players set @s coins 0
execute as @a unless score @s mana = @s mana run scoreboard players set @s mana 0
execute as @a unless score @s souls = @s souls run scoreboard players set @s souls 0

kill @e[type=item]

#

execute store result score @a players_not_in_team run execute if entity @a[team=]

execute as @a[scores={players_not_in_team=0, timer=..79}] run scoreboard players operation @s timer += @s increase

execute as @a[scores={players_not_in_team=0, timer=1}] run title @s times 0.5s 4s 0.5s

execute if entity @a[scores={players_not_in_team=0, timer=1}] run tellraw @a [{"text": "---------------\n", "color": "green", "bold": true}, {"text": "The game begins!\n", "color": "green", "bold": true}, {"text": "---------------", "color": "green", "bold": true}]

execute if entity @a[scores={players_not_in_team=0, timer=1}] run title @a title {"text": "The game begins!", "color": "green", "bold": true}

execute if entity @a[scores={players_not_in_team=0, timer=20}] run title @a subtitle [{"text": "the game starts in: ", "color": "green", "bold": true}, {"text": "3", "color": "gold", "bold": true}]
execute as @a at @a if entity @s[scores={players_not_in_team=0, timer=20}] run playsound block.note_block.bit
execute if entity @a[scores={players_not_in_team=0, timer=40}] run title @a subtitle [{"text": "the game starts in: ", "color": "green", "bold": true}, {"text": "2", "color": "gold", "bold": true}]
execute as @a at @a if entity @s[scores={players_not_in_team=0, timer=40}] run playsound block.note_block.bit
execute if entity @a[scores={players_not_in_team=0, timer=60}] run title @a subtitle [{"text": "the game starts in: ", "color": "green", "bold": true}, {"text": "1", "color": "gold", "bold": true}]
execute as @a at @a if entity @s[scores={players_not_in_team=0, timer=60}] run playsound block.note_block.bit

execute if entity @a[scores={players_not_in_team=0, timer=80}] run tp @a 0 32 0
execute if entity @a[scores={players_not_in_team=0, timer=80}] run scoreboard players set @a game_start 1

execute as @a[scores={timer=1..}] unless entity @s[scores={players_not_in_team=0}] run title @s clear
execute as @a[scores={timer=1..}] unless entity @s[scores={players_not_in_team=0}] run title @s title {"text": "Canseled", "color": "red", "bold": true}
execute as @a[scores={timer=1..}] unless entity @s[scores={players_not_in_team=0}] run tellraw @s [{"text": "-------------------------------------\n", "color": "red", "bold": true}, {"text": "The start of the game has been cancelled!\n", "color": "red", "bold": true}, {"text": "-------------------------------------", "color": "red", "bold": true}]

execute as @a[scores={timer=0..}] unless entity @s[scores={players_not_in_team=0}] run scoreboard players set @s timer 0

#

execute if entity @a[scores={class_choose=1}] run clear @a[scores={class_choose=1}]

execute if entity @a[scores={class_choose=1}] run item replace entity @a[scores={class_choose=1}] hotbar.0 with white_concrete
execute if entity @a[scores={class_choose=1}] run item modify entity @a[scores={class_choose=1}] hotbar.0 defeners:set_name_teams

execute if entity @a[scores={class_choose=1}] run item replace entity @a[scores={class_choose=1}] hotbar.2 with netherite_sword
execute if entity @a[scores={class_choose=1}] run item modify entity @a[scores={class_choose=1}] hotbar.2 defeners:classes/set_name_warrior

execute if entity @a[scores={class_choose=1}] run item replace entity @a[scores={class_choose=1}] hotbar.3 with totem_of_undying
execute if entity @a[scores={class_choose=1}] run item modify entity @a[scores={class_choose=1}] hotbar.3 defeners:classes/set_name_medic

execute if entity @a[scores={class_choose=1}] run item replace entity @a[scores={class_choose=1}] hotbar.4 with bow
execute if entity @a[scores={class_choose=1}] run item modify entity @a[scores={class_choose=1}] hotbar.4 defeners:classes/set_name_shooter

execute if entity @a[scores={class_choose=1}] run item replace entity @a[scores={class_choose=1}] hotbar.5 with potion
execute if entity @a[scores={class_choose=1}] run item modify entity @a[scores={class_choose=1}] hotbar.5 defeners:classes/set_name_magician

execute if entity @a[scores={class_choose=1}] run item replace entity @a[scores={class_choose=1}] hotbar.6 with ender_pearl
execute if entity @a[scores={class_choose=1}] run item modify entity @a[scores={class_choose=1}] hotbar.6 defeners:classes/set_name_spy

execute as @a[scores={class_choose=1}] at @a[scores={class_choose=1}] run playsound block.lever.click

#

execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run tellraw @s [{"text": "You have chosen a ", "color": "green", "bold": true}, {"text": "WARRIOR", "color": "red", "bold": true}]

execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run clear @s

execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run item replace entity @s hotbar.0 with book
execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run item modify entity @s hotbar.0 defeners:set_name_classes

execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run item replace entity @s hotbar.3 with red_concrete
execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run item modify entity @s hotbar.3 defeners:set_name_red_team

execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run item replace entity @s hotbar.5 with blue_concrete
execute as @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run item modify entity @s hotbar.5 defeners:set_name_blue_team

execute as @a[scores={class_warrior_choose=1}] at @a[scores={class_warrior_choose=1}] unless entity @s[scores={class=1}] run playsound block.note_block.pling

execute if entity @a[scores={class_warrior_choose=1, class=1}] run tellraw @a[scores={class_warrior_choose=1, class=1}] [{"text": "You have already chosen this class!", "color": "red", "bold": true}]
execute if entity @a[scores={class_warrior_choose=1, class=1}] run item replace entity @a[scores={class_warrior_choose=1, class=1}] hotbar.2 with netherite_sword
execute if entity @a[scores={class_warrior_choose=1, class=1}] run item modify entity @a[scores={class_warrior_choose=1, class=1}] hotbar.2 defeners:classes/set_name_warrior
execute as @a[scores={class_warrior_choose=1, class=1}] at @a[scores={class_warrior_choose=1, class=1}] run playsound block.note_block.guitar

execute if entity @a[scores={class_warrior_choose=1}] run scoreboard players set @a[scores={class_warrior_choose=1}] class 1


execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run tellraw @s [{"text": "You have chosen a ", "color": "green", "bold": true}, {"text": "MEDIC", "color": "green", "bold": true}]

execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run clear @s

execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run item replace entity @s hotbar.0 with book
execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run item modify entity @s hotbar.0 defeners:set_name_classes

execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run item replace entity @s hotbar.3 with red_concrete
execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run item modify entity @s hotbar.3 defeners:set_name_red_team

execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run item replace entity @s hotbar.5 with blue_concrete
execute as @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run item modify entity @s hotbar.5 defeners:set_name_blue_team

execute as @a[scores={class_medic_choose=1}] at @a[scores={class_medic_choose=1}] unless entity @s[scores={class=2}] run playsound block.note_block.pling

execute if entity @a[scores={class_medic_choose=1, class=2}] run tellraw @a[scores={class_medic_choose=1, class=2}] [{"text": "You have already chosen this class!", "color": "red", "bold": true}]
execute if entity @a[scores={class_medic_choose=1, class=2}] run item replace entity @a[scores={class_medic_choose=1, class=2}] hotbar.3 with totem_of_undying
execute if entity @a[scores={class_medic_choose=1, class=2}] run item modify entity @a[scores={class_medic_choose=1, class=2}] hotbar.3 defeners:classes/set_name_medic
execute as @a[scores={class_medic_choose=1, class=2}] at @a[scores={class_medic_choose=1, class=2}] run playsound block.note_block.guitar

execute if entity @a[scores={class_medic_choose=1}] run scoreboard players set @a[scores={class_medic_choose=1}] class 2


execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run tellraw @s [{"text": "You have chosen a ", "color": "green", "bold": true}, {"text": "SHOOTER", "color": "yellow", "bold": true}]

execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run clear @s

execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run item replace entity @s hotbar.0 with book
execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run item modify entity @s hotbar.0 defeners:set_name_classes

execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run item replace entity @s hotbar.3 with red_concrete
execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run item modify entity @s hotbar.3 defeners:set_name_red_team

execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run item replace entity @s hotbar.5 with blue_concrete
execute as @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run item modify entity @s hotbar.5 defeners:set_name_blue_team

execute as @a[scores={class_shooter_choose=1}] at @a[scores={class_shooter_choose=1}] unless entity @s[scores={class=3}] run playsound block.note_block.pling

execute if entity @a[scores={class_shooter_choose=1, class=3}] run tellraw @a[scores={class_shooter_choose=1, class=3}] [{"text": "You have already chosen this class!", "color": "red", "bold": true}]
execute if entity @a[scores={class_shooter_choose=1, class=3}] run item replace entity @a[scores={class_shooter_choose=1, class=3}] hotbar.4 with bow
execute if entity @a[scores={class_shooter_choose=1, class=3}] run item modify entity @a[scores={class_shooter_choose=1, class=3}] hotbar.4 defeners:classes/set_name_shooter
execute as @a[scores={class_shooter_choose=1, class=5}] at @a[scores={class_shooter_choose=1, class=3}] run playsound block.note_block.guitar

execute if entity @a[scores={class_shooter_choose=1}] run scoreboard players set @a[scores={class_shooter_choose=1}] class 3


execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run tellraw @s [{"text": "You have chosen a ", "color": "green", "bold": true}, {"text": "MAGICIAN", "color": "light_purple", "bold": true}]

execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run clear @s

execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run item replace entity @s hotbar.0 with book
execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run item modify entity @s hotbar.0 defeners:set_name_classes

execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run item replace entity @s hotbar.3 with red_concrete
execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run item modify entity @s hotbar.3 defeners:set_name_red_team

execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run item replace entity @s hotbar.5 with blue_concrete
execute as @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run item modify entity @s hotbar.5 defeners:set_name_blue_team

execute as @a[scores={class_magician_choose=1}] at @a[scores={class_magician_choose=1}] unless entity @s[scores={class=4}] run playsound block.note_block.pling

execute if entity @a[scores={class_magician_choose=1, class=4}] run tellraw @a[scores={class_magician_choose=1, class=4}] [{"text": "You have already chosen this class!", "color": "red", "bold": true}]
execute if entity @a[scores={class_magician_choose=1, class=4}] run item replace entity @a[scores={class_magician_choose=1, class=4}] hotbar.5 with potion
execute if entity @a[scores={class_magician_choose=1, class=4}] run item modify entity @a[scores={class_magician_choose=1, class=4}] hotbar.5 defeners:classes/set_name_magician
execute as @a[scores={class_magician_choose=1, class=4}] at @a[scores={class_magician_choose=1, class=4}] run playsound block.note_block.guitar

execute if entity @a[scores={class_magician_choose=1}] run scoreboard players set @a[scores={class_magician_choose=1}] class 4


execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run tellraw @s [{"text": "You have chosen a ", "color": "green", "bold": true}, {"text": "SPY", "color": "aqua", "bold": true}]

execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run clear @s

execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run item replace entity @s hotbar.0 with book
execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run item modify entity @s hotbar.0 defeners:set_name_classes

execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run item replace entity @s hotbar.3 with red_concrete
execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run item modify entity @s hotbar.3 defeners:set_name_red_team

execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run item replace entity @s hotbar.5 with blue_concrete
execute as @a[scores={class_spy_choose=1}] unless entity @s[scores={class=5}] run item modify entity @s hotbar.5 defeners:set_name_blue_team

execute as @a[scores={class_spy_choose=1}] at @a[scores={class_spy_choose=1}] unless entity @a[scores={class=5}] run playsound block.note_block.pling

execute if entity @a[scores={class_spy_choose=1, class=5}] run tellraw @a[scores={class_spy_choose=1, class=5}] [{"text": "You have already chosen this class!", "color": "red", "bold": true}]
execute if entity @a[scores={class_spy_choose=1, class=5}] run item replace entity @a[scores={class_spy_choose=1, class=5}] hotbar.6 with ender_pearl
execute if entity @a[scores={class_spy_choose=1, class=5}] run item modify entity @a[scores={class_spy_choose=1, class=5}] hotbar.6 defeners:classes/set_name_spy
execute as @a[scores={class_spy_choose=1, class=5}] at @a[scores={class_spy_choose=1, class=5}] run playsound block.note_block.guitar

execute if entity @a[scores={class_spy_choose=1}] run scoreboard players set @a[scores={class_spy_choose=1}] class 5

#

execute if entity @a[scores={team_choose=1}] run clear @a[scores={team_choose=1}]

execute if entity @a[scores={team_choose=1}] run item replace entity @a[scores={team_choose=1}] hotbar.0 with book
execute if entity @a[scores={team_choose=1}] run item modify entity @a[scores={team_choose=1}] hotbar.0 defeners:set_name_classes

execute if entity @a[scores={team_choose=1}] run item replace entity @a[scores={team_choose=1}] hotbar.3 with red_concrete
execute if entity @a[scores={team_choose=1}] run item modify entity @a[scores={team_choose=1}] hotbar.3 defeners:set_name_red_team

execute if entity @a[scores={team_choose=1}] run item replace entity @a[scores={team_choose=1}] hotbar.5 with blue_concrete
execute if entity @a[scores={team_choose=1}] run item modify entity @a[scores={team_choose=1}] hotbar.5 defeners:set_name_blue_team

execute as @a[scores={team_choose=1}] at @a[scores={team_choose=1}] run playsound block.lever.click

#

execute if entity @a[scores={blue_choose=1, class=0}] run tellraw @a[scores={blue_choose=1, class=0}] {"text": "First, choose your class!", "color": "red", "bold": true}
execute if entity @a[scores={blue_choose=1, class=0}] run item replace entity @a[scores={blue_choose=1, class=0}] hotbar.5 with blue_concrete
execute if entity @a[scores={blue_choose=1, class=0}] run item modify entity @a[scores={blue_choose=1, class=0}] hotbar.5 defeners:set_name_blue_team
execute as @a[scores={blue_choose=1, class=0}] at @a[scores={blue_choose=1, class=0}] run playsound block.note_block.guitar

execute as @a[scores={blue_choose=1}] unless entity @s[scores={class=0}] run team join blue @s
execute as @a[scores={blue_choose=1}] unless entity @s[scores={class=0}] run tellraw @a [{"selector": "@s", "color": "blue", "bold": true}, {"text": " join to the ", "bold": true, "color": "white"}, {"text": "BLUE ", "color": "blue", "bold": true}, {"text": "team", "bold": true, "color": "white"}]
execute as @a[scores={blue_choose=1}] unless entity @s[scores={class=0}] run clear @s
execute as @a[scores={blue_choose=1}] unless entity @s[scores={class=0}] run item replace entity @s hotbar.4 with orange_concrete
execute as @a[scores={blue_choose=1}] unless entity @s[scores={class=0}] run item modify entity @s hotbar.4 defeners:set_name_change_team
execute as @a[scores={blue_choose=1}] at @a[scores={blue_choose=1}] unless entity @s[scores={class=0}] run playsound block.note_block.pling

execute if entity @a[scores={red_choose=1, class=0}] run tellraw @a[scores={red_choose=1, class=0}] {"text": "First, choose your class!", "color": "red", "bold": true}
execute if entity @a[scores={red_choose=1, class=0}] run item replace entity @a[scores={red_choose=1, class=0}] hotbar.3 with red_concrete
execute if entity @a[scores={red_choose=1, class=0}] run item modify entity @a[scores={red_choose=1, class=0}] hotbar.3 defeners:set_name_red_team
execute as @a[scores={red_choose=1, class=0}] at @a[scores={red_choose=1, class=0}] run playsound block.note_block.guitar

execute as @a[scores={red_choose=1}] unless entity @s[scores={class=0}] run team join red @s
execute as @a[scores={red_choose=1}] unless entity @s[scores={class=0}] run tellraw @a [{"selector": "@s", "color": "red", "bold": true}, {"text": " join to the ", "bold": true, "color": "white"}, {"text": "RED ", "color": "red", "bold": true}, {"text": "team", "bold": true, "color": "white"}]
execute as @a[scores={red_choose=1}] unless entity @s[scores={class=0}] run clear @s
execute as @a[scores={red_choose=1}] unless entity @s[scores={class=0}] run item replace entity @s hotbar.4 with orange_concrete
execute as @a[scores={red_choose=1}] unless entity @s[scores={class=0}] run item modify entity @s hotbar.4 defeners:set_name_change_team
execute as @a[scores={red_choose=1}] at @a[scores={red_choose=1}] unless entity @s[scores={class=0}] run playsound block.note_block.pling

execute if entity @a[scores={change_team_choose=1}] run clear @a[scores={change_team_choose=1}]

execute if entity @a[scores={change_team_choose=1}, team=red] run tellraw @a [{"selector": "@a[scores={change_team_choose=1}, team=red]", "color": "red", "bold": true}, {"text": " left the team", "color": "white", "bold": true}]
execute if entity @a[scores={change_team_choose=1}, team=blue] run tellraw @a [{"selector": "@a[scores={change_team_choose=1}, team=blue]", "color": "blue", "bold": true}, {"text": " left the team", "color": "white", "bold": true}]

execute if entity @a[scores={change_team_choose=1}] run team leave @a[scores={change_team_choose=1}]
execute if entity @a[scores={change_team_choose=1}] run item replace entity @a[scores={change_team_choose=1}] hotbar.0 with book
execute if entity @a[scores={change_team_choose=1}] run item modify entity @a[scores={change_team_choose=1}] hotbar.0 defeners:set_name_classes
execute if entity @a[scores={change_team_choose=1}] run item replace entity @a[scores={change_team_choose=1}] hotbar.3 with red_concrete
execute if entity @a[scores={change_team_choose=1}] run item modify entity @a[scores={change_team_choose=1}] hotbar.3 defeners:set_name_red_team
execute if entity @a[scores={change_team_choose=1}] run item replace entity @a[scores={change_team_choose=1}] hotbar.5 with blue_concrete
execute if entity @a[scores={change_team_choose=1}] run item modify entity @a[scores={change_team_choose=1}] hotbar.5 defeners:set_name_blue_team
execute as @a[scores={change_team_choose=1}] at @a[scores={change_team_choose=1}] if entity @a[scores={change_team_choose=1}] run playsound block.note_block.guitar

#

scoreboard players set @a blue_choose 0
scoreboard players set @a red_choose 0
scoreboard players set @a change_team_choose 0
scoreboard players set @a class_choose 0
scoreboard players set @a class_warrior_choose 0
scoreboard players set @a class_medic_choose 0
scoreboard players set @a class_shooter_choose 0
scoreboard players set @a class_magician_choose 0
scoreboard players set @a class_spy_choose 0
scoreboard players set @a team_choose 0