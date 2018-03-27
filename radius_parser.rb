#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'pp'
require 'strscan'

class RadiusParser < Racc::Parser

module_eval(<<'...end radius_parser.ry/module_eval...', 'radius_parser.ry', 72)

def parse(str)
  scanner = StringScanner.new(str)
  @q = []
  while !scanner.eos?
    scanner.scan(/[\s\n]+/)

    scanner.scan(/if/) ?                        @q << [:IF, "if"] :
    scanner.scan(/else/) ?                      @q << [:ELSE, "else"] :
    scanner.scan(/loop/) ?                      @q << [:LOOP, "loop"] :
    scanner.scan(/break/) ?                     @q << [:BREAK, "break"] :

    scanner.scan(/true|false/) ?                @q << [:BOOLEAN, scanner.matched] :
    scanner.scan(/\".*?\"/) ?                   @q << [:STRING, scanner.matched[1..-2]] :
    scanner.scan(/[a-zA-Z_][a-zA-Z0-9_]*/) ?    @q << [:IDENTIFIER, scanner.matched] :
    scanner.scan(/([0-9]+|[0-9]*\.[0-9]+)/) ?   @q << [:NUMBER, scanner.matched.to_i] :

    scanner.scan(/\+=/) ?                       @q << ["+=", "+="] :
    scanner.scan(/-=/) ?                        @q << ["-=", "-="] :
    scanner.scan(/\*=/) ?                       @q << ["*=", "*="] :
    scanner.scan(/\/=/) ?                       @q << ["/=", "/="] :

    scanner.scan(/==/) ?                        @q << ["==", "=="] :
    scanner.scan(/!=/) ?                        @q << ["!=", "!="] :
    scanner.scan(/>=/) ?                        @q << [">=", ">="] :
    scanner.scan(/<=/) ?                        @q << ["<=", "<="] :
    scanner.scan(/>/) ?                         @q << [">", ">"] :
    scanner.scan(/</) ?                         @q << ["<", "<"] :

    scanner.scan(/./) ?                         @q << [scanner.matched, scanner.matched] :
    (raise "scanner error")
  end
  # puts ("Token: #{@q}")

  do_parse
end

def next_token
  @q.shift
end

...end radius_parser.ry/module_eval...
##### State transition tables begin ###

racc_action_table = [
     2,    79,    70,    25,    26,    27,    12,    71,    42,    34,
    12,    25,    26,    27,    25,    26,    27,    35,    43,    44,
     8,    10,    14,    12,    21,    79,    14,    11,    12,    17,
    18,    19,    20,    17,    18,    19,    20,   nil,   nil,    14,
    12,   nil,   nil,   nil,    14,    12,    17,    18,    19,    20,
   nil,    17,    18,    19,    20,   nil,    14,    12,   nil,   nil,
   nil,    14,    12,    17,    18,    19,    20,   nil,    17,    18,
    19,    20,   nil,    14,    12,   nil,   nil,   nil,    14,    12,
    17,    18,    19,    20,   nil,    17,    18,    19,    20,   nil,
    14,    12,   nil,   nil,   nil,    14,    12,    17,    18,    19,
    20,   nil,    17,    18,    19,    20,   nil,    14,    12,   nil,
   nil,   nil,    14,    12,    17,    18,    19,    20,   nil,    17,
    18,    19,    20,   nil,    14,    12,   nil,   nil,   nil,    14,
    12,    17,    18,    19,    20,   nil,    17,    18,    19,    20,
   nil,    14,    12,   nil,   nil,   nil,    14,    12,    17,    18,
    19,    20,   nil,    17,    18,    19,    20,   nil,    14,    12,
   nil,   nil,   nil,    14,    12,    17,    18,    19,    20,   nil,
    17,    18,    19,    20,   nil,    14,    12,   nil,   nil,   nil,
    14,    12,    17,    18,    19,    20,   nil,    17,    18,    19,
    20,   nil,    14,   nil,    12,   nil,   nil,    14,    12,    17,
    18,    19,    20,   nil,    17,    18,    19,    20,     8,    10,
    14,    12,   nil,    73,    14,    11,   nil,    17,    18,    19,
    20,    17,    18,    19,    20,     8,    10,    14,    12,    75,
   nil,   nil,    11,   nil,    17,    18,    19,    20,   nil,   nil,
   nil,    12,     8,    10,    14,   nil,   nil,    80,   nil,    11,
   nil,    17,    18,    19,    20,     8,    10,    14,    12,    81,
   nil,   nil,    11,   nil,    17,    18,    19,    20,   nil,   nil,
   nil,   nil,     8,    10,    14,   nil,   nil,    85,   nil,    11,
   nil,    17,    18,    19,    20,    25,    26,    27,    23,    24,
    28,    29,    30,    31,    32,    33,    36,    37,    38,    39,
    40,    41,   nil,   nil,   nil,    42,    72,    25,    26,    27,
    23,    24,    28,    29,    30,    31,    32,    33,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    69,    25,
    26,    27,    23,    24,    28,    29,    30,    31,    32,    33,
   nil,   nil,   nil,   nil,   nil,   nil,    22,    25,    26,    27,
    23,    24,    28,    29,    30,    31,    32,    33,    25,    26,
    27,    23,    24,    28,    29,    30,    31,    32,    33,    25,
    26,    27,    23,    24,    28,    29,    30,    31,    32,    33,
    25,    26,    27,    23,    24,    28,    29,    30,    31,    32,
    33,    25,    26,    27,    23,    24,    28,    29,    30,    31,
    32,    33,    25,    26,    27,    23,    24,   -45,   -45,   -45,
   -45,   -45,   -45,    25,    26,    27,    23,    24,   -45,   -45,
   -45,   -45,   -45,   -45,    25,    26,    27,    23,    24,    28,
    29,    30,    31,    32,    33,    25,    26,    27,    23,    24,
    28,    29,    30,    31,    32,    33,    25,    26,    27,    23,
    24,    28,    29,    30,    31,    32,    33,    25,    26,    27,
    23,    24,   -45,   -45,   -45,   -45,   -45,   -45,    25,    26,
    27,    23,    24,   -45,   -45,   -45,   -45,   -45,   -45,    25,
    26,    27,    23,    24,   -45,   -45,   -45,   -45,   -45,   -45,
    25,    26,    27,    23,    24,   -45,   -45,   -45,   -45,   -45,
   -45 ]

racc_action_check = [
     1,    76,    66,    45,    45,    45,     1,    66,    46,     5,
    27,    48,    48,    48,    49,    49,    49,     8,    10,    11,
     1,     1,     1,    12,     2,    80,    27,     1,    14,     1,
     1,     1,     1,    27,    27,    27,    27,   nil,   nil,    12,
    23,   nil,   nil,   nil,    14,    24,    12,    12,    12,    12,
   nil,    14,    14,    14,    14,   nil,    23,    25,   nil,   nil,
   nil,    24,    26,    23,    23,    23,    23,   nil,    24,    24,
    24,    24,   nil,    25,    28,   nil,   nil,   nil,    26,    29,
    25,    25,    25,    25,   nil,    26,    26,    26,    26,   nil,
    28,    30,   nil,   nil,   nil,    29,    31,    28,    28,    28,
    28,   nil,    29,    29,    29,    29,   nil,    30,    32,   nil,
   nil,   nil,    31,    33,    30,    30,    30,    30,   nil,    31,
    31,    31,    31,   nil,    32,    36,   nil,   nil,   nil,    33,
    37,    32,    32,    32,    32,   nil,    33,    33,    33,    33,
   nil,    36,    38,   nil,   nil,   nil,    37,    39,    36,    36,
    36,    36,   nil,    37,    37,    37,    37,   nil,    38,    40,
   nil,   nil,   nil,    39,    41,    38,    38,    38,    38,   nil,
    39,    39,    39,    39,   nil,    40,    42,   nil,   nil,   nil,
    41,    43,    40,    40,    40,    40,   nil,    41,    41,    41,
    41,   nil,    42,   nil,    68,   nil,   nil,    43,    71,    42,
    42,    42,    42,   nil,    43,    43,    43,    43,    68,    68,
    68,    72,   nil,    68,    71,    68,   nil,    68,    68,    68,
    68,    71,    71,    71,    71,    72,    72,    72,    77,    72,
   nil,   nil,    72,   nil,    72,    72,    72,    72,   nil,   nil,
   nil,    79,    77,    77,    77,   nil,   nil,    77,   nil,    77,
   nil,    77,    77,    77,    77,    79,    79,    79,    84,    79,
   nil,   nil,    79,   nil,    79,    79,    79,    79,   nil,   nil,
   nil,   nil,    84,    84,    84,   nil,   nil,    84,   nil,    84,
   nil,    84,    84,    84,    84,    67,    67,    67,    67,    67,
    67,    67,    67,    67,    67,    67,     9,     9,     9,     9,
     9,     9,   nil,   nil,   nil,     9,    67,    47,    47,    47,
    47,    47,    47,    47,    47,    47,    47,    47,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    47,     4,
     4,     4,     4,     4,     4,     4,     4,     4,     4,     4,
   nil,   nil,   nil,   nil,   nil,   nil,     4,    65,    65,    65,
    65,    65,    65,    65,    65,    65,    65,    65,    74,    74,
    74,    74,    74,    74,    74,    74,    74,    74,    74,    62,
    62,    62,    62,    62,    62,    62,    62,    62,    62,    62,
    63,    63,    63,    63,    63,    63,    63,    63,    63,    63,
    63,    64,    64,    64,    64,    64,    64,    64,    64,    64,
    64,    64,    57,    57,    57,    57,    57,    57,    57,    57,
    57,    57,    57,    58,    58,    58,    58,    58,    58,    58,
    58,    58,    58,    58,    59,    59,    59,    59,    59,    59,
    59,    59,    59,    59,    59,    60,    60,    60,    60,    60,
    60,    60,    60,    60,    60,    60,    61,    61,    61,    61,
    61,    61,    61,    61,    61,    61,    61,    53,    53,    53,
    53,    53,    53,    53,    53,    53,    53,    53,    54,    54,
    54,    54,    54,    54,    54,    54,    54,    54,    54,    55,
    55,    55,    55,    55,    55,    55,    55,    55,    55,    55,
    56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
    56 ]

racc_action_pointer = [
   nil,     0,    24,   nil,   327,   -10,   nil,   nil,    -2,   283,
    -4,    -5,    17,   nil,    22,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    34,    39,    51,    56,     4,    68,    73,
    85,    90,   102,   107,   nil,   nil,   119,   124,   136,   141,
   153,   158,   170,   175,   nil,     1,   -14,   305,     9,    12,
   nil,   nil,   nil,   455,   466,   477,   488,   400,   411,   422,
   433,   444,   367,   378,   389,   345,   -21,   283,   188,   nil,
   nil,   192,   205,   nil,   356,   nil,   -25,   222,   nil,   235,
    -1,   nil,   nil,   nil,   252,   nil ]

racc_action_default = [
    -1,   -45,   -45,    -2,   -45,   -45,    -5,    -6,   -45,   -41,
   -45,   -45,   -45,   -32,   -45,   -34,   -35,   -40,   -42,   -43,
   -44,    86,    -3,   -45,   -45,   -45,   -45,   -45,   -45,   -45,
   -45,   -45,   -45,   -45,    -4,    -7,   -45,   -45,   -45,   -45,
   -45,   -45,   -37,   -45,    -1,   -22,   -41,   -45,   -20,   -21,
   -23,   -24,   -25,   -26,   -27,   -28,   -29,   -30,   -31,    -8,
    -9,   -10,   -11,   -12,   -13,   -38,   -45,   -45,   -45,   -33,
   -36,   -45,   -45,   -19,   -39,    -1,   -16,   -45,   -15,   -45,
   -16,    -1,   -18,   -14,   -45,   -17 ]

racc_goto_table = [
     9,    45,    76,    47,     1,    66,    78,   nil,   nil,    82,
    83,   nil,    48,    49,    50,    51,    52,    53,    54,    55,
    56,    57,    58,   nil,   nil,    59,    60,    61,    62,    63,
    64,    65,    67,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    68,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    74,   nil,   nil,   nil,   nil,   nil,   nil,     9,   nil,   nil,
   nil,     9,   nil,   nil,   nil,   nil,     9,   nil,     9,    77,
   nil,   nil,   nil,     9,   nil,    84 ]

racc_goto_check = [
     7,     3,     2,     3,     1,    12,     8,   nil,   nil,     2,
     8,   nil,     3,     3,     3,     3,     3,     3,     3,     3,
     3,     3,     3,   nil,   nil,     3,     3,     3,     3,     3,
     3,     3,     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     1,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     3,   nil,   nil,   nil,   nil,   nil,   nil,     7,   nil,   nil,
   nil,     7,   nil,   nil,   nil,   nil,     7,   nil,     7,     1,
   nil,   nil,   nil,     7,   nil,     1 ]

racc_goto_pointer = [
   nil,     4,   -70,   -11,   nil,   nil,   nil,    -1,   -70,   nil,
   nil,   nil,   -37 ]

racc_goto_default = [
   nil,   nil,     3,     4,     5,     6,     7,    46,   nil,    13,
    15,    16,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 34, :_reduce_1,
  2, 34, :_reduce_2,
  2, 35, :_reduce_none,
  2, 35, :_reduce_none,
  1, 35, :_reduce_none,
  1, 35, :_reduce_none,
  2, 35, :_reduce_7,
  3, 37, :_reduce_8,
  3, 37, :_reduce_9,
  3, 37, :_reduce_10,
  3, 37, :_reduce_11,
  3, 37, :_reduce_12,
  3, 37, :_reduce_13,
  8, 38, :_reduce_14,
  6, 38, :_reduce_15,
  0, 41, :_reduce_none,
  4, 41, :_reduce_17,
  2, 41, :_reduce_18,
  4, 39, :_reduce_19,
  3, 36, :_reduce_20,
  3, 36, :_reduce_21,
  2, 36, :_reduce_22,
  3, 36, :_reduce_23,
  3, 36, :_reduce_24,
  3, 36, :_reduce_25,
  3, 36, :_reduce_26,
  3, 36, :_reduce_27,
  3, 36, :_reduce_28,
  3, 36, :_reduce_29,
  3, 36, :_reduce_30,
  3, 36, :_reduce_31,
  1, 36, :_reduce_none,
  3, 42, :_reduce_33,
  1, 42, :_reduce_none,
  1, 42, :_reduce_none,
  4, 44, :_reduce_36,
  0, 45, :_reduce_37,
  1, 45, :_reduce_38,
  3, 45, :_reduce_39,
  1, 43, :_reduce_40,
  1, 43, :_reduce_41,
  1, 43, :_reduce_42,
  1, 43, :_reduce_43,
  1, 40, :_reduce_44 ]

racc_reduce_n = 45

racc_shift_n = 86

racc_token_table = {
  false => 0,
  :error => 1,
  "*" => 2,
  "/" => 3,
  "%" => 4,
  "+" => 5,
  "-" => 6,
  "==" => 7,
  "!=" => 8,
  ">" => 9,
  ">=" => 10,
  "<" => 11,
  "<=" => 12,
  "=" => 13,
  "+=" => 14,
  "-=" => 15,
  "*=" => 16,
  "/=" => 17,
  "%=" => 18,
  ";" => 19,
  :BREAK => 20,
  :IF => 21,
  "(" => 22,
  ")" => 23,
  "{" => 24,
  "}" => 25,
  :ELSE => 26,
  :LOOP => 27,
  "," => 28,
  :NUMBER => 29,
  :STRING => 30,
  :BOOLEAN => 31,
  :IDENTIFIER => 32 }

racc_nt_base = 33

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
  "\"*\"",
  "\"/\"",
  "\"%\"",
  "\"+\"",
  "\"-\"",
  "\"==\"",
  "\"!=\"",
  "\">\"",
  "\">=\"",
  "\"<\"",
  "\"<=\"",
  "\"=\"",
  "\"+=\"",
  "\"-=\"",
  "\"*=\"",
  "\"/=\"",
  "\"%=\"",
  "\";\"",
  "BREAK",
  "IF",
  "\"(\"",
  "\")\"",
  "\"{\"",
  "\"}\"",
  "ELSE",
  "LOOP",
  "\",\"",
  "NUMBER",
  "STRING",
  "BOOLEAN",
  "IDENTIFIER",
  "$start",
  "stmts",
  "stmt",
  "expr",
  "var_assign",
  "if_stmt",
  "loop_stmt",
  "identifier",
  "else_stmt",
  "primary",
  "lit",
  "func_call",
  "list" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 9)
  def _reduce_1(val, _values, result)
    result = ['STMTS']
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 10)
  def _reduce_2(val, _values, result)
    result << val[1]
    result
  end
