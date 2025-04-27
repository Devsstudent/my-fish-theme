
function flash_git_branch_name
    # Get the current branch
    command git rev-parse --abbrev-ref HEAD
end

function fish_right_prompt
  set -l code $status

  function status::color -S
    test $code -ne 0; and echo (pink); or echo (blue) (reset_color)
  end

  if test $CMD_DURATION -gt 0
    printf (gray)" "(printf "%.3fs " (math "$CMD_DURATION / 1000"))(reset_color)
  end

  if test -d .git
    echo (purple)"("(hard_blue)(flash_git_branch_name)(purple)")"(reset_color)
  end

  printf " "(gray)(date +%H(status::color):(gray)%M(status::color):(gray)%S)(orange)" "(reset_color)

  if test $code -ne 0
    echo (blue)"≡ "(pink)"$code"(reset_color)
  end
end
