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
    @broke = false
    @returned = false
    env = {}
    evaluate(@structure, env, nil)
    puts "Env: #{env}"
  end
  def evaluate(tree, env, instance)
    if tree.nil?
      return
    end
    case tree[0]
      # 式
      when "+"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {}, objs[0][3]+objs[1][3]]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :STRING, {}, objs[0][3].to_s+objs[1][3]]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :STRING, {}, objs[0][3]+objs[1][3].to_s]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :STRING, {}, objs[0][3]+objs[1][3]]
        else
          raise "Can't do + operator"
        end

      when "-"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {}, objs[0][3]-objs[1][3]]
        else
          raise "Can't do - operator"
        end

      when "*"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {}, objs[0][3]*objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
              (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {}, objs[0][3]*objs[1][3]]
        else
          raise "Can't do * operator"
        end

      when "/"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][3] != 0
            [:INSTANCE, :NUMBER, {}, objs[0][3]/objs[1][3]]
          else
            raise "Can't divide by 0"
          end
        else
          raise "Can't do / operator"
        end

      when "%"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][3] != 0
            [:INSTANCE, :NUMBER, {}, objs[0][3]%objs[1][3]]
          else
            raise "Can't divide by 0"
          end
        else
          raise "Can't do % operator"
        end

      # 条件式
      when "=="
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] == objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
              (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
            [:INSTANCE, :BOOLEAN, {}, objs[0][3] == objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] == objs[1][3]]
        else
          [:INSTANCE, :BOOLEAN, {}, objs[0] === objs[1]]
        end

      when "!="
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] != objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] != objs[1][3]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] != objs[1][3]]
        else
          [:INSTANCE, :BOOLEAN, {}, objs[0] != objs[1]]
        end

      when ">="
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] >= objs[1][3]]
        else
          raise "Can't do >= operator"
        end

      when "<="
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] <= objs[1][3]]
        else
          raise "Can't do <= operator"
        end

      when ">"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] > objs[1][3]]
        else
          raise "Can't do > operator"
        end

      when "<"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] < objs[1][3]]
        else
          raise "Can't do < operator"
        end
      when "&&"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] && objs[1][3]]
        else
          raise "Can't do && operator"
        end
      when "||"
        objs = [evaluate(tree[1], env, instance), evaluate(tree[2], env, instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, {}, objs[0][3] || objs[1][3]]
        else
          raise "Can't do || operator"
        end

      # 代入式
      when "="
        if tree[1][1].nil?
          find_env = env
        else
          obj = evaluate(tree[1][1], env, instance)
          case obj[0]
            when :CLASS
              find_env = obj[2]
            when :INSTANCE
              find_env = obj[2]
          end
        end
        find_env[tree[1][2][1]] = evaluate(tree[2], env, instance)

      # 構文
      when :LOOP # loop構文
        @broke = false
        while true
          result = evaluate(tree[1], env, instance)
          if @broke
            @broke = false
            break
          end
          return result if @returned
        end
        nil

      when :IF # if構文
        objs = evaluate(tree[1], env, instance)
        if !((objs[0] == :INSTANCE && objs[1] == :BOOLEAN && objs[3] == false) ||
             (objs[0] == :NULL)) # falseまたはnullでないときはtrue
          result = evaluate(tree[2], env, instance)
          return result if @returned
        else
          result = evaluate(tree[3], env, instance)
          return result if @returned
        end
        nil

      # リテラル
      when :INSTANCE
        tree

      when :FUNCTION # 関数定義
        tree
      when :FUNC_CALL # 関数呼出
        if tree[1] # オブジェクトに付属する関数呼び出し
          obj = evaluate(tree[1], env, instance)
          case obj[0]
            # クラスの関数を呼び出す
            when :CLASS
              if tree[2][1] == :new
                function = obj[2][:init]
                new_instance = [:INSTANCE, obj, {}]
                func_call(function, tree[3], env, new_instance) if function
                return new_instance
              else
                function = obj[2][tree[2][1]]
              end
            # インスタンスの関数を呼び出す
            when :INSTANCE
              case obj[1]
                when :NUMBER
                  puts("this is number")
                when :BOOLEAN
                  puts("this is boolean")
                when :STRING
                  puts("this is string")
                else
                  function = obj[1][2][tree[2][1]]
                  instance = obj
              end
          end
        elsif tree[2][0] == :IDENTIFIER # 関数呼び出し
          case tree[2][1]
            # 組み込み関数の実行
            when :print
              obj = evaluate(tree[3][0], env, instance)
              if obj[0]==:INSTANCE && (obj[1]==:NUMBER || obj[1]==:STRING || obj[1]==:BOOLEAN)
                puts(obj[3])
              else
                p obj
              end
              return
            # 有名関数呼び出し
            else
              function = env[tree[2][1]]
          end
        elsif tree[2][0] == :FUNCTION # 無名関数呼び出し
          function = tree[2]
        end
        func_call(function, tree[3], env, instance)

      when :BREAK
        @broke = true
        nil
      when :RETURN
        result = evaluate(tree[1], env, instance)
        @returned = true
        result

      when :VARIABLE # 変数呼び出し
        if tree[1]
          obj = evaluate(tree[1], env, instance)
          case obj[0]
            when :CLASS
              new_env = obj[2]
              new_obj = new_env[tree[2][1]]
              raise("'#{tree[2][1].to_s}' is undefined class") if new_obj.nil?
              return new_obj
            when :INSTANCE
              new_env = obj[2]
              new_obj = new_env[tree[2][1]]
              raise("'#{tree[2][1].to_s}' is undefined object") if new_obj.nil?
              return new_obj
          end
        else
          obj = env[tree[2][1]]
          raise("'#{tree[2][1].to_s}' is undefined object") if obj.nil?
          return obj
        end
      # 複文
      when :STMTS
        tree[1].each do |stmt|
          result = evaluate(stmt, env, instance)
          break if @broke
          return result if @returned
        end
        nil

      # クラス定義
      when :CLASS
        class_env = {}
        evaluate(tree[2], class_env, nil)
        [:CLASS, tree[1], class_env]
      when :SELF
        return instance
    end
  end
  def func_call(function, args, local_env, instance)
    if function && function[0] == :FUNCTION
      new_local_env = Marshal.load(Marshal.dump(local_env)) # ローカル変数環境を作成
      function[1].length.times do |i|
        new_local_env[function[1][i][1]] = evaluate(args[i], local_env, instance)
      end
      result = evaluate(function[2], new_local_env, instance)
      @returned = false
      result
    else
      raise("undefined function is called")
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