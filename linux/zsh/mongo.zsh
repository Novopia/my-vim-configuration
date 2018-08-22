# Aliases

# Evergreen
alias evergreen="~/bin/evergreen"

# Code indexing
# It has to be run in the mongo directory.
alias refresh="scons compiledb; ./mongo-cscope.sh"

# Compile
NINJA_OPTION_BACKUP="CC=clang CXX=clang++ --modules=ninja CCFLAGS=-gsplit-dwarf --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown --icecream"
NINJA_OPTION="--variables-files=etc/scons/mongodbtoolchain_gcc.vars CCFLAGS=--modules=ninja CCFLAGS=-gsplit-dwarf --link-model=dynamic --allocator=system MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown --icecream"
NINJA_OPTION_OBJECT="--variables-files=etc/scons/mongodbtoolchain_gcc.vars --opt=on --modules=ninja CCFLAGS=-gsplit-dwarf --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown --icecream"

alias build-ninja-dynamic="python2 $WORKSPACE/mongo/buildscripts/scons.py VARIANT_DIR=dynamic_ninja $NINJA_OPTION build-dynamic.ninja"
alias build-ninja-obj="python2 $WORKSPACE/mongo/buildscripts/scons.py VARIANT_DIR=obj_ninja $NINJA_OPTION_OBJECT build-obj.ninja"

alias build-ninja-asan="python2 $WORKSPACE/mongo/buildscripts/scons.py --allocator=system --sanitize=address VARIANT_DIR=asan_ninja $NINJA_OPTION build-asan.ninja"

alias build-ninja-dbg="python2 $WORKSPACE/mongo/buildscripts/scons.py --dbg --opt=off VARIANT_DIR=dbg_ninja $NINJA_OPTION build-dbg.ninja"

alias build-ninja-enterprise="python $WORKSPACE/mongo/buildscripts/scons.py --dbg --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
 CC=clang CXX=clang++ \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=dbg --modules=ninja,enterprise --icecream \
     build-enterprise.ninja"

alias build-ninja-enterprise-asan="python $WORKSPACE/mongo/buildscripts/scons.py --allocator=system --sanitize=address --dbg --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
 CC=clang CXX=clang++ \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=dbg --modules=ninja,enterprise --icecream \
     build-enterprise.ninja"

alias make-mongo-asan="build-ninja-asan; ./build-asan.ninja -j300 core"
alias make-mongo-dbg="build-ninja-dbg; ./build-dbg.ninja -j300 core"
alias make-enterprise="build-ninja-enterprise; ./build-enterprise.ninja -j300 core"
alias make-mongo-dynamic="build-ninja-dynamic; ./build-dynamic.ninja -j400 core"
alias make-mongo-obj="build-ninja-obj; ./build-obj.ninja -j400 core"
alias make-mongo="make-mongo-dbg; cp build-dbg.ninja build.ninja; ./build.ninja -j400 core"

# Testing
alias resmoke="python2 $WORKSPACE/mongo/buildscripts/resmoke.py"
alias rsmk="resmoke --dbpath ~/data/db --basePort 50000"

# Misc.
alias merge-base="git merge-base HEAD master"
alias m="cd ~/projects/mongo"
alias lint="python buildscripts/clang_format.py lint-all"
alias format="python buildscripts/clang_format.py format"
alias rs="rm -rf ~/data/db/*"
alias run="./mongod --port 50000 --dbpath ~/data/db"
alias glg="git log --stat --pretty='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"
alias gb="git branch -vvvvv"
alias branch="git symbolic-ref --short HEAD"
alias gg="git grep"
alias z="vim ~/.zsh/mongo.zsh"
alias cr="python ~/projects/kernel-tools/codereview/upload.py -s mongodbcr.appspot.com --jira_user=xiangyu.yao --check-clang-format --clang-format-location /usr/bin/clang-format --check-eslint --cc codereview-mongo@10gen.com,serverteam-storage@10gen.com"
alias gdb="/opt/mongodbtoolchain/gdb/bin/gdb"
alias rmrepl="sed '/REPL\|ASIO\|NETWORK\|FTDC\|to become available.\|to be elected./d'"
alias rmshell="sed '/connecting to: mongodb:\/\/\|MongoDB server version: 0.0.0\|setting random seed:/d'"
alias rmall="rmrepl | rmshell"
alias mongowt='wt -C "extensions=["/home/xy24/projects/wiredtiger/ext/compressors/snappy/.libs/libwiredtiger_snappy.so"],log=(compressor=snappy,path=journal)"'

function subject()
{
    git log --format='%s' `merge-base`.. | grep "^$(branch)" | tail -1
}

# Code Review Workflow
function clear_pyc()
{
    find . -name '*.pyc' -delete
}

function evg()
{
    evergreen patch -p mongodb-mongo-master -d "`subject`" --alias required -f
}

function crm()
{
    if [[ $# -eq 2 ]]; then
        cr --no_oauth2_webbrowser --nojira --rev `merge-base`.. -t $1 -i $2
    elif [[ $# -eq 1 ]]; then
        cr --no_oauth2_webbrowser --rev `merge-base`.. -t $1
    fi
}

# Run MongoDB
function startRepl()
{
    rm -rf /data/rs0-0
    rm -rf /data/rs0-1
    mkdir -p /data/rs0-0
    mkdir -p /data/rs0-1
    ~/projects/mongo/mongod --dbpath /data/rs0-0 --port 50000 --replSet rs0 & disown
    ~/projects/mongo/mongod --dbpath /data/rs0-1 --port 50001 --replSet rs0 & disown
    sleep 2
    ~/projects/mongo/mongo --port 50000 --eval "rs.initiate( { 
        _id : 'rs0', members: [
            { _id: 0, host: 'localhost:50000', priority: 1 },
            { _id: 1, host: 'localhost:50001' , priority: 0}
        ]});"
}

function endRepl()
{
    killall mongod
}

function mgd()
{
    rm -rf /data/rs0-0
    mkdir -p /data/rs0-0
    ~/projects/mongo/mongod --dbpath /data/rs0-0 --port 50000 --replSet rs0
}

function mgd2()
{
    rm -rf /data/rs0-1
    mkdir -p /data/rs0-1
    ~/projects/mongo/mongod --dbpath /data/rs0-1 --port 50001 --replSet rs0
}

function mgs()
{
    ~/projects/mongo/mongo --port 50000
}
 
function mgs2()
{
    ~/projects/mongo/mongo --port 50001
}
 
# Debugging
# alias gdb="xterm -e gdb --tui --tty `tty` $1"

# Environment variables
# For gdb -tui remotely
# export DISPLAY="127.0.0.1:10.0"

# Rtags
export PATH="/home/xy24/mongo/link:/home/xy24/projects/rtags/bin:${PATH}"

# NINJA status
export NINJA_STATUS='[%f/%t (%p) %es] ' # make the ninja output even nicer

workon mongo
