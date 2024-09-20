#> km_raycast:zz/block/raycast/end/limit
# @within function km_raycast:zz/block/raycast/**

scoreboard players set $LastCollideAxis KMBlockRaycast -1
scoreboard players operation $NowLengthX KMBlockRaycast -= $RemainingLength KMBlockRaycast
scoreboard players operation $NowLengthY KMBlockRaycast -= $RemainingLength KMBlockRaycast
scoreboard players operation $NowLengthZ KMBlockRaycast -= $RemainingLength KMBlockRaycast
scoreboard players set $RemainingLength KMBlockRaycast 0

function km_raycast:zz/block/raycast/end/executer_tp
