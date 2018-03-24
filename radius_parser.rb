#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'pp'
require 'strscan'

class RadiusParser < Racc::Parser

module_eval(<<'...end radius_parser.ry/module_eval...', 'radius_parser.ry', 56)

def parse(str)
  scanner = StringScanner.new(str)
  @q = []
  while !scanner.eos?
    scanner.scan(/[\s\n]+/)

    scanner.scan(/if/) ?                        @q << [:IF, "if"] :
    scanner.scan(/else/) ?                      @q << [:ELSE, "else"] :

    scanner.scan(/\".*?\"/) ?                   @q << [:STRING, scanner.matched[1..-2]] :
    scanner.scan(/[a-zA-Z_][a-zA-Z0-9_]*/) ?    @q << [:IDENTIFIER, scanner.matched] :
    scanner.scan(/([0-9]+|[0-9]*\.[0-9]+)/) ?   @q << [:NUMBER, scanner.matched.to_i] :

    scanner.scan(/==/) ?                        @q << ["==", "=="] :
    scanner.scan(/!=/) ?                        @q << ["!=", "!="] :
    scanner.scan(/>/) ?                         @q << [">", ">"] :
    scanner.scan(/>=/) ?                        @q << [">=", ">="] :
    scanner.scan(/</) ?                         @q << ["<", "<"] :
    scanner.scan(/<=/) ?                        @q << ["<=", "<="] :

    scanner.scan(/./) ?                         @q << [scanner.matched, scanner.matched] :
    (raise "scanner error")
  end
  puts ("Token: #{@q}")

  do_parse
end

def next_token
  @q.shift
end

...end radius_parser.ry/module_eval...
##### State transition tables begin ###

racc_action_table = [
     2,   -33,   -33,   -33,   -33,   -33,   -33,     9,    15,    31,
    49,     9,    10,     7,    50,     8,    10,    29,    13,    14,
    28,    57,    13,    14,    21,    22,    23,    24,    25,    26,
    19,    20,    17,    18,    27,    57,    28,   nil,   nil,    51,
    21,    22,    23,    24,    25,    26,    19,    20,    17,    18,
   nil,     9,   nil,    31,   nil,    47,    10,   nil,   nil,     9,
   nil,    31,    13,    14,    10,   nil,   nil,     9,   nil,    31,
    13,    14,    10,   nil,   nil,     9,   nil,    31,    13,    14,
    10,   nil,   nil,     9,   nil,    31,    13,    14,    10,   nil,
   nil,     9,   nil,    31,    13,    14,    10,   nil,   nil,     9,
   nil,    31,    13,    14,    10,   nil,   nil,     9,   nil,    31,
    13,    14,    10,   nil,   nil,     9,   nil,    31,    13,    14,
    10,   nil,   nil,     9,   nil,    31,    13,    14,    10,   nil,
   nil,     9,   nil,    31,    13,    14,    10,   nil,   nil,     9,
   nil,    31,    13,    14,    10,   nil,   nil,     9,   nil,    31,
    13,    14,    10,   nil,   nil,     9,   nil,    31,    13,    14,
    10,   nil,   nil,     9,   nil,    31,    13,    14,    10,   nil,
   nil,   nil,   nil,   nil,    13,    14,     9,   nil,     7,   nil,
     8,    10,   nil,    53,   nil,   nil,   nil,    13,    14,     9,
   nil,     7,   nil,     8,    10,   nil,   nil,    58,   nil,   nil,
    13,    14,     9,   nil,     7,   nil,     8,    10,   nil,    59,
   nil,   nil,   nil,    13,    14,     9,   nil,     7,   nil,     8,
    10,   nil,   nil,    63,   nil,   nil,    13,    14,    21,    22,
    23,    24,    25,    26,    19,    20,    17,    18,    48,    21,
    22,    23,    24,    25,    26,    19,    20,    17,    18,    16,
    21,    22,    23,    24,    25,    26,    19,    20,    17,    18,
    21,    22,    23,    24,    25,    26,    19,    20,    17,    18,
    21,    22,    23,    24,    25,    26,    19,    20,    21,    22,
    23,    24,    25,    26,    19,    20,    21,    22,    23,    24,
    25,    26,    19,    20,   -33,   -33,   -33,   -33,   -33,   -33,
   -33,   -33,   -33,   -33,   -33,   -33,   -33,   -33,   -33,   -33,
   -33,   -33,   -33,   -33,   -33,   -33,   -33,   -33,    21,    22,
    23,    24,    25,    26,    21,    22,    23,    24,    25,    26,
   -33,   -33,   -33,   -33,   -33,   -33 ]

racc_action_check = [
     1,    39,    39,    39,    39,    39,    39,    20,     2,    20,
    45,     1,    20,     1,    45,     1,     1,     8,    20,    20,
    31,    58,     1,     1,    46,    46,    46,    46,    46,    46,
    46,    46,    46,    46,     7,    54,     7,   nil,   nil,    46,
    32,    32,    32,    32,    32,    32,    32,    32,    32,    32,
   nil,     9,   nil,     9,   nil,    32,     9,   nil,   nil,    10,
   nil,    10,     9,     9,    10,   nil,   nil,    17,   nil,    17,
    10,    10,    17,   nil,   nil,    18,   nil,    18,    17,    17,
    18,   nil,   nil,    19,   nil,    19,    18,    18,    19,   nil,
   nil,    21,   nil,    21,    19,    19,    21,   nil,   nil,    22,
   nil,    22,    21,    21,    22,   nil,   nil,    23,   nil,    23,
    22,    22,    23,   nil,   nil,    24,   nil,    24,    23,    23,
    24,   nil,   nil,    25,   nil,    25,    24,    24,    25,   nil,
   nil,    26,   nil,    26,    25,    25,    26,   nil,   nil,    27,
   nil,    27,    26,    26,    27,   nil,   nil,    28,   nil,    28,
    27,    27,    28,   nil,   nil,    29,   nil,    29,    28,    28,
    29,   nil,   nil,    50,   nil,    50,    29,    29,    50,   nil,
   nil,   nil,   nil,   nil,    50,    50,    51,   nil,    51,   nil,
    51,    51,   nil,    51,   nil,   nil,   nil,    51,    51,    55,
   nil,    55,   nil,    55,    55,   nil,   nil,    55,   nil,   nil,
    55,    55,    57,   nil,    57,   nil,    57,    57,   nil,    57,
   nil,   nil,   nil,    57,    57,    62,   nil,    62,   nil,    62,
    62,   nil,   nil,    62,   nil,   nil,    62,    62,    43,    43,
    43,    43,    43,    43,    43,    43,    43,    43,    43,     4,
     4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
    44,    44,    44,    44,    44,    44,    44,    44,    44,    44,
    52,    52,    52,    52,    52,    52,    52,    52,    52,    52,
    33,    33,    33,    33,    33,    33,    33,    33,    34,    34,
    34,    34,    34,    34,    34,    34,    30,    30,    30,    30,
    30,    30,    30,    30,    40,    40,    40,    40,    40,    40,
    41,    41,    41,    41,    41,    41,    42,    42,    42,    42,
    42,    42,    37,    37,    37,    37,    37,    37,    36,    36,
    36,    36,    36,    36,    35,    35,    35,    35,    35,    35,
    38,    38,    38,    38,    38,    38 ]

racc_action_pointer = [
   nil,     0,     8,   nil,   237,   nil,   nil,    20,     1,    40,
    48,   nil,   nil,   nil,   nil,   nil,   nil,    56,    64,    72,
    -4,    80,    88,    96,   104,   112,   120,   128,   136,   144,
   284,     4,    38,   268,   276,   322,   316,   310,   328,    -1,
   292,   298,   304,   226,   248,    -7,    22,   nil,   nil,   nil,
   152,   165,   258,   nil,    15,   178,   nil,   191,     1,   nil,
   nil,   nil,   204,   nil ]

racc_action_default = [
    -1,   -33,   -33,    -2,   -33,    -4,    -5,   -31,   -33,   -33,
   -33,   -24,   -25,   -30,   -32,    64,    -3,   -33,   -33,   -33,
   -33,   -33,   -33,   -33,   -33,   -33,   -33,   -33,   -27,   -33,
   -14,   -31,   -33,   -12,   -13,   -15,   -16,   -18,   -19,   -20,
   -21,   -22,   -23,   -33,   -28,   -33,   -33,   -17,    -6,   -26,
   -33,   -33,   -29,    -1,    -9,   -33,    -8,   -33,    -9,    -1,
   -11,    -7,   -33,   -10 ]

racc_goto_table = [
     1,    30,    32,    56,    45,   nil,   nil,    61,   nil,    33,
    34,    35,    36,    37,    38,    39,    40,    41,    42,    43,
    44,    46,    54,   nil,   nil,   nil,   nil,   nil,    60,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    52,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    55,   nil,   nil,   nil,   nil,   nil,    62 ]

racc_goto_check = [
     1,     3,     3,     6,     9,   nil,   nil,     6,   nil,     3,
     3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
     3,     3,     2,   nil,   nil,   nil,   nil,   nil,     2,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,     1,   nil,   nil,   nil,   nil,   nil,     1 ]

racc_goto_pointer = [
   nil,     0,   -29,    -8,   nil,   nil,   -51,   nil,   nil,   -24 ]

racc_goto_default = [
   nil,   nil,     3,     4,     5,     6,   nil,    11,    12,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 25, :_reduce_1,
  2, 25, :_reduce_2,
  2, 26, :_reduce_none,
  1, 26, :_reduce_none,
  1, 26, :_reduce_none,
  4, 28, :_reduce_6,
  8, 29, :_reduce_7,
  6, 29, :_reduce_8,
  0, 30, :_reduce_none,
  4, 30, :_reduce_10,
  2, 30, :_reduce_11,
  3, 27, :_reduce_12,
  3, 27, :_reduce_13,
  2, 27, :_reduce_14,
  3, 27, :_reduce_15,
  3, 27, :_reduce_16,
  3, 27, :_reduce_17,
  3, 27, :_reduce_18,
  3, 27, :_reduce_19,
  3, 27, :_reduce_20,
  3, 27, :_reduce_21,
  3, 27, :_reduce_22,
  3, 27, :_reduce_23,
  1, 27, :_reduce_none,
  1, 27, :_reduce_none,
  4, 31, :_reduce_26,
  0, 33, :_reduce_27,
  1, 33, :_reduce_28,
  3, 33, :_reduce_29,
  1, 32, :_reduce_30,
  1, 32, :_reduce_31,
  1, 32, :_reduce_32 ]

racc_reduce_n = 33

racc_shift_n = 64

racc_token_table = {
  false => 0,
  :error => 1,
  "==" => 2,
  "!=" => 3,
  ">" => 4,
  ">=" => 5,
  "<" => 6,
  "<=" => 7,
  "*" => 8,
  "/" => 9,
  "+" => 10,
  "-" => 11,
  ";" => 12,
  :IDENTIFIER => 13,
  "=" => 14,
  :IF => 15,
  "(" => 16,
  ")" => 17,
  "{" => 18,
  "}" => 19,
  :ELSE => 20,
  "," => 21,
  :NUMBER => 22,
  :STRING => 23 }

racc_nt_base = 24

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"==\"",
  "\"!=\"",
  "\">\"",
  "\">=\"",
  "\"<\"",
  "\"<=\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\";\"",
  "IDENTIFIER",
  "\"=\"",
  "IF",
  "\"(\"",
  "\")\"",
  "\"{\"",
  "\"}\"",
  "ELSE",
  "\",\"",
  "NUMBER",
  "STRING",
  "$start",
  "stmts",
  "stmt",
  "expr",
  "var_assign",
  "if_stmt",
  "else_stmt",
  "func_call",
  "lit",
  "list" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 8)
  def _reduce_1(val, _values, result)
    result = ['STMTS']
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 9)
  def _reduce_2(val, _values, result)
    result << val[1]
    result
  end
