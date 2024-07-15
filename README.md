# KMRaycast
Minecraft JEのコマンドでレイキャスト処理を行うライブラリデータパックです。

# 機能
実行位置・向きから進んでブロックに衝突する位置に実行エンティティを移動させます。

# 対応バージョン
Minecraft Java Edition 1.21~

# 使用例
```
# 引数設定
data modify storage km_raycast: Raycast.Arguments set value {MaxLength:10000, Conditions:"unless block ~ ~ ~ air"}

# 関数実行
function km_raycast:raycast/

# 戻り値取得
data get storage km_raycast: Raycast.Returns
# -> ストレージ変数km_raycast:は以下の内容を持っています：{LastCollideAxis: 2, ResultLength: 6.227d, RemainingLength: 3.773d}
```

# 連絡先
不具合や要望などがあればTwitterまでご連絡ください
https://twitter.com/komaramune
