# 二分探査1/8
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.0625 run return run function km_raycast:zz/entity/raycast/binary_search/4

scoreboard players add $BSLength KMEntityRaycast 32
execute if score $BSLength KMEntityRaycast < $MaxLength KMEntityRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.0625 run return run function km_raycast:zz/entity/raycast/binary_search/4