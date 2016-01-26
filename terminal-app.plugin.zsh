##
# ZSH + Terminal.app = ❤️
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
  print -Pn "\e]1;\a" "\e]6;\a"
  print -Pn "\e]2;${(%):-"%n@%m"}\a"
}
add-zsh-hook precmd drak_window_title

drak_terminal_pwd()
{
  local _url="file://${USER}@$(hostname)$(realpath -eL ${PWD})"
  print -Pn "\e]7;${_url}\a"
}
add-zsh-hook chpwd drak_terminal_pwd; drak_terminal_pwd

drak_title_document()
{
  local _path _url
  for f in ${(@z)${1}}; do
    _path="${f/"~"/${HOME}}"
    if [[ -e "${_path}" ]]; then
      _path=`realpath ${_path}`
      _url="file://${USER}@$(hostname)${_path}"
      print -Pn "\e]6;${_url}\a"
      return 0
    fi
  done
}
add-zsh-hook preexec drak_title_document

drak_tab_title()
{
  local _psvar _icon
  _icon=${${drak_tabicon[${${(z)3}[1]}]}:-${drak_tabicon[${_repl}]}}
  _psvar=${psvar} \
    && psvar=(${_args}) print -Pn "\e]1;${_icon}\a" \
    && psvar=${_psvar}
}
add-zsh-hook preexec drak_tab_title

typeset -gA drak_tabicon
drak_tabicon+=('brew'   $'\U1F37A'); # BEER MUG
drak_tabicon+=('jekyll' $'\U1F489'); # SYRINGE
drak_tabicon+=('make'   $'\U1F6E0'); # HAMMER AND WRENCH
drak_tabicon+=('rails'  $'\U1F6E4'); # RAILWAY TRACK
drak_tabicon+=('grunt'  $'\U1F43D'); # PIG NOSE
drak_tabicon+=('gulp'   $'\U1F379'); # TROPICAL DRINK
drak_tabicon+=('bower'  $'\U1F3F9'); # BOW AND ARROW
drak_tabicon+=('git'    $'\U1F3F7'); # LABEL
drak_tabicon+=('hg'     $'\U1F3F7'); # LABEL
drak_tabicon+=('svn'    $'\U1F3F7'); # LABEL
drak_tabicon+=('cvs'    $'\U1F3F7'); # LABEL
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
drak_tabicon+=('rm'     $'\U1F5D1'); # WASTEBASKET
drak_tabicon+=('_A'     $'\U1F1E6'); # REGIONAL INDICATOR SYMBOL LETTER A
drak_tabicon+=('_B'     $'\U1F1E7'); # REGIONAL INDICATOR SYMBOL LETTER B
drak_tabicon+=('_C'     $'\U1F1E8'); # REGIONAL INDICATOR SYMBOL LETTER C
drak_tabicon+=('_D'     $'\U1F1E9'); # REGIONAL INDICATOR SYMBOL LETTER D
drak_tabicon+=('_E'     $'\U1F1EA'); # REGIONAL INDICATOR SYMBOL LETTER E
drak_tabicon+=('_F'     $'\U1F1EB'); # REGIONAL INDICATOR SYMBOL LETTER F
drak_tabicon+=('_G'     $'\U1F1EC'); # REGIONAL INDICATOR SYMBOL LETTER G
drak_tabicon+=('_H'     $'\U1F1ED'); # REGIONAL INDICATOR SYMBOL LETTER H
drak_tabicon+=('_I'     $'\U1F1EE'); # REGIONAL INDICATOR SYMBOL LETTER I
drak_tabicon+=('_J'     $'\U1F1EF'); # REGIONAL INDICATOR SYMBOL LETTER J
drak_tabicon+=('_K'     $'\U1F1F0'); # REGIONAL INDICATOR SYMBOL LETTER K
drak_tabicon+=('_L'     $'\U1F1F1'); # REGIONAL INDICATOR SYMBOL LETTER L
drak_tabicon+=('_M'     $'\U1F1F2'); # REGIONAL INDICATOR SYMBOL LETTER M
drak_tabicon+=('_N'     $'\U1F1F3'); # REGIONAL INDICATOR SYMBOL LETTER N
drak_tabicon+=('_O'     $'\U1F1F4'); # REGIONAL INDICATOR SYMBOL LETTER O
drak_tabicon+=('_P'     $'\U1F1F5'); # REGIONAL INDICATOR SYMBOL LETTER P
drak_tabicon+=('_Q'     $'\U1F1F6'); # REGIONAL INDICATOR SYMBOL LETTER Q
drak_tabicon+=('_R'     $'\U1F1F7'); # REGIONAL INDICATOR SYMBOL LETTER R
drak_tabicon+=('_S'     $'\U1F1F8'); # REGIONAL INDICATOR SYMBOL LETTER S
drak_tabicon+=('_T'     $'\U1F1F9'); # REGIONAL INDICATOR SYMBOL LETTER T
drak_tabicon+=('_U'     $'\U1F1FA'); # REGIONAL INDICATOR SYMBOL LETTER U
drak_tabicon+=('_V'     $'\U1F1FB'); # REGIONAL INDICATOR SYMBOL LETTER V
drak_tabicon+=('_W'     $'\U1F1FC'); # REGIONAL INDICATOR SYMBOL LETTER W
drak_tabicon+=('_X'     $'\U1F1FD'); # REGIONAL INDICATOR SYMBOL LETTER X
drak_tabicon+=('_Y'     $'\U1F1FE'); # REGIONAL INDICATOR SYMBOL LETTER Y
drak_tabicon+=('_Z'     $'\U1F1FF'); # REGIONAL INDICATOR SYMBOL LETTER Z
drak_tabicon+=('__'     $'\U2049' ); # EXCLAMATION QUESTION MARK

