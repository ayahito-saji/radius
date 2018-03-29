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
    @variables = {} # 変数オブジェクトは最初存在しない
    @returned = false # return スタック
    lenv = {}
    genv = {}
    evaluate(@structure, lenv, genv)
    puts " Local Env: #{lenv}"
    puts "Global Env: #{genv}"
  end
  def evaluate(tree, lenv, genv)
    if tree.nil?
      return
    end
    case tree[0]
      # 式
      when "+"
        evaluate(tree[1], lenv, genv) + evaluate(tree[2], lenv, genv)
      when "-"
        evaluate(tree[1], lenv, genv) - evaluate(tree[2], lenv, genv)
      when "*"
        evaluate(tree[1], lenv, genv) * evaluate(tree[2], lenv, genv)
      when "/"
        evaluate(tree[1], lenv, genv) / evaluate(tree[2], lenv, genv)
      when "%"
        evaluate(tree[1], lenv, genv) % evaluate(tree[2], lenv, genv)

      # 条件式
      when "=="
        evaluate(tree[1], lenv, genv) == evaluate(tree[2], lenv, genv)
      when ">="
        evaluate(tree[1], lenv, genv) >= evaluate(tree[2], lenv, genv)
      when "<="
        evaluate(tree[1], lenv, genv) <= evaluate(tree[2], lenv, genv)
      when ">"
        evaluate(tree[1], lenv, genv) > evaluate(tree[2], lenv, genv)
      when "<"
        evaluate(tree[1], lenv, genv) < evaluate(tree[2], lenv, genv)

      # 代入式
      when "="
        lenv[tree[1][1]] = evaluate(tree[2], lenv, genv)
      when "+="
        lenv[tree[1][1]] += evaluate(tree[2], lenv, genv)
      when "-="
        lenv[tree[1][1]] -= evaluate(tree[2], lenv, genv)
      when "*="
        lenv[tree[1][1]] *= evaluate(tree[2], lenv, genv)
      when "/="
        lenv[tree[1][1]] /= evaluate(tree[2], lenv, genv)
      when "%="
        lenv[tree[1][1]] %= evaluate(tree[2], lenv, genv)

      # 構文
      when "LOOP" # loop構文
        @broke = false
        while true
          result = evaluate(tree[1], lenv, genv)
          if @broke
            @broke = false
            break
          end
          return result if @returned
        end
        nil
      when "IF" # if構文
        if evaluate(tree[1], lenv, genv)
          result = evaluate(tree[2], lenv, genv)
          return result if @returned
        else
          result = evaluate(tree[3], lenv, genv)
          return result if @returned
        end
        nil

      # リテラル
      when "NUMBER" # 数字リテラル
        tree[1]
      when "STRING" # 文字列リテラル
        tree[1]
      when "BOOLEAN" # ブール値リテラル
        tree[1] == "true" ? true : false

      when "BREAK"
        @broke = true
        nil
      when "RETURN"
        result = evaluate(tree[1], lenv, genv)
        @returned = true
        result
      when "STMTS" # 複文の処理
        count = 1
        while !tree[count].nil?
          result = evaluate(tree[count], lenv, genv)
          break if @broke
          return result if @returned
          count += 1
        end
        nil
      when "IDENTIFIER" # 変数参照
        lenv[tree[1]]
      when "FUNCTION"
        tree
      when "FUNC_CALL"
        if tree[1][0] == "IDENTIFIER" # 有名関数を実行
          case tree[1][1]
            when "print"
              puts(evaluate(tree[2][0], lenv, genv))
            else
              func_call(lenv[tree[1][1]], tree[2], lenv, genv)
          end
        else # 無名関数を実行
          func_call(tree[1], tree[2], lenv, genv)
        end
    end
  end
  def func_call(function, args, lenv, genv)
    if function && function[0] == "FUNCTION"
      local_env = Marshal.load(Marshal.dump(lenv)) # ローカル変数環境を作成
      params = function[1] # 関数の引数一覧を取得
      i = 0
      while params[i] do
        local_env[params[i][1]] = evaluate(args[i], lenv, genv)
        i += 1
      end
      result = evaluate(function[2], local_env, genv)
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