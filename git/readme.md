
# Goodies

* https://github.com/tj/git-extras

# Setup

`ln -s $HOME/Projects/dotfiles/git/gitconfig .gitconfig`

As the user is not stored in `.gitconfig`, you have to add the `EMAIL` environment variable to your
`~/.bashrc` file.

# Cleaning branches

To list the branches of type feature mixed with the remote branch develop, you can execute the
command:

`git fetch --prune && git rotten | grep feature`

The list of branches obtained can be deleted from the remote repository using the command:

`git push origin :<branch>`

With these commands the branches are deleted from the remote repository origin, but not from the
local repositories, to delete them from the local repositories must be executed:

`git fetch --prune`
