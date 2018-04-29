#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'pp'
require 'strscan'

class RadiusParser < Racc::Parser

module_eval(<<'...end radius_parser.ry/module_eval...', 'radius_parser.ry', 142)

def parse(str)
  scanner = StringScanner.new(str)
  @q = []
  while !scanner.eos?
    scanner.scan(/[\s\n]+/)

    scanner.scan(/if/) ?                        @q << [:IF, "if"] :
    scanner.scan(/(elif|elsif)/) ?              @q << [:ELSEIF, "elseif"] :
    scanner.scan(/else/) ?                      @q << [:ELSE, "else"] :
    scanner.scan(/loop/) ?                      @q << [:LOOP, "loop"] :
    scanner.scan(/for/) ?                       @q << [:FOR, "for"] :
    scanner.scan(/while/) ?                     @q << [:WHILE, "while"] :
    scanner.scan(/break/) ?                     @q << [:BREAK, "break"] :
    scanner.scan(/return/) ?                    @q << [:RETURN, "return"] :
    scanner.scan(/function/) ?                  @q << [:FUNCTION, "function"] :
    scanner.scan(/class/) ?                     @q << [:CLASS, "class"] :
    scanner.scan(/self/) ?                      @q << [:SELF, "self"] :
    scanner.scan(/true/) ?                      @q << [:BOOLEAN, true] :
    scanner.scan(/false/) ?                     @q << [:BOOLEAN, false] :
    scanner.scan(/private/) ?                   @q << [:PRIVATE, "private"] :
    scanner.scan(/public/) ?                    @q << [:PUBLIC, "pubic"] :
    scanner.scan(/const/) ?                     @q << [:CONST, "const"] :
    scanner.scan(/static/) ?                    @q << [:STATIC, "static"] :
    scanner.scan(/null/) ?                      @q << [:NULL, "null"] :
    scanner.scan(/super/) ?                     @q << [:SUPER, "super"]:
    scanner.scan(/base/) ?                      @q << [:SUPER, "super"]:
    scanner.scan(/parent/) ?                    @q << [:SUPER, "super"]:

    scanner.scan(/\".*?\"/) ?                   @q << [:STRING, scanner.matched[1..-2]] :
    scanner.scan(/[a-zA-Z_][a-zA-Z0-9_]*/) ?    @q << [:IDENTIFIER, scanner.matched.to_s] :
    scanner.scan(/([0-9]*\.[0-9]+)/) ?          @q << [:NUMBER, scanner.matched.to_f] :
    scanner.scan(/(0|[1-9][0-9]*)/) ?           @q << [:NUMBER, scanner.matched.to_i] :

    scanner.scan(/<-/) ?                        @q << ["=", "="] :

    scanner.scan(/\+=/) ?                       @q << ["+=", "+="] :
    scanner.scan(/-=/) ?                        @q << ["-=", "-="] :
    scanner.scan(/\*=/) ?                       @q << ["*=", "*="] :
    scanner.scan(/\/=/) ?                       @q << ["/=", "/="] :
    scanner.scan(/%=/) ?                        @q << ["%=", "%="] :

    scanner.scan(/==/) ?                        @q << ["==", "=="] :
    scanner.scan(/!=/) ?                        @q << ["!=", "!="] :
    scanner.scan(/<>/) ?                        @q << ["<>", "<>"] :
    scanner.scan(/>=/) ?                        @q << [">=", ">="] :
    scanner.scan(/<=/) ?                        @q << ["<=", "<="] :
    scanner.scan(/>/) ?                         @q << [">", ">"] :
    scanner.scan(/</) ?                         @q << ["<", "<"] :

    scanner.scan(/\&\&/) ?                      @q << ["&&", "&&"] :
    scanner.scan(/\|\|/) ?                      @q << ["||", "||"] :
    scanner.scan(/#.*/) ?                       nil :
    scanner.scan(/\/\/.*/) ?                    nil :

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

clist = [
'-1,117,126,24,141,114,80,82,23,129,130,104,105,79,81,42,154,115,115',
'142,44,101,101,118,42,11,12,14,34,66,42,42,15,16,17,26,24,33,156,21',
'22,23,42,30,31,32,35,38,39,40,158,-27,41,42,61,61,100,100,11,12,14,34',
'176,174,43,15,16,17,26,24,33,111,21,22,23,144,30,31,32,35,38,39,40,-28',
'-29,41,42,3,71,70,68,11,12,14,34,172,,24,15,16,17,26,23,33,,21,22,,',
'30,31,32,35,38,39,40,101,,41,42,24,,34,171,101,23,49,50,51,26,,33,,21',
'22,,,30,31,32,35,38,39,40,101,34,41,42,24,61,,100,26,23,33,,,61,,100',
'30,31,32,35,38,39,40,,,41,42,,,34,,,,61,24,100,26,,33,23,,,,,30,31,32',
'35,38,39,40,,,41,42,,11,12,14,34,170,,24,15,16,17,26,23,33,,21,22,,',
'30,31,32,35,38,39,40,,,41,42,24,,34,,101,23,49,50,51,26,,33,,,,,,30',
'31,32,35,38,39,40,,34,41,42,,,24,,26,,33,23,,61,,100,30,31,32,35,38',
'39,40,,,41,42,,11,12,14,34,168,,24,15,16,17,26,23,33,,21,22,,,30,31',
'32,35,38,39,40,,,41,42,24,,34,,101,23,49,50,51,26,,33,,,,,,30,31,32',
'35,38,39,40,,34,41,42,24,,,,26,23,33,,,61,,100,30,31,32,35,38,39,40',
',,41,42,24,,34,,,23,,,,26,,33,,,,,,30,31,32,35,38,39,40,,34,41,42,24',
',,,26,23,33,,,,,,30,31,32,35,38,39,40,,,41,42,24,,34,,,23,,,,26,,33',
',,,,,30,31,32,35,38,39,40,,34,41,42,24,,,,26,23,33,,,,,,30,31,32,35',
'38,39,40,,,41,42,,,34,,,,,24,,26,,33,23,,,,,30,31,32,35,38,39,40,,,41',
'42,,11,12,14,34,160,,24,15,16,17,26,23,33,,21,22,,,30,31,32,35,38,39',
'40,,,41,42,,,34,,,,,24,,26,,33,23,,,,,30,31,32,35,38,39,40,,,41,42,',
'11,12,14,34,133,,24,15,16,17,26,23,33,,21,22,,,30,31,32,35,38,39,40',
',,41,42,24,,34,,,23,,,,26,,33,,,,,,30,31,32,35,38,39,40,,34,41,42,24',
',,,26,23,33,,,,,,30,31,32,35,38,39,40,,,41,42,24,,34,,,23,,,,26,,33',
',,,,,30,31,32,35,38,39,40,,34,41,42,24,,,,26,23,33,,,,,,30,31,32,35',
'38,39,40,,,41,42,24,,34,,,23,,,,26,,33,,,,,,30,31,32,35,38,39,40,,34',
'41,42,24,,,,26,23,33,,,,,,30,31,32,35,38,39,40,,,41,42,24,,34,,,23,',
',,26,,33,,,,,,30,31,32,35,38,39,40,,34,41,42,24,,,,26,23,33,,,,,,30',
'31,32,35,38,39,40,,,41,42,24,,34,,,23,,,,26,,33,,,,,,30,31,32,35,38',
'39,40,,34,41,42,24,,,,26,23,33,,,,,,30,31,32,35,38,39,40,,,41,42,24',
',34,,,23,,,,26,,33,,,,,,30,31,32,35,38,39,40,,34,41,42,24,,,,26,23,33',
',,,,,30,31,32,35,38,39,40,,,41,42,24,,34,,,23,,,,26,,33,,,,,,30,31,32',
'35,38,39,40,,34,41,42,24,,,,26,23,33,,,,,,30,31,32,35,38,39,40,,,41',
'42,24,,34,,,23,,,,26,,33,,,,,,30,31,32,35,38,39,40,,34,41,42,24,,,,26',
'23,33,,,,,,30,31,32,35,38,39,40,,,41,42,24,,34,,,23,,,,26,,33,,,,,,30',
'31,32,35,38,39,40,,34,41,42,,,24,,26,,33,23,,,,,30,31,32,35,38,39,40',
',,41,42,,11,12,14,34,152,,,15,16,17,26,24,33,,21,22,23,,30,31,32,35',
'38,39,40,,,41,42,,,,,11,12,14,34,151,,24,15,16,17,26,23,33,,21,22,,',
'30,31,32,35,38,39,40,,,41,42,,,34,24,,,,,23,26,,33,,,,,,30,31,32,35',
'38,39,40,,24,41,42,34,145,23,,,,,26,,33,,21,22,,,30,31,32,35,38,39,40',
'34,,41,42,,24,,26,,33,23,,,,,30,31,32,35,38,39,40,,,41,42,,11,12,14',
'34,143,,24,15,16,17,26,23,33,,21,22,,,30,31,32,35,38,39,40,,,41,42,24',
',34,,,23,,,,26,,33,,,,,,30,31,32,35,38,39,40,,34,41,42,24,,,,26,23,33',
',,,,,30,31,32,35,38,39,40,,,41,42,24,,34,,,23,,,,26,,33,,,,,,30,31,32',
'35,38,39,40,,34,41,42,24,,,,26,23,33,,,,,,30,31,32,35,38,39,40,,,41',
'42,,,34,,,,,,,26,,33,,,,,,30,31,32,35,38,39,40,,,41,42,101,,49,50,51',
'47,48,52,53,55,56,57,58,54,59,60,101,,49,50,51,47,48,52,53,55,56,57',
'58,54,59,60,,61,,100,,,,,,,,,,,,,155,61,,100,,,,,,,,,,,,101,116,49,50',
'51,47,48,52,53,55,56,57,58,54,59,60,101,,49,50,51,47,48,52,53,55,56',
'57,58,54,59,60,,61,,100,147,,,,,,,,,,,,,61,,100,125,101,,49,50,51,47',
'48,52,53,55,56,57,58,54,59,60,,,,,,,,,,,159,,,,,,,61,101,100,49,50,51',
'47,48,-90,-90,-90,-90,-90,-90,-90,101,,49,50,51,47,48,-90,-90,-90,-90',
'-90,-90,-90,,,,,,61,,100,,,,,,,,,,,,61,101,100,49,50,51,47,48,-90,-90',
'-90,-90,-90,-90,-90,101,,49,50,51,47,48,-90,-90,-90,-90,-90,-90,-90',
',,,,,61,,100,,,,,,,,,,,,61,101,100,49,50,51,47,48,-90,-90,-90,-90,-90',
'-90,-90,101,,49,50,51,47,48,-90,-90,-90,-90,-90,-90,-90,,,,,,61,,100',
',,,,,,,,,,,61,101,100,49,50,51,47,48,-90,-90,-90,-90,-90,-90,-90,101',
',49,50,51,47,48,52,53,55,56,57,58,54,,,,,,61,,100,,,,,,,,,,,,61,101',
'100,49,50,51,47,48,52,53,55,56,57,58,54,59,101,,49,50,51,47,48,52,53',
'55,56,57,58,54,59,60,,,61,,100,,135,,,,,,,,,,,61,101,100,49,50,51,47',
'48,52,53,55,56,57,58,54,59,60,101,,49,50,51,47,48,52,53,55,56,57,58',
'54,59,60,,61,,100,,,,,,,,,,,,,,61,101,100,49,50,51,47,48,52,53,55,56',
'57,58,54,59,60,101,,49,50,51,47,48,52,53,55,56,57,58,54,59,60,,61,113',
'100,,,,,,,108,,,,,,,61,101,100,49,50,51,47,48,52,53,55,56,57,58,54,59',
'60,,,,,,,,,,,106,,,,,,,61,101,100,49,50,51,47,48,52,53,55,56,57,58,54',
'59,60,,,,,,,,,,,150,,,,,,,61,101,100,49,50,51,47,48,52,53,55,56,57,58',
'54,59,60,45,,49,50,51,47,48,52,53,55,56,57,58,54,59,60,,61,,100,,,,',
',,,,,,,,,61,101,46,49,50,51,47,48,52,53,55,56,57,58,54,59,60,101,,49',
'50,51,47,48,52,53,55,56,57,58,54,59,60,,61,,100,,,,,,,,,,,,,,61,101',
'100,49,50,51,47,48,52,53,55,56,57,58,54,59,60,,,,,,,162,,,,,,,,,,,61',
'101,100,49,50,51,47,48,52,53,55,56,57,58,54,59,60,101,,49,50,51,47,48',
'52,53,55,56,57,58,54,59,60,,61,,100,,,,,,,,,,,,,,61,45,100,49,50,51',
'47,48,52,53,55,56,57,58,54,59,60,101,,49,50,51,47,48,52,53,55,56,57',
'58,54,59,60,,61,,46,,,,,,,,,,,,,,61,173,100' ]
        racc_action_table = arr = ::Array.new(2132, nil)
        idx = 0
        clist.each do |str|
          str.split(',', -1).each do |i|
            arr[idx] = i.to_i unless i.empty?
            idx += 1
          end
        end

clist = [
'2,78,99,2,119,76,40,41,2,104,104,64,64,40,41,45,136,99,76,119,4,88,89',
'78,81,2,2,2,2,15,79,101,2,2,2,2,175,2,141,2,2,175,142,2,2,2,2,2,2,2',
'144,83,2,2,88,89,88,89,175,175,175,175,175,173,3,175,175,175,175,167',
'175,69,175,175,167,122,175,175,175,175,175,175,175,20,125,175,175,1',
'19,18,17,167,167,167,167,167,,166,167,167,167,167,166,167,,167,167,',
',167,167,167,167,167,167,167,73,,167,167,12,,166,166,72,12,72,72,72',
'166,,166,,166,166,,,166,166,166,166,166,166,166,87,12,166,166,14,73',
',73,12,14,12,,,72,,72,12,12,12,12,12,12,12,,,12,12,,,14,,,,87,165,87',
'14,,14,165,,,,,14,14,14,14,14,14,14,,,14,14,,165,165,165,165,165,,16',
'165,165,165,165,16,165,,165,165,,,165,165,165,165,165,165,165,,,165',
'165,162,,16,,85,162,85,85,85,16,,16,,,,,,16,16,16,16,16,16,16,,162,16',
'16,,,161,,162,,162,161,,85,,85,162,162,162,162,162,162,162,,,162,162',
',161,161,161,161,161,,155,161,161,161,161,155,161,,161,161,,,161,161',
'161,161,161,161,161,,,161,161,154,,155,,86,154,86,86,86,155,,155,,,',
',,155,155,155,155,155,155,155,,154,155,155,23,,,,154,23,154,,,86,,86',
'154,154,154,154,154,154,154,,,154,154,24,,23,,,24,,,,23,,23,,,,,,23',
'23,23,23,23,23,23,,24,23,23,26,,,,24,26,24,,,,,,24,24,24,24,24,24,24',
',,24,24,33,,26,,,33,,,,26,,26,,,,,,26,26,26,26,26,26,26,,33,26,26,34',
',,,33,34,33,,,,,,33,33,33,33,33,33,33,,,33,33,,,34,,,,,149,,34,,34,149',
',,,,34,34,34,34,34,34,34,,,34,34,,149,149,149,149,149,,105,149,149,149',
'149,105,149,,149,149,,,149,149,149,149,149,149,149,,,149,149,,,105,',
',,,107,,105,,105,107,,,,,105,105,105,105,105,105,105,,,105,105,,107',
'107,107,107,107,,100,107,107,107,107,100,107,,107,107,,,107,107,107',
'107,107,107,107,,,107,107,135,,100,,,135,,,,100,,100,,,,,,100,100,100',
'100,100,100,100,,135,100,100,46,,,,135,46,135,,,,,,135,135,135,135,135',
'135,135,,,135,135,47,,46,,,47,,,,46,,46,,,,,,46,46,46,46,46,46,46,,47',
'46,46,48,,,,47,48,47,,,,,,47,47,47,47,47,47,47,,,47,47,49,,48,,,49,',
',,48,,48,,,,,,48,48,48,48,48,48,48,,49,48,48,50,,,,49,50,49,,,,,,49',
'49,49,49,49,49,49,,,49,49,51,,50,,,51,,,,50,,50,,,,,,50,50,50,50,50',
'50,50,,51,50,50,52,,,,51,52,51,,,,,,51,51,51,51,51,51,51,,,51,51,53',
',52,,,53,,,,52,,52,,,,,,52,52,52,52,52,52,52,,53,52,52,54,,,,53,54,53',
',,,,,53,53,53,53,53,53,53,,,53,53,55,,54,,,55,,,,54,,54,,,,,,54,54,54',
'54,54,54,54,,55,54,54,56,,,,55,56,55,,,,,,55,55,55,55,55,55,55,,,55',
'55,57,,56,,,57,,,,56,,56,,,,,,56,56,56,56,56,56,56,,57,56,56,58,,,,57',
'58,57,,,,,,57,57,57,57,57,57,57,,,57,57,59,,58,,,59,,,,58,,58,,,,,,58',
'58,58,58,58,58,58,,59,58,58,60,,,,59,60,59,,,,,,59,59,59,59,59,59,59',
',,59,59,61,,60,,,61,,,,60,,60,,,,,,60,60,60,60,60,60,60,,61,60,60,,',
'134,,61,,61,134,,,,,61,61,61,61,61,61,61,,,61,61,,134,134,134,134,134',
',,134,134,134,134,132,134,,134,134,132,,134,134,134,134,134,134,134',
',,134,134,,,,,132,132,132,132,132,,129,132,132,132,132,129,132,,132',
'132,,,132,132,132,132,132,132,132,,,132,132,,,129,124,,,,,124,129,,129',
',,,,,129,129,129,129,129,129,129,,68,129,129,124,124,68,,,,,124,,124',
',124,124,,,124,124,124,124,124,124,124,68,,124,124,,121,,68,,68,121',
',,,,68,68,68,68,68,68,68,,,68,68,,121,121,121,121,121,,71,121,121,121',
'121,71,121,,121,121,,,121,121,121,121,121,121,121,,,121,121,118,,71',
',,118,,,,71,,71,,,,,,71,71,71,71,71,71,71,,118,71,71,116,,,,118,116',
'118,,,,,,118,118,118,118,118,118,118,,,118,118,115,,116,,,115,,,,116',
',116,,,,,,116,116,116,116,116,116,116,,115,116,116,110,,,,115,110,115',
',,,,,115,115,115,115,115,115,115,,,115,115,,,110,,,,,,,110,,110,,,,',
',110,110,110,110,110,110,110,,,110,110,140,,140,140,140,140,140,140',
'140,140,140,140,140,140,140,140,77,,77,77,77,77,77,77,77,77,77,77,77',
'77,77,77,,140,,140,,,,,,,,,,,,,140,77,,77,,,,,,,,,,,,127,77,127,127',
'127,127,127,127,127,127,127,127,127,127,127,127,84,,84,84,84,84,84,84',
'84,84,84,84,84,84,84,84,,127,,127,127,,,,,,,,,,,,,84,,84,84,148,,148',
'148,148,148,148,148,148,148,148,148,148,148,148,148,,,,,,,,,,,148,,',
',,,,148,90,148,90,90,90,90,90,90,90,90,90,90,90,90,91,,91,91,91,91,91',
'91,91,91,91,91,91,91,,,,,,90,,90,,,,,,,,,,,,91,92,91,92,92,92,92,92',
'92,92,92,92,92,92,92,93,,93,93,93,93,93,93,93,93,93,93,93,93,,,,,,92',
',92,,,,,,,,,,,,93,94,93,94,94,94,94,94,94,94,94,94,94,94,94,95,,95,95',
'95,95,95,95,95,95,95,95,95,95,,,,,,94,,94,,,,,,,,,,,,95,96,95,96,96',
'96,96,96,96,96,96,96,96,96,96,97,,97,97,97,97,97,97,97,97,97,97,97,97',
',,,,,96,,96,,,,,,,,,,,,97,98,97,98,98,98,98,98,98,98,98,98,98,98,98',
'98,109,,109,109,109,109,109,109,109,109,109,109,109,109,109,109,,,98',
',98,,109,,,,,,,,,,,109,75,109,75,75,75,75,75,75,75,75,75,75,75,75,75',
'75,112,,112,112,112,112,112,112,112,112,112,112,112,112,112,112,,75',
',75,,,,,,,,,,,,,,112,74,112,74,74,74,74,74,74,74,74,74,74,74,74,74,74',
'67,,67,67,67,67,67,67,67,67,67,67,67,67,67,67,,74,74,74,,,,,,,67,,,',
',,,67,65,67,65,65,65,65,65,65,65,65,65,65,65,65,65,65,,,,,,,,,,,65,',
',,,,,65,131,65,131,131,131,131,131,131,131,131,131,131,131,131,131,131',
',,,,,,,,,,131,,,,,,,131,62,131,62,62,62,62,62,62,62,62,62,62,62,62,62',
'62,137,,137,137,137,137,137,137,137,137,137,137,137,137,137,137,,62',
',62,,,,,,,,,,,,,,137,138,137,138,138,138,138,138,138,138,138,138,138',
'138,138,138,138,139,,139,139,139,139,139,139,139,139,139,139,139,139',
'139,139,,138,,138,,,,,,,,,,,,,,139,153,139,153,153,153,153,153,153,153',
'153,153,153,153,153,153,153,,,,,,,153,,,,,,,,,,,153,163,153,163,163',
'163,163,163,163,163,163,163,163,163,163,163,163,164,,164,164,164,164',
'164,164,164,164,164,164,164,164,164,164,,163,,163,,,,,,,,,,,,,,164,5',
'164,5,5,5,5,5,5,5,5,5,5,5,5,5,5,169,,169,169,169,169,169,169,169,169',
'169,169,169,169,169,169,,5,,5,,,,,,,,,,,,,,169,169,169' ]
        racc_action_check = arr = ::Array.new(2132, nil)
        idx = 0
        clist.each do |str|
          str.split(',', -1).each do |i|
            arr[idx] = i.to_i unless i.empty?
            idx += 1
          end
        end

racc_action_pointer = [
   nil,    87,     0,    64,    -4,  2078,   nil,   nil,   nil,   nil,
   nil,   nil,   117,   nil,   145,     1,   203,    55,    48,    70,
    65,   nil,   nil,   335,   358,   nil,   386,   nil,   nil,   nil,
   nil,   nil,   nil,   409,   437,   nil,   nil,   nil,   nil,   nil,
   -22,   -21,   nil,   nil,   nil,   -38,   604,   627,   655,   678,
   706,   729,   757,   780,   808,   831,   859,   882,   910,   933,
   961,   984,  1894,   nil,   -19,  1826,   nil,  1792,  1123,    29,
   nil,  1181,   122,   114,  1776,  1726,   -33,  1351,   -28,   -23,
   nil,   -29,   nil,    33,  1414,   231,   312,   142,    19,    20,
  1485,  1499,  1533,  1547,  1581,  1595,  1629,  1643,  1677,   -34,
   553,   -22,   nil,   nil,   -18,   495,   nil,   525,   nil,  1692,
  1283,   nil,  1742,   nil,   nil,  1255,  1232,   nil,  1204,   -32,
   nil,  1153,    39,   nil,  1101,    66,   nil,  1398,   nil,  1075,
   nil,  1860,  1047,   nil,  1014,   576,    -2,  1910,  1944,  1960,
  1335,    10,   -11,   nil,    22,   nil,   nil,   nil,  1451,   467,
   nil,   nil,   nil,  1994,   307,   284,   nil,   nil,   nil,   nil,
   nil,   256,   226,  2028,  2044,   175,    94,    66,   nil,  2094,
   nil,   nil,   nil,    35,   nil,    33,   nil ]

racc_action_default = [
    -2,   -90,   -30,   -90,    -3,    -5,    -6,    -7,    -8,    -9,
   -10,   -11,   -12,   -16,   -90,   -90,   -90,   -90,   -33,   -90,
   -57,   -31,   -32,   -90,   -90,   -55,   -90,   -59,   -60,   -61,
   -62,   -63,   -64,   -80,   -74,   -67,   -68,   -69,   -70,   -71,
   -90,   -90,   -89,   177,    -4,   -90,   -90,   -90,   -90,   -90,
   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
   -90,   -80,   -13,   -57,   -20,   -90,    -2,   -90,   -90,   -35,
   -34,   -90,   -39,   -52,   -90,   -81,   -90,   -90,   -90,   -77,
    -2,   -85,   -87,   -56,   -90,   -37,   -38,   -40,   -41,   -42,
   -43,   -44,   -45,   -46,   -47,   -48,   -49,   -50,   -51,   -90,
   -90,   -90,   -14,   -17,   -90,   -90,    -2,   -30,    -2,   -90,
   -90,   -36,   -26,   -58,   -65,   -90,   -90,   -66,   -90,   -90,
   -78,   -30,   -90,   -86,   -30,   -54,   -53,   -90,   -56,   -90,
    -2,   -90,   -30,   -22,   -30,   -90,   -90,   -90,   -82,   -75,
   -90,   -90,   -90,   -73,   -90,   -84,   -88,   -54,   -90,   -30,
    -2,   -15,   -23,   -90,   -90,   -90,    -2,   -79,   -87,    -2,
   -21,   -30,   -90,   -25,   -76,   -30,   -30,   -30,   -19,   -90,
   -72,   -83,   -18,   -90,    -2,   -30,   -24 ]

racc_goto_table = [
     2,   124,    20,    76,   146,   136,    78,   119,   122,   110,
    64,   102,   103,    69,     1,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    99,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    83,   146,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   107,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   166,   nil,   120,
   121,   123,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   128,   nil,   nil,   nil,   nil,   132,    20,   134,   nil,
    20,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    20,   nil,   nil,    20,   nil,   nil,   nil,   nil,   nil,
   149,   nil,    20,   nil,    20,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   157,   nil,   nil,   nil,   nil,   nil,   nil,    20,
   161,   nil,   nil,   nil,   nil,   nil,   165,   nil,    62,   167,
    65,    20,    67,   nil,   nil,    20,    20,    20,   nil,    72,
    73,   nil,    74,   nil,   175,    20,   nil,   nil,   nil,    75,
    77,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    84,    85,    86,    87,    88,    89,    90,    91,
    92,    93,    94,    95,    96,    97,    98,    75,   nil,   nil,
   nil,   nil,   nil,   nil,   109,   nil,   nil,   112,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   127,   nil,   nil,   nil,
   nil,   131,   nil,   nil,   nil,   nil,   137,   nil,   nil,   nil,
   nil,   138,   139,   nil,   140,   nil,   nil,   nil,   nil,   nil,
   137,   nil,   nil,   nil,   nil,   148,   nil,   nil,   nil,   nil,
   nil,   153,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   163,   164,   nil,   nil,   nil,   nil,   nil,   nil,   169,   nil,
   nil,   nil,   137 ]

racc_goto_check = [
     2,    29,    18,    19,     5,    17,    24,    27,    28,    16,
    11,    12,    13,    15,     1,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    19,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    18,     5,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     2,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    29,   nil,    18,
     2,    18,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    18,   nil,   nil,   nil,   nil,     2,    18,     2,   nil,
    18,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    18,   nil,   nil,    18,   nil,   nil,   nil,   nil,   nil,
     2,   nil,    18,   nil,    18,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    18,   nil,   nil,   nil,   nil,   nil,   nil,    18,
     2,   nil,   nil,   nil,   nil,   nil,     2,   nil,     4,     2,
     4,    18,     4,   nil,   nil,    18,    18,    18,   nil,     4,
     4,   nil,     4,   nil,     2,    18,   nil,   nil,   nil,     4,
     4,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     4,     4,     4,     4,     4,     4,     4,     4,
     4,     4,     4,     4,     4,     4,     4,     4,   nil,   nil,
   nil,   nil,   nil,   nil,     4,   nil,   nil,     4,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     4,   nil,   nil,   nil,
   nil,     4,   nil,   nil,   nil,   nil,     4,   nil,   nil,   nil,
   nil,     4,     4,   nil,     4,   nil,   nil,   nil,   nil,   nil,
     4,   nil,   nil,   nil,   nil,     4,   nil,   nil,   nil,   nil,
   nil,     4,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     4,     4,   nil,   nil,   nil,   nil,   nil,   nil,     4,   nil,
   nil,   nil,     4 ]

racc_goto_pointer = [
   nil,    14,     0,   nil,   146,  -120,   nil,   nil,   nil,   nil,
   nil,    -3,   -53,   -52,   nil,    -5,   -60,  -105,     0,   -30,
   nil,   nil,   nil,   nil,   -28,   nil,   nil,   -72,   -73,   -81 ]

racc_goto_default = [
   nil,   nil,   nil,     4,     5,     6,     7,     8,     9,    10,
    13,   nil,   nil,   nil,    18,   nil,   nil,    19,    63,   nil,
    25,    29,    27,    28,   nil,    36,    37,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 55, :_reduce_none,
  0, 56, :_reduce_2,
  2, 56, :_reduce_3,
  3, 56, :_reduce_4,
  1, 57, :_reduce_none,
  1, 57, :_reduce_none,
  1, 57, :_reduce_none,
  1, 57, :_reduce_none,
  1, 57, :_reduce_none,
  1, 57, :_reduce_none,
  1, 57, :_reduce_11,
  1, 57, :_reduce_12,
  2, 57, :_reduce_13,
  3, 60, :_reduce_14,
  5, 64, :_reduce_15,
  0, 65, :_reduce_16,
  2, 65, :_reduce_17,
  6, 67, :_reduce_18,
  5, 67, :_reduce_19,
  0, 66, :_reduce_none,
  4, 66, :_reduce_21,
  4, 61, :_reduce_22,
  5, 63, :_reduce_23,
  11, 62, :_reduce_24,
  6, 59, :_reduce_25,
  3, 59, :_reduce_26,
  3, 71, :_reduce_27,
  1, 71, :_reduce_28,
  4, 71, :_reduce_29,
  0, 68, :_reduce_30,
  1, 68, :_reduce_31,
  1, 68, :_reduce_32,
  0, 69, :_reduce_33,
  1, 69, :_reduce_34,
  0, 70, :_reduce_35,
  1, 70, :_reduce_36,
  3, 58, :_reduce_37,
  3, 58, :_reduce_38,
  2, 58, :_reduce_39,
  3, 58, :_reduce_40,
  3, 58, :_reduce_41,
  3, 58, :_reduce_42,
  3, 58, :_reduce_43,
  3, 58, :_reduce_44,
  3, 58, :_reduce_45,
  3, 58, :_reduce_46,
  3, 58, :_reduce_47,
  3, 58, :_reduce_48,
  3, 58, :_reduce_49,
  3, 58, :_reduce_50,
  3, 58, :_reduce_51,
  2, 58, :_reduce_52,
  4, 58, :_reduce_53,
  4, 58, :_reduce_54,
  1, 58, :_reduce_none,
  3, 75, :_reduce_56,
  1, 75, :_reduce_57,
  3, 74, :_reduce_58,
  1, 74, :_reduce_none,
  1, 74, :_reduce_none,
  1, 74, :_reduce_none,
  1, 76, :_reduce_62,
  1, 76, :_reduce_63,
  1, 76, :_reduce_64,
  3, 76, :_reduce_65,
  3, 76, :_reduce_66,
  1, 76, :_reduce_67,
  1, 77, :_reduce_none,
  1, 77, :_reduce_none,
  1, 77, :_reduce_70,
  1, 77, :_reduce_71,
  7, 79, :_reduce_72,
  4, 79, :_reduce_73,
  0, 78, :_reduce_74,
  3, 78, :_reduce_75,
  5, 78, :_reduce_76,
  0, 81, :_reduce_77,
  1, 81, :_reduce_78,
  3, 81, :_reduce_79,
  0, 73, :_reduce_80,
  1, 73, :_reduce_81,
  3, 73, :_reduce_82,
  7, 80, :_reduce_83,
  4, 80, :_reduce_84,
  0, 82, :_reduce_85,
  1, 82, :_reduce_86,
  0, 83, :_reduce_87,
  2, 83, :_reduce_88,
  1, 72, :_reduce_89 ]

racc_reduce_n = 90

racc_shift_n = 177

racc_token_table = {
  false => 0,
  :error => 1,
  "." => 2,
  "!" => 3,
  "*" => 4,
  "/" => 5,
  "%" => 6,
  "+" => 7,
  "-" => 8,
  "==" => 9,
  "!=" => 10,
  ">" => 11,
  ">=" => 12,
  "<" => 13,
  "<=" => 14,
  "<>" => 15,
  "&&" => 16,
  "||" => 17,
  "=" => 18,
  "+=" => 19,
  "-=" => 20,
  "*=" => 21,
  "/=" => 22,
  "%=" => 23,
  ";" => 24,
  :BREAK => 25,
  :RETURN => 26,
  :IF => 27,
  "{" => 28,
  "}" => 29,
  :ELSE => 30,
  :ELSEIF => 31,
  :LOOP => 32,
  :WHILE => 33,
  :FOR => 34,
  "(" => 35,
  ")" => 36,
  "[" => 37,
  "]" => 38,
  :PRIVATE => 39,
  :PUBLIC => 40,
  :STATIC => 41,
  :CONST => 42,
  :NUMBER => 43,
  :STRING => 44,
  :BOOLEAN => 45,
  :NULL => 46,
  :SELF => 47,
  :SUPER => 48,
  :FUNCTION => 49,
  ":" => 50,
  "," => 51,
  :CLASS => 52,
  :IDENTIFIER => 53 }

racc_nt_base = 54

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
  "\".\"",
  "\"!\"",
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
  "\"<>\"",
  "\"&&\"",
  "\"||\"",
  "\"=\"",
  "\"+=\"",
  "\"-=\"",
  "\"*=\"",
  "\"/=\"",
  "\"%=\"",
  "\";\"",
  "BREAK",
  "RETURN",
  "IF",
  "\"{\"",
  "\"}\"",
  "ELSE",
  "ELSEIF",
  "LOOP",
  "WHILE",
  "FOR",
  "\"(\"",
  "\")\"",
  "\"[\"",
  "\"]\"",
  "PRIVATE",
  "PUBLIC",
  "STATIC",
  "CONST",
  "NUMBER",
  "STRING",
  "BOOLEAN",
  "NULL",
  "SELF",
  "SUPER",
  "FUNCTION",
  "\":\"",
  "\",\"",
  "CLASS",
  "IDENTIFIER",
  "$start",
  "program",
  "statements",
  "statement",
  "expr",
  "var_assign",
  "if_els_stmt",
  "loop_stmt",
  "for_stmt",
  "while_stmt",
  "if_stmt",
  "elif_stmts",
  "els_stmt",
  "elif_stmt",
  "access_md",
  "static_md",
  "const_md",
  "var_def",
  "identifier",
  "args",
  "primary",
  "variable",
  "lit",
  "object",
  "hash",
  "func_def",
  "class_def",
  "params",
  "expands",
  "var_assigns" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 15)
  def _reduce_2(val, _values, result)
    result = [:STATEMENTS, []]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 16)
  def _reduce_3(val, _values, result)
    result[1] << val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 17)
  def _reduce_4(val, _values, result)
    result[1] << val[1]
    result
  end
