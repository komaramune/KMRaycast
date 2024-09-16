# 戻り値セット
scoreboard players operation $RemainingLength KMRaycast = $MaxLength KMRaycast
scoreboard players operation $RemainingLength KMRaycast -= @s KMRaycast
execute store result storage km_raycast: EntityRaycast.Returns.ResultLength double 0.00390625 run scoreboard players get @s KMRaycast
execute store result storage km_raycast: EntityRaycast.Returns.RemainingLength double 0.00390625 run scoreboard players get $RemainingLength KMRaycast
execute store result storage km_raycast: EntityRaycast.Returns.HitCount int 1 run scoreboard players add $HitCount KMRaycast 1