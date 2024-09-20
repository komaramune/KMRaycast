#> km_raycast:zz/block/raycast/get_decimal/
# @within function km_raycast:**

execute positioned 0.0005 0.0005 0.0005 run tp @s ^ ^ ^1

data modify storage km_raycast: BlockRaycast.Pos set from entity @s Pos
execute store result score $UnitX KMBlockRaycast run data get storage km_raycast: BlockRaycast.Pos[0] 1000
execute store result score $UnitY KMBlockRaycast run data get storage km_raycast: BlockRaycast.Pos[1] 1000
execute store result score $UnitZ KMBlockRaycast run data get storage km_raycast: BlockRaycast.Pos[2] 1000

scoreboard players set $LengthX KMBlockRaycast 1000000
scoreboard players set $LengthY KMBlockRaycast 1000000
scoreboard players set $LengthZ KMBlockRaycast 1000000
execute if score $UnitX KMBlockRaycast matches ..-1 run scoreboard players operation $LengthX KMBlockRaycast *= $-1 KMBlockRaycast
execute if score $UnitY KMBlockRaycast matches ..-1 run scoreboard players operation $LengthY KMBlockRaycast *= $-1 KMBlockRaycast
execute if score $UnitZ KMBlockRaycast matches ..-1 run scoreboard players operation $LengthZ KMBlockRaycast *= $-1 KMBlockRaycast
execute unless score $UnitX KMBlockRaycast matches 0 run scoreboard players operation $LengthX KMBlockRaycast /= $UnitX KMBlockRaycast
execute unless score $UnitY KMBlockRaycast matches 0 run scoreboard players operation $LengthY KMBlockRaycast /= $UnitY KMBlockRaycast
execute unless score $UnitZ KMBlockRaycast matches 0 run scoreboard players operation $LengthZ KMBlockRaycast /= $UnitZ KMBlockRaycast


tp @s ~0.0005 ~0.0005 ~0.0005

data modify storage km_raycast: BlockRaycast.Pos set from entity @s Pos
execute store result storage km_raycast: BlockRaycast.Macro.int_x int 1 run data get storage km_raycast: BlockRaycast.Pos[0] -1
execute store result storage km_raycast: BlockRaycast.Macro.int_y int 1 run data get storage km_raycast: BlockRaycast.Pos[1] -1
execute store result storage km_raycast: BlockRaycast.Macro.int_z int 1 run data get storage km_raycast: BlockRaycast.Pos[2] -1

function km_raycast:zz/block/raycast/get_decimal/_.m with storage km_raycast: BlockRaycast.Macro

data modify storage km_raycast: BlockRaycast.Pos set from entity @s Pos
execute store result score $DeltaX KMBlockRaycast run data get storage km_raycast: BlockRaycast.Pos[0] -1000
execute store result score $DeltaY KMBlockRaycast run data get storage km_raycast: BlockRaycast.Pos[1] -1000
execute store result score $DeltaZ KMBlockRaycast run data get storage km_raycast: BlockRaycast.Pos[2] -1000

execute if score $UnitX KMBlockRaycast matches ..-1 run scoreboard players remove $DeltaX KMBlockRaycast 1000
execute if score $UnitY KMBlockRaycast matches ..-1 run scoreboard players remove $DeltaY KMBlockRaycast 1000
execute if score $UnitZ KMBlockRaycast matches ..-1 run scoreboard players remove $DeltaZ KMBlockRaycast 1000
execute if score $UnitX KMBlockRaycast matches ..-1 run scoreboard players operation $DeltaX KMBlockRaycast *= $-1 KMBlockRaycast
execute if score $UnitY KMBlockRaycast matches ..-1 run scoreboard players operation $DeltaY KMBlockRaycast *= $-1 KMBlockRaycast
execute if score $UnitZ KMBlockRaycast matches ..-1 run scoreboard players operation $DeltaZ KMBlockRaycast *= $-1 KMBlockRaycast


scoreboard players operation $NowLengthX KMBlockRaycast = $LengthX KMBlockRaycast
scoreboard players operation $NowLengthY KMBlockRaycast = $LengthY KMBlockRaycast
scoreboard players operation $NowLengthZ KMBlockRaycast = $LengthZ KMBlockRaycast
scoreboard players operation $NowLengthX KMBlockRaycast *= $DeltaX KMBlockRaycast
scoreboard players operation $NowLengthY KMBlockRaycast *= $DeltaY KMBlockRaycast
scoreboard players operation $NowLengthZ KMBlockRaycast *= $DeltaZ KMBlockRaycast
scoreboard players operation $NowLengthX KMBlockRaycast /= $1000 KMBlockRaycast
scoreboard players operation $NowLengthY KMBlockRaycast /= $1000 KMBlockRaycast
scoreboard players operation $NowLengthZ KMBlockRaycast /= $1000 KMBlockRaycast

data remove storage km_raycast: BlockRaycast.Pos
kill @s
