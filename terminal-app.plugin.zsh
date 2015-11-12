##
# ZSH Terminal.app
# Ryan Maulding <ryan@drak.io>
#

function _zta_title_document () {
  two=$(echo $1 | awk '{print $2}')
  if [[ -e "$two" ]]; then
    print -Pn "\e]6;\a"
  fi
}
add-zsh-hook preexec _zta_title_document

function _zta_terminal_pwd () {
  print -Pn "\e]7;file://${USER}@$(hostname)${PWD}\a"
}
add-zsh-hook chpwd _zta_terminal_pwd; _zta_terminal_pwd

typeset -A _zta_emoji
_zta_emoji+=("brew"   "\U1f37a") # beer mug
_zta_emoji+=("jekyll" "\U1f489") # syringe
_zta_emoji+=("make"   "\U1f527") # wrench

function _zta_tab_title () {
  one=$(echo $1 | awk '{print $1}')
  if [[ -n "$one" ]]; then img="${_zta_emoji[${one}]}"; fi
  two=$(echo $1 | awk '{print $2}')
  three=$(echo $1 | awk '{print $3}')
  if [[ -n "$img" ]]; then cmd="${img} ${one}"; else cmd="${one}"; fi
  if [[ -n "$two" ]]; then cmd+=": ${two}"; fi
  if [[ -n "$three" ]]; then cmd+=" (${three})"; fi
  print -Pn "\e]1;${cmd}\a"
}
add-zsh-hook preexec _zta_tab_title

function _zta_window_title () {
  print -Pn "\e]2;${(%):-"%n@%m"}\a"
}
add-zsh-hook precmd  _zta_window_title
add-zsh-hook preexec _zta_window_title
