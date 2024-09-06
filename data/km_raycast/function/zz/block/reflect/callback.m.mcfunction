# 戻り値
scoreboard players operation $ResultLength KMRaycast = $MaxLength KMRaycast
scoreboard players operation $ResultLength KMRaycast -= $RemainingLength KMRaycast
data remove storage km_raycast: BlockReflect.Returns
execute store result storage km_raycast: BlockReflect.Returns.ResultLength double 0.001 run scoreboard players get $ResultLength KMRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastLength double 0.001 run scoreboard players get $RayLength KMRaycast
execute store result storage km_raycast: BlockReflect.Returns.RemainingLength double 0.001 run scoreboard players get $RemainingLength KMRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastCollideAxis int 1 run scoreboard players get $LastCollideAxis KMRaycast
execute store result storage km_raycast: BlockRaycast.Returns.ResultRelfrctCount int 1 run scoreboard players get $RemainingReflectCount KMRaycast

$function $(CallbackFunction)