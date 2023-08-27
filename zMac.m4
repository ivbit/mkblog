

# Print left and right quote symbols ` and '
define(`left_quote', `ifelse(`$#', `0', ``$0'', `changequote(`[',`]')`dnl'
changequote([`], ['])')')

define(`right_quote', `ifelse(`$#', `0', ``$0'', `changequote(`[', `]')dnl`
'changequote([`], ['])')')

left_quote()right_quote()

# Counter, first call initialize the counter to $1, no args == 0
define(`cntu', `ifelse(`$#', `0',
  `define(`_$0', `0')define(`$0', `_$0`'define(`_$0', incr(_$0))')',
  `define(`_$0', `$1')define(`$0', `_$0`'define(`_$0', incr(_$0))')')')

define(`cntd', `ifelse(`$#', `0',
  `define(`_$0', `0')define(`$0', `_$0`'define(`_$0', decr(_$0))')',
  `define(`_$0', `$1')define(`$0', `_$0`'define(`_$0', decr(_$0))')')')

define(`cntr', defn(`cntu'))
cntr(`711')cntr cntr() cntr cntr

define(`cntr', defn(`cntd'))
cntr(`-11')cntr cntr() cntr cntr

# Using `defn' to build a string from parts
define(`part1', `Some text. ')
define(`part2', `More text. ')
define(`part3', `Text.')
define(`full_text', defn(`part1', `part2', `part3'))
full_text

define(`full_text', defn(`full_text')``$1'')
full_text(` And more text')

