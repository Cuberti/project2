execute as @a[scores={class=1}] unless score @s warrior_sword_hit = @s warrior_sword_hit run scoreboard players set @s warrior_sword_hit 0
execute as @a[scores={class=1}] unless score @s warrior_kills = @s warrior_kills run scoreboard players set @s warrior_kills 0
execute as @a[scores={class=1}] unless score @s blood_of_enemies_choose = @s blood_of_enemies_choose run scoreboard players set @s blood_of_enemies_choose 0

kill @e[type=lightning_bolt]
execute as @e[type=item] run data merge entity @s {PickupDelay:0s}

execute as @a[scores={class=1}, team=red] unless entity @s[scores={timer_start=120}] run tp @s 49 2 4
execute as @a[scores={class=2}, team=red] unless entity @s[scores={timer_start=120}] run tp @s 49 2 2
execute as @a[scores={class=3}, team=red] unless entity @s[scores={timer_start=120}] run tp @s 49 2 0
execute as @a[scores={class=4}, team=red] unless entity @s[scores={timer_start=120}] run tp @s 49 2 -2
execute as @a[scores={class=5}, team=red] unless entity @s[scores={timer_start=120}] run tp @s 49 2 -4

execute as @a[scores={class=1}, team=blue] unless entity @s[scores={timer_start=120}] run tp @s -50 2 -5
execute as @a[scores={class=2}, team=blue] unless entity @s[scores={timer_start=120}] run tp @s -50 2 -3
execute as @a[scores={class=3}, team=blue] unless entity @s[scores={timer_start=120}] run tp @s -50 2 -1
execute as @a[scores={class=4}, team=blue] unless entity @s[scores={timer_start=120}] run tp @s -50 2 1
execute as @a[scores={class=5}, team=blue] unless entity @s[scores={timer_start=120}] run tp @s -50 2 3

execute as @a[scores={timer_start=0}] run scoreboard players set @s died 0
execute as @a[scores={timer_start=0}] run clear @s
execute as @a[scores={timer_start=0}] run title @s clear

execute as @a[scores={timer_start=0, class=1}] run item replace entity @s hotbar.0 with netherite_sword
execute as @a[scores={timer_start=0, class=1}] run item modify entity @s hotbar.0 defeners:weapons/warrior_sword

execute as @a[scores={timer_start=0, class=1}] run item replace entity @s hotbar.1 with iron_hoe
execute as @a[scores={timer_start=0, class=1}] run item modify entity @s hotbar.1 defeners:weapons/scythe_of_death

execute as @a[scores={timer_start=0, class=1}] run item replace entity @s hotbar.2 with mace
execute as @a[scores={timer_start=0, class=1}] run item modify entity @s hotbar.2 defeners:weapons/hammer_of_zeus

execute as @a[scores={timer_start=0, class=1}] run summon villager 54 2 0 {CustomNameVisible:1b,NoAI:1b,CustomName:'{"bold":true,"color":"gold","text":"SHOP"}', Rotation:[90F, 0F]}
execute as @a[scores={timer_start=0, class=1}] run summon villager -55 2 -1 {CustomNameVisible:1b,NoAI:1b,CustomName:'{"bold":true,"color":"gold","text":"SHOP"}', Rotation:[-90F, 0F]}


execute as @a[scores={timer_start=..119}] run scoreboard players operation @s timer_start += @s increase


execute as @a[scores={timer_start=20}] run title @s title {"text": "5", "color": "green", "bold": true}
execute as @a[scores={timer_start=20}] at @s run playsound block.note_block.bit
execute as @a[scores={timer_start=40}] run title @s title {"text": "4", "color": "green", "bold": true}
execute as @a[scores={timer_start=40}] at @s run playsound block.note_block.bit
execute as @a[scores={timer_start=60}] run title @s title {"text": "3", "color": "green", "bold": true}
execute as @a[scores={timer_start=60}] at @s run playsound block.note_block.bit
execute as @a[scores={timer_start=80}] run title @s title {"text": "2", "color": "green", "bold": true}
execute as @a[scores={timer_start=80}] at @s run playsound block.note_block.bit
execute as @a[scores={timer_start=100}] run title @s title {"text": "1", "color": "green", "bold": true}
execute as @a[scores={timer_start=100}] at @s run playsound block.note_block.bit
execute as @a[scores={timer_start=119}] run title @s title {"text": "GO!", "color": "green", "bold": true}
execute as @a[scores={timer_start=119}] at @s run playsound block.note_block.pling

