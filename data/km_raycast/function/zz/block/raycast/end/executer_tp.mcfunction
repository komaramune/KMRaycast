#> km_raycast:zz/block/raycast/end/executer_tp
# @within function km_raycast:zz/block/raycast/**

scoreboard players set $TPX KMBlockRaycast 1000
scoreboard players operation $TPX KMBlockRaycast *= $NowLengthX KMBlockRaycast
scoreboard players operation $TPX KMBlockRaycast /= $LengthX KMBlockRaycast
scoreboard players remove $TPX KMBlockRaycast 500
execute if score $UnitX KMBlockRaycast matches 0.. run scoreboard players operation $TPX KMBlockRaycast *= $-1 KMBlockRaycast
execute unless score $LastCollideAxis KMBlockRaycast matches 0 store result storage km_raycast: BlockRaycast.Macro.TPX double 0.001 run scoreboard players get $TPX KMBlockRaycast
execute if score $LastCollideAxis KMBlockRaycast matches 0 store result storage km_raycast: BlockRaycast.Macro.TPX double 0.00100001 run scoreboard players get $TPX KMBlockRaycast

scoreboard players set $TPY KMBlockRaycast 1000
scoreboard players operation $TPY KMBlockRaycast *= $NowLengthY KMBlockRaycast
scoreboard players operation $TPY KMBlockRaycast /= $LengthY KMBlockRaycast
scoreboard players remove $TPY KMBlockRaycast 500
execute if score $UnitY KMBlockRaycast matches 0.. run scoreboard players operation $TPY KMBlockRaycast *= $-1 KMBlockRaycast
execute unless score $LastCollideAxis KMBlockRaycast matches 1 store result storage km_raycast: BlockRaycast.Macro.TPY double 0.001 run scoreboard players get $TPY KMBlockRaycast
execute if score $LastCollideAxis KMBlockRaycast matches 1 store result storage km_raycast: BlockRaycast.Macro.TPY double 0.00100001 run scoreboard players get $TPY KMBlockRaycast

scoreboard players set $TPZ KMBlockRaycast 1000
scoreboard players operation $TPZ KMBlockRaycast *= $NowLengthZ KMBlockRaycast
scoreboard players operation $TPZ KMBlockRaycast /= $LengthZ KMBlockRaycast
scoreboard players remove $TPZ KMBlockRaycast 500
execute if score $UnitZ KMBlockRaycast matches 0.. run scoreboard players operation $TPZ KMBlockRaycast *= $-1 KMBlockRaycast
execute unless score $LastCollideAxis KMBlockRaycast matches 2 store result storage km_raycast: BlockRaycast.Macro.TPZ double 0.001 run scoreboard players get $TPZ KMBlockRaycast
execute if score $LastCollideAxis KMBlockRaycast matches 2 store result storage km_raycast: BlockRaycast.Macro.TPZ double 0.00100001 run scoreboard players get $TPZ KMBlockRaycast

execute align xyz positioned ~0.5 ~0.5 ~0.5 run function km_raycast:zz/block/raycast/end/tp.m with storage km_raycast: BlockRaycast.Macro
