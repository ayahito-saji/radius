class Radius

  @obj_class = [:class, nil, {}]
  # 木構造を逆ポーランド記法に変換する処理
  # 入力: 木構造
  # 出力: 逆ポーランド配列([TYPE, 子ノード数, 定数値])
  def tree2revpol(tree)
    stack = [tree]
    operations = []

    while stack.length > 0
      node = stack.pop()
      case node[0]
        when :statements
          # statementsノード
          # 入力: [:statements, [文, ..., 文]]
          # 出力: [:statements, 文の個数]
          node[1].each {|statement| stack.push(statement)}
          operations.push([:statements, node[1].length])

        when :set_var
          # set_varノード
          # 入力: [:set_var, 親オブジェクト, 保存キー, オブジェクト, [アクセス修飾子, 静的修飾子, 定数修飾子]]
          # 出力: [:set_var, 3, [アクセス修飾子, 静的修飾子, 定数修飾子]]
          stack.push(node[1])  # 保存環境
          stack.push(node[2])  # 保存キー
          stack.push(node[3])  # オブジェクト
          operations.push([:set_var, 3])

        when :get_var
          # get_varノード
          # 入力: [:get_var, 親オブジェクト, 保存キー]
          # 出力: [:get_var, 2]
          stack.push(node[1])  # 保存環境
          stack.push(node[2])  # 保存キー
          operations.push([:get_var, 2])

        when :call_function
          # call_functionノード
          # 入力: [:call_function, 引数(arguments)群, 実行内容]
          # 出力: [:call_function, 2]
          stack.push(node[1])  # 引数群
          stack.push(node[2])  # 実行内容
          operations.push([:call_function, 2])

        when :parameters
          # parametersノード
          # 入力: [:parameters, [式, ..., 式]]
          # 出力: [:parameters, 式の個数]
          node[1].each {|parameter| stack.push(parameter)}
          operations.push([:parameters, node[1].length])

        when :return
          # returnノード
          # 入力: [:return, 式]
          # 出力: [:return, 1]
          stack.push(node[1])  # 返り値
          operations.push([:return, 1])

        when :identifier
          # identifierノード
          # 入力: [:identifier, 識別子]
          # 出力: [:identifier, 0, [:identifier, 識別子]]
          operations.push([:identifier, 0, node[1]])

        when :null
          # nullノード
          # 入力: [:null]
          # 出力: [:null, 0]
          operations.push([:null, 0])

        when :function
          # functionノード
          # 入力: [:function, [識別子, ..., 識別子], 複文]
          # 出力: [:function, 0, 仮引数群, 複文のoperations]
          operations.push([:function, 0, node[1], node[2]])
        when :class
          # classノード
          # 入力: [:class, 継承元クラス, 複文]
          # 出力: [:class, 2]
          stack.push(node[1])  # 継承元クラス
          operations.push([:class, 1, node[2]])
      end
      puts "ノード　　: #{node[0]}"
      puts "スタック　: #{stack.map{|item| item[0]}}"
      puts "オペレータ: #{operations.map{|item| [item[0], item[1]]}}"
      puts
    end
    return operations
  end

  # オペレーションを実行していく
  def run(operations)
    results = []
    env = {}

    while operations.length > 0
      # 結果を受け取って、オペレーションを実行していく
      operation = operations.pop
      buffers = results.pop(operation[1])

      case operation[0]
        when :null
          # 入力オペレータ: [:null, 0]
          # 出力リザルト  : [:instance, :null_class, nil, nil]
          results.push([:instance, :null_class, nil, nil])

        when :identifier
          # 入力オペレータ: [:identifier, 0, 識別子]
          # 出力リザルト  : [:identifier, 識別子]
          results.push([:identifier, operation[2]])

        when :set_var
          # 入力オペレータ: [:set_var, 3]
          # 出力リザルト　: [:instance, :null_class, nil, nil]
          parent = buffers[0]
          key = buffers[1]
          value = buffers[2]
          env[key[1]] = value
          results.push([:instance, :null_class, nil, nil])

        when :get_var
          # 入力オペレータ: [:set_var, 2]
          # 出力リザルト　: 変数データ
          parent = buffers[0]
          key = buffers[1]
          results.push(env[key[1]])

        when :statements
          # 入力オペレータ: [:set_var, 2]
          # 出力リザルト　: nullオブジェクト
          results.push([:instance, :null_class, nil, nil])

        when :class
          # classノード
          # 入力: [:class, 1]
          # 出力: [:class, 継承元, 文]
          results.push([:class, buffers[0], {}])
      end

      puts "オペレータ: #{operation}"
      puts "バッファ　: #{buffers.map{|item| item[0]}}}"
      puts "スタック　: #{results.map{|item| item[0]}}}"
      puts "メモリー　: #{env}"
      puts
    end
    p results[0]
  end
end


tree = [:statements, [
    [:set_var, [:null], [:identifier, "a"],
        [:class, [:null], [:statements, []]]
    ],
    [:get_var, [:null], [:identifier, "a"]]
]]

radius = Radius.new

operations = radius.tree2revpol(tree)
radius.run(operations)