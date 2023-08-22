divert(`-1')
# Copyright (c) 2023 Ivan Bityutskiy 
# 
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# Usage:
# >| blog.html m4 --gnu -- blog.m4
# >| blog.html m4 --gnu -D rmt_srv_ -- blog.m4
changecom(`#####', `
')
define(`divert', `ifelse(`$#', `0', ``$0'', `builtin(`$0', $@)')')
define(`fname___', ./blog.txt)
define(`fnamed___', ./bloged.txt)
changequote(`[', `]')
syscmd([>| ]fnamed___()[ sed 's/&/\&#38;/g;s/,/\&#44;/g;s/'\''/\&#39;/g;s/"/\&#34;/g;s/`/\&#96;/g;s/\$/\&#36;/g;s/</\&#60;/g;s/>/\&#62;/g' ]fname___())
changequote([`], ['])
define(`set_url_', `ifelse(`$#', `0', ``$0'',
  `ifdef(`rmt_srv_', `substr(`$1', `0', index(`$1', ` '))', `substr(`$1', incr(index(`$1', ` ')))')')')
define(`ttl_', `ifelse(`$#', `0', ``$0'', `syscmd(`sed "1s/^dnl //;q" 'fnamed___()` | tr -d "\n"')')')
define(`authr_', `ifelse(`$#', `0', ``$0'', `Ivan&#160;Bityutskiy')')
define(`dtyear_', `ifelse(`$#', `0', ``$0'', `syscmd(`date "+%Y" | tr -d "\n"')')')
define(`cprt_', `ifelse(`$#', `0', ``$0'', `Copyright &#169; dtyear_() authr_()')')
define(`s_', `ifelse(`$#', `0', ``$0'', `<section>$1</section>')')
define(`h_', `ifelse(`$#', `0', ``$0'', `<h3>$1</h3>')')
define(`ul_', `ifelse(`$#', `0', ``$0'', `<ul>$1</ul>')')
define(`ol_', `ifelse(`$#', `0', ``$0'', `<ol>$1</ol>')')
define(`li_', `ifelse(`$#', `0', ``$0'', `<li>$1</li>')')
define(`p_', `ifelse(`$#', `0', ``$0'', `<p>$1</p>')')
define(`c_', `ifelse(`$#', `0', ``$0'', `<code>$1</code>')')
define(`pre_', `ifelse(`$#', `0', ``$0'', `<pre>$1</pre>')')
define(`spw_', `ifelse(`$#', `0', ``$0'', `<span class="warning">$1</span>')')
define(`b_', `ifelse(`$#', `0', ``$0'', `<strong>$1</strong>')')
define(`i_', `ifelse(`$#', `0', ``$0'', `<em>$1</em>')')
##### Guillemets and quotes: standard and alternative Russian quotation.
define(`laq_', `ifelse(`$#', `0', ``$0'', `&#171;$1&#187;')')
define(`nesq_', `ifelse(`$#', `0', ``$0'', `&#8222;$1&#8220;')')
define(`altlaq_', `ifelse(`$#', `0', ``$0'', `&#8220;$1&#8221;')')
define(`altnesq_', `ifelse(`$#', `0', ``$0'', `&#8216;$1&#8217;')')
##### Unmatched left parenthesis will break all macros, it should be replaced.
define(`lparen_', `ifelse(`$#', `0', ``$0'', `&#40;')')
##### Unmatched right parenthesis will break all macros, it should be replaced.
define(`rparen_', `ifelse(`$#', `0', ``$0'', `$1&#41;')')
define(`paren_', `ifelse(`$#', `0', ``$0'', `&#40;$1&#41;')')
define(`angb_', `ifelse(`$#', `0', ``$0'', `&#9001;$1&#9002;')')
define(`br_', `ifelse(`$#', `0', ``$0'', `$1<br />')')
define(`cpy_', `ifelse(`$#', `0', ``$0'', `&#169;')')
define(`cpysr_', `ifelse(`$#', `0', ``$0'', `&#8471;')')
define(`rg_', `ifelse(`$#', `0', ``$0'', `&#174;')')
define(`tm_', `ifelse(`$#', `0', ``$0'', `&#8482;')')
define(`numerosign_', `ifelse(`$#', `0', ``$0'', `&#8470;')')
define(`larr_', `ifelse(`$#', `0', ``$0'', `$1&#8592;')')
define(`rarr_', `ifelse(`$#', `0', ``$0'', `&#8594;')')
define(`llarr_', `ifelse(`$#', `0', ``$0'', `$1&#10229;')')
define(`lrarr_', `ifelse(`$#', `0', ``$0'', `&#10230;')')
##### Non-breaking space, non-breaking hyphen, soft hyphen.
define(`nbsp_', `ifelse(`$#', `0', ``$0'', `$1&#160;')')
define(`nbhyp_', `ifelse(`$#', `0', ``$0'', `$1&#8209;')')
define(`shyp_', `ifelse(`$#', `0', ``$0'', `$1&#173;')')
##### Symbols.
define(`sct_', `ifelse(`$#', `0', ``$0'', `&#167;')')
define(`pmrk_', `ifelse(`$#', `0', ``$0'', `&#182;')')
define(`degr_', `ifelse(`$#', `0', ``$0'', `$1&#176;')')
define(`mnt_', `ifelse(`$#', `0', ``$0'', `$1&#8242;')')
define(`scnd_', `ifelse(`$#', `0', ``$0'', `$1&#8243;')')
define(`ceur_', `ifelse(`$#', `0', ``$0'', `&#8364;')')
define(`crub_', `ifelse(`$#', `0', ``$0'', `$1&#8381;')')
##### An unspaced em-dash or a spaced en-dash can be used to mark a break in a sentence.
define(`ndsh_', `ifelse(`$#', `0', ``$0'', `&#8211;')')
define(`blt_', `ifelse(`$#', `0', ``$0'', `&#8226;')')
##### Box-drawing characters
define(`bdc_', `ifelse(`$#', `0', ``$0'', `&#9500;&#9472;')')
define(`bdce_', `ifelse(`$#', `0', ``$0'', `&#9492;&#9472;')')
##### Links: URL and text are separated by a ` ' space character.
define(`a_', `ifelse(`$#', `0', ``$0'', `<a href="'substr(`$1', `0', index(`$1', ` '))`">'substr(`$1', incr(index(`$1', ` ')))`</a>')')
define(`ab_', `ifelse(`$#', `0', ``$0'',
  `<a href="'substr(`$1', `0', index(`$1', ` '))`" target="_blank">'substr(`$1', incr(index(`$1', ` ')))`</a>')')
divert(`0')dnl
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="ttl_()" />
  <title>ttl_()</title>
  <link rel="stylesheet" type="text/css" href="set_url_(/style.css ../../style.css)" />
  <link rel="icon" href="set_url_(/favicon.ico ../../favicon.ico)" />
</head>
<body>
  <header>
    <nav>
      <ul>
        <li><a href="set_url_(/ ../../index.html)">Blog</a></li>
        <li><a href="set_url_(/about ../../about.html)">About</a></li>
      </ul>
    </nav>
  </header>
  <main class="mainAbout">
    <h1>ttl_()</h1>
include(fnamed___())dnl
  </main>
  <footer>
    <p class="centertxt">cprt_()</p>
    <p class="centertxt">Permission is granted to make and distribute verbatim copies<br />
    of this entire document without royalty provided the copyright<br />
    notice and this permission notice are preserved.</p>
    <p class="centertxt">The documentation is provided &#34;as is&#34; and the author disclaims<br />
    all warranties with regard to this documentation including all<br />
    implied warranties of merchantability and fitness. In no event shall the<br />
    author be liable for any special&#44; direct&#44; indirect&#44; or consequential<br />
    damages or any damages whatsoever resulting from loss of use&#44; data or<br />
    profits&#44; whether in an action of contract&#44; negligence or other tortious<br />
    action&#44; arising out of or in connection with the use or performance of<br />
    this documentation.</p>
    <p class="centertxt">This page is free from cookies and javascript.</p>
  </footer>
</body>
</html>

