#> km_raycast:zz/block/reflect/rec
# @within function km_raycast:reflect

scoreboard players operation $RayLength KMBlockRaycast = $RemainingLength KMBlockRaycast

scoreboard players set $LastCollideAxis KMBlockRaycast -1
execute at @s align xyz run function km_raycast:zz/block/raycast/move/.m with storage km_raycast: BlockRaycast.Macro

scoreboard players operation $RayLength KMBlockRaycast -= $RemainingLength KMBlockRaycast

# 角度反転
execute if score $LastCollideAxis KMBlockRaycast matches 0 at @s positioned 0.0 0.0 0.0 positioned ^ ^ ^-2 positioned 0.0 ~ ~ positioned ^ ^ ^1 facing 0.0 0.0 0.0 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if score $LastCollideAxis KMBlockRaycast matches 1 at @s positioned 0.0 0.0 0.0 positioned ^ ^ ^-2 positioned ~ 0.0 ~ positioned ^ ^ ^1 facing 0.0 0.0 0.0 positioned as @s run tp @s ~ ~ ~ ~ ~
execute if score $LastCollideAxis KMBlockRaycast matches 2 at @s positioned 0.0 0.0 0.0 positioned ^ ^ ^-2 positioned ~ ~ 0.0 positioned ^ ^ ^1 facing 0.0 0.0 0.0 positioned as @s run tp @s ~ ~ ~ ~ ~

execute if score $LastCollideAxis KMBlockRaycast matches 0 run scoreboard players operation $UnitX KMBlockRaycast *= $-1 KMBlockRaycast
execute if score $LastCollideAxis KMBlockRaycast matches 1 run scoreboard players operation $UnitY KMBlockRaycast *= $-1 KMBlockRaycast
execute if score $LastCollideAxis KMBlockRaycast matches 2 run scoreboard players operation $UnitZ KMBlockRaycast *= $-1 KMBlockRaycast

# コールバック実行
execute unless data storage km_raycast: {Reflect:{Arguments:{CallbackFunction:""}}} run function km_raycast:zz/block/reflect/callback.m with storage km_raycast: BlockReflect.Arguments

scoreboard players remove $RemainingReflectCount KMBlockRaycast 1

execute if score $RemainingReflectCount KMBlockRaycast matches 0.. if score $RemainingLength KMBlockRaycast matches 1.. unless score $LastCollideAxis KMBlockRaycast matches -1 at @s run function km_raycast:zz/block/reflect/rec
