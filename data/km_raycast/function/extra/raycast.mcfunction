#> km_raycast:extra/raycast
#
# ブロック＆エンティティ統合レイキャスト処理
# @input
#   as entity
#   at position rotation 線の始点と向き
#   storage km_raycast: ExtraRaycast.Arguments.MaxLength: 最大進行距離(m)
#   storage km_raycast: ExtraRaycast.Arguments.Conditions: "unless block"などのサブコマンドの文字列で表される透過しないブロックの条件
#   storage km_raycast: ExtraRaycast.Arguments.SelectorArguments: エンティティを絞り込むセレクタ引数(例:",type=armor_stand,tag=hoge"。最初に","が必要)
#   storage km_raycast: ExtraRaycast.Arguments.EntityCallbackFunction: 検知したエンティティに対して実行するファンクション(空文字列で実行無し)
#   storage km_raycast: ExtraRaycast.Arguments.BlockCallbackFunction: ブロックの衝突位置もしくは最大進行距離位置で実行するファンクション(空文字列で実行無し)
#   storage km_raycast: ExtraRaycast.Arguments.ThroughMode: 線がエンティティを貫通するかどうか。非貫通モードでは最も手前のエンティティが対象になる(一体だけとは限らない)
# @output
#   storage km_raycast: ExtraRaycast.Returns.ResultLength: 前進した距離(m)
#   storage km_raycast: Raycast.Returns.RemainingLength: 衝突した時点で残った進行距離(m)
#   storage km_raycast: ExtraRaycast.Returns.HitCount: ヒットした回数
#   storage km_raycast: ExtraRaycast.Returns.LastCollideAxis: ブロックに衝突した方向(-1:衝突なし, 0:X軸, 1:Y軸, 2:Z軸)
# @api

# 引数チェック
data remove storage km_raycast: ExtraRaycast.SuccessFlag
execute store success storage km_raycast: ExtraRaycast.SuccessFlag byte 1 run function km_raycast:zz/extra/raycast/check_arguments.m with storage km_raycast: ExtraRaycast.Arguments
execute unless data storage km_raycast: {ExtraRaycast:{SuccessFlag:True}} run say 【エラー】レイキャスト関数の引数に渡された値が不正です。
execute unless data storage km_raycast: {ExtraRaycast:{SuccessFlag:True}} run return run data remove storage km_raycast: ExtraRaycast.SuccessFlag

# ブロックレイキャスト＆エンティティレイキャストの引数＆戻り値退避
data remove storage km_raycast: ExtraRaycast.Stash
data modify storage km_raycast: ExtraRaycast.Stash.BlockRaycast set from storage km_raycast: BlockRaycast
data modify storage km_raycast: ExtraRaycast.Stash.EntityRaycast set from storage km_raycast: EntityRaycast

# レイキャスト処理開始
execute summon marker run function km_raycast:zz/extra/raycast/

# 後処理
data remove storage km_raycast: ExtraRaycast.Macro

# ブロックレイキャスト＆エンティティレイキャストの引数＆戻り値復元
data modify storage km_raycast: BlockRaycast set from storage km_raycast: ExtraRaycast.Stash.BlockRaycast
data modify storage km_raycast: EntityRaycast set from storage km_raycast: ExtraRaycast.Stash.EntityRaycast
data remove storage km_raycast: ExtraRaycast.Stash
