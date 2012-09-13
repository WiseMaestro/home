# Set up the prompt
export SHELL=/bin/zsh
export PATH=/opt/local/bin:$PATH
export PATH=/Application/XCode.app/Contents/Developer/usr/bin:$PATH
export PATH=~/coreutils/deps/bin:$PATH
export PATH=~/bin:$PATH
autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

stty eof ''
bindkey '^[k' kill-region


export HADOOP_HOME=~/hadoop/hadoop-0.20.2-cdh3u3/
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export HBASE_HOME=~/hbase/hbase-0.90.4-cdh3u3


export PATH=$HBASE_HOME/bin:$HADOOP_HOME/bin:$PATH




alias emacs="source startemacs"
alias ls="ls --color=auto"
export EDITOR='emacs -nw'
export VISUAL='emacs -nw'
#export SHORTSHELL=$(echo $SHELL | sed 's:[a-z/]*/::g')
export SHORTSHELL='zsh'
setopt promptsubst

export RPS1='%F{cyan}%. %K{blue}%F{green}%T%F{white}'
# export PS1="\n\\`if [ \$? = 0 ]; then echo \[\e[33m\]\$?\
#   \[\e[0m\]; else echo \[\e[31m\]\$?\[\e[0m\]; fi\`\[\e[0m\])-(\[\e[34;1m\]\u@\h\[\e[0m\])\[\e[0m\]\n\[\016\]\[\017\]╰─\
#   (\[\e[36;1m\]\@ \d\[\e[0m\])-(\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah \
#   | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[0m\])\[\e[0m\])--> \[\e[0m\]"

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:/Applications/Emacs.app/Contents/MacOS/:/Applications/Emacs.app/Contents/MacOS/bin/:$PATH
export PS1='$(echo -e "\n ")%B%F{cyan}╭─=%b%F{green}(%F{cyan}$(pwd)%F{green})-%F{green}(%F{red}%?%F{green})-(%F{yellow}%n%F{red}@%F{yellow}%M%k%F{green})$(echo -e "\n ")%F{cyan}╰─\
=%F{green}((%F{yellow}$(ls -1 | wc -l | sed "s: ::g")files , $(ls -lah | grep -m 1 total | sed -e "s%total %%")%F{green}))%F{yellow}--%B%F{white}$SHORTSHELL%F{green}%#%F{white}:--%F{green}\$>%F{white} '




export SVNHOME=svn://mayfield.explorys/source/
