##
# ZSH + Terminal.app = ❤️
# Ryan Maulding <github@the8.us>
#
autoload -Uz add-zsh-hook

__the8_cmd_window()
{
  print -NPn "\e]2;${(%):-"%n@%m"}\a"
}

__the8_exe_window()
{
  print -NPn "\e]1;\U1F4BB\a" "\e]2;${(%):-"%n@%m"}\a"
}

__the8_exe_tab()
{
  print -NPn "\e]0;\U1F4BB\a" "\e]1;\U1F4BB\a"
  local _icon
  _icon=${${__the8_tabicon[${${(z)3}[1]}]}:-${__the8_tabicon[${_repl}]}}
  (print -NPn "\e]1;${_icon}\a" && sleep 0.1) &!
}

__the8_cmd_tab()
{
  print -NPn "\e]0;\U1F4BB\a" "\e]1;\U1F4BB\a"
}

__the8_exe_document()
{
  local _path _url
  for f in ${(@z)${1}}; do
    _path="${f/"~"/${HOME}}"
    if [[ -e "${_path}" ]]; then
      _path=`realpath -eL ${_path}`
      _url="file://${USER}@$(hostname)${_path}"
      print -NPn "\e]6;${_url}\a"
      return 0
    fi
  done
}

__the8_cmd_document()
{
  print -NPn "\e]6;\a"
}

__the8_pwd_terminal()
{
  local _url="file://${USER}@$(hostname)$(realpath -eL ${PWD})"
  print -NPn "\e]7;${_url}\a"
}

add-zsh-hook precmd  __the8_cmd_tab
add-zsh-hook precmd  __the8_cmd_window
add-zsh-hook precmd  __the8_cmd_document

add-zsh-hook preexec __the8_exe_tab
add-zsh-hook preexec __the8_exe_window
add-zsh-hook preexec __the8_exe_document

add-zsh-hook chpwd   __the8_pwd_terminal

