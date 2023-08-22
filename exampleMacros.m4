divert(`-1')

# Non printable characters `Start of Text' \002 ^B and `Acknowledgement' \006 ^F can be set as quotes
# with macro `changequote' because they do not interfere with printable characters.

# Bitwise AND
ifelse(eval(`21 & 1'), `1', `Odd', `Even')
ifelse(eval(`22 & 1'), `1', `Odd', `Even')

define(`_swp', `1')
define(`swp', `define(`_$0', eval(incr(_$0) & 1))ifelse(_$0, `0', `Red', `Green')')
swp swp swp swp swp

# First use of Str is `', all others are `;' as in `[1;2;3;4;5]'
define(`Str', `define(`$0', `;')')
[Str`1'Str`2'Str`3'Str`4'Str`5']

# GNU m4 `esyscmd' re-reads output of a shell command; `syscmd' does not re-read output of a shell command
define(`Arg1', ``$1'')
# $1 in this case contains the year, $2 in this case contains newline character
define(`Year', `Arg1(esyscmd(`date "+%Y,"'))')
year is >Year<

# Concatenate arguments
define(`Cat', `translit(`$@', `,')')
Cat(`1', `2', `3', `4', `5', `6', `7', `8', `9', `10', `11', `12', `13', `14', `15', `16', `17', `18')

# Counter
define(`_cntr', `0')
define(`cntr', `ifelse(`$#', `1', `define(`_$0', `0')', `define(`_$0', incr(_$0))_$0`'')')
define(`count_args', `ifelse(eval(`$# > 1'), `1', `cntr: `$1'
$0(shift($@))', `cntr: `$1'')')
cntr()count_args(`a', `b', `c', `d', `e', `f')

# Average
define(`average', `ifelse(`$#', `0', ``$0'', `$#', `1', `$1', `eval(($1 + $2) / 2)')')

# Apply (higher-order macro), in GNU m4 there is builtin indir
define(`apply', `ifelse(`$#', `0', ``$0'', `$#', `1', `$1', `$1(shift($@))')')
cntr()apply(`count_args', `foo', `bar', `baz', `abc', `xyz')
cntr()indir(`count_args', `foo', `bar', `baz', `abc', `xyz')

# Currying is the technique of translating the evaluation of a function that takes multiple arguments
# into evaluating a sequence of functions, each with a single argument. Uncurrying: do the opposite.
# Currying and partial function application are often mistakenly conflated.
# Partial function application refers to the process of fixing a number of arguments to a function,
# producing another function of smaller arity. Arity: number of arguments taken by a function.
# Partial function application example:
define(`Times', `eval(`$1 * $2')')
define(`Partial1', `define(`$1', `$2'(``$3'', $`'@))')
Partial1(`Times3', `Times', `3')
Times3(`5')
define(`Partial2', `define(`$1', `$2'(``$3'', ``$4'', $`'@))')
Partial2(`Times35', `Times', `3', `5')
# Although Partial2 allows for the partially applied macro to have additional arguments, they are unused in this case.
Times35
dumpdef(`Partial1', `Partial2', `Times', `Times3', `Times35')

# Factorial, Fact(`12') is the limit for 32-bit signed integers, Fact(`13') results in an integer overflow and incorrect result.
define(`Fact', `ifelse(eval(`$1 <= 1'), 1, 1, `eval(`$1' * $0(decr(`$1')))')')
Fact(`12')
# Improved Factorial macro to avoid argument stack overflow in "eval"
define(`Fact', `_$0(`$1', `1')')
define(`_Fact', `ifelse(eval(`$1 <= 0'), `1', `$2', `$0(decr(`$1'), eval(`$1 * $2'))')')
Fact(`12')

# Fibonacci; Fib(`20') is 6765; m4's limit (32-bit signed integer): Fib(`46') is 1836311903
define(`Fib', `ifelse(`$1', `0', `0', `_$0(`$1', `1', `0')')')
define(`_Fib', `ifelse(`$1', `1', `$2', `$0(eval(`$1 - 1'), eval(`$2 + $3'), `$2')')')
Fib(`20')

# Mutual recursion
define(`Flip', `ifelse(eval(`$1 > 0'), `1', `On Flop(decr(`$1'))')')
define(`Flop', `ifelse(eval(`$1 > 0'), `1', `Off Flip(decr(`$1'))')')
Flip(`5')
Flop(`5')

# Loops
define(`loop', `ifelse(`$#', `0', ``$0'', `$2', `0', undefine(`$1'), `define(`$1', `$2')$3`'loop(`$1', decr(`$2'), `$3')')')
loop(`i', `10', `Counter is i ')

# Lists; (,) is considered to be a single argument, matching parentheses remove comma's special meaning.
# Use [...;...] for lists inside m4 (internal), (...,...) for lists outside m4 (external).
# IntList, ExtList transform lists from internal form into external form and the opposite.
define(`IntList', `translit(`$1', `(,)', `[;]')')
define(`ExtList', `translit(`$1', `[;]', `(,)')')
IntList(`(1,2,3,4,5,`foo',7)')
ExtList(`[1;2;3;4;5;`foo';7]')

# Adding item to a list with Cons
define(`Cons', `ifelse(`$2', `[]', `[$1]', `[`$1';substr(`$2', `1', decr(len(`$2')))')')
define(`Cons', `ifelse(`$2', `[]', `[$1]', `[`$1';substr(`$2', `1')')')
Cons(`hello', `[]')
Cons(`hello', `[world;bar;baz;foo]')

# Head and tail of the list
define(`HeadEnd', `HeadEndAux(`$1', `1', `0')')

define(`HeadEndAux',
  `define(`$0Char', substr(`$1', `$2',
    `1'))ifelse($0Char, `[', `$0(`$1', incr(`$2'), incr(`$3'))',
                $0Char, `]', `ifelse(`$3', `0', decr(`$2'), `$0(`$1', incr(`$2'), decr(`$3'))')',
                $0Char, `;', `ifelse(`$3', `0', decr(`$2'), `$0(`$1', incr(`$2'), `$3')')', `$0(`$1', incr(`$2'), `$3')')')

define(`Head', `substr(`$1', `1', HeadEnd(`$1'))')

define(`Tail', `define(`$0Pos', HeadEnd(`$1'))define(`$0Len',
  len(`$1'))ifelse($0Pos, eval($0Len - 2), `[]', `[substr(`$1', eval($0Pos + 2), eval($0Len - $0Pos - 2))')')

Head(`[foo;bar;baz]')
Head(`[foo[hello;world];bar;baz]')
Tail(`[foo;bar;baz]')
Tail(`[foo[hello;world];bar;baz]')

# Concatenating lists
define(`Concat', `ifelse(`$1', `[]', `$2', `$2', `[]', `$1', `substr(`$1', `0', decr(len(`$1')));substr(`$2', `1')')')

Concat(`[]', `[hello;world]')
Concat(`[foo;bar]', `[]')
Concat(`[foo;bar]', `[hello;world]')

# Length of the list; hangs the macro if argument is not a list
define(`Length', `LengthAux(`$1', `0')')
define(`LengthAux', `ifelse(`$1', `[]', `$2', `$0(Tail(`$1'), incr(`$2'))')')

Length(`[foo;bar;baz;abc;xyz;hello;world]')
Length(`[]')

# Reverse a list
define(`Reverse', `ReverseAux(`$1', `[]')')
define(`ReverseAux', `ifelse(`$1', `[]', `$2', `$0(Tail(`$1'), Cons(Head(`$1'), `$2'))')')
Reverse(`[foo;bar;baz;abc;xyz]')
Reverse(`[foo]')
Reverse(`[]')

# Apply a macro to all elements of a list; MapList rebuilds the list with results of applied macro.
define(`AppList', `ifelse(`$2', `[]', `', `$1(Head(`$2'))`'AppList(`$1', Tail(`$2'))')')

AppList(`incr', `[]')
AppList(`incr', `[1;2;3;4;5;6]')

define(`MapList', `MapListAux(`$1', `$2', `[')')
define(`MapListAux', `ifelse(`$2', `[]', `$3]',
  `ifelse(`$3', `[', `$0(`$1', Tail(`$2'), `$3'$1(Head(`$2')))', `$0(`$1', Tail(`$2'), `$3;'$1(Head(`$2')))')')')

MapList(`incr', `[]')
MapList(`incr', `[1;2;3;4;5]')

ExtList(MapList(`incr', `[1;2;3;4;5]'))
MapList(`incr', IntList(`(56,111,17)'))

# include(`exampleMacros.m4')dnl
divert(`0')
