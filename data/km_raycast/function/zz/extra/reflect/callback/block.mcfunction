#> km_raycast:zz/extra/reflect/callback/block
# @within function km_raycast:**

execute if data storage km_raycast: {ExtraReflect:{Arguments:{MultiHitMode:True}}} run function km_raycast:zz/extra/reflect/callback/reset_score

# 戻り値セット
data modify storage km_raycast: ExtraReflect.Returns set from storage km_raycast: BlockReflect.Returns

# エンティティレイキャスト処理
execute as 8c6c3500-0ec4-4556-b818-24046a8a1352 positioned 0.0 0.0 0.0 positioned ^ ^ ^-0.5 align xyz facing -0.5 -0.5 -0.5 positioned as @s run tp @s ~ ~ ~ ~ ~
execute store result score $MaxLength KMEntityRaycast run data get storage km_raycast: BlockReflect.Returns.LastLength 256
scoreboard players set $SearchLength KMEntityRaycast 0
scoreboard players set $MinLength KMEntityRaycast 2000000000
function km_raycast:zz/entity/raycast/rec

# ブロックコールバック実行
execute unless data storage km_raycast: {ExtraReflect:{Arguments:{BlockCallbackFunction:""}}} run function km_raycast:zz/extra/reflect/callback/block_macro.m with storage km_raycast: ExtraReflect.Macro