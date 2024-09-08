# 二分探査1/256
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.001953125 run return run function km_raycast:zz/entity/raycast/binary_search/hit

scoreboard players add $BSLength KMRaycast 1
execute if score $BSLength KMRaycast < $LineLength KMRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.001953125 run return run function km_raycast:zz/entity/raycast/binary_search/hit