null_obj = [:instance, :null_class, nil, nil]
stack = []
env = {}

operations = [
    [:statements, 3],
    [:null, 0],
    [:ref_var, 2],
    [:identifier, 0, "a"],
    [:null, 0],
    [:def_var, 3],
    [:new_number, 0, 1],
    [:identifier, 0, "a"],
    [:null, 0]
]

while operations.length > 0

  # オペレータ
  operation = operations.pop
  buffers = stack.pop(operation[1])

  case operation[0]

    when :null
      stack.push(null_obj)

    when :identifier
      stack.push([:identifier, operation[2]])

    when :new_number
      stack.push([:instance, :number_class, nil, operation[2]])

    when :def_var
      parent = buffers[0]
      key = buffers[1]
      value = buffers[2]
      env[key[1]] = value
      stack.push(null_obj)

    when :ref_var
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