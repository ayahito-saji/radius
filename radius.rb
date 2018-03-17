class Radius
  attr_accessor(:code)
  def analysis
    # @code変数にぶち込まれた文字列コードを構造化したものを@structureに入れる
    @structure = {
        classes: {
            MyRobot: {
                constructor: {
                    arguments: [],
                    statements: [
                        [["=", "="], [[:IDENTIFY, "self"], [".", "."], [:IDENTIFY, "name"]], [:IDENTIFY, "taro"]]
                    ]
                }
            }
        },
        phases: {
            main: [
                [["=", "="], [:IDENTIFY, "robot1"], [[".", "."], [:IDENTIFY, "MyRobot"], [:IDENTIFY, "new"]]]
            ]
        }
    }
  end
  def process
    # プログラムメモリ
    @objects = {}
    @program_pointer = [[:phases, :main, 0]]

    pp = @program_pointer[-1]
    case statement[0]
      when "="

    end
  end
  def run
    self.analysis
    self.process
  end
end

# Radiusの動かし方
radius = Radius.new
# radius.code = ""
radius.run