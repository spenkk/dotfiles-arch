export ZSH="/home/arbenn/.oh-my-zsh"

#ZSH_THEME="random"
#ZSH_THEME="norm"
#ZSH_THEME="candy"
#ZSH_THEME="lukerandall"
ZSH_THEME="linuxonly"


plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias gitc="git clone"
alias cdb="cd ~/BugBounty/"
alias xclip="xclip -sel clip"
alias nmap="grc nmap"

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