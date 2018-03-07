# Aliases

# Evergreen
alias evergreen="~/bin/evergreen"

# Code review tool
alias cr='python ~/projects/kernel-tools/codereview/upload.py -s mongodbcr.appspot.com --jira_user=xiangyu.yao --check-clang-format --check-eslint --git_similarity=100'
alias crm='cr --rev origin/master... --no_oauth2_webbrowser'

# Code indexing
# It has to be run in the mongo directory.
alias refresh="scons compiledb; ./mongo-cscope.sh"

# Compile
NINJA_OPTION="CC=clang CXX=clang++ --modules=ninja CCFLAGS=-gsplit-dwarf --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown --icecream"

alias build-ninja="python2 $WORKSPACE/mongo/buildscripts/scons.py VARIANT_DIR=iceninja $NINJA_OPTION build.ninja"

alias build-ninja-dbg="python2 $WORKSPACE/mongo/buildscripts/scons.py --dbg --opt=off VARIANT_DIR=dbgninja $NINJA_OPTION build-dbg.ninja"

alias build-ninja-enterprise="python $WORKSPACE/mongo/buildscripts/scons.py --dbg --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
 CC=clang CXX=clang++ \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=dbg --modules=ninja,enterprise --icecream \
     build-enterprise.ninja"

alias build-ninja-dynamic="python2 $WORKSPACE/mongo/buildscripts/scons.py --config=force \
--modules=ninja --icecream --variables-files=etc/scons/mongodbtoolchain_gcc.vars \
--link-model=dynamic VARIANT_DIR=iceninja CCFLAGS=-gsplit-dwarf \
--link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown build.ninja"

alias make-mongo="build-ninja; ./build.ninja -j300 core"
alias make-mongo-dbg="build-ninja-dbg; ./build-dbg.ninja -j300 core"
alias make-enterprise="build-ninja-enterprise; ./build-enterprise.ninja -j300 core"

# Testing
alias resmoke="python2 $WORKSPACE/mongo/buildscripts/resmoke.py"
alias rsmk="resmoke --dbpath ~/data/db --basePort 50000"

# Misc.
alias merge-base="git merge-base HEAD master"
alias m="cd ~/projects/mongo"
# alias gdb="xterm -j -geometry 200x70 -e /opt/mongodbtoolchain/gdb/bin/gdb --tui --tty `tty`"
alias gdb="/opt/mongodbtoolchain/gdb/bin/gdb --tui "
alias lint="python buildscripts/clang_format.py lint-all"
alias format="python buildscripts/clang_format.py format"
alias rs="rm -rf ~/data/db/*"
alias run="./mongod --port 50000 --dbpath ~/data/db"
alias glg="git log --stat --pretty='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"

alias gdd="git diff --name-only $(git merge-base ${1:-origin/master} ${2:-HEAD})"
 
# Environment variables
# For gdb -tui remotely
# export DISPLAY="127.0.0.1:10.0"

# Python Virtual Environment
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
source /usr/bin/virtualenvwrapper.sh
