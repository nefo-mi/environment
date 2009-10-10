export PATH=~/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:$PATH

case "${OSTYPE}" in
cygwin*)
  export LANG=ja_JP.SJIS
  alias open='cygstart'
  ;;
linux*)
  export LANG=ja_JP.UTF-8
#  export Lang=C
  alias open='gnome-open'
  ;;
esac

# use color
setopt prompt_subst
PROMPT='[%n@%m %c% ]%% '
PROMPT2='%_>'

autoload -U compinit
compinit -u
#setopt correct_all
# 
setopt complete_in_word
# after --prefix== ok!
setopt magic_equal_subst

setopt noautoremoveslash
setopt NO_beep
#setopt print_eight_bit
setopt auto_cd
# (){}[]
setopt auto_param_keys
setopt always_last_prompt

# dont mail check
MAILCHECK=0

setopt NO_beep
# Ctrl-S off
setopt NO_flow_control
# Ctrl-D off
setopt ignoreeof
# is comment in commandline
setopt interactive_comments

#list
#========================================
setopt auto_list
setopt list_packed
setopt nolistbeep
# list type 
setopt list_types
setopt auto_menu
#========================================

# no \n but show
unsetopt promptcr

# {a-c} =>  a b c 
setopt brace_ccl

# history
#==========================================
HISTFILE=~/.myhistory
HISTSIZE=10000
SAVEHIST=10000
# start space dont add history
setopt hist_ignore_space
setopt share_history
# remove history command in history
setopt hist_no_store
# dont add history same command
setopt hist_ignore_all_dups 
setopt hist_save_nodups
setopt hist_reduce_blanks
setopt extended_history
setopt append_history
#=========================================

WORDCHARS="*?-_[]~&;\!#$%^(){}<>"

alias ls='ls -Fcv --color=auto'
alias rm='rm -i'
alias w3m='w3m -B'
alias ll='ls -lh'
alias la='ls -a'
alias cal='cal --u --m'
alias lu='ls -lha'
alias -g L='| lv'
alias -g T='| tee -a'
alias -g G='| grep'
alias -g W='| wc'
alias -g X='| xargs'

function chpwd(){ ls }

if [ "$TERM" = "screen" ]; then
	preexec() {
		# see [zsh-workers:13180]
		# http://www.zsh.org/mla/workers/2000/msg03993.html
		emulate -L zsh
		local -a cmd; cmd=(${1})
		case $cmd[1] in
			fg)
				return
				;;
			%*) 
				return
				;;
			cd)
				return;;
			ls)
				return
				;;
			*)
				if (( $#cmd == 2)); then
					echo -n "k$cmd[1] $cmd[2]:t\\"
				else
					echo -n "k$cmd[1]:t\\"
				fi
				return
				;;
		esac

		local -A jt; jt=(${(kv)jobtexts})

		$cmd >>(read num rest
			cmd=(${(z)${(e):-\$jt$num}})
			echo -n "k$cmd[1]:t\\") 2>/dev/null
	}
fi

if [ $TERM != "screen" ]; then
        screen -xRR
fi

stty stop undef
