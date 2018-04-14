# RADIUS

## 言語仕様

RADIUSは、次の要素で構成されています
* コメント
* 変数
* オブジェクト
* 算術演算子
* 条件分岐文
* 繰り返し文

### コメント
コメントはプログラムに影響を与えません。
コメントは次のいずれかで定義します。
```
#コメント
//コメント
```

### 変数
オブジェクトを代入できる領域です。
変数に型は存在しません。
変数に次のいずれかのように代入します。
変数名に小文字が含まれていない場合、後述する定数修飾子を付けることと等価になります。
```
変数名 = オブジェクト
変数名 <- オブジェクト
```
変数は次のように呼び出します。
```
変数名
```
代入する際に、次のオプションを0以上だけ付けることができます。
* 定数修飾子
* 静的修飾子
* アクセス修飾子
#### 定数(constant)修飾子
定数修飾子を付けると、定数扱いとなり、以後この変数に代入しようとするとエラーが発生します。
次のように修飾します。
```
const 変数 = オブジェクト
```

#### 静的(static)修飾子
クラス内で定義された変数のみに影響します。
静的修飾子が付与された変数は、クラス変数扱いになります。
クラス名.変数でアクセスできるようになりますが、インスタンス名.変数でエラーが発生します。
次のように修飾します。
```
static 変数 = オブジェクト
```

#### アクセス修飾子
クラス内で定義された変数のみに影響します。
##### public
全ての外部クラスから代入、参照可能になります。
```
public 変数 = オブジェクト
```

##### private
クラス内でのみ代入、参照が可能になります。
外部からインスタンス名(またはクラス名).変数名で代入、参照しようとするとエラーが発生します。
```
private 変数 = オブジェクト
```

### オブジェクト

オブジェクトは次の特徴をもちます。
* 算術演算子の演算対象である
* 変数として保存される
オブジェクト(親)内のオブジェクト(子)は次のようにして参照、代入できます。
```
オブジェクト(親).オブジェクト(子)
```

#### オブジェクトの種類
オブジェクトは次の種類があります。
* クラス
* インスタンス
* 関数

#### クラス
クラスとは設計図によく例えられます。クラスはインスタンス(製品)の特徴・機能を定義します。
クラスオブジェクトは次のように定義し、0以上のオブジェクトをまとめて保持します。
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
クラスはオブジェクトなので、次のように代入演算子(=)で変数に代入します。

```
クラス名 = class(継承元クラス名){
    変数代入文
}
```

#### インスタンス
インスタンスは次のようにnew演算子を使用することでクラスから生成できます。
インスタンス生成時に、クラスのinit関数が自動的に呼ばれ、実引数が渡されます。
インスタンスは、生成したクラスのオブジェクトをすべて持ちます。
インスタンス固有のオブジェクトを保存することもできます。

```
new クラス名(実引数)
```
インスタンスはオブジェクトなので、次のように代入演算子(=)で変数に代入します。
```
インスタンス名 = new クラス名(引数)
```

#### 関数
##### 関数定義
関数は次のように定義します。
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

関数はオブジェクトなので、次のように代入演算子(=)で変数に代入します。
```
関数名 = function(仮引数){
    命令文
}
```
##### 関数実行
関数は次のように実行します。
```
関数名(実引数)
```
実行するタイミングは()を付けた時です。
次のように()を付けないと、あくまで関数というオブジェクトを参照しただけなので、実行しません。
```
# 関数を定義
func = function(){
    #命令
}
# 関数を参照(実行されません。not_resには関数オブジェクト(func)が入る)
not_res = func
# 関数を実行(resには関数の返り値が入る)
res = func()
```

宣言と同時に実行も可能なので、
```
function(仮引数){
    命令文
}(実引数)
```
として無名関数として実行可能です。

#### 特殊インスタンス
特殊インスタンスは、インスタンス固有のオブジェクトを持ちません。


##### 数字(number)

数字を表すオブジェクトです。次のように半角数字で宣言します。
最初から定義されているNumberクラスのインスタンスです。
```
1
24.75
```

##### 文字列(string)

文字列を表すオブジェクトです。次のように"で囲って宣言します。
最初から定義されているStringクラスのインスタンスです。
```
"Sample String"
```

##### 真偽値(boolean)

true(真)とfalse(偽)の2種類の値をとるオブジェクトです。次のように宣言します。
最初から定義されているBooleanクラスのインスタンスです。
```
true
false
```

##### リスト(list)

0以上のオブジェクトをリスト化して保持するオブジェクトです。次のように定義します。
最初から定義されているListクラスのインスタンスです。
```
sample_list = [1, "Hello", true]
```

個々の要素は次のように定義します。(0オリジンで番号が振られています)
```
sample_list[0] = 1

n = 2
sample_list[n] = "Hello"
```

個々の要素は次のように参照します。(0オリジンで番号が振られています)
```
sample_list[0]
```


##### ハッシュ、連想配列、辞書型(hash)

0以上のオブジェクトを数値または文字列と対応付けして保持するオブジェクトです。次のように定義します。
最初から定義されているHashクラスのインスタンスです。
```
sample_hash = {"Hello": "String", 1:"Number"}
```

個々の要素は次のように定義します。
```
sample_hash["Hello"] = "String"
sample_hash[1] = "Number"

s = "Hello"
sample_hash[s] = "String"
```

個々の要素は次のように参照します。

```
sample_hash["Hello"]
sample_hash[1]
```

### 算術演算子
算術演算子は次の順序で優先されます。

| 演算子 |
|:-----------|
| ( ) |
| . |
| ! |
| * / % |
| + - |
| == != <> > >= < <= |
| \&\& \|\| |
| = += -= *= /= %=|

### 条件分岐文
条件文は次のように定義します。{}は省略できません。
else if～とelse～は省略可能です。
```
if(条件式1){
    # 条件式1がtrueならば実行される命令
}else if(条件式2){
    # 条件式1がfalseかつ条件式2がtrueならば実行される命令
}else{
    # それ以外ならば実行される命令
}
```
else ifについて、次のように記述することもできます。
```
elsif(条件式2){}
elif(条件式2){}
```
いずれの場合でも、else ifと等価です。
### 繰り返し文
#### loop文
一番シンプルな繰り返し文です。命令を無限ループします。
途中で抜ける場合には、break文を使用します。
```
loop{
    # 繰り返す命令
}
```