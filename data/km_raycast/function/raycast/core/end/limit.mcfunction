#> km_raycast:raycast/core/end/limit
# @within function km_raycast:raycast/core/**

scoreboard players set $LastCollideAxis KMRaycast -1
scoreboard players operation $NowLengthX KMRaycast -= $RemainingLength KMRaycast
scoreboard players operation $NowLengthY KMRaycast -= $RemainingLength KMRaycast
scoreboard players operation $NowLengthZ KMRaycast -= $RemainingLength KMRaycast
scoreboard players set $RemainingLength KMRaycast 0

function km_raycast:raycast/core/end/executer_tp
