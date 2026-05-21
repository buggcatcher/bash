#########################
#			            #
#	     ALIASES	    #
#			            #
#########################

alias missing="/nfs/homes/mailinci/repo/bash/missing.sh"
alias mini="bash ~/mini-moulinette/mini-moul.sh"
alias gg="gcc -Werror -Wall -Wextra"
alias francinette=/nfs/homes/mailinci/francinette/tester.sh
alias paco=/nfs/homes/mailinci/francinette/tester.sh
alias grind=valgrind -s --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose
alias grademe=bash -c "$(curl https://grademe.fr)"
alias la="pwd && ls -lha"
alias clip="xclip -selection clipboard"
alias clipc='cat -- *.c 2>/dev/null | xclip -selection clipboard'
alias studio="cd /home/nautilus/Coding/Android/android-studio-2023.3.1.18-linux/android-studio/bin && ./studio.sh &"
alias map="telnet mapscii.me "
alias ship='echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠤⠴⠶⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠀⠂⠉⡇⠀⠀⠀⢰⣿⣿⣿⣿⣧⠀⠀⢀⣄⣀⠀⠀⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⢠⣶⣶ⷷ⠀⠀⠀⠸⠟⠁⠀⡇⠀⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠘⠟⢹⣋⣀⡀⢀⣤⣶⣿⣿⣿⣿⣿⡿⠛⣠⣼⣿⡟⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⣴⣾⣿⣿⣿⣿⢁⣾⣿⣿⣿⣿⣿⣿⡿⢁⣾⣿⣿⣿⠁⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⠿⠇⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠳⣤⣙⠟⠛⢻⠿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣇⠘⠉⠀⢸⠀⢀⣠⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠈⠻⣷⣦⣼⠀⠀⠀⢻⣿⣿⠿⢿⡿⠿⣿⡄⠀⠀⣼⣷⣿⣿⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣶⣄⡈⠉⠀⠀⢸⡇⠀⠀⠉⠂⠀⣿⣿⣿⣧⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣷⣤⣀⣸⣧⣠⣤⣴⣶⣾⣿⣿⣿⡿⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠉⠀⠀⠀⠀"; \
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"'


#########################
#			            #
#	     SCRIPTS	    #
#			            #
#########################

gittree() {
  git fetch origin 2>/dev/null

  local tmpfile
  tmpfile=$(mktemp)
  git --no-pager log --all -n 24 \
    --pretty=format:"%h" 2>/dev/null | while read -r hash; do
    stat=$(git diff --shortstat "${hash}^" "${hash}" 2>/dev/null)
    ins=$(echo "$stat" | grep -oP '\d+(?= insertion)' || echo 0)
    del=$(echo "$stat" | grep -oP '\d+(?= deletion)' || echo 0)
    [[ -z "$ins" ]] && ins=0
    [[ -z "$del" ]] && del=0
    echo "${hash} +${ins} -${del}" >> "$tmpfile"
  done

  git --no-pager log \
    --graph --all --decorate --abbrev-commit -n 24 \
    --color=always \
    --pretty=format:'%C(yellow)%h%C(reset)%C(auto)%d%C(reset) %s  %C(cyan)%an%C(reset)  %C(green)%cr%C(reset) %C(white dim)(%cd)%C(reset)' \
    --date=format:'%d/%m %H:%M' 2>/dev/null | \
  while IFS= read -r line; do
    hash=$(echo "$line" | grep -oP '[0-9a-f]{7}' | head -1)
    if [[ -n "$hash" ]]; then
      statline=$(grep "^$hash " "$tmpfile" 2>/dev/null)
      ins=$(echo "$statline" | grep -oP '\+\d+')
      del=$(echo "$statline" | grep -oP '\-\d+')
      if [[ -n "$ins" ]]; then
        printf "%s  \033[38;5;76m%s\033[0m \033[38;5;196m%s\033[0m\n" "$line" "$ins" "$del"
      else
        echo "$line"
      fi
    else
      echo "$line"
    fi
  done

  rm -f "$tmpfile"
  echo
}

scout()
{
    tmpfile="/tmp/ranger-cd-$$"
    ranger --choosedir="$tmpfile" "${@:-$PWD}"
    test -f "$tmpfile" && test "$(cat "$tmpfile")" != "$(pwd)" && cd "$(cat "$tmpfile")"
    rm -f "$tmpfile"
}

srcmd() {
    compgen -c | sort | fzf --preview 'man {}' --preview-window 'right:60%:wrap' | xargs man
} 

srcfile() {
  local selected
  selected=$(find . -type f 2>/dev/null \
    | fzf --preview 'bat --style=numbers --color=always --line-range=:100 {} 2>/dev/null || head -n 100 {}' \
          --preview-window='right:60%:wrap' \
          --height=90% --layout=reverse --border)

  if [[ -n "$selected" ]]; then
    local dir
    dir=$(dirname "$selected")
    cd "$dir" || return
    echo "Moved to: $dir"
  fi
}

srcman()
{
    local man_page
    man_page=$(man -k . | sort | fzf --prompt='Man Pages> ' --preview='echo {} | awk "{print \$1}" | xargs man' --preview-window=down:50%:wrap)
    man "$(echo "$man_page" | awk '{print $1}')"
}

convert_segments() {
  local input="$1"
  local cmd="$2"
  local full_format="$3"
  local result=""
  local seg
  IFS='.'
  
  for seg in ${=input}; do
    local bc_cmd=$(echo "$cmd" | sed "s/SEG/$seg/")
    local conv=$(echo "$bc_cmd" | bc 2>/dev/null)
    
    if [ $? -ne 0 ] || [ -z "$conv" ]; then
      conv="ERROR"
    elif [ "$full_format" = "true" ] && [ "$cmd" = "obase=2; SEG" ]; then
      conv=$(printf "%08d" "$conv")
    fi
    
    result="${result}${result:+.}$conv"
  done
  
  unset IFS
  echo "$result"
}

itob() {
  if [ "$1" = "--full" ]; then
    convert_segments "$2" "obase=2; SEG" "true"
  else
    convert_segments "$1" "obase=2; SEG" "false"
  fi
}



btoi() { convert_segments "$1" "ibase=2; SEG" "false"; }
itoh() { convert_segments "$1" "obase=16; SEG" "false"; }
htoi() { convert_segments "$(echo $1 | tr '[:lower:]' '[:upper:]')" "ibase=16; SEG" "false"; }
btoh() { convert_segments "$1" "ibase=2; obase=16; SEG" "false"; }
htob() { convert_segments "$(echo $1 | tr '[:lower:]' '[:upper:]')" "ibase=16; obase=2; SEG" "false"; }



command_not_found_handler() {
  if [[ "$*" == *grazie* ]]; then
    sleep 0.5
    echo -n '.'
    sleep 0.1
    echo -n '.' 
    sleep 0.1
    echo -n '.'
    sleep 0.5
    echo ' prego!'
    return 0
  else
    echo "zsh: command not found: $1"
    return 127
  fi
}

###if host has gnome enable over amplification with: ~$ gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
volume() {
    if [[ -z "$1" ]]; then
        echo "uso: volume <percentuale>"
        return 1
    fi

    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "invalido"
        return 1
    fi

    if (( $1 < 0 || $1 > 777 )); then
        echo "fuori range"
        return 1
    fi

    local livello
    livello=$(echo "scale=2; $1 / 100" | bc)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "$livello"
    echo "impostato al $1%"
}
