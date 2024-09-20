#> km_raycast:zz/block/raycast/move/shift_z
# @within function km_raycast:zz/block/raycast/move/.m

execute if score $RemainingLength KMBlockRaycast < $NowLengthZ KMBlockRaycast run return run function km_raycast:zz/block/raycast/end/limit

scoreboard players operation $RemainingLength KMBlockRaycast -= $NowLengthZ KMBlockRaycast
execute unless score $UnitX KMBlockRaycast matches 0 run scoreboard players operation $NowLengthX KMBlockRaycast -= $NowLengthZ KMBlockRaycast
execute unless score $UnitY KMBlockRaycast matches 0 run scoreboard players operation $NowLengthY KMBlockRaycast -= $NowLengthZ KMBlockRaycast
scoreboard players operation $NowLengthZ KMBlockRaycast = $LengthZ KMBlockRaycast

scoreboard players set $LastCollideAxis KMBlockRaycast 2

execute if score $UnitZ KMBlockRaycast matches 0.. positioned ~ ~ ~1 run return run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
execute positioned ~ ~ ~-1 run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
