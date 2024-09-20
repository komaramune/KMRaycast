#> km_raycast:zz/block/raycast/move/.m
# @within function km_raycast:**

$execute $(Conditions) unless score $LastCollideAxis KMBlockRaycast matches -1 run return run function km_raycast:zz/block/raycast/end/executer_tp

scoreboard players set $LastCollideAxis KMBlockRaycast -1
execute unless loaded ~ ~ ~ run return run function km_raycast:zz/block/raycast/end/executer_tp

execute if score $NowLengthX KMBlockRaycast <= $NowLengthY KMBlockRaycast if score $NowLengthX KMBlockRaycast <= $NowLengthZ KMBlockRaycast run return run function km_raycast:zz/block/raycast/move/shift_x
execute if score $NowLengthY KMBlockRaycast <= $NowLengthZ KMBlockRaycast run return run function km_raycast:zz/block/raycast/move/shift_y
function km_raycast:zz/block/raycast/move/shift_z
