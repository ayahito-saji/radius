#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'pp'
require 'strscan'

class RadiusParser < Racc::Parser

module_eval(<<'...end radius_parser.ry/module_eval...', 'radius_parser.ry', 112)

def parse(str)
  scanner = StringScanner.new(str)
  @q = []
  while !scanner.eos?
    scanner.scan(/[\s\n]+/)

    scanner.scan(/if/) ?                        @q << [:IF, "if"] :
    scanner.scan(/else/) ?                      @q << [:ELSE, "else"] :
    scanner.scan(/loop/) ?                      @q << [:LOOP, "loop"] :
    scanner.scan(/break/) ?                     @q << [:BREAK, "break"] :
    scanner.scan(/return/) ?                    @q << [:RETURN, "return"] :
    scanner.scan(/function/) ?                  @q << [:FUNCTION, "function"] :
    scanner.scan(/class/) ?                     @q << [:CLASS, "class"] :
    scanner.scan(/self/) ?                      @q << [:SELF, "self"] :
    scanner.scan(/true/) ?                      @q << [:BOOLEAN, true] :
    scanner.scan(/false/) ?                     @q << [:BOOLEAN, false] :

    scanner.scan(/\".*?\"/) ?                   @q << [:STRING, scanner.matched[1..-2]] :
    scanner.scan(/[a-zA-Z_][a-zA-Z0-9_]*/) ?    @q << [:IDENTIFIER, scanner.matched.to_sym] :
    scanner.scan(/([0-9]*\.[0-9]+)/) ?          @q << [:NUMBER, scanner.matched.to_f] :
    scanner.scan(/(0|[1-9][0-9]*)/) ?           @q << [:NUMBER, scanner.matched.to_i] :

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

    scanner.scan(/\&\&/) ?                      @q << ["&&", "&&"] :
    scanner.scan(/\|\|/) ?                      @q << ["||", "||"] :
    scanner.scan(/#.+/) ?                       nil :

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
    54,    55,    56,    52,    53,    57,    58,    59,    60,    61,
    62,    22,   104,   106,   111,    26,   107,    63,    64,   105,
   105,     8,     9,    12,    73,   108,    26,    13,    47,   124,
    22,    47,   109,    14,    17,    20,   105,    21,    22,    28,
    26,    31,    32,    33,    14,    17,    20,    46,    21,    22,
    28,    26,    31,    32,    33,    14,    17,    20,    45,    21,
    22,    49,    26,   102,    28,    48,    31,    32,    33,    14,
    17,    20,   119,    21,    22,    28,    26,    31,    32,    33,
    14,    17,    20,    22,    21,    22,    28,    26,    31,    32,
    33,    14,    17,    20,   121,    21,    22,    51,    26,   102,
    28,    50,    31,    32,    33,    14,    17,    20,   -47,    21,
    22,    28,    26,    31,    32,    33,    14,    17,    20,    22,
    21,    22,    28,    26,    31,    32,    33,    14,    17,    20,
    24,    21,    22,    23,    26,     3,    28,   nil,    31,    32,
    33,    14,    17,    20,   nil,    21,    22,    28,    26,    31,
    32,    33,    14,    17,    20,   nil,    21,    22,    28,    26,
    31,    32,    33,    14,    17,    20,   nil,    21,    22,   nil,
    26,   nil,    28,   nil,    31,    32,    33,    14,    17,    20,
   nil,    21,    22,    28,    26,    31,    32,    33,    14,    17,
    20,   nil,    21,    22,    28,    26,    31,    32,    33,    14,
    17,    20,   nil,    21,    22,   nil,    26,   nil,    28,   nil,
    31,    32,    33,    14,    17,    20,   nil,    21,    22,    28,
    26,    31,    32,    33,    14,    17,    20,   nil,    21,    22,
    28,    26,    31,    32,    33,    14,    17,    20,   nil,    21,
    22,   nil,    26,   nil,    28,   nil,    31,    32,    33,    14,
    17,    20,   nil,    21,    22,    28,    26,    31,    32,    33,
    14,    17,    20,   nil,    21,    22,    28,    26,    31,    32,
    33,    14,    17,    20,   nil,    21,    22,   nil,    26,   nil,
    28,   nil,    31,    32,    33,    14,    17,    20,   nil,    21,
    22,    28,    26,    31,    32,    33,    14,    17,    20,   nil,
    21,    22,    28,    26,    31,    32,    33,    14,    17,    20,
   nil,    21,    22,   nil,    26,   nil,    28,   nil,    31,    32,
    33,    14,    17,    20,   nil,    21,    22,    28,    26,    31,
    32,    33,    14,    17,    20,   nil,    21,    22,    28,   nil,
    31,    32,    33,    14,    17,    20,   nil,    21,    22,    54,
    55,    56,    28,   nil,    31,    32,    33,    14,    17,    20,
   nil,    21,    22,    54,    55,    56,    52,    53,    57,    58,
    59,    60,    61,    62,   129,    54,    55,    56,   nil,   nil,
    63,    64,    14,    17,    20,   nil,    21,    22,    54,    55,
    56,   nil,    99,    54,    55,    56,    52,    53,    57,    58,
    59,    60,    61,    62,    36,    37,    38,    39,    40,    41,
    63,    64,    54,    55,    56,    52,    53,    57,    58,    59,
    60,    61,    62,   nil,   nil,   nil,   nil,   nil,   nil,    63,
    64,    54,    55,    56,    52,    53,    57,    58,    59,    60,
    61,    62,   nil,   nil,   nil,   nil,   nil,   nil,    63,    64,
    54,    55,    56,    52,    53,    57,    58,    59,    60,    61,
    62,   nil,   nil,   nil,   nil,   nil,   nil,    63,    64,    54,
    55,    56,    52,    53,    57,    58,    59,    60,    61,    62,
   nil,   nil,   nil,   nil,   nil,   nil,    63,    64,    54,    55,
    56,    52,    53,    57,    58,    59,    60,    61,    62,   nil,
   nil,   nil,   nil,   nil,   nil,    63,    64,    54,    55,    56,
    52,    53,    57,    58,    59,    60,    61,    62,   nil,   nil,
   nil,   nil,   nil,   nil,    63,    64,    54,    55,    56,    52,
    53,    57,    58,    59,    60,    61,    62,   nil,   nil,   nil,
   nil,   nil,   nil,    63,    64,    54,    55,    56,    52,    53,
    57,    58,    59,    60,    61,    62,   nil,   nil,   nil,   nil,
   nil,   nil,    63,    64,     8,     9,    12,   nil,   114,   nil,
    13,   nil,   nil,   nil,   nil,   nil,    14,    17,    20,   nil,
    21,    22,     8,     9,    12,   nil,   127,   nil,    13,   nil,
   nil,   nil,   nil,   nil,    14,    17,    20,   nil,    21,    22,
     8,     9,    12,    43,   nil,   nil,    13,   nil,   nil,     8,
     9,    12,    14,    17,    20,    13,    21,    22,   nil,   nil,
   nil,    14,    17,    20,   nil,    21,    22,     8,     9,    12,
   115,   nil,   nil,    13,   nil,   nil,   nil,   nil,   nil,    14,
    17,    20,   nil,    21,    22,     8,     9,    12,   nil,   128,
   nil,    13,   nil,   nil,   nil,   nil,   nil,    14,    17,    20,
   nil,    21,    22,    54,    55,    56,    52,    53,    57,    58,
    59,    60,    61,    62,   nil,     8,     9,    12,   nil,   110,
    63,    13,   nil,   nil,   nil,   nil,   nil,    14,    17,    20,
   nil,    21,    22,     8,     9,    12,   nil,   103,   nil,    13,
   nil,   nil,   nil,   112,   nil,    14,    17,    20,   nil,    21,
    22,    14,    17,    20,   nil,    21,    22,    54,    55,    56,
    52,    53,   -71,   -71,   -71,   -71,   -71,   -71,    54,    55,
    56,    52,    53,   -71,   -71,   -71,   -71,   -71,   -71,    54,
    55,    56,    52,    53,   -71,   -71,   -71,   -71,   -71,   -71,
    54,    55,    56,    52,    53,    57,    58,    59,    60,    61,
    62,    54,    55,    56,    52,    53,   -71,   -71,   -71,   -71,
   -71,   -71,    54,    55,    56,    52,    53,   -71,   -71,   -71,
   -71,   -71,   -71,    54,    55,    56,    52,    53,   -71,   -71,
   -71,   -71,   -71,   -71 ]

racc_action_check = [
    42,    42,    42,    42,    42,    42,    42,    42,    42,    42,
    42,    50,    77,    78,    83,    58,    79,    42,    42,    77,
    78,    42,    42,    42,    42,    80,    37,    42,    30,   118,
    47,    19,    80,    42,    42,    42,   118,    42,    42,    58,
    38,    58,    58,    58,    58,    58,    58,    18,    58,    58,
    37,    39,    37,    37,    37,    37,    37,    37,    15,    37,
    37,    20,    40,    74,    38,    20,    38,    38,    38,    38,
    38,    38,   108,    38,    38,    39,    41,    39,    39,    39,
    39,    39,    39,   109,    39,    39,    40,    45,    40,    40,
    40,    40,    40,    40,   111,    40,    40,    21,    46,   114,
    41,    21,    41,    41,    41,    41,    41,    41,    10,    41,
    41,    45,    52,    45,    45,    45,    45,    45,    45,    48,
    45,    45,    46,    53,    46,    46,    46,    46,    46,    46,
     4,    46,    46,     3,    54,     1,    52,   nil,    52,    52,
    52,    52,    52,    52,   nil,    52,    52,    53,    55,    53,
    53,    53,    53,    53,    53,   nil,    53,    53,    54,    56,
    54,    54,    54,    54,    54,    54,   nil,    54,    54,   nil,
    57,   nil,    55,   nil,    55,    55,    55,    55,    55,    55,
   nil,    55,    55,    56,    59,    56,    56,    56,    56,    56,
    56,   nil,    56,    56,    57,    60,    57,    57,    57,    57,
    57,    57,   nil,    57,    57,   nil,    61,   nil,    59,   nil,
    59,    59,    59,    59,    59,    59,   nil,    59,    59,    60,
    62,    60,    60,    60,    60,    60,    60,   nil,    60,    60,
    61,    63,    61,    61,    61,    61,    61,    61,   nil,    61,
    61,   nil,    64,   nil,    62,   nil,    62,    62,    62,    62,
    62,    62,   nil,    62,    62,    63,     9,    63,    63,    63,
    63,    63,    63,   nil,    63,    63,    64,   107,    64,    64,
    64,    64,    64,    64,   nil,    64,    64,   nil,    12,   nil,
     9,   nil,     9,     9,     9,     9,     9,     9,   nil,     9,
     9,   107,   105,   107,   107,   107,   107,   107,   107,   nil,
   107,   107,    12,    26,    12,    12,    12,    12,    12,    12,
   nil,    12,    12,   nil,    28,   nil,   105,   nil,   105,   105,
   105,   105,   105,   105,   nil,   105,   105,    26,    36,    26,
    26,    26,    26,    26,    26,   nil,    26,    26,    28,   nil,
    28,    28,    28,    28,    28,    28,   nil,    28,    28,    65,
    65,    65,    36,   nil,    36,    36,    36,    36,    36,    36,
   nil,    36,    36,    66,    66,    66,    66,    66,    66,    66,
    66,    66,    66,    66,   126,    86,    86,    86,   nil,   nil,
    66,    66,   126,   126,   126,   nil,   126,   126,    87,    87,
    87,   nil,    66,   117,   117,   117,   117,   117,   117,   117,
   117,   117,   117,   117,    11,    11,    11,    11,    11,    11,
   117,   117,    25,    25,    25,    25,    25,    25,    25,    25,
    25,    25,    25,   nil,   nil,   nil,   nil,   nil,   nil,    25,
    25,    68,    68,    68,    68,    68,    68,    68,    68,    68,
    68,    68,   nil,   nil,   nil,   nil,   nil,   nil,    68,    68,
    70,    70,    70,    70,    70,    70,    70,    70,    70,    70,
    70,   nil,   nil,   nil,   nil,   nil,   nil,    70,    70,    76,
    76,    76,    76,    76,    76,    76,    76,    76,    76,    76,
   nil,   nil,   nil,   nil,   nil,   nil,    76,    76,    69,    69,
    69,    69,    69,    69,    69,    69,    69,    69,    69,   nil,
   nil,   nil,   nil,   nil,   nil,    69,    69,    72,    72,    72,
    72,    72,    72,    72,    72,    72,    72,    72,   nil,   nil,
   nil,   nil,   nil,   nil,    72,    72,    71,    71,    71,    71,
    71,    71,    71,    71,    71,    71,    71,   nil,   nil,   nil,
   nil,   nil,   nil,    71,    71,    67,    67,    67,    67,    67,
    67,    67,    67,    67,    67,    67,   nil,   nil,   nil,   nil,
   nil,   nil,    67,    67,   100,   100,   100,   nil,   100,   nil,
   100,   nil,   nil,   nil,   nil,   nil,   100,   100,   100,   nil,
   100,   100,   123,   123,   123,   nil,   123,   nil,   123,   nil,
   nil,   nil,   nil,   nil,   123,   123,   123,   nil,   123,   123,
    13,    13,    13,    13,   nil,   nil,    13,   nil,   nil,     2,
     2,     2,    13,    13,    13,     2,    13,    13,   nil,   nil,
   nil,     2,     2,     2,   nil,     2,     2,   102,   102,   102,
   102,   nil,   nil,   102,   nil,   nil,   nil,   nil,   nil,   102,
   102,   102,   nil,   102,   102,   125,   125,   125,   nil,   125,
   nil,   125,   nil,   nil,   nil,   nil,   nil,   125,   125,   125,
   nil,   125,   125,    98,    98,    98,    98,    98,    98,    98,
    98,    98,    98,    98,   nil,    82,    82,    82,   nil,    82,
    98,    82,   nil,   nil,   nil,   nil,   nil,    82,    82,    82,
   nil,    82,    82,    75,    75,    75,   nil,    75,   nil,    75,
   nil,   nil,   nil,    85,   nil,    75,    75,    75,   nil,    75,
    75,    85,    85,    85,   nil,    85,    85,    91,    91,    91,
    91,    91,    91,    91,    91,    91,    91,    91,    92,    92,
    92,    92,    92,    92,    92,    92,    92,    92,    92,    93,
    93,    93,    93,    93,    93,    93,    93,    93,    93,    93,
    97,    97,    97,    97,    97,    97,    97,    97,    97,    97,
    97,    96,    96,    96,    96,    96,    96,    96,    96,    96,
    96,    96,    95,    95,    95,    95,    95,    95,    95,    95,
    95,    95,    95,    94,    94,    94,    94,    94,    94,    94,
    94,    94,    94,    94 ]

racc_action_pointer = [
   nil,   135,   586,   133,   108,   nil,   nil,   nil,   nil,   250,
    87,   391,   272,   577,   nil,    28,   nil,   nil,    17,    10,
    35,    71,   nil,   nil,   nil,   410,   297,   nil,   308,   nil,
     7,   nil,   nil,   nil,   nil,   nil,   322,    20,    34,    45,
    56,    70,    -2,   nil,   nil,    81,    92,   -10,    79,   nil,
   -29,   nil,   106,   117,   128,   142,   153,   164,     9,   178,
   189,   200,   214,   225,   236,   347,   361,   543,   429,   486,
   448,   524,   505,   nil,    35,   670,   467,   -19,   -18,   -14,
    -6,   nil,   652,   -17,   nil,   676,   373,   386,   nil,   nil,
   nil,   715,   726,   737,   781,   770,   759,   748,   661,   nil,
   541,   nil,   604,   nil,   nil,   286,   nil,   261,    46,    43,
   nil,    68,   nil,   nil,    71,   nil,   nil,   391,    -2,   nil,
   nil,   nil,   nil,   559,   nil,   622,   347,   nil,   nil,   nil ]

racc_action_default = [
    -2,   -71,    -1,   -71,    -3,    -5,    -6,    -7,    -8,   -71,
   -10,   -45,   -71,   -71,   -46,   -48,   -49,   -50,   -51,   -71,
   -71,   -71,   -70,   130,    -4,    -9,   -71,   -38,   -71,   -40,
   -41,   -42,   -43,   -44,   -45,   -47,   -71,   -71,   -71,   -71,
   -71,   -71,   -71,    -2,   -23,   -61,   -61,   -71,   -55,    -2,
   -66,   -68,   -71,   -71,   -71,   -71,   -71,   -71,   -71,   -71,
   -71,   -71,   -71,   -71,   -71,   -26,   -71,   -11,   -12,   -13,
   -14,   -15,   -16,    -2,   -19,   -71,   -62,   -71,   -71,   -52,
   -71,   -56,   -71,   -71,   -67,   -71,   -24,   -25,   -27,   -28,
   -29,   -30,   -31,   -32,   -33,   -34,   -35,   -36,   -37,   -39,
   -71,   -18,   -71,   -22,   -59,   -71,   -58,   -61,   -71,   -71,
   -54,   -71,   -65,   -69,   -19,    -2,   -21,   -63,   -71,    -2,
   -57,   -68,   -17,   -71,   -60,   -71,   -71,   -20,   -53,   -64 ]

racc_goto_table = [
    19,    44,    85,     2,    11,   101,    79,    81,    10,    84,
   113,    19,    77,    78,    80,    11,    83,     1,   nil,    10,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    74,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    19,   nil,   nil,   nil,    11,   122,    75,   nil,    10,   nil,
   nil,   113,    82,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   120,   nil,
   nil,   nil,   126,    19,   118,   nil,   100,    11,   nil,   nil,
    19,    10,   nil,    19,    11,   nil,   nil,    11,    10,   nil,
   116,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    19,   nil,
    19,   nil,    11,   nil,    11,   nil,    10,   nil,    10,   nil,
   nil,   nil,   nil,    25,   nil,   nil,    42,   nil,   123,   nil,
   nil,    19,   125,    19,    19,    11,   nil,    11,    11,    10,
    65,    10,    66,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    67,    68,    69,    70,    71,    72,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    86,    87,    88,    89,
    90,    91,    92,    93,    94,    95,    96,    97,    98,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   117 ]

racc_goto_check = [
    13,     3,    20,     2,     9,    10,    16,    16,     8,    16,
     4,    13,    18,    18,    17,     9,    19,     1,   nil,     8,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    13,   nil,   nil,   nil,     9,    10,     2,   nil,     8,   nil,
   nil,     4,     2,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    16,   nil,
   nil,   nil,    20,    13,    18,   nil,     2,     9,   nil,   nil,
    13,     8,   nil,    13,     9,   nil,   nil,     9,     8,   nil,
     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    13,   nil,
    13,   nil,     9,   nil,     9,   nil,     8,   nil,     8,   nil,
   nil,   nil,   nil,     7,   nil,   nil,     7,   nil,     2,   nil,
   nil,    13,     2,    13,    13,     9,   nil,     9,     9,     8,
     7,     8,     7,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     7,     7,     7,     7,     7,     7,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     7,     7,     7,     7,
     7,     7,     7,     7,     7,     7,     7,     7,     7,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     7 ]

racc_goto_pointer = [
   nil,    17,     3,   -12,   -75,   nil,   nil,   104,     6,     2,
   -69,   nil,   nil,    -2,   nil,   nil,   -41,   -34,   -33,   -34,
   -49 ]

racc_goto_default = [
   nil,   nil,   nil,     4,     5,     6,     7,    76,    35,    34,
   nil,    27,    29,    30,    15,    16,    18,   nil,   nil,   nil,
   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 42, :_reduce_none,
  0, 43, :_reduce_2,
  2, 43, :_reduce_3,
  3, 43, :_reduce_4,
  1, 44, :_reduce_none,
  1, 44, :_reduce_none,
  1, 44, :_reduce_none,
  1, 44, :_reduce_8,
  2, 44, :_reduce_9,
  1, 44, :_reduce_none,
  3, 45, :_reduce_11,
  3, 45, :_reduce_12,
  3, 45, :_reduce_13,
  3, 45, :_reduce_14,
  3, 45, :_reduce_15,
  3, 45, :_reduce_16,
  6, 46, :_reduce_17,
  4, 46, :_reduce_18,
  0, 51, :_reduce_none,
  4, 51, :_reduce_20,
  2, 51, :_reduce_21,
  4, 47, :_reduce_22,
  2, 47, :_reduce_23,
  3, 48, :_reduce_24,
  3, 48, :_reduce_25,
  2, 48, :_reduce_26,
  3, 48, :_reduce_27,
  3, 48, :_reduce_28,
  3, 48, :_reduce_29,
  3, 48, :_reduce_30,
  3, 48, :_reduce_31,
  3, 48, :_reduce_32,
  3, 48, :_reduce_33,
  3, 48, :_reduce_34,
  3, 48, :_reduce_35,
  3, 48, :_reduce_36,
  3, 48, :_reduce_37,
  1, 48, :_reduce_none,
  3, 52, :_reduce_39,
  1, 52, :_reduce_none,
  1, 52, :_reduce_none,
  1, 53, :_reduce_42,
  1, 53, :_reduce_43,
  1, 53, :_reduce_44,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_none,
  1, 54, :_reduce_50,
  1, 50, :_reduce_51,
  3, 50, :_reduce_52,
  7, 55, :_reduce_53,
  4, 55, :_reduce_54,
  0, 58, :_reduce_55,
  1, 58, :_reduce_56,
  3, 58, :_reduce_57,
  4, 49, :_reduce_58,
  4, 49, :_reduce_59,
  6, 49, :_reduce_60,
  0, 59, :_reduce_61,
  1, 59, :_reduce_62,
  3, 59, :_reduce_63,
  7, 56, :_reduce_64,
  4, 56, :_reduce_65,
  0, 60, :_reduce_66,
  1, 60, :_reduce_none,
  0, 61, :_reduce_68,
  2, 61, :_reduce_69,
  1, 57, :_reduce_70 ]

racc_reduce_n = 71

racc_shift_n = 130

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
  "&&" => 19,
  "||" => 20,
  "." => 21,
  ";" => 22,
  :BREAK => 23,
  :RETURN => 24,
  :IF => 25,
  "{" => 26,
  "}" => 27,
  :ELSE => 28,
  :LOOP => 29,
  "(" => 30,
  ")" => 31,
  :NUMBER => 32,
  :STRING => 33,
  :BOOLEAN => 34,
  :instance => 35,
  :SELF => 36,
  :FUNCTION => 37,
  "," => 38,
  :CLASS => 39,
  :IDENTIFIER => 40 }

