#!/usr/bin/env fish
function git-purge
set -l options (fish_opt --short=h --long=help)
set options $options (fish_opt --short=i --long=interactive)
set options $options (fish_opt --short=n --long=dry-run)
argparse $options -- $argv

git fetch -p
set branches (git branch -vv | grep "gone]" | string split '\n')
for branch in $branches
    set branch_name (echo $branch | awk '{print $1}')
    if test -n "$_flag_dry_run"
        echo "Deleting $branch_name"
    else
        if test -n "$_flag_interactive"
            read -l -P "Delete $branch_name [y/n]:" reply

            switch $reply
                case Y y
                    git branch -D $branch_name
            end
        else
            git branch -D $branch_name
        end
    end
end
echo 'No branches left to prune'
end
#!/usr/bin/env bash -e

#git branch -vv | grep "gone]" | xargs -L 1 -p echo | awk '{print $1}' #grep -v main | grep -v '*' | xargs -L 1 -p git branch -v -d

# git branch --merged | grep -v main | grep -v '*' | xargs -L 1 -p git branch -v -d
