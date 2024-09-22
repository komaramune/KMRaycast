#> km_raycast:zz/extra/raycast/
# @within function km_raycast:**

# ブロックレイキャスト処理
data modify storage km_raycast: BlockRaycast.Arguments.MaxLength set from storage km_raycast: ExtraRaycast.Arguments.MaxLength
data modify storage km_raycast: BlockRaycast.Arguments.Conditions set from storage km_raycast: ExtraRaycast.Arguments.Conditions
function km_raycast:block/raycast

# エンティティレイキャスト処理
data modify storage km_raycast: EntityRaycast.Arguments.MaxLength set from storage km_raycast: BlockRaycast.Returns.ResultLength
data modify storage km_raycast: EntityRaycast.Arguments.SelectorArguments set from storage km_raycast: ExtraRaycast.Arguments.SelectorArguments
data modify storage km_raycast: EntityRaycast.Arguments.ThroughMode set from storage km_raycast: ExtraRaycast.Arguments.ThroughMode
data modify storage km_raycast: EntityRaycast.Arguments.CallbackFunction set value "km_raycast:zz/extra/raycast/callback/entity"
function km_raycast:entity/raycast

# 戻り値
data remove storage km_raycast: ExtraRaycast.Returns
data modify storage km_raycast: ExtraRaycast.Returns.ResultLength set from storage km_raycast: EntityRaycast.Returns.ResultLength
data modify storage km_raycast: ExtraRaycast.Returns.RemainingLength set from storage km_raycast: EntityRaycast.Returns.RemainingLength
data modify storage km_raycast: ExtraRaycast.Returns.HitCount set from storage km_raycast: EntityRaycast.Returns.HitCount
data modify storage km_raycast: ExtraRaycast.Returns.LastCollideAxis set from storage km_raycast: BlockRaycast.Returns.LastCollideAxis

# ブロックコールバック実行
execute unless data storage km_raycast: {ExtraRaycast:{Arguments:{BlockCallbackFunction:""}}} at @s run function km_raycast:zz/extra/raycast/callback/block

# 実行者マーカー削除
kill @s