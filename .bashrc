set -o vi
alias l="ls -asCFh"

# multiple terminal history
# either https://github.com/jcsalterego/historian
# or 
# http://askubuntu.com/questions/80371/bash-history-handling-with-multiple-terminals
export PROMPT_COMMAND='history -a'
