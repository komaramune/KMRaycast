# 後処理
execute if data storage km_raycast: {EntityRaycast:{Arguments:{ThroughMode:true}}} run return 0
execute if score @s KMEntityRaycast > $MinLength KMEntityRaycast run return run scoreboard players reset @s KMEntityRaycast

function km_raycast:zz/entity/raycast/return

scoreboard players set $SearchLength KMEntityRaycast 2000000000
data modify storage km_raycast: EntityRaycast.Macro.RunLength set from storage km_raycast: EntityRaycast.Returns.ResultLength

execute unless data storage km_raycast: {EntityRaycast:{Arguments:{CallbackFunction:""}}} positioned as 8c6c3500-0ec4-4556-b818-24046a8a1352 run function km_raycast:zz/entity/raycast/callback.m with storage km_raycast: EntityRaycast.Macro