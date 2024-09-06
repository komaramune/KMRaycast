#> km_raycast:zz/block/raycast/move/shift_z
# @within function km_raycast:zz/block/raycast/move/.m

execute if score $RemainingLength KMRaycast < $NowLengthZ KMRaycast run return run function km_raycast:zz/block/raycast/end/limit

scoreboard players operation $RemainingLength KMRaycast -= $NowLengthZ KMRaycast
execute unless score $UnitX KMRaycast matches 0 run scoreboard players operation $NowLengthX KMRaycast -= $NowLengthZ KMRaycast
execute unless score $UnitY KMRaycast matches 0 run scoreboard players operation $NowLengthY KMRaycast -= $NowLengthZ KMRaycast
scoreboard players operation $NowLengthZ KMRaycast = $LengthZ KMRaycast

scoreboard players set $LastCollideAxis KMRaycast 2

execute if score $UnitZ KMRaycast matches 0.. positioned ~ ~ ~1 run return run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
execute positioned ~ ~ ~-1 run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro
