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
  def run
    # プログラムメモリ
    @objects = {}
    @program_pointer = [["phases", "main", 0]]

  end
end

radius = Radius.new
radius.code = ""
radius.analysis
radius.run