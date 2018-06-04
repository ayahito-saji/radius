class NStackRadius
  attr_accessor :prg
  attr_accessor :members
  require_relative 'n_stack_radius_parser'
  def analysis
    parser = NStackRadiusParser.new
    @operators = parser.parse(@prg)
    pp @operators
  end
  def process
    @phase_environment = {}
    @variable_environment = {}
    @master_stack = []

    @master_operators = @operators
    do_master_operators


  end
  def do_master_operators

    @master_operators.reverse_each do |operator|
      puts "オペレータ #{operator}"
      arguments = @master_stack.pop(operator[2]) # オペレータで使用する変数
      data = operator[1]                        # オペレータで使用する定数
      puts "引数 #{arguments}"
      puts "定数 #{data}"

      case operator[0] # オペレータ種類
        when :identifier
          @master_stack.push(operator)
        when :phase
          # puts "フェイズ名:#{arguments[0][1][0]} フェイズ内容:#{data[0]}"
          @phase_environment[arguments[0][1][0]] = data[0]
          @master_stack.push([:null, nil, 0])
        else
          @master_stack.push([:null, nil, 0])
      end

      puts "スタック #{@master_stack}"
      puts ""
    end
    puts "フェイズデータ"
    pp @phase_environment

  end
  def run
    self.analysis
    self.process
  end
end

if __FILE__ == $0
  radius = NStackRadius.new
  File.open("program.rlb", "r") do |f|
    radius.prg = f.read.chomp
  end
  radius.members = 5
  radius.run
end