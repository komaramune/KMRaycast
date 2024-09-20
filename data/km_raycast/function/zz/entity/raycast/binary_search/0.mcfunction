# particle crit ~ ~ ~ 0 0 0 0 0 force
# ヒット済みのエンティティを除外
execute if score @s KMEntityRaycast matches 0.. run return fail

# 対角線の長さが1blockとなる直方体判定
scoreboard players operation $BSLength KMEntityRaycast = $SearchLength KMEntityRaycast
execute positioned ~0.5 ~0.5 ~0.5 positioned ^ ^ ^0.5 if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-1 if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.5 run return run function km_raycast:zz/entity/raycast/binary_search/1