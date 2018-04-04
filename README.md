# RADIUS

## 言語仕様

RADIUSは、次の要素で構成されています
* オブジェクト

### オブジェクト

#### オブジェクトの機能
オブジェクトは次の機能をもちます
* 式の項となる
* 変数として保存する

#### オブジェクトの種類
オブジェクトは次の種類があります
* クラス
* インスタンス
* 関数

##### クラス
###### クラス宣言
クラスは0以上の関数と、変数をひとまとめにしたものです。
クラスは次のように宣言します。
```
class(継承元クラス名){
    変数代入文
}
```
継承元クラス名が存在しないときのみ特別に次のようにも宣言可能です
```
class{
    変数代入文
}
```
クラスはオブジェクトなので、次のように代入演算子(=)で変数に代入することができます。

```
クラス名 = class(継承元){
    変数代入文
}
```

##### インスタンス
###### インスタンス生成
インスタンスは次のようにクラスのnew関数を呼ぶことで生成できます。
```
クラス名.new(実引数)
```
インスタンスはオブジェクトなので、次のように代入演算子(=)で変数に代入することができます。

```
インスタンス名 = クラス名.new(引数)
```
インスタンス生成時に、クラスのinit関数が自動的に呼ばれ、実引数が渡されます。

###### インスタンス

##### 関数
###### 関数宣言
関数は次のように宣言します。
仮引数で任意の式を渡せます。
```
function(仮引数){
    命令文
}
```
仮引数の個数が0のときのみ特別に次のようにも宣言可能です
```
function{
    命令文
}
```

関数はオブジェクトなので、次のように代入演算子(=)で変数に代入することができます。
```
関数名 = function(仮引数){
    命令文
}
```
###### 関数呼び出し
関数は次のように呼び出します。
```
関数名(実引数)
```
で呼び出します。オブジェクトの関数（メソッド）は、次のように呼び出します。
```
オブジェクト名.関数名(引数)
```

宣言と同時に実行も可能なので、
```
function(仮引数){
    命令文
}(実引数)
```
として無名関数/メソッドとして実行可能です。

##### リテラル
次のリテラルがあります

* 数字(number)

数字を表すリテラルオブジェクトです。次のように半角数字で宣言します。
```
1
```
```
24.75
```
* 文字列(string)

文字列を表すリテラルオブジェクトです。次のように"で囲って宣言します。
```
"Sample String"
```

* 真偽値(boolean)

true(真)とfalse(偽)の2種類の値をとるリテラルオブジェクトです。次のように宣言します
```
true
```
```
false
```
