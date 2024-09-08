# 二分探査1/2
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.25 run return run function km_raycast:zz/entity/raycast/binary_search/2

scoreboard players add $BSLength KMRaycast 128
execute if score $BSLength KMRaycast < $LineLength KMRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.25 run return run function km_raycast:zz/entity/raycast/binary_search/2