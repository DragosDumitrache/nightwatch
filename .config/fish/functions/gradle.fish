function gradle --wraps gradle --description 'Wraps gradle or the wrapper if it exists'
    if test -f gradlew
        command ./gradlew $argv
    else
        command gradle $argv
    end
end
