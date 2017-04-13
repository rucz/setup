set -o vi
alias l="ls -asCFh"

# checkout a pull request against an 'upstream' repo
alias pr="f() { git fetch -fu \${2:-upstream} refs/pull/\$1/head:pr/\$1 && git checkout pr/\$1; }; f"

# multiple terminal history
# either https://github.com/jcsalterego/historian
# or 
# http://askubuntu.com/questions/80371/bash-history-handling-with-multiple-terminals
export PROMPT_COMMAND='history -a'
