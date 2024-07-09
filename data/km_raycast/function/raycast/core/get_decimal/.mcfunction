#> km_raycast:raycast/core/get_decimal/
# @within function km_raycast:**

execute positioned 0.0005 0.0005 0.0005 run tp @s ^ ^ ^1

data modify storage km_raycast: Raycast.Pos set from entity @s Pos
execute store result score $UnitX KMRaycast run data get storage km_raycast: Raycast.Pos[0] 1000
execute store result score $UnitY KMRaycast run data get storage km_raycast: Raycast.Pos[1] 1000
execute store result score $UnitZ KMRaycast run data get storage km_raycast: Raycast.Pos[2] 1000

scoreboard players set $LengthX KMRaycast 1000000
scoreboard players set $LengthY KMRaycast 1000000
scoreboard players set $LengthZ KMRaycast 1000000
execute if score $UnitX KMRaycast matches ..-1 run scoreboard players operation $LengthX KMRaycast *= $-1 KMRaycast
execute if score $UnitY KMRaycast matches ..-1 run scoreboard players operation $LengthY KMRaycast *= $-1 KMRaycast
execute if score $UnitZ KMRaycast matches ..-1 run scoreboard players operation $LengthZ KMRaycast *= $-1 KMRaycast
execute unless score $UnitX KMRaycast matches 0 run scoreboard players operation $LengthX KMRaycast /= $UnitX KMRaycast
execute unless score $UnitY KMRaycast matches 0 run scoreboard players operation $LengthY KMRaycast /= $UnitY KMRaycast
execute unless score $UnitZ KMRaycast matches 0 run scoreboard players operation $LengthZ KMRaycast /= $UnitZ KMRaycast


tp @s ~0.0005 ~0.0005 ~0.0005

data modify storage km_raycast: Raycast.Pos set from entity @s Pos
execute store result storage km_raycast: Raycast.Macro.int_x int 1 run data get storage km_raycast: Raycast.Pos[0] -1
execute store result storage km_raycast: Raycast.Macro.int_y int 1 run data get storage km_raycast: Raycast.Pos[1] -1
execute store result storage km_raycast: Raycast.Macro.int_z int 1 run data get storage km_raycast: Raycast.Pos[2] -1

function km_raycast:raycast/core/get_decimal/_.m with storage km_raycast: Raycast.Macro

data modify storage km_raycast: Raycast.Pos set from entity @s Pos
execute store result score $DeltaX KMRaycast run data get storage km_raycast: Raycast.Pos[0] -1000
execute store result score $DeltaY KMRaycast run data get storage km_raycast: Raycast.Pos[1] -1000
execute store result score $DeltaZ KMRaycast run data get storage km_raycast: Raycast.Pos[2] -1000

execute if score $UnitX KMRaycast matches ..-1 run scoreboard players remove $DeltaX KMRaycast 1000
execute if score $UnitY KMRaycast matches ..-1 run scoreboard players remove $DeltaY KMRaycast 1000
execute if score $UnitZ KMRaycast matches ..-1 run scoreboard players remove $DeltaZ KMRaycast 1000
execute if score $UnitX KMRaycast matches ..-1 run scoreboard players operation $DeltaX KMRaycast *= $-1 KMRaycast
execute if score $UnitY KMRaycast matches ..-1 run scoreboard players operation $DeltaY KMRaycast *= $-1 KMRaycast
execute if score $UnitZ KMRaycast matches ..-1 run scoreboard players operation $DeltaZ KMRaycast *= $-1 KMRaycast


scoreboard players operation $NowLengthX KMRaycast = $LengthX KMRaycast
scoreboard players operation $NowLengthY KMRaycast = $LengthY KMRaycast
scoreboard players operation $NowLengthZ KMRaycast = $LengthZ KMRaycast
scoreboard players operation $NowLengthX KMRaycast *= $DeltaX KMRaycast
scoreboard players operation $NowLengthY KMRaycast *= $DeltaY KMRaycast
scoreboard players operation $NowLengthZ KMRaycast *= $DeltaZ KMRaycast
scoreboard players operation $NowLengthX KMRaycast /= $1000 KMRaycast
scoreboard players operation $NowLengthY KMRaycast /= $1000 KMRaycast
scoreboard players operation $NowLengthZ KMRaycast /= $1000 KMRaycast

data remove storage km_raycast: Raycast.Pos
kill @s
