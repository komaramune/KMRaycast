#> km_raycast:raycast/reflect/
#
# レイキャスト処理
# @input
#   as entity
#   storage km_raycast: Raycast.Arguments.MaxLength: 最大進行距離(m)
#   storage km_raycast: Raycast.Arguments.Conditions: unless blockなどのサブコマンドの文字列で表される透過しないブロックの条件
#   storage km_raycast: Raycast.Arguments.MaxReflectCount: 最大反射可能回数
#   storage km_raycast: Raycast.Arguments.CallbackFunction: 反射位置で実行するファンクション(空文字列で実行無し)
# @output
#   storage km_raycast: Raycast.Returns.ResultLength: 前進した合計距離(m)
#   storage km_raycast: Raycast.Returns.LastLength: 最後に前進した距離(m)
#   storage km_raycast: Raycast.Returns.RemainingLength: 終了した時点で残った進行距離(m)
#   storage km_raycast: Raycast.Returns.LastCollideAxis: 最後に衝突した方向(-1:衝突なし, 0:x, 1:y, 2:z)
#   storage km_raycast: Raycast.Returns.RemainingRelfrctCount: 残りの反射可能回数
#   (コールバック実行時の追加情報)
#   実行位置・向き: 発射時点での位置・向き
#   as entity: 着弾・反射後の位置・向き
# @api

# 引数チェック
execute store success score $CheckConditions KMRaycast run function km_raycast:reflect/core/check_arguments.m with storage km_raycast: Reflect.Arguments
execute unless score $CheckConditions KMRaycast matches 1 run return run say 【エラー】リフレクト関数の引数に渡された値が不正です。

# 引数コピー
execute store result score $MaxLength KMRaycast run data get storage km_raycast: Reflect.Arguments.MaxLength 1000
data modify storage km_raycast: Raycast.Macro.Conditions set from storage km_raycast: Reflect.Arguments.Conditions
execute store result score $RemainingReflectCount KMRaycast run data get storage km_raycast: Reflect.Arguments.MaxReflectCount

# 定数値定義
scoreboard players set $1000 KMRaycast 1000
scoreboard players set $-1 KMRaycast -1

# 数値取得
execute summon marker run function km_raycast:raycast/core/get_decimal/

# レイキャスト処理
tp @s ~ ~ ~ ~ ~
scoreboard players operation $RemainingLength KMRaycast = $MaxLength KMRaycast
function km_raycast:reflect/core/rec

# 戻り値
scoreboard players add $RemainingReflectCount KMRaycast 1
scoreboard players operation $ResultLength KMRaycast = $MaxLength KMRaycast
scoreboard players operation $ResultLength KMRaycast -= $RemainingLength KMRaycast
data remove storage km_raycast: Reflect.Returns
execute store result storage km_raycast: Reflect.Returns.ResultLength double 0.001 run scoreboard players get $ResultLength KMRaycast
execute store result storage km_raycast: Reflect.Returns.LastLength double 0.001 run scoreboard players get $RayLength KMRaycast
execute store result storage km_raycast: Reflect.Returns.RemainingLength double 0.001 run scoreboard players get $RemainingLength KMRaycast
execute store result storage km_raycast: Reflect.Returns.LastCollideAxis int 1 run scoreboard players get $LastCollideAxis KMRaycast
execute store result storage km_raycast: Reflect.Returns.RemainingRelfrctCount int 1 run scoreboard players get $RemainingReflectCount KMRaycast

# 後処理
scoreboard players reset $-1 KMRaycast
scoreboard players reset $1000 KMRaycast
scoreboard players reset $RemainingLength KMRaycast
scoreboard players reset $UnitX KMRaycast
scoreboard players reset $UnitY KMRaycast
scoreboard players reset $UnitZ KMRaycast
scoreboard players reset $DeltaX KMRaycast
scoreboard players reset $DeltaY KMRaycast
scoreboard players reset $DeltaZ KMRaycast
scoreboard players reset $LengthX KMRaycast
scoreboard players reset $LengthY KMRaycast
scoreboard players reset $LengthZ KMRaycast
scoreboard players reset $NowLengthX KMRaycast
scoreboard players reset $NowLengthY KMRaycast
scoreboard players reset $NowLengthZ KMRaycast
scoreboard players reset $TPX KMRaycast
scoreboard players reset $TPY KMRaycast
scoreboard players reset $TPZ KMRaycast
scoreboard players reset $MaxLength KMRaycast
scoreboard players reset $ResultLength KMRaycast
scoreboard players reset $CheckConditions KMRaycast
scoreboard players reset $LastCollideAxis KMRaycast
scoreboard players reset $RayLength KMRaycast
scoreboard players reset $RemainingReflectCount
data remove storage km_raycast: Raycast.Macro