typeset -gA __the8_tabicon
__the8_tabicon+=('brew'    $'\U1F37A'); # BEER MUG
__the8_tabicon+=('jekyll'  $'\U1F489'); # SYRINGE
__the8_tabicon+=('make'    $'\U1F6E0'); # HAMMER AND WRENCH
__the8_tabicon+=('rails'   $'\U1F6E4'); # RAILWAY TRACK
__the8_tabicon+=('grunt'   $'\U1F43D'); # PIG NOSE
__the8_tabicon+=('gulp'    $'\U1F379'); # TROPICAL DRINK
__the8_tabicon+=('bower'   $'\U1F3F9'); # BOW AND ARROW
__the8_tabicon+=('git'     $'\U1F3F7'); # LABEL
__the8_tabicon+=('hg'      $'\U1F3F7'); # LABEL
__the8_tabicon+=('svn'     $'\U1F3F7'); # LABEL
__the8_tabicon+=('cvs'     $'\U1F3F7'); # LABEL
__the8_tabicon+=('psql'    $'\U1F418'); # ELEPHANT
__the8_tabicon+=('mysql'   $'\U1F42C'); # DOLPHIN
__the8_tabicon+=('budle'   $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('budler'  $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('tar'     $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('zip'     $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('unzip'   $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('gzip'    $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('gunzip'  $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('bzip'    $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('bunzip'  $'\U1F4E6'); # PACKAGE
__the8_tabicon+=('java'    $'\U2615' ); # HOT BEVERAGE
__the8_tabicon+=('node'    $'\U2615' ); # HOT BEVERAGE
__the8_tabicon+=('coffee'  $'\U2615' ); # HOT BEVERAGE
__the8_tabicon+=('tail'    $'\U1F453'); # EYEGLASSES
__the8_tabicon+=('less'    $'\U1F453'); # EYEGLASSES
__the8_tabicon+=('more'    $'\U1F453'); # EYEGLASSES
__the8_tabicon+=('grep'    $'\U1F50E'); # RIGHT-POINTING MAGNIFYING GLASS
__the8_tabicon+=('ack'     $'\U1F50E'); # RIGHT-POINTING MAGNIFYING GLASS
__the8_tabicon+=('man'     $'\U1F4DA'); # BOOKS
__the8_tabicon+=('ssh'     $'\U1F5A5'); # DESKTOP COMPUTER
__the8_tabicon+=('rm'      $'\U1F5D1'); # WASTEBASKET
__the8_tabicon+=('docker-compose' $'\U1F433'); # SPOUTING WHALE
__the8_tabicon+=('docker'  $'\U1F433'); # SPOUTING WHALE
__the8_tabicon+=('python'  $'\U1F40D'); # SNAKE
__the8_tabicon+=('python3' $'\U1F40D'); # SNAKE
__the8_tabicon+=('_A'      $'\U1F1E6'); # REGIONAL INDICATOR SYMBOL LETTER A
__the8_tabicon+=('_B'      $'\U1F1E7'); # REGIONAL INDICATOR SYMBOL LETTER B
__the8_tabicon+=('_C'      $'\U1F1E8'); # REGIONAL INDICATOR SYMBOL LETTER C
__the8_tabicon+=('_D'      $'\U1F1E9'); # REGIONAL INDICATOR SYMBOL LETTER D
__the8_tabicon+=('_E'      $'\U1F1EA'); # REGIONAL INDICATOR SYMBOL LETTER E
__the8_tabicon+=('_F'      $'\U1F1EB'); # REGIONAL INDICATOR SYMBOL LETTER F
__the8_tabicon+=('_G'      $'\U1F1EC'); # REGIONAL INDICATOR SYMBOL LETTER G
__the8_tabicon+=('_H'      $'\U1F1ED'); # REGIONAL INDICATOR SYMBOL LETTER H
__the8_tabicon+=('_I'      $'\U1F1EE'); # REGIONAL INDICATOR SYMBOL LETTER I
__the8_tabicon+=('_J'      $'\U1F1EF'); # REGIONAL INDICATOR SYMBOL LETTER J
__the8_tabicon+=('_K'      $'\U1F1F0'); # REGIONAL INDICATOR SYMBOL LETTER K
__the8_tabicon+=('_L'      $'\U1F1F1'); # REGIONAL INDICATOR SYMBOL LETTER L
__the8_tabicon+=('_M'      $'\U1F1F2'); # REGIONAL INDICATOR SYMBOL LETTER M
__the8_tabicon+=('_N'      $'\U1F1F3'); # REGIONAL INDICATOR SYMBOL LETTER N
__the8_tabicon+=('_O'      $'\U1F1F4'); # REGIONAL INDICATOR SYMBOL LETTER O
__the8_tabicon+=('_P'      $'\U1F1F5'); # REGIONAL INDICATOR SYMBOL LETTER P
__the8_tabicon+=('_Q'      $'\U1F1F6'); # REGIONAL INDICATOR SYMBOL LETTER Q
__the8_tabicon+=('_R'      $'\U1F1F7'); # REGIONAL INDICATOR SYMBOL LETTER R
__the8_tabicon+=('_S'      $'\U1F1F8'); # REGIONAL INDICATOR SYMBOL LETTER S
__the8_tabicon+=('_T'      $'\U1F1F9'); # REGIONAL INDICATOR SYMBOL LETTER T
__the8_tabicon+=('_U'      $'\U1F1FA'); # REGIONAL INDICATOR SYMBOL LETTER U
__the8_tabicon+=('_V'      $'\U1F1FB'); # REGIONAL INDICATOR SYMBOL LETTER V
__the8_tabicon+=('_W'      $'\U1F1FC'); # REGIONAL INDICATOR SYMBOL LETTER W
__the8_tabicon+=('_X'      $'\U1F1FD'); # REGIONAL INDICATOR SYMBOL LETTER X
__the8_tabicon+=('_Y'      $'\U1F1FE'); # REGIONAL INDICATOR SYMBOL LETTER Y
__the8_tabicon+=('_Z'      $'\U1F1FF'); # REGIONAL INDICATOR SYMBOL LETTER Z
__the8_tabicon+=('__'      $'\U2049' ); # EXCLAMATION QUESTION MARK

