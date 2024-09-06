#> km_raycast:zz/block/raycast/move/shift_y
# @within function km_raycast:zz/block/raycast/move/.m

execute if score $RemainingLength KMRaycast < $NowLengthY KMRaycast run return run function km_raycast:zz/block/raycast/end/limit

scoreboard players operation $RemainingLength KMRaycast -= $NowLengthY KMRaycast
execute unless score $UnitX KMRaycast matches 0 run scoreboard players operation $NowLengthX KMRaycast -= $NowLengthY KMRaycast
execute unless score $UnitZ KMRaycast matches 0 run scoreboard players operation $NowLengthZ KMRaycast -= $NowLengthY KMRaycast
scoreboard players operation $NowLengthY KMRaycast = $LengthY KMRaycast

scoreboard players set $LastCollideAxis KMRaycast 1

execute if score $UnitY KMRaycast matches 0.. positioned ~ ~1 ~ run return run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
execute positioned ~ ~-1 ~ run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