.,.,

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 25)
  def _reduce_11(val, _values, result)
    result = [:BREAK]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 26)
  def _reduce_12(val, _values, result)
    result = [:RETURN, [:INSTANCE, :NULL, nil]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 27)
  def _reduce_13(val, _values, result)
    result = [:RETURN, val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 29)
  def _reduce_14(val, _values, result)
    result = [:IF] + [([val[0]] + val[1] + [val[2]])]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 31)
  def _reduce_15(val, _values, result)
    result = [val[1], val[3]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 33)
  def _reduce_16(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 34)
  def _reduce_17(val, _values, result)
    result << val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 35)
  def _reduce_18(val, _values, result)
    result = [val[2], val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 36)
  def _reduce_19(val, _values, result)
    result = [val[1], val[3]]
    result
  end
.,.,

# reduce 20 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 39)
  def _reduce_21(val, _values, result)
    result = [[:INSTANCE, :BOOLEAN, nil, true], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 41)
  def _reduce_22(val, _values, result)
    result = [:LOOP, val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 43)
  def _reduce_23(val, _values, result)
    result = [:WHILE, val[1], val[3]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 45)
  def _reduce_24(val, _values, result)
    result = [:FOR, val[2], val[4], val[6], val[9]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 47)
  def _reduce_25(val, _values, result)
    result = ['=', val[0], val[1], val[2], val[3], val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 48)
  def _reduce_26(val, _values, result)
    result = ['=', nil, nil, nil, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 50)
  def _reduce_27(val, _values, result)
    result = [:VARIABLE, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 51)
  def _reduce_28(val, _values, result)
    result = [:VARIABLE, nil, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 52)
  def _reduce_29(val, _values, result)
    result = [:INDEX, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 54)
  def _reduce_30(val, _values, result)
    result = nil
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 55)
  def _reduce_31(val, _values, result)
    result = :PRIVATE
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 56)
  def _reduce_32(val, _values, result)
    result = :PUBLIC
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 58)
  def _reduce_33(val, _values, result)
    result = nil
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 59)
  def _reduce_34(val, _values, result)
    result = :STATIC
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 61)
  def _reduce_35(val, _values, result)
    result = nil
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 62)
  def _reduce_36(val, _values, result)
    result = :CONSTANT
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 64)
  def _reduce_37(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_add"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 65)
  def _reduce_38(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_sub"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 66)
  def _reduce_39(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, [:NUMBER_NEW, 0], [:IDENTIFIER, "_sub"]], [val[1]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 67)
  def _reduce_40(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_mul"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 68)
  def _reduce_41(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_div"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 69)
  def _reduce_42(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_mod"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 71)
  def _reduce_43(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_eq"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 72)
  def _reduce_44(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_neq"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 73)
  def _reduce_45(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_neq"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 74)
  def _reduce_46(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_gt"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 75)
  def _reduce_47(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_gte"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 76)
  def _reduce_48(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_lt"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 77)
  def _reduce_49(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_lte"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 79)
  def _reduce_50(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_and"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 80)
  def _reduce_51(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[0], [:IDENTIFIER, "_or"]], [val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 81)
  def _reduce_52(val, _values, result)
    result = [:FUNC_CALL, [:VARIABLE, val[1], [:IDENTIFIER, "_not"]], []]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 83)
  def _reduce_53(val, _values, result)
    result = [:FUNC_CALL, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 84)
  def _reduce_54(val, _values, result)
    result = [:INDEX, val[0], val[2]]
    result
  end
.,.,

# reduce 55 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 89)
  def _reduce_56(val, _values, result)
    result = [:VARIABLE, val[0], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 90)
  def _reduce_57(val, _values, result)
    result = [:VARIABLE, nil, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 92)
  def _reduce_58(val, _values, result)
    result = val[1]
    result
  end
.,.,

# reduce 59 omitted

# reduce 60 omitted

# reduce 61 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 97)
  def _reduce_62(val, _values, result)
    result = [:NUMBER_NEW, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 98)
  def _reduce_63(val, _values, result)
    result = [:STRING_NEW, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 99)
  def _reduce_64(val, _values, result)
    result = [:BOOLEAN_NEW, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 100)
  def _reduce_65(val, _values, result)
    result = [:LIST_NEW, val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 101)
  def _reduce_66(val, _values, result)
    result = [:HASH_NEW, val[1]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 102)
  def _reduce_67(val, _values, result)
    result = [:NULL_NEW]
    result
  end
.,.,

# reduce 68 omitted

# reduce 69 omitted

module_eval(<<'.,.,', 'radius_parser.ry', 106)
  def _reduce_70(val, _values, result)
    result = [:SELF]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 107)
  def _reduce_71(val, _values, result)
    result = [:SUPER]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 109)
  def _reduce_72(val, _values, result)
    result = [:FUNCTION, val[2], val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 110)
  def _reduce_73(val, _values, result)
    result = [:FUNCTION, [], val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 112)
  def _reduce_74(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 113)
  def _reduce_75(val, _values, result)
    result = [[val[0], val[2]]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 114)
  def _reduce_76(val, _values, result)
    result << [val[2], val[4]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 116)
  def _reduce_77(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 117)
  def _reduce_78(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 118)
  def _reduce_79(val, _values, result)
    result << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 120)
  def _reduce_80(val, _values, result)
    result = []
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 121)
  def _reduce_81(val, _values, result)
    result = [val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 122)
  def _reduce_82(val, _values, result)
    result << val[2]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 124)
  def _reduce_83(val, _values, result)
    result = [:CLASS_NEW, val[2], val[5]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 125)
  def _reduce_84(val, _values, result)
    result = [:CLASS_NEW, nil, val[2]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 127)
  def _reduce_85(val, _values, result)
    result = nil
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 128)
  def _reduce_86(val, _values, result)
    result = [:VARIABLE, nil, val[0]]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 130)
  def _reduce_87(val, _values, result)
    result = [:STATEMENTS, []]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 131)
  def _reduce_88(val, _values, result)
    result[1] << val[1]
    result
  end
.,.,

module_eval(<<'.,.,', 'radius_parser.ry', 133)
  def _reduce_89(val, _values, result)
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
    res = parser.parse(f.read.chomp)
    p (res)
  end
end
