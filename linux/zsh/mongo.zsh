# Aliases

# Code indexing
# It has to be run in the mongo directory.
alias refresh="scons compiledb; ./mongo-cscope.sh"

# Compile
NINJA_OPTION="CC=clang CXX=clang++ --modules=ninja CCFLAGS='-Wa,--compress-debug-sections -gsplit-dwarf' --disable-warnings-as-errors --link-model=dynamic MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown --icecream"
# NINJA_OPTION_OBJECT="CC=clang CXX=clang++ --modules=ninja CCFLAGS='-fno-var-tracking-assignments -Wa,--compress-debug-sections -gsplit-dwarf' --disable-warnings-as-errors --link-model=dynamic MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown --icecream"
NINJA_OPTION_OBJECT="CC=clang CXX=clang++ --modules=ninja CCFLAGS='-Wa,--compress-debug-sections -gsplit-dwarf' --disable-warnings-as-errors --link-model=object MONGO_VERSION=0.0.0 MONGO_GIT_HASH=unknown --icecream"

alias build-ninja-dynamic="python $WORKSPACE/mongo/buildscripts/scons.py VARIANT_DIR=dynamic_ninja $NINJA_OPTION build-dynamic.ninja"

alias build-ninja-mobile="python $WORKSPACE/mongo/buildscripts/scons.py VARIANT_DIR=obj_ninja --mobile-se=on --opt=on $NINJA_OPTION_OBJECT build-mobile.ninja"

alias build-ninja-dbg="python $WORKSPACE/mongo/buildscripts/scons.py --dbg --opt=off VARIANT_DIR=dbg_ninja $NINJA_OPTION_OBJECT build-dbg.ninja"

alias build-ninja-enterprise="python $WORKSPACE/mongo/buildscripts/scons.py --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
VARIANT_DIR=enterprise_ninja \
 CC=clang CXX=clang++ \
 --link-model=object \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=enterprise_ninja --modules=ninja,enterprise --icecream \
     build-enterprise.ninja"

alias build-ninja-enterprise-asan="python $WORKSPACE/mongo/buildscripts/scons.py --allocator=system --sanitize=address --dbg --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
VARIANT_DIR=enterprise_asan_ninja \
 CC=gcc-5 CXX=g++-5 \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=enterprise_asan_ninja --modules=ninja,enterprise --icecream \
     build-enterprise-asan.ninja"

alias build-ninja-asan="python $WORKSPACE/mongo/buildscripts/scons.py --allocator=system --sanitize=address --dbg --ssl \
CPPPATH=/usr/local/opt/openssl/include LIBPATH=/usr/local/opt/openssl/lib \
VARIANT_DIR=asan_ninja \
 CC=clang CXX=clang++ \
  CCFLAGS='-Wa,--compress-debug-sections' \
   MONGO_VERSION='0.0.0' MONGO_GIT_HASH='unknown' \
    VARIANT_DIR=asan_ninja --modules=ninja --icecream \
     build-asan.ninja"

alias make-mongo-mobile="build-ninja-mobile; ./build-mobile.ninja -j300 core"
alias make-mongo-asan="build-ninja-asan; ./build-asan.ninja -j300 core"
alias make-mongo-dbg="build-ninja-dbg; ./build-dbg.ninja -j300 core"
alias make-mongo-enterprise="build-ninja-enterprise; ./build-enterprise.ninja -j300 core"
alias make-mongo-dynamic="build-ninja-dynamic; ./build-dynamic.ninja -j400 core"
alias make-mongo="make-mongo-dynamic"

# Testing
alias resmoke="python ./buildscripts/resmoke.py"
alias rsmk="resmoke --dbpath ~/data/db --basePort 40000"

# Misc.
alias m="cd ~/projects/mongo"
alias lint="python buildscripts/clang_format.py lint-all"
alias format="python buildscripts/clang_format.py format"
alias rs="rm -rf ~/data/db/*"
alias run="./mongod --port 50000 --dbpath ~/data/db"
alias glg="git log --stat --pretty='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"
alias gb="git branch -vvvvv"
alias branch="git symbolic-ref --short HEAD"
alias gg="git grep"
alias gf="git show --pretty=format:'' --name-only"
alias z="vim ~/.zsh/mongo.zsh"
alias cr="python ~/projects/kernel-tools/codereview/upload.py -s mongodbcr.appspot.com --jira_user=xiangyu.yao --check-clang-format --clang-format-location /usr/bin/clang-format --check-eslint --cc codereview-mongo@10gen.com,serverteam-storage@10gen.com"
alias rmrepl="sed '/REPL\|ASIO\|NETWORK\|FTDC\|to become available.\|to be elected./d'"
alias rmshell="sed '/connecting to: mongodb:\/\/\|MongoDB server version: 0.0.0\|setting random seed:/d'"
alias rmall="rmrepl | rmshell"
alias mongowt='wt -C "extensions=["/home/xy24/projects/wiredtiger-develop/ext/compressors/snappy/.libs/libwiredtiger_snappy.so"],log=(compressor=snappy,path=journal)"'
alias mdb_catalog="mongowt dump -x table:_mdb_catalog | hex2bson"
alias psm="ps aux | grep mongod"

function merge-base()
{
    git merge-base HEAD master
}

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
        cr --nojira --rev `merge-base`.. -t $1 -i $2
    elif [[ $# -eq 1 ]]; then
        cr --rev `merge-base`.. -t $1
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

function burnintest()
{
if [ ! -f regtest.ninja ]
then
        python buildscripts/scons.py --modules=ninja --link-model=dynamic --icecream VARIANT_DIR=regninja \
        MONGO_VERSION="0.0.0" MONGO_GIT_HASH="unknown" "CCFLAGS=-gsplit-dwarf -fno-var-tracking" regtest.ninja
fi
CCACHE_DISABLE=1 ninja -j600 -f regtest.ninja all 
python buildscripts/burn_in_tests.py --buildVariant=ubuntu1804
python buildscripts/resmoke.py -j$(getconf _NPROCESSORS_CONF) ${*:-"--suites=unittests,dbtest,core,aggregation,no_passthrough,concurrency,replica_sets"}
}

function countLine()
{
    let n=0
    for file in `find . -name "*.h" -o -name "*.cc" -o -name "*.cpp" -o -name "*.c" -o -name "*.java" `
    do
      let n+=`grep -c . "$file"`
    done
    echo $n
}
 
# Debugging
# alias gdb="xterm -e gdb --tui --tty `tty` $1"

# Environment variables
# For gdb -tui remotely
export DISPLAY=:0

# Rtags
export PATH="/home/xy24/projects/mongo/link:/home/xy24/projects/rtags/bin:${PATH}"

# NINJA status
export NINJA_STATUS='[%f/%t (%p) %es] ' # make the ninja output even nicer
