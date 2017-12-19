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
alias build-ninja-ice="python2 $WORKSPACE/mongo/buildscripts/scons.py --config=force --modules=ninja --icecream \
    --variables-files=etc/scons/mongodbtoolchain_gcc.vars VARIANT_DIR=iceninja \
        CCFLAGS=-gsplit-dwarf --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown build.ninja"

alias build-ninja-gdb="python2 $WORKSPACE/mongo/buildscripts/scons.py --config=force --dbg --opt=off --modules=ninja --icecream \
    --variables-files=etc/scons/mongodbtoolchain_gcc.vars VARIANT_DIR=iceninja \
        CCFLAGS=-gsplit-dwarf --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown build.ninja"

alias build-enterprise-ninja="python $WORKSPACE/mongo/buildscripts/scons.py --dbg --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
 CC=clang CXX=clang++ \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=dbg --modules=ninja,enterprise --icecream \
     build-enterprise.ninja"

alias make-mongo-ice="build-ninja-ice; ./build.ninja -j300 core"
alias make-mongo-gdb="build-ninja-gdb; ./build.ninja -j300 core"
alias make-enterprise="build-enterprise-ninja; ./build-enterprise.ninja -j300 core"

# Testing
alias resmoke="python2 $WORKSPACE/mongo/buildscripts/resmoke.py"
alias rsmk="resmoke --dbpath ~/data/db --basePort 40000"

# Misc.
alias merge-base="git merge-base HEAD master"
alias m="cd ~/projects/mongo"
# alias gdb="xterm -j -geometry 200x70 -e /opt/mongodbtoolchain/gdb/bin/gdb --tui --tty `tty`"
alias gdb="/opt/mongodbtoolchain/gdb/bin/gdb --tui "
alias lint="python buildscripts/clang_format.py lint-all"

# Environment variables
# For gdb -tui remotely
export DISPLAY="127.0.0.1:10.0"


