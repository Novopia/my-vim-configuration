function ls-files-touched-by-me()
{
    git log --pretty="%H" --author="Xiangyu Yao" |
        while read commit_hash
        do
            git show --oneline --name-only $commit_hash | tail -n+2
        done | sort | uniq
}

function see-creator()
{
    git log --reverse --format="%an" -n 1 $1
}

function see-authors()
{
    git log --reverse --format="%an" $1
}

function ls-files-and-authors()
{
    git ls-files | 
        while read file
        do
            author=`see-creator $file`
            echo $file " " $author
        done
}

function ls-max-files()
{
    git ls-files $1 | 
        while read file
        do
            author=`see-creator $file`
            if [[ $author == "Max Hirschhorn" ]];
            then
                timestamp=`git log --pretty="%ar" --reverse -n 1 $file`
                echo $file " Creator: " $author " Time: " $timestamp
            fi
        done
}
