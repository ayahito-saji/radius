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
    # プログラムメモリ
    @returned = false # return スタック
    local_env = {}
    evaluate(@structure, local_env, nil)
    puts " Local Env: #{local_env}"
  end
  def evaluate(tree, local_env, instance_env)
    if tree.nil?
      return
    end
    case tree[0]
      # 式
      when "+"
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {val: objs[0][2][:val]+objs[1][2][:val]}]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :STRING, {val: objs[0][2][:val].to_s+objs[1][2][:val]}]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :STRING, {val: objs[0][2][:val]+objs[1][2][:val].to_s}]
        elsif(objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
             (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
          [:INSTANCE, :STRING, {val: objs[0][2][:val]+objs[1][2][:val]}]
        else
          raise "Can't do + operator"
        end

      when "-"
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {val: objs[0][2][:val]-objs[1][2][:val]}]
        else
          raise "Can't do - operator"
        end

      when "*"
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {val: objs[0][2][:val]*objs[1][2][:val]}]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
              (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :NUMBER, {val: objs[0][2][:val]*objs[1][2][:val]}]
        else
          raise "Can't do * operator"
        end

      when "/"
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][2][:val] != 0
            [:INSTANCE, :NUMBER, {val: objs[0][2][:val]/objs[1][2][:val]}]
          else
            raise "Can't divide by 0"
          end
        else
          raise "Can't do / operator"
        end

      when "%"
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          if objs[1][2][:val] != 0
            [:INSTANCE, :NUMBER, {val: objs[0][2][:val]%objs[1][2][:val]}]
          else
            raise "Can't divide by 0"
          end
        else
          raise "Can't do % operator"
        end

      # 条件式
      when "=="
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, objs[0][2][:val] == objs[1][2][:val]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :STRING) &&
              (objs[1][0] == :INSTANCE && objs[1][1] == :STRING)
            [:INSTANCE, :BOOLEAN, objs[0][2][:val] == objs[1][2][:val]]
        elsif (objs[0][0] == :INSTANCE && objs[0][1] == :BOOLEAN) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :BOOLEAN)
          [:INSTANCE, :BOOLEAN, objs[0][2][:val] == objs[1][2][:val]]
        else
          [:INSTANCE, :BOOLEAN, objs[0] === objs[1]]
        end

      when ">="
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
           (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, objs[0][2][:val] >= objs[1][2][:val]]
        else
          raise "Can't do >= operator"
        end

      when "<="
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, objs[0][2][:val] <= objs[1][2][:val]]
        else
          raise "Can't do <= operator"
        end

      when ">"
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, objs[0][2][:val] > objs[1][2][:val]]
        else
          raise "Can't do > operator"
        end

      when "<"
        objs = [evaluate(tree[1], local_env, instance_env), evaluate(tree[2], local_env, instance_env)]
        if (objs[0][0] == :INSTANCE && objs[0][1] == :NUMBER) &&
            (objs[1][0] == :INSTANCE && objs[1][1] == :NUMBER)
          [:INSTANCE, :BOOLEAN, objs[0][2][:val] < objs[1][2][:val]]
        else
          raise "Can't do < operator"
        end

      # 代入式
      when "="
        if tree[1][1].nil?
          env = local_env
        else
          obj = find_variable(tree[1][1], local_env)
          case obj[0]
            when :CLASS
              env = obj[2]
          end
        end
        env[tree[1][2][1]] = evaluate(tree[2], local_env, instance_env)

      # 構文
      when :LOOP # loop構文
        @broke = false
        while true
          result = evaluate(tree[1], local_env, instance_env)
          if @broke
            @broke = false
            break
          end
          return result if @returned
        end
        nil

      when :IF # if構文
        objs = evaluate(tree[1], local_env, instance_env)
        if !((objs[0] == :INSTANCE && objs[1] == :BOOLEAN && objs[2] == false) ||
             (objs[0] == :NULL)) # falseまたはnullでないときはtrue
          result = evaluate(tree[2], local_env, instance_env)
          return result if @returned
        else
          result = evaluate(tree[3], local_env, instance_env)
          return result if @returned
        end
        nil

      # リテラル
      when :INSTANCE
        tree

      when :FUNCTION # 関数定義
        tree
      when :FUNC_CALL # 関数呼出
        if tree[1]
          obj = find_variable(tree[1], local_env)
          case obj[0]
            when :CLASS
              function = obj[2][tree[2][1]]
          end
        else
          case tree[2][1]
            when :print
              obj -
              puts(evaluate(tree[3][0], local_env, instance_env)[2][:val])
              return
            else
              function = local_env[tree[2][1]]
          end
        end
        func_call(function, tree[3], local_env, instance_env)
      when :BREAK
        @broke = true
        nil
      when :RETURN
        result = evaluate(tree[1], local_env, instance_env)
        @returned = true
        result

      when :VARIABLE # 変数呼び出し
        return find_variable(tree, local_env)
      # 複文
      when :STMTS
        tree[1].each do |stmt|
          result = evaluate(stmt, local_env, instance_env)
          break if @broke
          return result if @returned
        end
        nil

      # クラス定義
      when :CLASS
        class_env = {}
        evaluate(tree[2], class_env, nil)
        [:CLASS, tree[1], class_env]
    end
  end
  def find_variable(tree, env)
    if tree[1]
      obj = find_variable(tree[1], env)
      case obj[0]
        when :CLASS
          new_env = obj[2]
          new_obj = new_env[tree[2][1]]
          return new_obj
      end
    else
      obj = env[tree[2][1]]
      return obj
    end
  end
  def func_call(function, args, local_env, instance_env)
    if function && function[0] == :FUNCTION
      new_local_env = Marshal.load(Marshal.dump(local_env)) # ローカル変数環境を作成
      function[1].length.times do |i|
        new_local_env[function[1][i][1]] = evaluate(args[i], local_env, instance_env)
      end
      result = evaluate(function[2], new_local_env, instance_env)
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