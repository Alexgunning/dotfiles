# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh 
# Set name of the theme to load. Optionally, if you set this to "random" # it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="alex-pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls="ls -Gp"
#alias vi="nvim"
#alias vim="nvim"
alias vi="nvim"
alias vim="nvim"
alias vimr="/Applications/MacVim.app/Contents/MacOS/Vim"
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
# alias python="python3"
alias z="vi ~/.zshrc"
alias sz="source ~/.zshrc"
alias s="git status"
alias k="gitk --all&"
alias gh="grep_history"
alias test="run_test"
alias drop="mongo RoninServer --eval 'db.dropDatabase()'"
alias load="mongorestore -d RoninServer --archive=/Users/cfsagunning/dbs/RoninServer.Devnode.2017-07-19.5pm.gz"
alias reload="mongo RoninServer --eval 'db.dropDatabase()'; mongorestore -d RoninServer --archive=/Users/cfsagunning/dbs/RoninServer.Devnode.2017-07-19.5pm.gz; mongo RoninServer --eval 'db.agendaJobs.drop()'"
alias graph="git log --graph --oneline --all"
alias getgrunt="npm install grunt grunt-cli grunt-contrib-watch grunt-shell"
alias dtest="rm -rf ~/ronin_server_node/src/tests"
alias utest="git checkout -- src/tests"
alias reb="npm run rebuild && npm run restart"
alias AndroidStudio="open -a /Applications/Android\ Studio.app"
alias caf="caffeinate -d"
alias nuget="mono /usr/local/bin/nuget.exe"
# alias empty="git commit --allow-empty -m 'empty commit'"
export ANDROID_HOME='/Users/cfsagunning/Library/Android/sdk'
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=/usr/local/bin/python3:$PATH


function empty() {
  branch=$(git branch | awk '/^\*/ { print $2 }' | grep -o 'RWS-[0-9]\+')
  commitmessage="${branch} empty commit"
  git commit --allow-empty -m $commitmessage
}


#source ~/prefs/git-completion.bash

PATH=~/scripts:$PATH

export DYLD_FORCE_FLAT_NAMESPACE=1

alias cdf="eval \"cd \\\"\\\`osascript -e 'tell app \\\\\\\"Finder\\\\\\\" to return the POSIX path of (target of window 1 as alias)'\\\`\\\"\""

#bindkey -v
#export KEYTIMEOUT=1


#####PASTED STUFF
#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    #zle reset-prompt
#}

##FIX DOESN'T WORK
#bindkey jk vi-cmd-mode

#zle -N zle-line-init
#zle -N zle-keymap-select

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by travis gem
[ -f /Users/cfsagunning/.travis/travis.sh ] && source /Users/cfsagunning/.travis/travis.sh
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
source /usr/local/bin/aws_zsh_completer.sh
