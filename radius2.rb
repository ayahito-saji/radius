class Radius
  require File.dirname(__FILE__) + '/radius_parser2'
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
          raise "Can't do + operator"
        end

      when "-"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, nil, objs[0][3]-objs[1][3]]
        else
          raise "Can't do - operator"
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
          raise "Can't do * operator"
        end

      when "/"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][3] != 0
            [:INSTANCE, :NUMBER, nil, objs[0][3]/objs[1][3]]
          else
            raise "Can't divide by 0"
          end
        else
          raise "Can't do / operator"
        end

      when "%"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][3] != 0
            [:INSTANCE, :NUMBER, nil, objs[0][3]%objs[1][3]]
          else
            raise "Can't divide by 0"
          end
        else
          raise "Can't do % operator"
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
          raise "Can't do >= operator"
        end

      when "<="
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] <= objs[1][3]]
        else
          raise "Can't do <= operator"
        end

      when ">"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] > objs[1][3]]
        else
          raise "Can't do > operator"
        end

      when "<"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] < objs[1][3]]
        else
          raise "Can't do < operator"
        end
      when "&&"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] && objs[1][3]]
        else
          raise "Can't do && operator"
        end
      when "||"
        objs = [evaluate(tree[1], current_env, current_instance), evaluate(tree[2], current_env, current_instance)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, nil, objs[0][3] || objs[1][3]]
        else
          raise "Can't do || operator"
        end

      # 代入式
      when "="
        if tree[2].nil?
          save_env = current_env
        else
          save_env = evaluate(tree[2], current_env, current_instance)[2]
        end
        val = evaluate(tree[1], current_env, current_instance)
        save_env[tree[3][1]] = [val, tree[4]]
        return val

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

      when :FUNCTION # 関数定義
        tree

      when :BREAK
        @broke = true
        nil

      when :RETURN
        result = evaluate(tree[1], current_env, current_instance)
        @returned = true
        result

      when :SELF
        return current_instance

      when :VARIABLE # 変数にアクセス
        if tree[1] # オブジェクトの環境を調べる
          obj = evaluate(tree[1], current_env, current_instance)
          case obj[0]
            when :CLASS # クラス環境を調べる
              new_env = obj[2]
              new_var = new_env[tree[2][1]]
              raise("'#{tree[2][1].to_s}' is undefined object in class") if new_var.nil?
              new_obj = new_var[0]
              return new_obj
            when :INSTANCE # インスタンス環境を調べる
              new_env = obj[2]
              new_var = new_env[tree[2][1]]
              raise("'#{tree[2][1].to_s}' is undefined object in instant") if new_var.nil?
              new_obj = new_var[0]
              return new_obj
          end
        else # 現在の環境を調べる
          var = current_env[tree[2][1]]
          raise("'#{tree[2][1].to_s}' is undefined object") if var.nil?
          obj = var[0]
          return obj
        end
      when :FUNC_CALL
        function = evaluate(tree[1], current_env, current_instance)
        args = tree[2]
        if function && function[0] == :FUNCTION
          new_env = Marshal.load(Marshal.dump(current_env))
          return func_call(function, args, new_env, current_instance)
        else
          raise("undefined function is called")
        end

      # クラス定義
      when :CLASS
        class_env = {}
        evaluate(tree[2], class_env, nil)
        [:CLASS, tree[1], class_env]
    end
  end
  # 関数を実際に実行する
  def func_call(function, args, env, instance)
    raise "No match args length:needs #{function[2].length}, real #{args.length}" if function[1].length != args.length
    function[1].length.times do |i|
      env[function[2][i][1]] = [evaluate(args[i], env, instance), :PRIVATE]
    end
    result = evaluate(function[1], env, instance)
    @returned = false
    return result
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