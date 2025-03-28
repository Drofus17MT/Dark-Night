tellraw @s[tag=!inicio] {"rawtext":[{"text":"§7"},{"selector":"@s"},{"text":" §8Bienvenido a la Oscuridad Misma§r"}]}
playsound item.trident.thunder @s[tag=!inicio] ~~~ 100 1 100
give @s[tag=!inicio] totem_of_undying 2
give @s[tag=!inicio] bread 16
execute as @s[tag=!inicio] run title @s title  §0§kW§r§8Dark §1Night§0§kD
execute as @s[tag=!inicio] run title @s subtitle §mCreador del Add-on §lDrofus§r.
tag @s[tag=!inicio] add inicio
difficulty hard
gamerule showcoordinates true
gamerule commandblockoutput false
gamerule sendcommandfeedback false
gamerule doimmediaterespawn true
