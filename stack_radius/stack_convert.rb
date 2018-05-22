require 'pp'

# 木構造のstack処理
puts "stack1"
stack1 = [tree]
stack2 = []
while stack1.length > 0
  p(stack1.map{|item| item[0]})
  node = stack1.pop()
  stack2.push(node)

  case node[0]
    when :statements
      node[1].each do |statement|
        stack1.push(statement)
      end
    when :set_var
      stack1.push(node[1])  # 保存環境
      stack1.push(node[2])  # 保存キー
      stack1.push(node[3])  # オブジェクト
    when :get_var
      stack1.push(node[1])  # 保存環境
      stack1.push(node[2])  # 保存キー
    when :call_function
      stack1.push(node[1])  # 引数
      stack1.push(node[2])  # 実行内容
    when :parameters
      node[1].each do |parameter|
        stack1.push(parameter)
      end
    when :arguments
      node[1].each do |parameter|
        stack1.push(parameter)
      end
    when :return
      stack1.push(node[1])  # 返り値
  end
end

puts "stack2"
p(stack2.map{|item| item[0]})

puts "stack3"
stack3 = []
while stack2.length > 0
  node = stack2.pop()
  case node[0]
    when :parameters
      result = [:parameters]
      node[1].length.times do
        result.push(stack3.pop())
      end
    when :get_var
      result = [:instance, nil, nil, 5]
    else
      result = node
  end
  stack3.push(result)
end
p(stack3.map{|item| item[0]})