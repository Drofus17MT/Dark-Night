title @a actionbar §1@s §8Ha Muerto
tag @s add muerto
gamemode spectator @s
playsound mob.enderdragon.growl @a ~~~ 16 2 16
tellraw @a {"rawtext":[{"text":"§4"},{"selector":"@s"},{"text":" §r§8ha sido desterrado al Oscuro Infierno...§r"}]}
title @a title §l§5§kW§r§l§8Dark §1Night§0§5§kD
playsound sounds.muertedn @a 100 1 0
effect @a darkness 10 255
time set midnight