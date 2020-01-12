
# Goodies

* https://github.com/tj/git-extras

# Setup

`ln -s $HOME/Projects/dotfiles/git/gitconfig .gitconfig`

As the user is not stored in the user `.gitconfig` file, you have to create the `/etc/gitconfig`
file with the following code:

```
[user]
    email = email@gmail.com
    name = User Name
```

# Cleaning branches

To list the branches of type feature mixed with the remote branch develop, you can execute the
command:

`git fetch --prune && git rotten | grep feature`

The list of branches obtained can be deleted from the remote repository using the command:

`git push origin :<branch>`

With these commands the branches are deleted from the remote repository origin, but not from the
local repositories, to delete them from the local repositories must be executed:

`git fetch --prune`
