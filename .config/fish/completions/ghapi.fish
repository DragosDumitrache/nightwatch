function __fish_complete_bash
    set cmd (commandline -cp)
    bash -c "source get-bash-completions.sh; get_completions '$cmd'"
end

# Set the tool to use bash completions
complete -xc ghapi -a '(__fish_complete_bash)'
