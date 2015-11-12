source emoji.zsh

function _emogicmd_tab_title () {
  one=$(echo $1 | awk '{print $1}')
  img="${_emojicmd[$one]}"
  two=$(echo $1 | awk '{print $2}')
  three=$(echo $1 | awk '{print $3}')
  if [[ -n "$img" ]]; then
    cmd="${img} ${one}"
  else
    cmd="${one}"
  fi
  if [[ -n "$two" ]]; then
    cmd+=": ${two}"
  fi
  if [[ -n "$three" ]]; then
    cmd+=" (${three})"
  fi
  echo -en "\e]1;${cmd}\a"
}; add-zsh-hook precmd tab_title

typeset -A _emojicmd
_emojicmd+=('brew'   ${emoji[beer_mug]})
_emojicmd+=('jekyll' ${emoji[syringe]})
_emojicmd+=('make'   ${emoji[wrench]})
