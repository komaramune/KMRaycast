#> km_raycast:zz/extra/reflect/callback/entity
# @within function km_raycast:**

# 戻り値セット
execute store result score $BlockResultLength KMExtraRaycast run data get storage km_raycast: BlockReflect.Returns.ResultLength 256
execute store result score $EntityRemainingLength KMExtraRaycast run data get storage km_raycast: EntityRaycast.Returns.RemainingLength 256
scoreboard players operation $BlockResultLength KMExtraRaycast -= $EntityRemainingLength KMExtraRaycast
execute store result storage km_raycast: ExtraReflect.Returns.ResultLength double 0.00390625 run scoreboard players get $BlockResultLength KMExtraRaycast
execute store result score $BlockRemainingLength KMExtraRaycast run data get storage km_raycast: BlockReflect.Returns.RemainingLength 256
scoreboard players operation $BlockRemainingLength KMExtraRaycast += $EntityRemainingLength KMExtraRaycast
execute store result storage km_raycast: ExtraReflect.Returns.RemainingLength double 0.00390625 run scoreboard players get $BlockRemainingLength KMExtraRaycast
data modify storage km_raycast: ExtraReflect.Returns.LastLength set from storage km_raycast: EntityRaycast.Returns.ResultLength
data modify storage km_raycast: ExtraReflect.Returns.HitCount set from storage km_raycast: EntityRaycast.Returns.HitCount
data modify storage km_raycast: ExtraReflect.Returns.LastCollideAxis set value -1

# エンティティコールバック実行
function km_raycast:zz/extra/raycast/callback/entity_macro.m with storage km_raycast: ExtraReflect.Macro

# 貫通モードの場合は戻り値再セット
execute if data storage km_raycast: {EntityRaycast:{Arguments:{ThroughMode:True}}} run data modify storage km_raycast: ExtraReflect.Returns set from storage km_raycast: BlockReflect.Returns

# 非貫通モードの場合は以下を実行
execute if data storage km_raycast: {EntityRaycast:{Arguments:{ThroughMode:True}}} run return fail
scoreboard players set $LastCollideAxis KMBlockRaycast -1
tp 9103578f-e515-4922-9f08-cc5d144257a5 ~ ~ ~ ~ ~