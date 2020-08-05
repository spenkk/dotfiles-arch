export ZSH="/home/arbenn/.oh-my-zsh"

#ZSH_THEME="random"
ZSH_THEME="norm"
#ZSH_THEME="candy"
#ZSH_THEME="lukerandall"
#ZSH_THEME="linuxonly"
#ZSH_THEME="theunraveler"
#ZSH_THEME="darkblood"

plugins=(zsh-autosuggestions history python sublime sudo urltools web-search)

source $ZSH/oh-my-zsh.sh

alias p2s="python2 -m SimpleHTTPServer"
alias p3s="python -m http.server"
alias sstart="systemctl start"
alias sstop="systemctl stop"
alias srestart="systemctl restart"
alias lt="ls -lt"
alias gitc="git clone"
alias cdb="cd ~/BugBounty/"
alias xclip="xclip -sel clip"
alias nmap="grc nmap"
alias ccat="pygmentize -g -O style=colorful,linenos=1"
alias myip='curl http://ipecho.net/plain'
alias cloudenum="python /home/arbenn/tools/cloud_enum/cloud_enum.py -k $1 >> $1.txt"
alias wbu="waybackurls"
alias smbmap="python2 /usr/bin/smbmap"
alias ipaddr="ifconfig wlp1s0 | grep -w inet | awk '{print \$2}'"
alias run-oneforall="docker run -it --rm -v ~/tools/oneforall/results:/OneForAll/results shmilylty/oneforall"
alias fufi="ffuf -c -w ~/tools/SecLists/Discovery/Web-Content/common.txt -mc 200,204,301,302,307,401,403,500,405 -e '/',.php,.txt,.db,.php.bak,.html,.zip -recursion -recursion-depth 2 -maxtime-job 300 -u "
alias cat="bat --style=grid"


cwd_to_urxvt() {
    local update="\0033]777;cwd-spawn;path;$PWD\0007"

    case $TERM in
    screen*)
    # pass through to parent terminal emulator
        update="\0033P$update\0033\\";;
    esac

    echo -ne "$update"
}

cwd_to_urxvt # execute upon startup to set initial directory

ssh_connection_to_urxvt() {
    # don't propagate information to urxvt if ssh is used non-interactive
    [ -t 0 ] || [ -t 1 ] || return

    local update="\0033]777;cwd-spawn;ssh;$1\0007"

    case $TERM in
    screen*)
    # pass through to parent terminal emulator
        update="\0033P$update\0033\\";;
    esac

    echo -ne "$update"
}

chpwd_functions=(${chpwd_functions} cwd_to_urxvt)

# Colorful commands (disabled because laggy terminal)
#source /root/tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Leave an empty line at each output
precmd() { print "" }
