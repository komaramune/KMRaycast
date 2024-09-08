# 1blockずつ再帰実行
execute if score $SearchLength KMRaycast >= $LineLength KMRaycast run return 1

execute positioned ^ ^ ^0.5 positioned ~-0.5 ~-0.5 ~-0.5 run function km_raycast:zz/entity/raycast/selector.m with storage km_raycast: EntityRaycast.Macro

scoreboard players add $SearchLength KMRaycast 256
execute positioned ^ ^ ^1 run function km_raycast:zz/entity/raycast/rec