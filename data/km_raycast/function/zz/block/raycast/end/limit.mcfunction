#> km_raycast:zz/block/raycast/end/limit
# @within function km_raycast:zz/block/raycast/**

scoreboard players set $LastCollideAxis KMRaycast -1
scoreboard players operation $NowLengthX KMRaycast -= $RemainingLength KMRaycast
scoreboard players operation $NowLengthY KMRaycast -= $RemainingLength KMRaycast
scoreboard players operation $NowLengthZ KMRaycast -= $RemainingLength KMRaycast
scoreboard players set $RemainingLength KMRaycast 0

function km_raycast:zz/block/raycast/end/executer_tp