###

##

execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_sword"}}, scores={damage_dealt=1..}] run scoreboard players operation @s warrior_sword_hit += @s increase
execute as @a[scores={warrior_sword_hit=3}] run effect give @s speed 3 0
execute as @a[scores={warrior_sword_hit=3}] run effect give @s regeneration 3 2
execute as @a[scores={warrior_sword_hit=3}] run scoreboard players set @s warrior_sword_hit 0
execute as @a[scores={class=1, damage_taken=1..}] run scoreboard players set @s warrior_sword_hit 0

#

execute as @a[scores={health=..10, damage_taken=1..}] if entity @a[scores={damage_dealt=1..}, distance=..3, nbt={SelectedItem:{id:"minecraft:iron_hoe"}}, limit=1] run effect give @s poison 3 1
execute as @a[scores={health=..10, damage_taken=1..}] if entity @a[scores={damage_dealt=1..}, distance=..3, nbt={SelectedItem:{id:"minecraft:iron_hoe"}}, limit=1] run effect give @s blindness 3 1

#

execute as @a[scores={damage_taken=20..}] at @s if entity @a[scores={damage_dealt=20..}, distance=..3, nbt={SelectedItem:{id:"minecraft:mace"}}, limit=1] run effect give @a[scores={damage_dealt=1..}, distance=..3, nbt={SelectedItem:{id:"minecraft:mace"}}, limit=1] resistance 1 10
execute as @a[scores={damage_taken=20..}] at @s if entity @a[scores={damage_dealt=20..}, distance=..3, nbt={SelectedItem:{id:"minecraft:mace"}}, limit=1] run summon lightning_bolt ~ ~ ~

#

##

execute as @a[scores={warrior_kills=5}] if entity @s[scores={killed=1}] run give @s redstone[item_name='{"bold":true,"color":"dark_red","text":"BLOOD OF ENEMIES"}']

execute as @a[scores={blood_of_enemies_choose=1}] run effect give @s strength 10 2
execute as @a[scores={blood_of_enemies_choose=1}] run effect give @s speed 10 1
execute as @a[scores={blood_of_enemies_choose=1}] run effect give @s regeneration 10 2
execute as @a[scores={blood_of_enemies_choose=1}] run effect give @s resistance 10 2

execute as @a[scores={blood_of_enemies_choose=1}] run kill @e[type=item, nbt={Item:{id:"minecraft:redstone"}}]
execute as @a[scores={blood_of_enemies_choose=1}] run scoreboard players set @s warrior_kills 0

execute as @a[scores={class=1}] at @s if entity @s[nbt={active_effects:[{id:"minecraft:strength"}]}] run particle angry_villager ~ ~ ~ 0.5 0.5 0.5 1 3

###

execute as @a[scores={shop_choose=1}] run tellraw @s [{"text": "------------------------------\n", "color": "green", "bold": true}, {"text": "  [WEAPONS]  ", "color": "red", "bold": true, "clickEvent": {"action": "run_command", "value": "/function #minecraft:shop/weapons"}}, {"text": "[ACTIVES]  ", "color": "green", "bold": true, "clickEvent": {"action": "run_command", "value": "/function defeners:shop/actives"}}, {"text": "[PERKS]\n", "color": "aqua", "bold": true, "clickEvent": {"action": "run_command", "value": "/function defeners:shop/perks"}}, {"text": "------------------------------", "color": "green", "bold": true}]
execute as @a[scores={shop_choose=1}] at @s run playsound block.note_block.pling

