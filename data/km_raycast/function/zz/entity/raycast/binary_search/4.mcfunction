# 二分探査1/16
execute if function km_raycast:zz/entity/raycast/cube_collider_a positioned ^ ^ ^-0.03125 run return run function km_raycast:zz/entity/raycast/binary_search/5

scoreboard players add $BSLength KMEntityRaycast 16
execute if score $BSLength KMEntityRaycast < $MaxLength KMEntityRaycast if function km_raycast:zz/entity/raycast/cube_collider_b positioned ^ ^ ^0.03125 run return run function km_raycast:zz/entity/raycast/binary_search/5