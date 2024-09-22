#> km_raycast:zz/extra/reflect/
# @within function km_raycast:**

# 実行者マーカー向き合わせ
tp @s ~ ~ ~ ~ ~

# エンティティレイキャスト準備
# エンティティレイキャスト用一時エンティティ召喚
summon marker ~ ~ ~ {UUID:[I; -1939065600, 247743830, -1206377468, 1787433810]}
# オブジェクティブ成作
scoreboard objectives add KMEntityRaycast dummy
# 引数コピー
data modify storage km_raycast: EntityRaycast.Arguments.ThroughMode set from storage km_raycast: ExtraReflect.Arguments.ThroughMode
data modify storage km_raycast: EntityRaycast.Macro.SelectorArguments set from storage km_raycast: ExtraReflect.Arguments.SelectorArguments
data modify storage km_raycast: EntityRaycast.Macro.CallbackFunction set value "km_raycast:zz/extra/reflect/callback/entity"
data modify storage km_raycast: EntityRaycast.Macro.RunLength set value 0d
# 戻り値セット
data remove storage km_raycast: EntityRaycast.Returns
data modify storage km_raycast: EntityRaycast.Returns set value {ResultLength:0d,RemainingLength:0d,HitCount:0}
execute store result storage km_raycast: EntityRaycast.Returns.ResultLength double 0.00390625 run data get storage km_raycast: ExtraReflect.Arguments.MaxLength 256
# スコアセット
scoreboard players set $HitCount KMEntityRaycast 0

# ブロックリフレクト処理
data modify storage km_raycast: BlockReflect.Arguments.MaxLength set from storage km_raycast: ExtraReflect.Arguments.MaxLength
data modify storage km_raycast: BlockReflect.Arguments.Conditions set from storage km_raycast: ExtraReflect.Arguments.Conditions
data modify storage km_raycast: BlockReflect.Arguments.MaxReflectCount set from storage km_raycast: ExtraReflect.Arguments.MaxReflectCount
data modify storage km_raycast: BlockReflect.Arguments.CallbackFunction set value "km_raycast:zz/extra/reflect/callback/block"
function km_raycast:block/reflect

# エンティティレイキャスト片付け
# 一時エンティティ削除
kill 8c6c3500-0ec4-4556-b818-24046a8a1352
# ストレージ削除
data remove storage km_raycast: EntityRaycast.Macro
# オブジェクティブ削除
scoreboard objectives remove KMEntityRaycast

# リフレクト用一時エンティティ削除
kill @s