#!/usr/bin/sbcl --script

#|
Intellectual property information START

Copyright (c) 2023 Ivan Bityutskiy

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

Intellectual property information END

Description START

The script writes M4 file.

m4 sample.m4

Description END
|#

(defparameter *backquote* #\Stx)
(defparameter *apostrophe* #\Ack)
(defparameter *m4file* "./sample.m4")

(with-open-file (test *m4file* :direction :output :if-exists :supersede)
  (format test "divert(`-1')~%")
  (format test "changequote(`~c', `~c')~%" *backquote* *apostrophe*)
  (format test "define(~cFOO~c, ~cBAR~c)~%"
    *backquote* *apostrophe* *backquote* *apostrophe*)
  (format test "define(~cBAZ~c, defn(~cFOO~c))~%"
    *backquote* *apostrophe* *backquote* *apostrophe*)
  (format test "define(~cABC~c, ~c~c$0~c~c)~%"
    *backquote* *apostrophe* *backquote* *backquote* *apostrophe* *apostrophe*)
  (format test "define(~cXYZ~c, ~c~cFOO~c~c)~%"
    *backquote* *apostrophe* *backquote* *backquote* *apostrophe* *apostrophe*)
  (format test "divert(~c0~c)dnl~%" *backquote* *apostrophe*)
  (format test "~cFOO~c:FOO~%~cBAZ~c:BAZ~%~cABC~c:ABC~%~cXYZ~c:XYZ~%"
    *backquote* *apostrophe* *backquote* *apostrophe* *backquote* *apostrophe* *backquote* *apostrophe*)
) ; with-open-file END

;; END OF SCRIPT

