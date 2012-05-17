the_status=$( cd $DOTFILES; git status --porcelain | wc -l )
the_remote_status=$( cd $DOTFILES; git status | grep "Your branch is" | wc -l) 
if [[ $the_status -ne 0 || $the_remote_status -ne 0 ]]; then
 echo -n "$fg[red]"
 echo "╭                                               ╮"
 echo "  The dotfiles have been changed,"
 echo "    please consider pushing them back to github"
 echo "╰                                               ╯"
fi 
