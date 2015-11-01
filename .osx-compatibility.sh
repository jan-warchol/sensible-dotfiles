# location containing scripts for tab completion and prompt status for git
# depends on OSX version and where you installed git from...

PATHS=(
    /Applications/Xcode.app/Contents/Developer/usr/share/git-core
    /Library/Developer/CommandLineTools/usr/share/git-core
    /usr/local/git/contrib/completion
    /usr/local/etc/bash_completion.d
    /opt/local/etc/profile.d
    /opt/local/share/git-core
    /opt/local/share/git-core/contrib/completion/
)

for dir in ${PATHS[*]}; do
    . $dir/git-prompt.sh >&/dev/null
    . $dir/git-completion.bash >&/dev/null
done

