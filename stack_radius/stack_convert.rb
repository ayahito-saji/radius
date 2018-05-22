require 'pp'

tree = [:statements, [[:set_var, [:null], [:identifier, "a"], [:number, 4]]]]

null_obj = [:instance, :null_class, nil, nil]

# 木構造を逆ポーランド記法で記述する処理
stack = [tree]
operations = []

while stack.length > 0
  node = stack.pop()
  case node[0]
    when :statements
      node[1].each {|statement| stack.push(statement)}
      operations.push([:statements, node[1].length])

    when :set_var
      stack.push(node[1])  # 保存環境
      stack.push(node[2])  # 保存キー
      stack.push(node[3])  # オブジェクト
      operations.push([:set_var, 3])

    when :get_var
      stack.push(node[1])  # 保存環境
      stack.push(node[2])  # 保存キー
      operations.push([:get_var, 2])

    when :call_function
      stack.push(node[1])  # 引数
      stack.push(node[2])  # 実行内容
      operations.push([:call_function, 2])

    when :parameters
      node[1].each {|parameter| stack.push(parameter)}
      operations.push([:parameters, node[1].length])

    when :arguments
      node[1].each {|argument| stack.push(argument)}
      operations.push([:parameters, node[1].length])

    when :return
      stack.push(node[1])  # 返り値
      operations.push([:return, 1])

    when :identifier
      operations.push([:identifier, 0, [:identifier, node[1]]])

    when :null
      operations.push([:null, 0, null_obj])

    when :number
      operations.push([:number, 0, [:instance, :number_class, nil, node[1]]])

    when :string
      operations.push([:string, 0, [:instance, :string_class, nil, node[1]]])

    when :function
      operations.push([:object, 0])
  end
  puts "ノード　: #{node[0]}"
  puts "スタック: #{stack.map{|item| item[0]}}"
  puts "オペレータ: #{operations.map{|item| [item[0], item[1]]}}"
  puts
end

# 逆ポーランド記法から実行

stack = []
env = {}

while operations.length > 0

  # オペレータ
  operation = operations.pop
  buffers = stack.pop(operation[1])

  case operation[0]

    when :null
      stack.push(operation[2])

    when :identifier
      stack.push(operation[2])

    when :number
      stack.push(operation[2])

    when :set_var
      parent = buffers[0]
      key = buffers[1]
      value = buffers[2]
      env[key[1]] = value
      stack.push(null_obj)

    when :get_var
      parent = buffers[0]
      key = buffers[1]
      stack.push(env[key[1]])

    when :statements
      stack.push(buffers[-1])
  end

  puts "オペレータ: #{operation}"
  puts "バッファ　: #{buffers.map{|item| item[0]}}"
  puts "スタック　: #{stack.map{|item| item[0]}}"
  puts "メモリー　: #{env}"
  puts
end
p stack[0]