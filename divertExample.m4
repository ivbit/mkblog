divert(`-1')
changequote(`☾', `☽')
define(☾SAFE_DIVERT☽, defn(☾divert☽))
# builtin - GNU M4 only:
# define(☾divert☽, ☾ifelse(☾$#☽, ☾0☽, ☾☾$0☽☽, ☾builtin(☾$0☽, $@)☽)☽)
undefine(☾divert☽)
define(☾FOO☽, ☾SAFE_DIVERT(☾0☽)☾Hello world!☽SAFE_DIVERT(☾-1☽)☽)
divert(☾0☽)At 0
define(☾BAR☽, ☾SAFE_DIVERT(☾0☽)☾Как дела?☽SAFE_DIVERT(☾-1☽)☽)
divert(☾0☽)divert At 0
define(☾BAZ☽, ☾SAFE_DIVERT(☾0☽)☾您好哇!☽SAFE_DIVERT(☾-1☽)☽)
divert(☾3☽)At 3
define(☾SPACE☽, ☾SAFE_DIVERT(☾0☽)☾ ☽SAFE_DIVERT(☾-1☽)☽)
divert(☾1☽)At 1
define(☾NEWLINE☽, ☾SAFE_DIVERT(☾0☽)☾
☽SAFE_DIVERT(☾-1☽)☽)
divert(☾5☽)At 5
FOO☾☽SPACE☾☽BAR☾☽NEWLINE☾☽BAZ☾☽NEWLINE☾☽

