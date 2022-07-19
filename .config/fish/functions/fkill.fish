function fkill --description 'Fuzzy killer'
  set -l to_kill (ps aux | fzf)
  set pid (echo $to_kill | awk '{print $2}')
  kill $pid
end
