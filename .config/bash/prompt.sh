# Colored prompt stands out in the sea of text, which makes it _much_ easier
# to navigate through the terminal output.

# Define vars with color codes - may be handy for other things, too
BOLD="\e[1m"
DIM="\e[2m"
NORMAL="\e[21m"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"
DEFAULT="\e[39m"

RESETALL="\e[0m"

# Using \[ and \] around color codes in prompt is necessary to prevent strange issues!
pathcolor="\[${CYAN}\]"
resetall="\[${RESETALL}\]"

# When I'm logged in via ssh, display the path in scp-like format (-> easy
# selecting with a double click) and display username in a different color.
if [ -n "$SSH_CONNECTION" ]; then
    usercolor="\[${MAGENTA}\]"
    separator=":"
else
    usercolor="\[${BLUE}\]"
    separator=" "
fi

# $(__git_ps1) displays git repository status in the prompt, which is extremely handy.
# Read more: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="verbose git"
GIT_PS1_SHOWCOLORHINTS="false"

# Use PROMPT_COMMAND instead of PS1 because it supports more features of __git_ps1.
# The syntax used here is "__git_ps1 <prefix> <suffix>", see link above.
export PROMPT_COMMAND='__git_ps1 "${usercolor}\u@\h${pathcolor}${separator}\w${resetall}" "\n\\$ "'
