#> km_raycast:zz/extra/reflect/callback/reset_score
# @within function km_raycast:**

scoreboard players operation $HitCount KMExtraRaycast = $HitCount KMEntityRaycast
scoreboard objectives remove KMEntityRaycast
scoreboard objectives add KMEntityRaycast dummy
scoreboard players operation $HitCount KMEntityRaycast = $HitCount KMExtraRaycast