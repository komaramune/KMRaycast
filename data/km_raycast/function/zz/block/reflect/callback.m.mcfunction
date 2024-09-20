# 戻り値
scoreboard players operation $ResultLength KMBlockRaycast = $MaxLength KMBlockRaycast
scoreboard players operation $ResultLength KMBlockRaycast -= $RemainingLength KMBlockRaycast
data remove storage km_raycast: BlockReflect.Returns
execute store result storage km_raycast: BlockReflect.Returns.ResultLength double 0.001 run scoreboard players get $ResultLength KMBlockRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastLength double 0.001 run scoreboard players get $RayLength KMBlockRaycast
execute store result storage km_raycast: BlockReflect.Returns.RemainingLength double 0.001 run scoreboard players get $RemainingLength KMBlockRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastCollideAxis int 1 run scoreboard players get $LastCollideAxis KMBlockRaycast
execute store result storage km_raycast: BlockRaycast.Returns.ResultRelfrctCount int 1 run scoreboard players get $RemainingReflectCount KMBlockRaycast

$function $(CallbackFunction)