function remove-path --description "Remove path from fish"
    echo  $fish_user_paths
    for my_path in $argv
        set count 0
        while set -l index (contains -i $my_path $fish_user_paths)
            set count (math $count + 1)
            set -e -U fish_user_paths[$index]
        end
        echo "Removed $count entries of $my_path"
    end
end
