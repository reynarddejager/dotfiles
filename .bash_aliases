alias config='/usr/bin/git --git-dir=/home/reynard/.cfg/ --work-tree=/home/reynard'

alias pon='ssh -fN prod-proxy'
alias poff='ssh -O exit prod-proxy'
alias pstat='ssh -O check prod-proxy'

alias ton='ssh -fN test-proxy'
alias toff='ssh -O exit test-proxy'
alias tstat='ssh -O check test-proxy'
