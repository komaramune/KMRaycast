#> km_raycast:raycast/core/move/shift_z
# @within function km_raycast:raycast/core/move/.m

execute if score $RemainingLength KMRaycast < $NowLengthZ KMRaycast run return run function km_raycast:raycast/core/end/limit

scoreboard players operation $RemainingLength KMRaycast -= $NowLengthZ KMRaycast
execute unless score $UnitX KMRaycast matches 0 run scoreboard players operation $NowLengthX KMRaycast -= $NowLengthZ KMRaycast
execute unless score $UnitY KMRaycast matches 0 run scoreboard players operation $NowLengthY KMRaycast -= $NowLengthZ KMRaycast
scoreboard players operation $NowLengthZ KMRaycast = $LengthZ KMRaycast

scoreboard players set $LastCollideDirection KMRaycast 2

execute if score $UnitZ KMRaycast matches 0.. positioned ~ ~ ~1 run return run function km_raycast:raycast/core/move/.m with storage km_raycast: Raycast.Macro
execute positioned ~ ~ ~-1 run function km_raycast:raycast/core/move/.m with storage km_raycast: Raycast.Macro