racc_nt_base = 41

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
  "\"&&\"",
  "\"||\"",
  "\".\"",
  "\";\"",
  "BREAK",
  "RETURN",
  "IF",
  "\"{\"",
  "\"}\"",
  "ELSE",
  "LOOP",
  "\"(\"",
  "\")\"",
  "NUMBER",
  "STRING",
  "BOOLEAN",
  "instance",
  "SELF",
  "FUNCTION",
  "\",\"",
  "CLASS",
  "IDENTIFIER",
  "$start",
  "program",
  "stmts",
  "stmt",
  "var_assign",
  "if_stmt",
  "loop_stmt",
  "expr",
  "func_call",
  "variable",
  "else_stmt",
  "primary",
  "lit",
  "object",
  "func_def",
  "class_def",
  "identifier",
  "params",
  "args",
  "expands",
  "var_assigns" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 14)
  def _reduce_2(val, _values, result)
    result = [:STMTS, []]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 15)
  def _reduce_3(val, _values, result)
    result[1] << val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 16)
  def _reduce_4(val, _values, result)
    result[1] << val[1]
    result
  end
.,.,

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 21)
  def _reduce_8(val, _values, result)
    result = [:BREAK]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 22)
  def _reduce_9(val, _values, result)
    result = [:RETURN, val[1]]
    result
  end
