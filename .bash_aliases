olimex='getkey@micro'
alias ssm="ssh $olimex"
alias st="ssh -t $olimex tmux a || ssh -t $olimex tmux"
alias ud='yaourt -Syua'
alias orcl="sudo pacman -Rsn $(echo $(pacman -Qdtq))" # echo to remove the line break

sudo() {
	# use sudo's path to prevent this function from calling itself
	if [ $1 = 'vim' ]; then
		$(which sudo) -E $@
	else
		$(which sudo) $@
	fi
}
