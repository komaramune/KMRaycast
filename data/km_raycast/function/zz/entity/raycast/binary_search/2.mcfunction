# 二分探査1/4
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.125 run return run function km_raycast:zz/entity/raycast/binary_search/3

scoreboard players add $BSLength KMRaycast 64
execute if score $BSLength KMRaycast < $MaxLength KMRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.125 run return run function km_raycast:zz/entity/raycast/binary_search/3