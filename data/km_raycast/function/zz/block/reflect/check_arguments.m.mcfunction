#> km_raycast:zz/block/reflect/check_arguments
# @within function km_raycast:**
#
# マクロを利用した引数のチェック処理

$execute $(Conditions)
$execute if entity @s[distance=$(MaxLength)..1000000]
$execute if entity @s[level=$(MaxReflectCount)]
return 1