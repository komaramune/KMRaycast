# 二分探査1/64
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.0078125 run return run function km_raycast:zz/entity/raycast/binary_search/7

scoreboard players add $BSLength KMRaycast 4
execute if score $BSLength KMRaycast < $LineLength KMRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.0078125 run return run function km_raycast:zz/entity/raycast/binary_search/7