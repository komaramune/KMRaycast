#> km_raycast:zz/block/raycast/move/shift_x
# @within function km_raycast:zz/block/raycast/move/.m

execute if score $RemainingLength KMBlockRaycast < $NowLengthX KMBlockRaycast run return run function km_raycast:zz/block/raycast/end/limit

scoreboard players operation $RemainingLength KMBlockRaycast -= $NowLengthX KMBlockRaycast
execute unless score $UnitY KMBlockRaycast matches 0 run scoreboard players operation $NowLengthY KMBlockRaycast -= $NowLengthX KMBlockRaycast
execute unless score $UnitZ KMBlockRaycast matches 0 run scoreboard players operation $NowLengthZ KMBlockRaycast -= $NowLengthX KMBlockRaycast
scoreboard players operation $NowLengthX KMBlockRaycast = $LengthX KMBlockRaycast

scoreboard players set $LastCollideAxis KMBlockRaycast 0

execute if score $UnitX KMBlockRaycast matches 0.. positioned ~1 ~ ~ run return run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
execute positioned ~-1 ~ ~ run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
