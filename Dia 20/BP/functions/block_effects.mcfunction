#web
#down
execute if block ~ ~0 ~ web run effect @s[m=s] fatal_poison 10 255
execute if block ~ ~0 ~ web run effect @s[m=s] instant_damage 10 0
#up
execute if block ~ ~1 ~ web run effect @s[m=s] fatal_poison 10 255
execute if block ~ ~1 ~ web run effect @s[m=s] instant_damage 10 0

#bedrock
#down
execute if block ~ ~-1 ~ bedrock run effect @s[m=s] blindness 3 255
#up
execute if block ~ ~2 ~ bedrock run effect @s[m=s] blindness 3 255
#+ +
execute if block ~1 ~ ~ bedrock run effect @s[m=s] blindness 3 255
execute if block ~ ~ ~1 bedrock run effect @s[m=s] blindness 3 255
execute if block ~1 ~ ~1 bedrock run effect @s[m=s] blindness 3 255
#- -
execute if block ~-1 ~ ~ bedrock run effect @s[m=s] blindness 3 255
execute if block ~ ~ ~-1 bedrock run effect @s[m=s] blindness 3 255
execute if block ~-1 ~ ~-1 bedrock run effect @s[m=s] blindness 3 255
#+ -
execute if block ~1 ~ ~-1 bedrock run effect @s[m=s] blindness 3 255
#- +
execute if block ~-1 ~ ~1 bedrock run effect @s[m=s] blindness 3 255

execute at @e[type=ender_crystal,r=200] run fill ~8 ~ ~8 ~-8 0 ~-8 bedrock replace obsidian