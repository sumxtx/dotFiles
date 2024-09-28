# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[󰊢 ${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=" 󰑕 ${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits=" ${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+  ${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits=" ${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x 󰗨 ${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$:  $RETVAL"
}

FMT_BOLD="\[\e[1m\]"
FMT_DIM="\[\e[2m\]"
FMT_RESET="\[\e[0m\]"
FMT_UNBOLD="\[\e[22m\]"
FMT_UNDIM="\[\e[22m\]"
FG_BLACK="\[\e[30m\]"
FG_BLUE="\[\e[34m\]"
FG_LIGHTBLUE="\[\e[94m\]"
FG_CYAN="\[\e[36m\]"
FG_GREEN="\[\e[32m\]"
FG_YELLOW="\[\e[33m\]"
FG_GREY="\[\e[37m\]"
FG_RED="\[\e[31m\]"
FG_MAGENTA="\[\e[35m\]"
FG_WHITE="\[\e[37m\]"
BG_BLACK="\[\e[40m\]"
BG_BLUE="\[\e[44m\]"
BG_CYAN="\[\e[46m\]"
BG_GREEN="\[\e[42m\]"
BG_YELLOW="\[\e[43m\]"
BG_RED="\[\e[48;5;1m\]"
BG_DARKBLUE="\[\e[48;5;18m\]"
BG_WHITE="\[\e[47m\]"
BG_MAGENTA="\[\e[45m\]"
##${FMT_DIM}${FG_GREY}\w
export PS1="\\n${FMT_BOLD}${FG_WHITE}┏${BG_WHITE}${FG_BLACK}   ${FG_WHITE}${BG_BLUE}${BG_BLUE}  \u 󰁥 󰒍 \h ${FG_BLUE}${BG_BLACK}${FG_LIGHTBLUE}${FMT_DIM}${FMT_BOLD} \W${FG_RED}\`nonzero_return\`${FMT_DIM}${FG_YELLOW}\`parse_git_branch\`${FG_WHITE}󰔛 \A  \d \\n${FMT_UNDIM}${FG_WHITE}┗\[\e[32m\] \\$ >>\[\e[m\] "

#Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias gpglist='gpg --list-secret-keys --keyid-format=long'
alias vim='vim -p'
alias nvim='nvim -p'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cdpy='cd ~/Templates/03_ProgrammingLanguages/Python/'
alias cdjs='cd ~/Templates/03_ProgrammingLanguages/Javascript/'
alias cdpen100='cd ~/Templates/08_Hacking/OffSec/PEN-100'
alias confi3='nvim ~/.config/i3/config'
alias confnvim='nvim ~/.config/nvim/lua/v3n0m/remap.lua'
alias confvim='nvim ~/.vimrc'
alias confpicom='nvim ~/.config/picom/picom.conf'
alias mkdir='mkdir -pv'
alias tmux='tmux -f ~/.config/tmux/tmux.conf' 

#alias delcon='sudo ip addr del $1 dev $2' # 1 ..../x 2 conNameEx:nm-bridge
#alias addcon='sudo ip address add 192.168.13.37/24 dev nm-bridge'
#alias my_ip='curl -s ifconfig.co/json | python3 -m json.tool'
#alias env1="source ~/project1/env/activate"

# RED LIGHT
alias daylight='xrandr --output HDMI-A-0 --gamma 1:1:1 --brightness 1.0 --output DisplayPort-2 --gamma 1:1:1 --brightness 1.0'
alias nightlight='xrandr --output HDMI-A-0 --gamma 1.0:0.88:0.76 --brightness 0.7 --output DisplayPort-2 --gamma 1.0:0.88:0.76 --brightness 0.5'
alias daylight1='xrandr --output HDMI-A-0 --gamma 1:1:1 --brightness 1.0'
alias nightlight1='xrandr --output HDMI-A-0 --gamma 1.0:0.88:0.76 --brightness 0.7'

# History Settings
export HISTFILESIZE=10000
export HISTSIZE=997
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%Y-%m-%d %T "

## Extra options
#export EDITOR="vim"
#export VISUAL="vim"
#export TMOUT="3600"