.,.,

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 15)
  def _reduce_6(val, _values, result)
    result = ['VAR_ASSIGN', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 17)
  def _reduce_7(val, _values, result)
    result = ['IF', val[2], val[5], val[7]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 18)
  def _reduce_8(val, _values, result)
    result = ['IF', val[2], val[4], val[5]]
    result
  end
.,.,

# reduce 9 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 21)
  def _reduce_10(val, _values, result)
    result = val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 22)
  def _reduce_11(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 24)
  def _reduce_12(val, _values, result)
    result = ['+', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 25)
  def _reduce_13(val, _values, result)
    result = ['-', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 26)
  def _reduce_14(val, _values, result)
    result = ['-', ["NUMBER", 0], val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 27)
  def _reduce_15(val, _values, result)
    result = ['*', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 28)
  def _reduce_16(val, _values, result)
    result = ['/', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 29)
  def _reduce_17(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 30)
  def _reduce_18(val, _values, result)
    result = ['==', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 31)
  def _reduce_19(val, _values, result)
    result = ['!=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 32)
  def _reduce_20(val, _values, result)
    result = ['>', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 33)
  def _reduce_21(val, _values, result)
    result = ['>=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 34)
  def _reduce_22(val, _values, result)
    result = ['<', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 35)
  def _reduce_23(val, _values, result)
    result = ['<=', val[0], val[2]]
    result
  end
.,.,

# reduce 24 omitted

# reduce 25 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 39)
  def _reduce_26(val, _values, result)
    result = ['FUNC_CALL', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 41)
  def _reduce_27(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 42)
  def _reduce_28(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 43)
  def _reduce_29(val, _values, result)
    result << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 45)
  def _reduce_30(val, _values, result)
    result = ['NUMBER', val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 46)
  def _reduce_31(val, _values, result)
    result = ['IDENTIFIER', val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 47)
  def _reduce_32(val, _values, result)
    result = ['STRING', val[0]]
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class RadiusParser

if __FILE__ == $0
  parser = RadiusParser.new
  File.open("program.rlb", "r") do |f|
    res = parser.parse(f.read)
    puts ("Parse: #{res}")
  end
end
