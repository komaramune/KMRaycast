#> km_raycast:entity/raycast
#
# エンティティレイキャスト判定検知
# @input
#   at position rotation 線の始点と向き
#   storage km_raycast: EntityRaycast.Arguments.MaxLength: 最大進行距離(m)
#   storage km_raycast: EntityRaycast.Arguments.SelectorArguments: エンティティを絞り込むセレクタ引数(例:",type=armor_stand,tag=hoge"。最初に","が必要)
#   storage km_raycast: EntityRaycast.Arguments.CallbackFunction: 検知したエンティティに対して実行するファンクション(空文字列で実行無し)
#   storage km_raycast: EntityRaycast.Arguments.ThroughMode: 線がエンティティを貫通するかどうか。非貫通モードでは最も手前のエンティティが対象になる(一体だけとは限らない)
# @output
#   storage km_raycast: EntityRaycast.Returns.ResultLength: 前進した距離(m)
#   storage km_raycast: EntityRaycast.Returns.RemainingLength: 残っている進行距離(m)
#   storage km_raycast: EntityRaycast.Returns.HitCount: ヒットした回数
# @api

# 実行位置が読み込まれていなかったら失敗
execute unless loaded ~ ~ ~ run return fail

# 一時エンティティ召喚
summon marker ~ ~ ~ {UUID:[I; -1939065600, 247743830, -1206377468, 1787433810]}

# オブジェクティブ成作
scoreboard objectives add KMEntityRaycast dummy

# 引数コピー
execute store result score $MaxLength KMEntityRaycast run data get storage km_raycast: EntityRaycast.Arguments.MaxLength 256
data modify storage km_raycast: EntityRaycast.Macro.SelectorArguments set from storage km_raycast: EntityRaycast.Arguments.SelectorArguments
data modify storage km_raycast: EntityRaycast.Macro.CallbackFunction set from storage km_raycast: EntityRaycast.Arguments.CallbackFunction
data modify storage km_raycast: EntityRaycast.Macro.RunLength set value 0d

# 戻り値セット
data remove storage km_raycast: EntityRaycast.Returns
data modify storage km_raycast: EntityRaycast.Returns set value {ResultLength:0d,RemainingLength:0d,HitCount:0}
execute store result storage km_raycast: EntityRaycast.Returns.ResultLength double 0.00390625 run data get storage km_raycast: EntityRaycast.Arguments.MaxLength 256

# execute幾何学で一時エンティティを角度align
execute as 8c6c3500-0ec4-4556-b818-24046a8a1352 positioned 0.0 0.0 0.0 positioned ^ ^ ^-0.5 align xyz facing -0.5 -0.5 -0.5 positioned as @s run tp @s ~ ~ ~ ~ ~

scoreboard players set $SearchLength KMEntityRaycast 0
scoreboard players set $MinLength KMEntityRaycast 2000000000
scoreboard players set $HitCount KMEntityRaycast 0
function km_raycast:zz/entity/raycast/rec

# 一時エンティティ削除
kill 8c6c3500-0ec4-4556-b818-24046a8a1352

# ストレージ削除
data remove storage km_raycast: EntityRaycast.Macro

# オブジェクティブ削除
scoreboard objectives remove KMEntityRaycast