#

execute as @a[scores={died=1, timer_death=0}] run gamemode spectator @s
execute as @a[scores={died=1, timer_death=0}] run effect clear @s
execute as @a[scores={died=1, timer_death=0}] run tp 0 19 0
execute as @a[scores={died=1, timer_death=0}] at @s run playsound block.note_block.guitar ambient
execute as @a[scores={died=1}] run scoreboard players operation @s timer_death += @s increase

execute as @a[scores={timer_death=1}] run title @s title {"text": "You are dead!", "color": "red", "bold": true}

execute as @a[scores={timer_death=20}] run title @s subtitle [{"text": "you will be reborn in: ", "color": "red", "bold": true}, {"text": "3", "color": "gold", "bold": true}]
execute as @a[scores={timer_death=20}] at @s run playsound block.note_block.bit
execute as @a[scores={timer_death=40}] run title @s subtitle [{"text": "you will be reborn in: ", "color": "red", "bold": true}, {"text": "2", "color": "gold", "bold": true}]
execute as @a[scores={timer_death=40}] at @a run playsound block.note_block.bit
execute as @a[scores={timer_death=60}] run title @s subtitle [{"text": "you will be reborn in: ", "color": "red", "bold": true}, {"text": "1", "color": "gold", "bold": true}]
execute as @a[scores={timer_death=60}] at @a run playsound block.note_block.bit

execute as @a[scores={class=1, timer_death=80}, team=red] run tp @s 49 2 4
execute as @a[scores={class=2, timer_death=80}, team=red] run tp @s 49 2 2
execute as @a[scores={class=3, timer_death=80}, team=red] run tp @s 49 2 0
execute as @a[scores={class=4, timer_death=80}, team=red] run tp @s 49 2 -2
execute as @a[scores={class=5, timer_death=80}, team=red] run tp @s 49 2 -4

execute as @a[scores={class=1, timer_death=80}, team=blue] run tp @s -50 2 -5
execute as @a[scores={class=2, timer_death=80}, team=blue] run tp @s -50 2 -3
execute as @a[scores={class=3, timer_death=80}, team=blue] run tp @s -50 2 -1
execute as @a[scores={class=4, timer_death=80}, team=blue] run tp @s -50 2 1
execute as @a[scores={class=5, timer_death=80}, team=blue] run tp @s -50 2 3

execute as @a[scores={timer_death=80}] run title @s clear
execute as @a[scores={timer_death=80}] run title @s title {"text": "You have been reborn!", "color": "green", "bold": true}
execute as @a[scores={timer_death=80}] at @s run playsound block.note_block.pling
execute as @a[scores={timer_death=80}] run gamemode adventure @s

execute as @a[scores={timer_death=80, class=1}] run item replace entity @s hotbar.0 with netherite_sword
execute as @a[scores={timer_death=80, class=1}] run item modify entity @s hotbar.0 defeners:weapons/warrior_sword

execute as @a[scores={timer_death=80, class=1}] run item replace entity @s hotbar.1 with iron_hoe
execute as @a[scores={timer_death=80, class=1}] run item modify entity @s hotbar.1 defeners:weapons/scythe_of_death

execute as @a[scores={timer_death=80, class=1}] run item replace entity @s hotbar.2 with mace
execute as @a[scores={timer_death=80, class=1}] run item modify entity @s hotbar.2 defeners:weapons/hammer_of_zeus

execute as @a[scores={timer_death=80}] run scoreboard players set @s died 0
execute as @a[scores={timer_death=80}] run scoreboard players set @s timer_death 0

#

execute as @e[type=villager] run data merge entity @s {Health:20}

#

scoreboard players set @a damage_taken 0
scoreboard players set @a damage_dealt 0
scoreboard players set @a killed 0

scoreboard players set @a blood_of_enemies_choose 0
scoreboard players set @a shop_choose 0