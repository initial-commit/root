# Initialise a git repository in a given directory.
# Parameters: the directory where to init the repo.
function start_versioning() {
    pushd "$1" > /dev/null
    if [[ !( -d './.git') ]]; then
        git init
        git add . > /dev/null
        git commit -m "Initial commit" > /dev/null
    fi
    #TODO: write data to a syslog-ng file, which will be replayed back later
    popd > /dev/null
}

# Commit all changes in the current directory.
# If there is no git repository initialised at destination or there is nothing
# unstaged, exit silently.
# Parameters: - the directory where to make the commit
#             - the commit message
function commit_all() {
    pushd "$1" > /dev/null
    if [[ -d './.git' && ! -z $(git status --porcelain) ]]; then
        git add -A . > /dev/null
        git commit -m "$2" > /dev/null
    fi
    popd > /dev/null
}

