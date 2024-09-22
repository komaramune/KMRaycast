#> km_raycast:zz/extra/raycast/callback/entity
# @within function km_raycast:**

# 戻り値セット
execute store result score $ExRemainingLength KMExtraRaycast run data get storage km_raycast: ExtraRaycast.Arguments.MaxLength 256
execute store result score $ExResultLength KMExtraRaycast run data get storage km_raycast: EntityRaycast.Returns.ResultLength 256
scoreboard players operation $ExRemainingLength KMExtraRaycast -= $ExResultLength KMExtraRaycast
execute store result storage km_raycast: ExtraRaycast.Returns.RemainingLength double 0.00390625 run scoreboard players get $ExRemainingLength KMExtraRaycast
data modify storage km_raycast: ExtraRaycast.Returns.ResultLength set from storage km_raycast: EntityRaycast.Returns.ResultLength
data modify storage km_raycast: ExtraRaycast.Returns.HitCount set from storage km_raycast: EntityRaycast.Returns.HitCount
data modify storage km_raycast: ExtraRaycast.Returns.LastCollideAxis set value -1

function km_raycast:zz/extra/raycast/callback/entity_macro.m with storage km_raycast: ExtraRaycast.Macro