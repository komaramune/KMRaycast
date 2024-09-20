# 二分探査終了処理
scoreboard players operation @s KMEntityRaycast = $BSLength KMEntityRaycast
scoreboard players operation $MinLength KMEntityRaycast < $BSLength KMEntityRaycast

execute if data storage km_raycast: {EntityRaycast:{Arguments:{ThroughMode:false}}} run return 1

function km_raycast:zz/entity/raycast/return
execute unless data storage km_raycast: {EntityRaycast:{Arguments:{CallbackFunction:""}}} run function km_raycast:zz/entity/raycast/callback.m with storage km_raycast: EntityRaycast.Macro
return 1