# 二分探査1/32
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.015625 run return run function km_raycast:zz/entity/raycast/binary_search/6

scoreboard players add $BSLength KMRaycast 8
execute if score $BSLength KMRaycast < $MaxLength KMRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.015625 run return run function km_raycast:zz/entity/raycast/binary_search/6