.,.,

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 16)
  def _reduce_7(val, _values, result)
    result = ['BREAK']
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 18)
  def _reduce_8(val, _values, result)
    result = ['=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 19)
  def _reduce_9(val, _values, result)
    result = ['+=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 20)
  def _reduce_10(val, _values, result)
    result = ['-=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 21)
  def _reduce_11(val, _values, result)
    result = ['*=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 22)
  def _reduce_12(val, _values, result)
    result = ['/=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 23)
  def _reduce_13(val, _values, result)
    result = ['%=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 25)
  def _reduce_14(val, _values, result)
    result = ['IF', val[2], val[5], val[7]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 26)
  def _reduce_15(val, _values, result)
    result = ['IF', val[2], val[4], val[5]]
    result
  end
.,.,

# reduce 16 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 29)
  def _reduce_17(val, _values, result)
    result = val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 30)
  def _reduce_18(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 32)
  def _reduce_19(val, _values, result)
    result = ['LOOP', val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 34)
  def _reduce_20(val, _values, result)
    result = ['+', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 35)
  def _reduce_21(val, _values, result)
    result = ['-', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 36)
  def _reduce_22(val, _values, result)
    result = ['-', ["NUMBER", 0], val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 37)
  def _reduce_23(val, _values, result)
    result = ['*', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 38)
  def _reduce_24(val, _values, result)
    result = ['/', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 39)
  def _reduce_25(val, _values, result)
    result = ['%', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 40)
  def _reduce_26(val, _values, result)
    result = ['==', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 41)
  def _reduce_27(val, _values, result)
    result = ['!=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 42)
  def _reduce_28(val, _values, result)
    result = ['>', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 43)
  def _reduce_29(val, _values, result)
    result = ['>=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 44)
  def _reduce_30(val, _values, result)
    result = ['<', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 45)
  def _reduce_31(val, _values, result)
    result = ['<=', val[0], val[2]]
    result
  end
.,.,

# reduce 32 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 48)
  def _reduce_33(val, _values, result)
    result = val[1]
    result
  end
.,.,

# reduce 34 omitted

# reduce 35 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 52)
  def _reduce_36(val, _values, result)
    result = ['FUNC_CALL', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 54)
  def _reduce_37(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 55)
  def _reduce_38(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 56)
  def _reduce_39(val, _values, result)
    result << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 58)
  def _reduce_40(val, _values, result)
    result = ['NUMBER', val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 59)
  def _reduce_41(val, _values, result)
    result = val[0]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 60)
  def _reduce_42(val, _values, result)
    result = ['STRING', val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 61)
  def _reduce_43(val, _values, result)
    result = ['BOOLEAN', val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 63)
  def _reduce_44(val, _values, result)
    result = ['IDENTIFIER', val[0]]
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
