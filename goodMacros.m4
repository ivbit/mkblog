divert(`-1')
define(`cls', `syscmd(`clear')')
define(`divert', `ifelse(`$#', `0', ``$0'', `builtin(`$0', $@)')')
define(`cleardivert', `pushdef(`_num', divnum)divert(`-1')ifelse(`$#', `0', `undivert`'', `undivert($@)')divert(_num)popdef(`_num')')
define(`reverse', `ifelse(`$#', `0', ``$0'', `$#', `1', ``$1'', `$0(shift($@)), `$1'')')
define(`cond', `ifelse(`$#', `0', ``$0'', `$#', `1', `$1', `ifelse($1, `$2', `$3', `$0(shift(shift(shift($@))))')')')
define(`argn', `ifelse(`$1', `1', ``$2'', `argn(decr(`$1'), shift(shift($@)))')')
define(`mpara', `ifelse(`$#', `0', ``$0'', `<p>$1</p>')')


divert(`0')
