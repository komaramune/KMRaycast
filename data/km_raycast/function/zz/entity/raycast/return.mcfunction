# 戻り値セット
scoreboard players operation $RemainingLength KMEntityRaycast = $MaxLength KMEntityRaycast
scoreboard players operation $RemainingLength KMEntityRaycast -= @s KMEntityRaycast
execute store result storage km_raycast: EntityRaycast.Returns.ResultLength double 0.00390625 run scoreboard players get @s KMEntityRaycast
execute store result storage km_raycast: EntityRaycast.Returns.RemainingLength double 0.00390625 run scoreboard players get $RemainingLength KMEntityRaycast
execute store result storage km_raycast: EntityRaycast.Returns.HitCount int 1 run scoreboard players add $HitCount KMEntityRaycast 1