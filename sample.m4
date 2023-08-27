divert(`-1')
changequote(`', `')
define(FOO, BAR)
define(BAZ, defn(FOO))
define(ABC, $0)
define(XYZ, FOO)
divert(0)dnl
FOO:FOO
BAZ:BAZ
ABC:ABC
XYZ:XYZ
