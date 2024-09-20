#> km_raycast:zz/block/raycast/move/shift_y
# @within function km_raycast:zz/block/raycast/move/.m

execute if score $RemainingLength KMBlockRaycast < $NowLengthY KMBlockRaycast run return run function km_raycast:zz/block/raycast/end/limit

scoreboard players operation $RemainingLength KMBlockRaycast -= $NowLengthY KMBlockRaycast
execute unless score $UnitX KMBlockRaycast matches 0 run scoreboard players operation $NowLengthX KMBlockRaycast -= $NowLengthY KMBlockRaycast
execute unless score $UnitZ KMBlockRaycast matches 0 run scoreboard players operation $NowLengthZ KMBlockRaycast -= $NowLengthY KMBlockRaycast
scoreboard players operation $NowLengthY KMBlockRaycast = $LengthY KMBlockRaycast

scoreboard players set $LastCollideAxis KMBlockRaycast 1

execute if score $UnitY KMBlockRaycast matches 0.. positioned ~ ~1 ~ run return run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
execute positioned ~ ~-1 ~ run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
