#> km_raycast:zz/block/raycast/end/executer_tp
# @within function km_raycast:zz/block/raycast/**

scoreboard players set $TPX KMRaycast 1000
scoreboard players operation $TPX KMRaycast *= $NowLengthX KMRaycast
scoreboard players operation $TPX KMRaycast /= $LengthX KMRaycast
scoreboard players remove $TPX KMRaycast 500
execute if score $UnitX KMRaycast matches 0.. run scoreboard players operation $TPX KMRaycast *= $-1 KMRaycast
execute store result storage km_raycast: BlockRaycast.Macro.TPX double 0.001 run scoreboard players get $TPX KMRaycast

scoreboard players set $TPY KMRaycast 1000
scoreboard players operation $TPY KMRaycast *= $NowLengthY KMRaycast
scoreboard players operation $TPY KMRaycast /= $LengthY KMRaycast
scoreboard players remove $TPY KMRaycast 500
execute if score $UnitY KMRaycast matches 0.. run scoreboard players operation $TPY KMRaycast *= $-1 KMRaycast
execute store result storage km_raycast: BlockRaycast.Macro.TPY double 0.001 run scoreboard players get $TPY KMRaycast

scoreboard players set $TPZ KMRaycast 1000
scoreboard players operation $TPZ KMRaycast *= $NowLengthZ KMRaycast
scoreboard players operation $TPZ KMRaycast /= $LengthZ KMRaycast
scoreboard players remove $TPZ KMRaycast 500
execute if score $UnitZ KMRaycast matches 0.. run scoreboard players operation $TPZ KMRaycast *= $-1 KMRaycast
execute store result storage km_raycast: BlockRaycast.Macro.TPZ double 0.001 run scoreboard players get $TPZ KMRaycast

execute align xyz positioned ~0.5 ~0.5 ~0.5 run function km_raycast:zz/block/raycast/end/tp.m with storage km_raycast: BlockRaycast.Macro

execute if score $LastCollideAxis KMRaycast matches 0 if score $UnitX KMRaycast matches 0.. positioned as @s run tp @s ~-0.0005 ~ ~
execute if score $LastCollideAxis KMRaycast matches 0 unless score $UnitX KMRaycast matches 0.. positioned as @s run tp @s ~0.0005 ~ ~
execute if score $LastCollideAxis KMRaycast matches 1 if score $UnitY KMRaycast matches 0.. positioned as @s run tp @s ~ ~-0.0005 ~
execute if score $LastCollideAxis KMRaycast matches 1 unless score $UnitY KMRaycast matches 0.. positioned as @s run tp @s ~ ~0.0005 ~
execute if score $LastCollideAxis KMRaycast matches 2 if score $UnitZ KMRaycast matches 0.. positioned as @s run tp @s ~ ~ ~-0.0005
execute if score $LastCollideAxis KMRaycast matches 2 unless score $UnitZ KMRaycast matches 0.. positioned as @s run tp @s ~ ~ ~0.0005
