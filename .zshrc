#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
#
# JAVA configuration
# export  JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"
# ANT configuration
# export ANT_HOME="/usr/local/Cellar/ant/1.10.1/libexec" export ANT_OPTS="-Xms64m -Xmx1500m"
# GO configuration
# export GOROOT="/usr/local/go" 
# PATH variable
# export PATH="${PATH}:${JAVA_HOME}/bin:${ANT_HOME}/bin"
export PATH="/home/xy24/bin:/home/xy24/mongo-bin/link:${PATH}"
export PATH="${PATH}:/Users/xy24/Library/Python/2.7/bin"

export CSCOPE_EDITOR=vim
# export TERM=xterm-256color
export WORKSPACE=$HOME/projects
export DOTFILES=$HOME/projects/dotfiles

export DISPLAY="127.0.0.1:10.0"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias evergreen="~/bin/evergreen"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias vim="/usr/local/bin/vim"
alias cr='python ~/projects/kernel-tools/codereview/upload.py -s mongodbcr.appspot.com --jira_user=xiangyu.yao --check-clang-format --check-eslint --git_similarity=100'

# alias cr='python ~/projects/kernel-tools/codereview/upload.py -s mongodbcr.appspot.com --jira_user=xiangyu.yao --check-clang-format --git_similarity=100'
alias crm='cr --rev origin/master... --no_oauth2_webbrowser'
# alias cr='python path/to/code/review/upload.py --oauth2 -H "mongodbcr.appspot.com" \-y --check-clang-format --jira_user your.user.name --git_similarity=100'
alias ctags='~/projects/ctags-5.8/ctags'

# It has to be run in the mongo directory
alias refresh="scons compiledb; ./mongo-cscope.sh"

# alias build-ninja="python2 $WORKSPACE/mongo/buildscripts/scons.py --dbg --opt=on CC=clang CXX=clang++ \
# CCFLAGS='-Wa,--compress-debug-sections' \
#  MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
#   VARIANT_DIR=iceninja --modules=ninja \
#    build.ninja"
# scons icecream.ninja --modules=ninja VARIANT_DIR=iceninja MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown CCFLAGS=-gsplit-dwarf --variables-files=etc/scons/mongodbtoolchain_gcc.vars --icecream
#
alias build-ninja-ice="python2 $WORKSPACE/mongo/buildscripts/scons.py --config=force --modules=ninja --icecream \
    --variables-files=etc/scons/mongodbtoolchain_gcc.vars VARIANT_DIR=iceninja \
        CCFLAGS=-gsplit-dwarf --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown build.ninja"

alias build-ninja-gdb="python2 $WORKSPACE/mongo/buildscripts/scons.py --config=force --dbg --opt=off --modules=ninja --icecream \
    --variables-files=etc/scons/mongodbtoolchain_gcc.vars VARIANT_DIR=iceninja \
        CCFLAGS=-gsplit-dwarf --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown build.ninja"

# alias build-ninja-gdb="python $WORKSPACE/mongo/buildscripts/scons.py --dbg --opt=off CC=clang CXX=clang++ \
# CCFLAGS='-Wa,--compress-debug-sections' \
#  MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
#   VARIANT_DIR=iceninja --modules=ninja \
#    build-gdb.ninja"

# alias make-mongo="build-ninja; ./build.ninja -j300 core"
alias make-mongo-ice="build-ninja-ice; ./build.ninja -j300 core"
alias make-mongo-gdb="build-ninja-gdb; ./build.ninja -j300 core"

alias build-enterprise-ninja="python $WORKSPACE/mongo/buildscripts/scons.py --dbg --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
 CC=clang CXX=clang++ \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=dbg --modules=ninja,enterprise --icecream \
     build-enterprise.ninja"
alias resmoke="python2 $WORKSPACE/mongo/buildscripts/resmoke.py"
alias rsmk="resmoke --dbpath ~/data/db --basePort 40000"
alias merge-base="git merge-base HEAD master"
alias up="cd .."
alias make-enterprise="build-enterprise-ninja; ./build-enterprise.ninja -j300 core"
alias m="cd ~/projects/mongo"
# alias gdb="xterm -j -geometry 200x70 -e /opt/mongodbtoolchain/gdb/bin/gdb --tui --tty `tty`"
alias gdb="/opt/mongodbtoolchain/gdb/bin/gdb --tui "
alias lint="python buildscripts/clang_format.py lint-all"
alias python="/usr/local/bin/python"
alias cf="git diff --name-only | xargs clang-format -style=file -i"


# 10ms for key sequences
KEYTIMEOUT=1

