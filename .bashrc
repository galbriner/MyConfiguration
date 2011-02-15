# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color=tty'
alias fgrep='fgrep --color=tty'

# ssh login aliases
alias ongoing='ssh root@ongoing_build'
alias ongoing32='ssh root@192.168.3.228'
alias 1000_build='ssh root@192.168.3.227'
alias 1010_build='ssh root@192.168.3.229'
alias 1020_build='ssh root@192.168.3.230'
alias 901_build='ssh root@192.168.3.223'
alias 910_build='ssh root@192.168.3.222'
alias 911_build='ssh root@192.168.3.224'
alias 912_build='ssh root@192.168.3.225'
alias 913_build='ssh root@192.168.3.226'
alias linux_repo='ssh root@linux-repo'
alias linux_vm='ssh root@192.168.3.94'
alias dan='ssh -X root@192.168.2.105'
alias ariel='ssh -X root@192.168.2.132'
alias oded='ssh -X root@192.168.2.38'
alias ron='ssh -X root@192.168.0.81'
alias ronvm='ssh -X root@192.168.1.121'
alias gershon='ssh -X root@192.168.3.20'
alias dell_gal='ssh -X gal@192.168.1.117'
alias dell_root='ssh -X root@192.168.1.117'
# test
alias src='cd ~/src/ongoing/src/cpp/sources/'
alias mkf='cd ~/src/ongoing/src/cpp/makefiles/'

PATH=/home/gal/colorgcc/:$PATH

