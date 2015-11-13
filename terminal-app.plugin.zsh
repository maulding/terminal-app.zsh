##
# ZSH Terminal.app
# Ryan Maulding <ryan@drak.io>
#

typeset -gA _zta_emoji
_zta_emoji+=(brew '\U1f37a')   # beer mug
_zta_emoji+=(jekyll '\U1f489') # syringe
_zta_emoji+=(make '\U1f527')   # wrench

autoload -U add-zsh-hook

_zta_title_document()
{
  if [[ -e "${@[2]}" ]]; then
    print -Pn "\e]6;${@[2]}\a"
  fi
}
add-zsh-hook preexec _zta_title_document

_zta_terminal_pwd()
{
  print -Pn "\e]7;file://${USER}@$(hostname)${PWD}\a"
}
add-zsh-hook chpwd _zta_terminal_pwd; _zta_terminal_pwd

_zta_tab_title()
{
  if [[ -n ${_zta_emoji[${@[1]}]} ]]; then
    cmd="${_zta_emoji[${@[1]}]} ${@[1]}"; else
    cmd="${@[1]}"; fi
  if [[ -n ${@[2]} ]]; then cmd+=": ${@[2]}"; fi
  if [[ -n ${@[3]} ]]; then cmd+=" (${@[3]})"; fi
  print -Pn "\e]1;${cmd}\a"
}
add-zsh-hook preexec _zta_tab_title

_zta_window_title()
{
  print -Pn "\e]2;${(%):-"%n@%m"}\a"
}
add-zsh-hook precmd  _zta_window_title
add-zsh-hook preexec _zta_window_title
