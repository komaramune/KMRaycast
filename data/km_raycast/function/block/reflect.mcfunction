#> km_raycast:block/reflect
#
# ブロック反射処理
# @input
#   as entity
#   storage km_raycast: BlockReflect.Arguments.MaxLength: 最大進行距離(m)
#   storage km_raycast: BlockReflect.Arguments.Conditions: unless blockなどのサブコマンドの文字列で表される透過しないブロックの条件
#   storage km_raycast: BlockReflect.Arguments.MaxReflectCount: 最大反射可能回数
#   storage km_raycast: BlockReflect.Arguments.CallbackFunction: 反射位置で実行するファンクション(空文字列で実行無し)
# @output
#   storage km_raycast: BlockReflect.Returns.ResultLength: 前進した合計距離(m)
#   storage km_raycast: BlockReflect.Returns.LastLength: 最後に前進した距離(m)
#   storage km_raycast: BlockReflect.Returns.RemainingLength: 終了した時点で残った進行距離(m)
#   storage km_raycast: BlockReflect.Returns.LastCollideAxis: 最後に衝突した方向(-1:衝突なし, 0:x, 1:y, 2:z)
#   storage km_raycast: BlockReflect.Returns.RemainingRelfrctCount: 残りの反射可能回数
#   (コールバック実行時の追加情報)
#   実行位置・向き: 発射時点での位置・向き
#   as entity: 着弾・反射後の位置・向き
# @api

# 引数チェック
data remove storage km_raycast: BlockReflect.SuccessFlag
execute store success storage km_raycast: BlockReflect.SuccessFlag byte 1 run function km_raycast:zz/block/reflect/check_arguments.m with storage km_raycast: BlockReflect.Arguments
execute unless data storage km_raycast: {BlockReflect:{SuccessFlag:1b}} run say 【エラー】リフレクト関数の引数に渡された値が不正です。
execute unless data storage km_raycast: {BlockReflect:{SuccessFlag:1b}} run return run data remove storage km_raycast: BlockReflect.SuccessFlag
data remove storage km_raycast: BlockReflect.SuccessFlag

# オブジェクティブ成作
scoreboard objectives add KMBlockRaycast dummy

# 引数コピー
execute store result score $MaxLength KMBlockRaycast run data get storage km_raycast: BlockReflect.Arguments.MaxLength 1000
data modify storage km_raycast: BlockRaycast.Macro.Conditions set from storage km_raycast: BlockReflect.Arguments.Conditions
execute store result score $RemainingReflectCount KMBlockRaycast run data get storage km_raycast: BlockReflect.Arguments.MaxReflectCount

# 定数値定義
scoreboard players set $1000 KMBlockRaycast 1000
scoreboard players set $-1 KMBlockRaycast -1

# 数値取得
execute summon marker run function km_raycast:zz/block/raycast/get_decimal/

# レイキャスト処理
tp @s ~ ~ ~ ~ ~
scoreboard players operation $RemainingLength KMBlockRaycast = $MaxLength KMBlockRaycast
function km_raycast:zz/block/reflect/rec

# 戻り値
scoreboard players add $RemainingReflectCount KMBlockRaycast 1
scoreboard players operation $ResultLength KMBlockRaycast = $MaxLength KMBlockRaycast
scoreboard players operation $ResultLength KMBlockRaycast -= $RemainingLength KMBlockRaycast
data remove storage km_raycast: BlockReflect.Returns
execute store result storage km_raycast: BlockReflect.Returns.ResultLength double 0.001 run scoreboard players get $ResultLength KMBlockRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastLength double 0.001 run scoreboard players get $RayLength KMBlockRaycast
execute store result storage km_raycast: BlockReflect.Returns.RemainingLength double 0.001 run scoreboard players get $RemainingLength KMBlockRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastCollideAxis int 1 run scoreboard players get $LastCollideAxis KMBlockRaycast
execute store result storage km_raycast: BlockReflect.Returns.RemainingRelfrctCount int 1 run scoreboard players get $RemainingReflectCount KMBlockRaycast

# 後処理
scoreboard objectives remove KMBlockRaycast
data remove storage km_raycast: BlockRaycast.Macro