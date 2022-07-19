function docker-kill --description 'Kill docker container'
  set -l containers (docker ps | string split "\n")
  set -e containers[1]
  set -l containers_to_kill

  for container in $containers
    set container_name (echo $container | awk '{print $2}')
    set -a containers_to_kill $container_name
  end

  set containers_to_kill (echo $containers_to_kill | string split " " | fzf -m)
  for container in $containers
    set container_name (echo $container | awk '{print $2}')
    if contains $container_name $containers_to_kill
      docker kill (echo $container | awk '{print $1}')
    end
  end
end
