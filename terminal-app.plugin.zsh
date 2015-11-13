##
# DrakPak4Mac: ZSH + Terminal.app = ❤️
# Ryan Maulding <ryan@drak.io>
#

autoload -Uz add-zsh-hook

# remove grml screen_title/xterm_title hooks from stack
add-zsh-hook -d precmd  grml_reset_screen_title
add-zsh-hook -d precmd  grml_vcs_to_screen_title
add-zsh-hook -d preexec grml_cmd_to_screen_title
add-zsh-hook -d preexec grml_control_xterm_title

drak_window_title()
{
  print -Pn "\e]0;\a"
  print -Pn "\e]1;\a"
  print -Pn "\e]6;\a"
  print -Pn "\e]2;${(%):-"%n@%m"}\a"
}
add-zsh-hook precmd drak_window_title

drak_terminal_pwd()
{
  print -Pn "\e]7;file://${USER}@$(hostname)${PWD}\a"
}
add-zsh-hook chpwd drak_terminal_pwd; drak_terminal_pwd

drak_title_document()
{
  if [[ -e "${${(z)@[3]}[2,-1]}" ]]; then
    print -Pn "\e]6;${${(z)@[3]}[2,-1]}\a"
  fi
}
add-zsh-hook preexec drak_title_document

drak_tab_title()
{
  #regexp-replace "$3" "-{1,2}(\\w+)=?[\"']?(.*)[\"']?" ""
  local _psvar=$psvar
  local format=${${drak_tabfmt[${${(z)3}[1]}]}:-${drak_tabfmt[]}}
  local icon=${${drak_tabicon[${${(z)3}[1]}]}:-${drak_tabicon[]}}
  local args=(${icon} ${(zu)${(z)3}[1,${${(ps.|.)format}[2]}]})
  psvar=${(z)args} print -Pn "\e]2;${${(ps.|.)format}[1]}\a"
  psvar=$_psvar
}
add-zsh-hook preexec drak_tab_title

typeset -gA drak_tabfmt
drak_tabfmt+=('man'    '%v %2v%4(V.: %4v.%3(V.: %3v.))%4(V.(%3v%).)|3');
drak_tabfmt+=('brew'   '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('jekyll' '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('git'    '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('hg'     '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('svn'    '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('rails'  '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('grunt'  '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('gulp'   '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('bower'  '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=('make'   '%v %2v%3(V.: %3v.)|2');
drak_tabfmt+=(''       '%v %2v|1');

typeset -gA drak_tabicon
drak_tabicon+=('brew'   $'\U1F37A'); # BEER MUG
drak_tabicon+=('jekyll' $'\U1F489'); # SYRINGE
drak_tabicon+=('make'   $'\U1F527'); # WRENCH
drak_tabicon+=('git'    $'\U1F529'); # NUT AND BOLT
drak_tabicon+=('hg'     $'\U1F529'); # NUT AND BOLT
drak_tabicon+=('svn'    $'\U1F529'); # NUT AND BOLT
drak_tabicon+=('cvs'    $'\U1F529'); # NUT AND BOLT
drak_tabicon+=('rails'  $'\U1F6E4'); # RAILWAY TRACK
drak_tabicon+=('grunt'  $'\U1F43D'); # PIG NOSE
drak_tabicon+=('gulp'   $'\U1F379'); # TROPICAL DRINK
drak_tabicon+=('bower'  $'\U1F3F9'); # BOW AND ARROW
drak_tabicon+=('psql'   $'\U1F418'); # ELEPHANT
drak_tabicon+=('mysql'  $'\U1F42C'); # DOLPHIN
drak_tabicon+=('budle'  $'\U1F4E6'); # PACKAGE
drak_tabicon+=('budler' $'\U1F4E6'); # PACKAGE
drak_tabicon+=('tar'    $'\U1F4E6'); # PACKAGE
drak_tabicon+=('zip'    $'\U1F4E6'); # PACKAGE
drak_tabicon+=('unzip'  $'\U1F4E6'); # PACKAGE
drak_tabicon+=('gzip'   $'\U1F4E6'); # PACKAGE
drak_tabicon+=('gunzip' $'\U1F4E6'); # PACKAGE
drak_tabicon+=('bzip'   $'\U1F4E6'); # PACKAGE
drak_tabicon+=('bunzip' $'\U1F4E6'); # PACKAGE
drak_tabicon+=('java'   $'\U2615' ); # HOT BEVERAGE
drak_tabicon+=('node'   $'\U2615' ); # HOT BEVERAGE
drak_tabicon+=('coffee' $'\U2615' ); # HOT BEVERAGE
drak_tabicon+=('tail'   $'\U1F453'); # EYEGLASSES
drak_tabicon+=('less'   $'\U1F453'); # EYEGLASSES
drak_tabicon+=('more'   $'\U1F453'); # EYEGLASSES
drak_tabicon+=('grep'   $'\U1F50E'); # RIGHT-POINTING MAGNIFYING GLASS
drak_tabicon+=('ack'    $'\U1F50E'); # RIGHT-POINTING MAGNIFYING GLASS
drak_tabicon+=('man'    $'\U1F4DA'); # BOOKS
drak_tabicon+=('ssh'    $'\U1F5A5'); # DESKTOP COMPUTER
drak_tabicon+=(''       $'\U2753');  # BLACK QUESTION MARK ORNAMENT

