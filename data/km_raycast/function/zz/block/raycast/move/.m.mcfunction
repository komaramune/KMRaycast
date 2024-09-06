#> km_raycast:zz/block/raycast/move/.m
# @within function km_raycast:**

$execute $(Conditions) unless score $LastCollideAxis KMRaycast matches -1 run return run function km_raycast:zz/block/raycast/end/executer_tp

scoreboard players set $LastCollideAxis KMRaycast -1
execute unless loaded ~ ~ ~ run return run function km_raycast:zz/block/raycast/end/executer_tp

execute if score $NowLengthX KMRaycast <= $NowLengthY KMRaycast if score $NowLengthX KMRaycast <= $NowLengthZ KMRaycast run return run function km_raycast:zz/block/raycast/move/shift_x
execute if score $NowLengthY KMRaycast <= $NowLengthZ KMRaycast run return run function km_raycast:zz/block/raycast/move/shift_y
function km_raycast:zz/block/raycast/move/shift_z
