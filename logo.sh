#!/bin/bash

check_and_install_pv() {
    if ! command -v pv &> /dev/null; then
        sudo apt update -y > /dev/null 2>&1
        sudo apt install pv -y > /dev/null 2>&1
    fi
}

print() {
    colors=("\e[1;37m" "\e[1;35m")

    for line in "$@"; do
        color=${colors[RANDOM % ${#colors[@]}]}
        echo -e "${color}${line}" | pv -qL 250 
        sleep 0.1
    done
}

reset='\e[0m'

check_and_install_pv

logo_lines=(                          
    "                                         "
    "                     ,----,.             " 
    "                   ,'   ,' |             " 
    "       ,----,    ,'   .'   |             " 
    "     .'   .' \ ,----.'    .'    ,---.    " 
    "   ,----,'    ||    |   .'     /     \   " 
    "   |    :  .  ;:    :  |--,   /    / '   " 
    "   ;    |.'  / :    |  ;.' \ .    ' /    " 
    "  `----'/  ;  |    |      |'    / ;     " 
    "     /  ;  /   `----'.'\   ;|   :  \     " 
    "    ;  /  /-,    __  \  .  |;   |   ``.  " 
    "   /  /  /.`|  /   /\/  /  :'   ;      \ "
    " ./__;      : / ,,/  ',-   .'   |  .\  | "
    " |   :    .'  \ ''\       ; |   :  ';  : " 
    " ;   | .'      \   \    .'   \   \    /  " 
    " `---'          `--`-,-'      `---`--`   "
    ""
    " ⋆ ——————————————————————————————————————————————————— ⋆"
    "   ▪️ Xtr : https://x.com/256_tr"
    "   ▪️ Xen : https://x.com/256__en"
    " ⋆ ——————————————————————————————————————————————————— ⋆"
)

echo -e "$reset"
print "${logo_lines[@]}"
echo -e "$reset"
