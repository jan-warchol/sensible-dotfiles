# Colored prompt stands out in the sea of text, which makes it _much_ easier
# to navigate through the terminal output.  Note that I'm using bright versions
# of colors, because in many color palettes the normal ones are too dim.
BR_BLUE="\e[94m"
BR_MAGENTA="\e[95m"
BR_CYAN="\e[96m"
DEFAULT_COLOR="\e[0m"

# Using \[ and \] around color codes is necessary to prevent issues
# with the prompt such as text overlapping one line over and over again.
pathcolor="\[${BR_CYAN}\]"
resetcolors="\[${DEFAULT_COLOR}\]"

# When I'm logged in via ssh, display the path in scp-like format (-> easy
# selecting with a double click) and display username in a different color.
if [ -n "$SSH_CONNECTION" ]; then
    usercolor="\[${BR_MAGENTA}\]"
    separator=":"
else
    usercolor="\[${BR_BLUE}\]"
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
export PROMPT_COMMAND='__git_ps1 "${usercolor}\u@\h${pathcolor}${separator}\w${resetcolors}" "\n\\$ "'
