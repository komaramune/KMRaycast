#> km_raycast:raycast/core/move/shift_x
# @within function km_raycast:raycast/core/move/.m

execute if score $RemainingLength KMRaycast < $NowLengthX KMRaycast run return run function km_raycast:raycast/core/end/limit

scoreboard players operation $RemainingLength KMRaycast -= $NowLengthX KMRaycast
execute unless score $UnitY KMRaycast matches 0 run scoreboard players operation $NowLengthY KMRaycast -= $NowLengthX KMRaycast
execute unless score $UnitZ KMRaycast matches 0 run scoreboard players operation $NowLengthZ KMRaycast -= $NowLengthX KMRaycast
scoreboard players operation $NowLengthX KMRaycast = $LengthX KMRaycast

scoreboard players set $LastCollideAxis KMRaycast 0

execute if score $UnitX KMRaycast matches 0.. positioned ~1 ~ ~ run return run function km_raycast:raycast/core/move/.m with storage km_raycast: Raycast.Macro
execute positioned ~-1 ~ ~ run function km_raycast:raycast/core/move/.m with storage km_raycast: Raycast.Macro
