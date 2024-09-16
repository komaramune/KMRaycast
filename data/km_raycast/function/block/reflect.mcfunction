#> km_raycast:block/reflect
#
# レイキャスト処理
# @input
#   as entity
#   storage km_raycast: BlockRaycast.Arguments.MaxLength: 最大進行距離(m)
#   storage km_raycast: BlockRaycast.Arguments.Conditions: unless blockなどのサブコマンドの文字列で表される透過しないブロックの条件
#   storage km_raycast: BlockRaycast.Arguments.MaxReflectCount: 最大反射可能回数
#   storage km_raycast: BlockRaycast.Arguments.CallbackFunction: 反射位置で実行するファンクション(空文字列で実行無し)
# @output
#   storage km_raycast: BlockRaycast.Returns.ResultLength: 前進した合計距離(m)
#   storage km_raycast: BlockRaycast.Returns.LastLength: 最後に前進した距離(m)
#   storage km_raycast: BlockRaycast.Returns.RemainingLength: 終了した時点で残った進行距離(m)
#   storage km_raycast: BlockRaycast.Returns.LastCollideAxis: 最後に衝突した方向(-1:衝突なし, 0:x, 1:y, 2:z)
#   storage km_raycast: BlockRaycast.Returns.RemainingRelfrctCount: 残りの反射可能回数
#   (コールバック実行時の追加情報)
#   実行位置・向き: 発射時点での位置・向き
#   as entity: 着弾・反射後の位置・向き
# @api

# オブジェクティブ成作
scoreboard objectives add KMRaycast dummy

# 引数チェック
execute store success score $CheckConditions KMRaycast run function km_raycast:zz/block/reflect/check_arguments.m with storage km_raycast: BlockReflect.Arguments
execute unless score $CheckConditions KMRaycast matches 1 run say 【エラー】リフレクト関数の引数に渡された値が不正です。
execute unless score $CheckConditions KMRaycast matches 1 run return run scoreboard objectives remove KMRaycast

# 引数コピー
execute store result score $MaxLength KMRaycast run data get storage km_raycast: BlockReflect.Arguments.MaxLength 1000
data modify storage km_raycast: BlockRaycast.Macro.Conditions set from storage km_raycast: BlockReflect.Arguments.Conditions
execute store result score $RemainingReflectCount KMRaycast run data get storage km_raycast: BlockReflect.Arguments.MaxReflectCount

# 定数値定義
scoreboard players set $1000 KMRaycast 1000
scoreboard players set $-1 KMRaycast -1

# 数値取得
execute summon marker run function km_raycast:zz/block/raycast/get_decimal/

# レイキャスト処理
tp @s ~ ~ ~ ~ ~
scoreboard players operation $RemainingLength KMRaycast = $MaxLength KMRaycast
function km_raycast:zz/block/reflect/rec

# 戻り値
scoreboard players add $RemainingReflectCount KMRaycast 1
scoreboard players operation $ResultLength KMRaycast = $MaxLength KMRaycast
scoreboard players operation $ResultLength KMRaycast -= $RemainingLength KMRaycast
data remove storage km_raycast: BlockReflect.Returns
execute store result storage km_raycast: BlockReflect.Returns.ResultLength double 0.001 run scoreboard players get $ResultLength KMRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastLength double 0.001 run scoreboard players get $RayLength KMRaycast
execute store result storage km_raycast: BlockReflect.Returns.RemainingLength double 0.001 run scoreboard players get $RemainingLength KMRaycast
execute store result storage km_raycast: BlockReflect.Returns.LastCollideAxis int 1 run scoreboard players get $LastCollideAxis KMRaycast
execute store result storage km_raycast: BlockReflect.Returns.RemainingRelfrctCount int 1 run scoreboard players get $RemainingReflectCount KMRaycast

# 後処理
scoreboard objectives remove KMRaycast
data remove storage km_raycast: BlockRaycast.Macro