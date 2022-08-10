# Nightwatch dotfiles

To install this on a new machine, see [this Hacker news post](https://news.ycombinator.com/item?id=11070797)

```sh
git clone --separate-git-dir=~/.cfg git@github.com:DragosDumitrache/nightwatch.git ~

$HOME/dot config status.showUntrackedFiles no
```

From then on, simply run
`./01-bootstrap.sh` 

For the macos system defaults, there is a `set-defaults.sh` script in [02-system](02-system) that you can run manually
