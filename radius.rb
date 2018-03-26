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

    puts ">> #{evaluate(@structure)}"
    puts @variables
  end
  def evaluate(tree)
    if tree.nil?
      return
    end
    case tree[0]
      when "+"
        evaluate(tree[1]) + evaluate(tree[2])
      when "-"
        evaluate(tree[1]) - evaluate(tree[2])
      when "*"
        evaluate(tree[1]) * evaluate(tree[2])
      when "/"
        evaluate(tree[1]) / evaluate(tree[2])

      when "=="
        evaluate(tree[1]) == evaluate(tree[2])
      when ">="
        evaluate(tree[1]) >= evaluate(tree[2])
      when "<="
        evaluate(tree[1]) <= evaluate(tree[2])
      when ">"
        evaluate(tree[1]) > evaluate(tree[2])
      when "<"
        evaluate(tree[1]) < evaluate(tree[2])

      when "="
        @variables[tree[1][1]] = evaluate(tree[2])
      when "+="
        @variables[tree[1][1]] += evaluate(tree[2])
      when "-="
        @variables[tree[1][1]] -= evaluate(tree[2])
      when "*="
        @variables[tree[1][1]] *= evaluate(tree[2])
      when "/="
        @variables[tree[1][1]] /= evaluate(tree[2])

      when "LOOP"
        @broke = false
        while true
          evaluate(tree[1])
          if @broke
            @broke = false
            break
          end
        end
      when "IF" # if構文
        if evaluate(tree[1])
          evaluate(tree[2])
        else
          evaluate(tree[3])
        end
      when "NUMBER" # 数字リテラル
        tree[1]
      when "STRING" # 文字列リテラル
        tree[1]
      when "BREAK"
        @broke = true
        nil
      when "STMTS" # 複文の処理
        count = 1
        last = nil
        while !tree[count].nil?
          last = evaluate(tree[count])
          break if @broke
          count += 1
        end
        last
      when "IDENTIFIER"
        @variables[tree[1]]
    end
  end
  def run
    self.analysis
    self.process
  end
end

if __FILE__ == $0
  # Radiusの動かし方
  radius = Radius.new
  File.open("program.rlb", "r") do |f|
    radius.code = f.read.chomp
  end

  puts radius.code

  radius.run
end