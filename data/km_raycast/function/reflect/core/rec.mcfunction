#> km_raycast:reflect/core/rec
# @within function km_raycast:reflect/

scoreboard players operation $RayLength KMRaycast = $RemainingLength KMRaycast

scoreboard players set $LastCollideAxis KMRaycast -1
execute at @s align xyz run function km_raycast:raycast/core/move/.m with storage km_raycast: Raycast.Macro

scoreboard players operation $RayLength KMRaycast -= $RemainingLength KMRaycast

# 角度反転
execute if score $LastCollideAxis KMRaycast matches 0 at @s positioned 0.0 0.0 0.0 positioned ^ ^ ^-2 positioned 0.0 ~ ~ positioned ^ ^ ^1 facing 0.0 0.0 0.0 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if score $LastCollideAxis KMRaycast matches 1 at @s positioned 0.0 0.0 0.0 positioned ^ ^ ^-2 positioned ~ 0.0 ~ positioned ^ ^ ^1 facing 0.0 0.0 0.0 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if score $LastCollideAxis KMRaycast matches 2 at @s positioned 0.0 0.0 0.0 positioned ^ ^ ^-2 positioned ~ ~ 0.0 positioned ^ ^ ^1 facing 0.0 0.0 0.0 positioned as @s run tp @s ~ ~ ~ ~ ~

execute if score $LastCollideAxis KMRaycast matches 0 run scoreboard players operation $UnitX KMRaycast *= $-1 KMRaycast
execute if score $LastCollideAxis KMRaycast matches 1 run scoreboard players operation $UnitY KMRaycast *= $-1 KMRaycast
execute if score $LastCollideAxis KMRaycast matches 2 run scoreboard players operation $UnitZ KMRaycast *= $-1 KMRaycast

# コールバック実行
execute unless data storage km_raycast: {Reflect:{Arguments:{CallbackFunction:""}}} run function km_raycast:reflect/core/callback.m with storage km_raycast: Reflect.Arguments

scoreboard players remove $RemainingReflectCount KMRaycast 1

execute if score $RemainingReflectCount KMRaycast matches 0.. if score $RemainingLength KMRaycast matches 1.. unless score $LastCollideAxis KMRaycast matches -1 at @s run function km_raycast:reflect/core/rec
