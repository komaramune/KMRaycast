# 戻り値
scoreboard players operation $ResultLength KMRaycast = $MaxLength KMRaycast
scoreboard players operation $ResultLength KMRaycast -= $RemainingLength KMRaycast
data remove storage km_raycast: Reflect.Returns
execute store result storage km_raycast: Reflect.Returns.ResultLength double 0.001 run scoreboard players get $ResultLength KMRaycast
execute store result storage km_raycast: Reflect.Returns.LastLength double 0.001 run scoreboard players get $RayLength KMRaycast
execute store result storage km_raycast: Reflect.Returns.RemainingLength double 0.001 run scoreboard players get $RemainingLength KMRaycast
execute store result storage km_raycast: Reflect.Returns.LastCollideAxis int 1 run scoreboard players get $LastCollideAxis KMRaycast
execute store result storage km_raycast: Raycast.Returns.ResultRelfrctCount int 1 run scoreboard players get $RemainingReflectCount KMRaycast

$function $(CallbackFunction)