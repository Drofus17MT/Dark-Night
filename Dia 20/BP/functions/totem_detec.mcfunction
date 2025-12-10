playsound random.totem @a ~ ~ ~
tellraw @a {"rawtext":[{"text":"§1§l"},{"selector":"@s"},{"text":" §r§9ha usado totem"}]}
effect @s clear
effect @s instant_health 1 10