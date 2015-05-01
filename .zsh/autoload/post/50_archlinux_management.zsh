# Install a package and commit this to the repository in /etc.
# Parameters: the package to be installed.
function installpkg() {
    echo "INSTALL: '$1'"
    pacman --noconfirm -S "$1" > /dev/null
    commit_all "/etc" "[INSTALL] $1"
    commit_all "/var/log" "[INSTALL] $1"
    #TODO: write data to a syslog-ng file, which will be replayed back later
}
