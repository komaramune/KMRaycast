# KMRaycast
Minecraft JEのコマンドでレイキャスト処理を行うライブラリデータパックです。

## 対応バージョン
Minecraft Java Edition 1.21~

## km_raycast:block/raycast
### 機能
実行位置・向きから進んでブロックに衝突する位置に実行エンティティを移動させます。

### 使用例
```
# 引数設定
data modify storage km_raycast: BlockRaycast.Arguments set value {MaxLength:10d, Conditions:"unless block ~ ~ ~ air"}

# 関数実行
function km_raycast:block/raycast

# 戻り値取得
data get storage km_raycast: BlockRaycast.Returns
# -> ストレージ変数km_raycast:は以下の内容を持っています：{LastCollideAxis: 2, ResultLength: 6.227d, RemainingLength: 3.773d}
```

## km_raycast:block/reflect
### 機能
ブロック衝突面で反射して複数回レイキャストします。
衝突位置で指定されたファンクションを実行させることもできます。

### 使用例
```
# 引数設定
data modify storage km_raycast: BlockReflect.Arguments set value {MaxLength:100d,Conditions:"unless block ~ ~ ~ air",MaxReflectCount:10,CallbackFunction:"hoge:fuga"}

# 関数実行
function km_raycast:block/reflect

# 戻り値取得
data get storage km_raycast: BlockReflect.Returns
# -> ストレージ変数km_raycast:は以下の内容を持っています：{LastCollideAxis: 0, RemainingRelfrctCount: 0, LastLength: 9.328d, ResultLength: 62.083d, RemainingLength: 37.917d}
```

## 連絡先
不具合や要望などがあればTwitterまでご連絡ください
https://twitter.com/komaramune