#> km_raycast:extra/reflect
#
# ブロック反射エンティティレイキャスト処理
# @input
#   as entity
#   storage km_raycast: ExtraReflect.Arguments.MaxLength: 最大進行距離(m)
#   storage km_raycast: ExtraReflect.Arguments.Conditions: unless blockなどのサブコマンドの文字列で表される透過しないブロックの条件
#   storage km_raycast: ExtraReflect.Arguments.MaxReflectCount: 最大反射可能回数
#   storage km_raycast: ExtraReflect.Arguments.EntityCallbackFunction: 検知したエンティティに対して実行するファンクション(空文字列で実行無し)
#   storage km_raycast: ExtraReflect.Arguments.BlockCallbackFunction: ブロック反射時に実行するファンクション(空文字列で実行無し)
#   storage km_raycast: ExtraRaycast.Arguments.ThroughMode: 線がエンティティを貫通するかどうか。非貫通モードでは最も手前のエンティティが対象になる(一体だけとは限らない)
#   storage km_raycast: ExtraReflect.Arguments.MultiHitMode: 一度反射したあと同じエンティティに再度当たるかどうか
# @output
#   storage km_raycast: ExtraReflect.Returns.ResultLength: 前進した合計距離(m)
#   storage km_raycast: ExtraReflect.Returns.LastLength: 最後に前進した距離(m)
#   storage km_raycast: ExtraReflect.Returns.RemainingLength: 残りの進行距離(m)
#   storage km_raycast: ExtraReflect.Returns.LastCollideAxis: 最後に衝突した方向(-1:衝突なし, 0:x, 1:y, 2:z)
#   storage km_raycast: ExtraReflect.Returns.RemainingRelfrctCount: 残りの反射可能回数
#   (コールバック実行時の追加情報)
#   実行位置・向き: 発射時点での位置・向き
#   at entity: 着弾・反射後の位置・向き
# @api

# 実行位置が読み込まれていなかったら失敗
execute unless loaded ~ ~ ~ run return fail

# 引数チェック
# data remove storage km_raycast: ExtraReflect.SuccessFlag
# execute store success storage km_raycast: ExtraReflect.SuccessFlag byte 1 run function km_raycast:zz/extra/reflect/check_arguments.m with storage km_raycast: BlockReflect.Arguments
# execute unless data storage km_raycast: {ExtraReflect:{SuccessFlag:1b}} run say 【エラー】リフレクト関数の引数に渡された値が不正です。
# execute unless data storage km_raycast: {ExtraReflect:{SuccessFlag:1b}} run return run data remove storage km_raycast: ExtraReflect.SuccessFlag
# data remove storage km_raycast: ExtraReflect.SuccessFlag

# 引数コピー
data modify storage km_raycast: ExtraReflect.Macro.BlockCallbackFunction set from storage km_raycast: ExtraReflect.Arguments.BlockCallbackFunction
data modify storage km_raycast: ExtraReflect.Macro.EntityCallbackFunction set from storage km_raycast: ExtraReflect.Arguments.EntityCallbackFunction

# オブジェクティブ成作
scoreboard objectives add KMExtraRaycast dummy

# ブロックレイキャスト＆エンティティレイキャストの引数＆戻り値退避
data remove storage km_raycast: ExtraReflect.Stash
data modify storage km_raycast: ExtraReflect.Stash.BlockRaycast set from storage km_raycast: BlockReflect
data modify storage km_raycast: ExtraReflect.Stash.EntityRaycast set from storage km_raycast: EntityRaycast

# リフレクト用一時エンティティ召喚
summon marker ~ ~ ~ {UUID:[I; -1862051953, -451589854, -1626813347, 339892133]}
tp 9103578f-e515-4922-9f08-cc5d144257a5 ~ ~ ~ ~ ~

# 戻り値リセット
data remove storage km_raycast: ExtraReflect.Returns

# レイキャスト処理開始
execute as 9103578f-e515-4922-9f08-cc5d144257a5 run function km_raycast:zz/extra/reflect/

# 後処理
data remove storage km_raycast: ExtraReflect.Macro
scoreboard objectives remove KMExtraRaycast

# ブロックレイキャスト＆エンティティレイキャストの引数＆戻り値復元
data modify storage km_raycast: BlockReflect set from storage km_raycast: ExtraReflect.Stash.BlockReflect
data modify storage km_raycast: EntityRaycast set from storage km_raycast: ExtraReflect.Stash.EntityRaycast
data remove storage km_raycast: ExtraReflect.Stash