class Radius
  require File.dirname(__FILE__) + '/radius_parser'

  attr_accessor(:code)
  def analysis
    # @code変数にぶち込まれた文字列コードを構造化したものを@structureに入れる
    parser = RadiusParser.new
    @structure = parser.parse(@code)
    puts("Tree: #{@structure}")
  end
  def process
    # プログラムメモリ
    @variables = {} # オブジェクトは最初存在しない

    puts(evaluate(@structure))
    puts(@variables)
  end
  def evaluate(tree)
    case tree[0]
      when "+"
        evaluate(tree[1]) + evaluate(tree[2])
      when "-"
        evaluate(tree[1]) - evaluate(tree[2])
      when "*"
        evaluate(tree[1]) * evaluate(tree[2])
      when "/"
        evaluate(tree[1]) / evaluate(tree[2])
      when "NUMBER" # 数字リテラル
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

  p radius.code

  radius.run
end