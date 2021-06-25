# echo $TERM
# echo "step into ~/.zshrc"
###############################
### New a Tmux session
###############################
#if [[ ! -v TMUX ]]; then
#	if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#	    tmux
#	fi
#fi
###############################
### PATH
###############################
PATH="/usr/local/bin:$PATH"
###############################
### autoload 
###############################
autoload zmv
unalias run-help 2> /dev/null
autoload run-help

###############################
### alias
###############################
alias mysite="ssh root@ss.caihuashuai.com -p 28121 -i /Users/tom/Dev/credential/ss.caihuashuai.com/id_rsa_PEM"
alias hh="/Users/tom/Dev/credential/lhh_bandwagon/chs/expect.script"
alias bn="/Users/tom/Dev/credential/lbn_bandwagon/chs/expect.script"
alias ss-lhh="/Users/tom/Dev/script/ss-server/start_ss.zsh"
alias wol="/Users/tom/Dev/script/wol/wol.sh"
alias zb="z -b"
alias zs="vim ~/.zshrc"
alias zt="vim ~/.tmux.conf"
alias vc="vim ~/.vimrc"
alias cs='frpc -c /Users/tom/Dev/config/frp/frp_0.33.0_darwin_amd64/frpc_capstone.ini &'
alias ta="tmux a"
alias h="run-help"
alias v="vim"
alias d="cd ~/Desktop"
alias ll="ls -l"
alias history="history -500"
alias df="df -h"
# alias hh="ssh tom@222.195.75.84 -p 7878 -i /Users/tom/GoogleDrive/Dev/credential/lhh_sshd/lhh_sshd"
if [[ `uname` == "Darwin" ]]; then
	alias rh="rmtrash"
	# Temporary hack to make the script run in both Linux and the specifc mac
	export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi
if [[ `uname` == "Linux" ]]; then
	alias ls="ls --color=auto"
fi




cltst(){
     awk 'BEGIN{
         s="/\\/\\/\\/\\/\\"; s=s s s s s s s s s s s s s s s s s s s s s s s;
         for (colnum = 0; colnum<256; colnum++) {
             r = 255-(colnum*255/255);
             g = (colnum*510/255);
             b = (colnum*255/255);
             if (g>255) g = 510-g;
             printf "\033[48;2;%d;%d;%dm", r,g,b;
             printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
             printf "%s\033[0m", substr(s,colnum+1,1);
         }
         printf "\n";
     }'
}

###############################
### init tools
###############################
# z.lua init
eval "$(lua ~/.libs/z.lua/z.lua  --init zsh)"
# fzf init 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=" +s -m --bind ctrl-a:select-all,ctrl-d:deselect-all --cycle --filepath-word --preview-window=right:40%::: --preview 'bat --style=numbers --color=always --line-range :500 {}' "
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
source ~/.key-bindings.zsh

###############################
### various
###############################

# The history setting actually should be set 
# (has been set) 
# In the /etc/zshrc or /etc/zsh/.zshrc, 
# Set it here again, in case I have no access to the global setting
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
# Activate vim mode.
bindkey -v
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
unsetopt LIST_BEEP
# ls color
if [[ `uname` == "Darwin" ]]; then
	export CLICOLOR=1
fi
HISTSIZE=200000
SAVEHIST=200000

###############################
### PROMT
###############################

#RPROMPT='[%D{%L:%M:%S %p}]'
#TMOUT=1
#TRAPALRM() {
#    if [ "$WIDGET" != "complete-word" ]; then
#        zle reset-prompt
#    fi
#}


bindkey "^h" run-help
[[ -n ${SHOW_CONF} ]] && { echo "~/.zshrc finished!"; echo PID=$$; }



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tom/Dev/tool/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tom/Dev/tool/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tom/Dev/tool/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tom/Dev/tool/google-cloud-sdk/completion.zsh.inc'; fi



export PATH=~/Library/Android/sdk/platform-tools:$PATH
export PATH=~/Library/Android/sdk/tools:$PATH

# execute startup scripts

#Prompt

