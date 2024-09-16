# 二分探査1/128
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.00390625 run return run function km_raycast:zz/entity/raycast/binary_search/8

scoreboard players add $BSLength KMRaycast 2
execute if score $BSLength KMRaycast < $MaxLength KMRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.00390625 run return run function km_raycast:zz/entity/raycast/binary_search/8