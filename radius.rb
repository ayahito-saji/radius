class Radius
  require File.dirname(__FILE__) + '/radius_parser'
  require 'pp'

  attr_accessor(:code)
  def analysis
    parser = RadiusParser.new
    @structure = parser.parse(@code)
    PP.pp(@structure, $>, 1)
  end
  def process
    @null_obj = [:INSTANCE, :NULL, nil]
    @broke = false
    @returned = false
    env = {
        "print"=> [[:FUNCTION, [[:IDENTIFIER, "obj"]], [:BUILD_IN, "puts(env['obj'][0][3]);return @null_obj"]], :PUBLIC, :DYNAMIC, :CONSTANT],
        "input"=> [[:FUNCTION, [], [:BUILD_IN, "return [:INSTANCE, :STRING, nil, gets.chomp]"]], :PUBLIC, :DYNAMIC, :CONSTANT],
        "Object"=> [[:CLASS, nil, {}], :PUBLIC, :DYNAMIC, :CONSTANT]
    }
    p evaluate(@structure, env, nil)
    puts "Env: #{env}"
  end
  def evaluate(tree, current_env, current_instance)
    if tree.nil?
      return
    end
    case tree[0]
      # 複文
      when :STATEMENTS
        result = [:INSTANCE, :NULL, nil]
        tree[1].each do |statement|
          result = evaluate(statement, current_env, current_instance)
          break if @broke
          return result if @returned
        end
        return result

      # 式
      when "+"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, nil, objs[0][3]+objs[1][3]]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :STRING, nil, objs[0][3].to_s+objs[1][3]]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :STRING, nil, objs[0][3]+objs[1][3].to_s]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :STRING, nil, objs[0][3]+objs[1][3]]
        else
          raise "'+'演算子が適用できません"
        end

      when "-"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, nil, objs[0][3]-objs[1][3]]
        else
          raise "'-'演算子が適用できません"
        end

      when "*"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, nil, objs[0][3]*objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
              (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, nil, objs[0][3]*objs[1][3]]
        else
          raise "'*'演算子が使用できません"
        end

      when "/"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][3] != 0
            [:INSTANCE, :NUMBER, nil, objs[0][3]/objs[1][3]]
          else
            raise "0で割れません"
          end
        else
          raise "'/'演算子が使用できません"
        end

      when "%"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][3] != 0
            [:INSTANCE, :NUMBER, nil, objs[0][3]%objs[1][3]]
          else
            raise "0で割った余りを出せません"
          end
        else
          raise "'%'演算子が使用できません"
        end

      # 条件式
      when "=="
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] == objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
              (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
            [:INSTANCE, :BOOLEAN, nil, objs[0][3] == objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] == objs[1][3]]
        else
          [:INSTANCE, :BOOLEAN, nil, objs[0] === objs[1]]
        end

      when "!="
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] != objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] != objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] != objs[1][3]]
        else
          [:INSTANCE, :BOOLEAN, nil, objs[0] != objs[1]]
        end

      when ">="
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] >= objs[1][3]]
        else
          raise "'>='演算子で比較できません"
        end

      when "<="
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] <= objs[1][3]]
        else
          raise "'<='演算子で比較できません"
        end

      when ">"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] > objs[1][3]]
        else
          raise "'>'演算子で比較できません"
        end

      when "<"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] < objs[1][3]]
        else
          raise "'<'演算子で比較できません"
        end
      when "&&"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] && objs[1][3]]
        else
          raise "'&&'演算子が使用できません"
        end
      when "||"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] || objs[1][3]]
        else
          raise "'||'演算子が使用できません"
        end

      # 代入式
      when "="
        # 値
        val = evaluate(tree[5], current_env, current_instance)
        # 変数オプション
        opt = [tree[1], tree[2], tree[3]]
        # 保存領域
        address = tree[4]
        case address[0]
          when :VARIABLE # 普通の変数に代入の場合
            if address[1].nil?
              save_env = current_env
              save_key = address[2][1]
            else
              obj = evaluate(address[1], current_env, current_instance)
              save_key = address[2][1]
              if obj[0] == :CLASS && obj[2]
                save_env = obj[2]
              elsif obj[0] == :INSTANCE && obj[2]
                save_env = obj[2]
              else
                raise "#{obj[0]}に変数またはメソッドを代入できません"
              end
            end
            if save_env[save_key] # すでに存在する場合、オプションは変更しない
              raise "定数#{save_key}の値を変更できません" if save_env[save_key][3] == :CONSTANT
              save_env[save_key][0] = val
              save_env[save_key][1] = opt[0] if opt[0]
              save_env[save_key][2] = opt[1] if opt[1]
              save_env[save_key][3] = opt[2] if opt[2]
            else # まだ存在しない場合、オプションまで設定する
              opt[0] ||= :NOTHING
              opt[1] ||= :DYNAMIC
              opt[2] ||= :VARIABLE
              save_env[save_key] = [val] + opt
            end
          when :INDEX # 配列またはハッシュに代入の場合
            raise "配列またはハッシュの特定の要素のみを#{opt[0]}にすることはできません。" if opt[0]
            raise "配列またはハッシュの特定の要素のみを#{opt[1]}にすることはできません。" if opt[1]
            raise "配列またはハッシュの特定の要素のみを#{opt[2]}にすることはできません。" if opt[2]
            obj = evaluate(address[1], current_env, current_instance)
            index = evaluate(address[2], current_env, current_instance)
            if obj[0] == :INSTANCE && obj[1] == :LIST
              if index[0] == :INSTANCE && index[1] == :NUMBER
                (index[3] - obj[3].length).times do obj[3] << @null_obj end # 要素数より多いインデックスが与えられた場合、その間をnullで埋める
                obj[3][index[3]] = val
              else
                raise "配列のインデックスは数字でなければなりません"
              end
            elsif obj[0] == :INSTANCE && obj[1] == :HASH
              if (index[0] == :INSTANCE && index[1] == :NUMBER) ||
                 (index[0] == :INSTANCE && index[1] == :STRING)
                obj[3][index[3]] = val
              else
                raise "ハッシュのキーは数字または文字列でなければなりません"
              end
            else
              raise "リストまたはハッシュではないオブジェクトです"
            end
        end
        return val

      # 配列またはハッシュ構築子
      when :LIST_NEW
        list = []
        tree[1].each do |obj|
          list << evaluate(obj, current_env, current_instance)
        end
        [:INSTANCE, :LIST, nil, list]
      when :HASH_NEW
        hash = {}
        tree[1].each do |item|
          key = evaluate(item[0], current_env, current_instance)
          value = evaluate(item[1], current_env, current_instance)

          if key[0] == :INSTANCE && key[1] == :STRING
            hash[key[3]] = value
          elsif key[0] == :INSTANCE && key[1] == :NUMBER
              hash[key[3]] = value
          elsif key[0] == :INSTANCE
            raise "#{key[1]}はキーとして登録できません"
          else
            raise "#{key[0]}はキーとして登録できません"
          end
        end
        [:INSTANCE, :HASH, nil, hash]

      # 構文
      when :LOOP # loop構文
        @broke = false
        while true
          result = evaluate(tree[1], current_env, current_instance)
          if @broke
            @broke = false
            break
          end
          return result if @returned
        end
        nil

      when :IF # if構文
        objs = evaluate(tree[1], current_env, current_instance)
        if !((objs[0] == :INSTANCE && objs[1] == :BOOLEAN && objs[3] == false) ||
             (objs[0] == :NULL)) # falseまたはnullでないときはtrue
          result = evaluate(tree[2], current_env, current_instance)
          return result if @returned
        else
          result = evaluate(tree[3], current_env, current_instance)
          return result if @returned
        end
        nil

      when :INSTANCE
        tree

      when :FUNCTION
        tree

      when :BREAK
        @broke = true
        nil

      when :RETURN
        result = evaluate(tree[1], current_env, current_instance)
        @returned = true
        result

      when :SELF
        raise "インスタンス関数ではありません" if current_instance.nil?
        return current_instance

      when :VARIABLE # 変数にアクセス
        var_name = tree[2][1]
        if tree[1]
          # 上位のオブジェクトを調べる
          obj = evaluate(tree[1], current_env, current_instance)
          # objには上位のオブジェクトが入っている（すなわち、クラスメソッドやクラス変数を呼ぶ場合はクラス、インスタンスメソッドやインスタンス変数を呼ぶ場合はインスタンスが入っている）
          case obj[0]
            when :CLASS # クラス環境を調べる
              new_env = obj[2]
              new_var = new_env[var_name]
              raise("'#{tree[2][1]}'は定義されていない変数です") if new_var.nil?
              new_obj = new_var[0] # new_objには、下位のオブジェクトが入っている
              return new_obj
            when :INSTANCE # インスタンス環境を調べる
              new_env = obj[2]
              new_var = new_env[var_name]
              cls = obj[1]
              while new_var.nil?
                break if cls.nil? || cls[0] != :CLASS
                new_env = cls[2]
                new_var = new_env[var_name]
                cls = cls[1]
              end
              raise("'#{tree[2][1]}'は定義されていない変数です") if new_var.nil?
              new_obj = new_var[0]
              new_obj = new_obj + [obj] if new_obj[0] == :FUNCTION # 関数オブジェクトならば、インスタンスまたはクラスをくっつけて返す
              return new_obj
          end
        else # 現在の環境を調べる
          var = current_env[var_name]
          if var
            obj = var[0]
            return obj
          else
            raise("'#{var_name}'は定義されていない変数です")
          end
        end
      when :INDEX
        obj = evaluate(tree[1], current_env, current_instance)
        index = evaluate(tree[2], current_env, current_instance)
        if obj[0] == :INSTANCE && obj[1] == :LIST
          if index[0] == :INSTANCE && index[1] == :NUMBER
            return obj[3][index[3]]
          else
            raise "配列のインデックスは数字でなければなりません"
          end
        elsif obj[0] == :INSTANCE && obj[1] == :HASH
          if (index[0] == :INSTANCE && index[1] == :NUMBER) ||
             (index[0] == :INSTANCE && index[1] == :STRING)
            return obj[3][index[3]]
          else
            raise "ハッシュのキーは数字または文字列でなければなりません"
          end
        else
          raise "リストまたはハッシュではないオブジェクトです"
        end

      when :FUNC_CALL
        # 関数を取得
        function = evaluate(tree[1], current_env, current_instance)
        # インスタンスを取得
        instance = function[3]
        # 引数を取得
        args = tree[2]
        env = Marshal.load(Marshal.dump(current_env))
        if function[1].length == args.length
          args.length.times do |i|
            env[function[1][i][1]] = [evaluate(args[i], env, current_instance), :PRIVATE]
          end
        else
          raise "引数の数があっていません。必要な数:#{function[1].length}、現在の数:#{args.length}"
        end
        p "関数データ #{function[2]}"
        p "変数環境データ #{env}"
        p "インスタンスデータ #{instance}"
        # 関数を実行する
        if function && function[0] == :FUNCTION
          result = evaluate(function[2], env, instance)
          @returned = false
          return result
        else
          raise("定義されていない関数、または関数でないオブジェクトが関数として呼び出されました")
        end

      # クラス定義
      when :CLASS
        class_env = {}
        evaluate(tree[2], class_env, nil)
        [:CLASS, tree[1], class_env]

      when :BUILD_IN
        env = current_env
        return eval(tree[1])

      when :NEW
        cls = evaluate(tree[1], current_env, current_instance)
        args = tree[2]
        raise "クラス以外からインスタンスを生成できません" if cls[0] != :CLASS
        instance = [:INSTANCE, cls, {}]
        function = cls[2]["init"][0] + [cls]
        evaluate([:FUNC_CALL, function, args], current_env, current_instance)
        return instance
    end
  end
  def run
    self.analysis
    self.process
  end
end

if __FILE__ == $0
  # Radiusの動かし方

  # インスタンスを生成して
  radius = Radius.new

  # コードにテキストデータを代入
  File.open("program.rlb", "r") do |f|
    radius.code = f.read.chomp
  end

  # 実行
  radius.run
end