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
      when "IF"
        if evaluate(tree[1])
          evaluate(tree[2])
        else
          evaluate(tree[3])
        end
      when "NUMBER" # 数字リテラル
        tree[1]
      when "STRING"
        tree[1]
      when "STMTS" # 複文の処理
        count = 1
        last = nil
        while !tree[count].nil?
          last = evaluate(tree[count])
          count += 1
        end
        last
      when "VAR_ASSIGN"
        @variables[tree[1][1]] = evaluate(tree[2])
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