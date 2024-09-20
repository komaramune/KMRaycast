#> km_raycast:block/raycast
#
# ブロックレイキャスト処理
# @input
#   as entity
#   storage km_raycast: BlockRaycast.Arguments.MaxLength: 最大進行距離(m)
#   storage km_raycast: BlockRaycast.Arguments.Conditions: "unless block"などのサブコマンドの文字列で表される透過しないブロックの条件
# @output
#   storage km_raycast: BlockRaycast.Returns.ResultLength: 前進した距離(m)
#   storage km_raycast: BlockRaycast.Returns.RemainingLength: 衝突した時点で残った進行距離(m)
#   storage km_raycast: BlockRaycast.Returns.LastCollideAxis: 衝突した方向(-1:衝突なし, 0:X軸, 1:Y軸, 2:Z軸)
# @api

# 引数チェック
execute store success storage km_raycast: BlockRaycast.SuccessFlag byte 1 run function km_raycast:zz/block/raycast/check_arguments.m with storage km_raycast: BlockRaycast.Arguments
execute unless data storage km_raycast: {BlockRaycast:{SuccessFlag:1b}} run say 【エラー】レイキャスト関数の引数に渡された値が不正です。
execute unless data storage km_raycast: {BlockRaycast:{SuccessFlag:1b}} run return run data remove storage km_raycast: BlockRaycast.SuccessFlag
data remove storage km_raycast: BlockRaycast.SuccessFlag

# オブジェクティブ成作
scoreboard objectives add KMBlockRaycast dummy

# 引数コピー
execute store result score $MaxLength KMBlockRaycast run data get storage km_raycast: BlockRaycast.Arguments.MaxLength 1000
data modify storage km_raycast: BlockRaycast.Macro.Conditions set from storage km_raycast: BlockRaycast.Arguments.Conditions

# 定数値定義
scoreboard players set $1000 KMBlockRaycast 1000
scoreboard players set $-1 KMBlockRaycast -1

# 数値取得
execute summon marker run function km_raycast:zz/block/raycast/get_decimal/

# レイキャスト処理
scoreboard players set $LastCollideAxis KMBlockRaycast -1
scoreboard players operation $RemainingLength KMBlockRaycast = $MaxLength KMBlockRaycast
execute align xyz run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro

# 戻り値
scoreboard players operation $ResultLength KMBlockRaycast = $MaxLength KMBlockRaycast
scoreboard players operation $ResultLength KMBlockRaycast -= $RemainingLength KMBlockRaycast
data remove storage km_raycast: BlockRaycast.Returns
execute store result storage km_raycast: BlockRaycast.Returns.ResultLength double 0.001 run scoreboard players get $ResultLength KMBlockRaycast
execute store result storage km_raycast: BlockRaycast.Returns.RemainingLength double 0.001 run scoreboard players get $RemainingLength KMBlockRaycast
execute store result storage km_raycast: BlockRaycast.Returns.LastCollideAxis int 1 run scoreboard players get $LastCollideAxis KMBlockRaycast

# 後処理
scoreboard objectives remove KMBlockRaycast
data remove storage km_raycast: BlockRaycast.Macro
