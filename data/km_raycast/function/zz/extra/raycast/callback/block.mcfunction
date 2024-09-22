#> km_raycast:zz/extra/raycast/callback/block
# @within function km_raycast:**

# 条件を満たさなければスキップ
execute if data storage km_raycast: {ExtraRaycast:{Arguments:{ThroughMode:False}}} unless data storage km_raycast: {EntityRaycast:{Returns:{HitCount:0}}} run return fail

# 戻り値セット
data modify storage km_raycast: ExtraRaycast.Returns.RemainingLength set from storage km_raycast: BlockRaycast.Returns.RemainingLength
data modify storage km_raycast: ExtraRaycast.Returns.ResultLength set from storage km_raycast: BlockRaycast.Returns.ResultLength

# コールバック実行
function km_raycast:zz/extra/raycast/callback/block_macro.m with storage km_raycast: ExtraRaycast.Macro