.,.,

# reduce 10 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 25)
  def _reduce_11(val, _values, result)
    result = ['=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 26)
  def _reduce_12(val, _values, result)
    result = ['+=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 27)
  def _reduce_13(val, _values, result)
    result = ['-=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 28)
  def _reduce_14(val, _values, result)
    result = ['*=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 29)
  def _reduce_15(val, _values, result)
    result = ['/=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 30)
  def _reduce_16(val, _values, result)
    result = ['%=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 32)
  def _reduce_17(val, _values, result)
    result = [:IF, val[1], val[3], val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 33)
  def _reduce_18(val, _values, result)
    result = [:IF, val[1], val[2], val[3]]
    result
  end
.,.,

# reduce 19 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 36)
  def _reduce_20(val, _values, result)
    result = val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 37)
  def _reduce_21(val, _values, result)
    result = val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 39)
  def _reduce_22(val, _values, result)
    result = [:LOOP, val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 40)
  def _reduce_23(val, _values, result)
    result = [:LOOP, val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 42)
  def _reduce_24(val, _values, result)
    result = ['+', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 43)
  def _reduce_25(val, _values, result)
    result = ['-', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 44)
  def _reduce_26(val, _values, result)
    result = ['-', [:INSTANCE, :NUMBER, {val: 0}], val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 45)
  def _reduce_27(val, _values, result)
    result = ['*', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 46)
  def _reduce_28(val, _values, result)
    result = ['/', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 47)
  def _reduce_29(val, _values, result)
    result = ['%', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 49)
  def _reduce_30(val, _values, result)
    result = ['==', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 50)
  def _reduce_31(val, _values, result)
    result = ['!=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 51)
  def _reduce_32(val, _values, result)
    result = ['>', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 52)
  def _reduce_33(val, _values, result)
    result = ['>=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 53)
  def _reduce_34(val, _values, result)
    result = ['<', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 54)
  def _reduce_35(val, _values, result)
    result = ['<=', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 56)
  def _reduce_36(val, _values, result)
    result = ['&&', val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 57)
  def _reduce_37(val, _values, result)
    result = ['||', val[0], val[2]]
    result
  end
.,.,

# reduce 38 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 61)
  def _reduce_39(val, _values, result)
    result = val[1]
    result
  end
.,.,

# reduce 40 omitted

# reduce 41 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 65)
  def _reduce_42(val, _values, result)
    result = [:INSTANCE, :NUMBER, {val: val[0]}]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 66)
  def _reduce_43(val, _values, result)
    result = [:INSTANCE, :STRING, {val: val[0]}]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 67)
  def _reduce_44(val, _values, result)
    result = [:INSTANCE, :BOOLEAN, {val: val[0]}]
    result
  end
.,.,

# reduce 45 omitted

# reduce 46 omitted

# reduce 47 omitted

# reduce 48 omitted

# reduce 49 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 74)
  def _reduce_50(val, _values, result)
    result = [:SELF]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 76)
  def _reduce_51(val, _values, result)
    result = [:VARIABLE, nil, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 77)
  def _reduce_52(val, _values, result)
    result = [:VARIABLE, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 79)
  def _reduce_53(val, _values, result)
    result = [:FUNCTION, val[2], val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 80)
  def _reduce_54(val, _values, result)
    result = [:FUNCTION, [], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 82)
  def _reduce_55(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 83)
  def _reduce_56(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 84)
  def _reduce_57(val, _values, result)
    result << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 86)
  def _reduce_58(val, _values, result)
    result = [:FUNC_CALL, nil, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 87)
  def _reduce_59(val, _values, result)
    result = [:FUNC_CALL, nil, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 88)
  def _reduce_60(val, _values, result)
    result = [:FUNC_CALL, val[0], val[2], val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 90)
  def _reduce_61(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 91)
  def _reduce_62(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 92)
  def _reduce_63(val, _values, result)
    result << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 94)
  def _reduce_64(val, _values, result)
    result = [:CLASS, val[2], val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 95)
  def _reduce_65(val, _values, result)
    result = [:CLASS, nil, val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 97)
  def _reduce_66(val, _values, result)
    result = nil
    result
  end
.,.,

# reduce 67 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 100)
  def _reduce_68(val, _values, result)
    result = [:STMTS, []]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 101)
  def _reduce_69(val, _values, result)
    result[1] << val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 103)
  def _reduce_70(val, _values, result)
    result = [:IDENTIFIER, val[0]]
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
