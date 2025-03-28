scoreboard objectives add totemrandomeffect dummy
scoreboard objectives add effectstotemdos dummy
scoreboard players random @s totemrandomeffect 0 2
execute as @s[scores={totemrandomeffect=0}] run damage @s 99999
execute as @s[scores={totemrandomeffect=1}] run scoreboard players random @s effectstotemdos 0 6
execute as @s[scores={totemrandomeffect=2}] run damage @s 0
execute as @s[scores={effectstotemdos=0}] run effect @s blindness 15 255
execute as @s[scores={effectstotemdos=1}] run effect @s fatal_poison 15 255
execute as @s[scores={effectstotemdos=2}] run effect @s hunger 15 255
execute as @s[scores={effectstotemdos=3}] run effect @s mining_fatigue 15 255
execute as @s[scores={effectstotemdos=4}] run effect @s slowness 15 255
execute as @s[scores={effectstotemdos=5}] run effect @s weakness 15 255
execute as @s[scores={effectstotemdos=6}] run effect @s wither 15 255
playsound random.totem @a ~ ~ ~
effect @s clear
effect @s instant_health 1 5