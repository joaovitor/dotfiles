# echo ".DS_Store" >> ~/.gitignore
# git config --global core.excludesfile ~/.gitignore

# git config --global user.name "Your Name Comes Here"
# git config --global user.email you@yourdomain.example.com
# git config --global core.editor vim
# git config --global push.default current

# git config --global alias.unstage 'reset HEAD'
# git config --global alias.st status
# git config --global alias.ci commit
# git config --global alias.co checkout
# git config --global alias.br branch
# git config --global color.branch auto
# git config --global color.diff auto
# git config --global color.interactive auto
# git config --global color.status auto

alias gba='git branch -a'
alias gcm='git checkout master'
alias glpp='git log --pretty=oneline'
alias gs='git status'
alias gd='git diff'
alias gl='git pull'
alias gci='git commit --interactive'
alias ga='gitk --all'
alias gsr='git svn rebase'
alias gmt='git mergetool'
alias gx='gitx' 
alias gg='gitg' 

alias upb='git checkout production && git merge origin/master && git push && git checkout master'
