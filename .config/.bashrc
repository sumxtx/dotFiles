# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
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
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
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
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

export PS1="\\n\e[36m  \e[0m~[\u@\h]:\`nonzero_return\`\`parse_git_branch\`|>\w \A \d \\n\[\e[32m\] \\$ >>\[\e[m\] "

#Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias gpglist='gpg --list-secret-keys --keyid-format=long'
alias nvim='nvim -p'
alias grep='grep -i --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cdpy='cd /home/v3n0m/Templates/03_ProgrammingLanguages/Python/'
alias cdjs='cd /home/v3n0m/Templates/03_ProgrammingLanguages/Javascript/'
alias cdpen100='cd /home/v3n0m/Templates/08_Hacking/OffSec/PEN-100'
#alias delcon='sudo ip addr del $1 dev $2' # 1 ..../x 2 conNameEx:nm-bridge
#alias addcon='sudo ip address add 192.168.13.37/24 dev nm-bridge'

# RED LIGHT
alias daylight='xrandr --output HDMI-A-0 --gamma 1:1:1 --brightness 1.0 --output DisplayPort-2 --gamma 1:1:1 --brightness 1.0'
#
alias nightlight='xrandr --output HDMI-A-0 --gamma 1.0:0.88:0.76 --brightness 0.9 --output DisplayPort-2 --gamma 1.0:0.88:0.76 --brightness 0.9'

#alias env1="source ~/project1/env/activate"


# Generated with bashrc generator: https://alexbaranowski.github.io/bash-rc-generator/
# History Settings

# Generated with bashrc generator: https://alexbaranowski.github.io/bash-rc-generator/
# History Settings

export HISTFILESIZE=10000
export HISTSIZE=997
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%Y-%m-%d %T "
#
## Aliases
#alias sudo='sudo '
#alias mkdir="mkdir -pv"
#alias grep='grep --color=auto'
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias my_ip='curl -s ifconfig.co/json | python3 -m json.tool'
## Extra options
#
#export EDITOR="vim"
#export VISUAL="vim"
#export TMOUT="3600"
#
#
#
#
#
