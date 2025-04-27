set -g CMD_DURATION 0

function blue; set_color -o 3dc1d3; end
function pink; set_color -o f78fb3; end
function deep_rose; set_color -o c44569; end
function porcelain; set_color -o e66767; end
function hard_blue; set_color -o 546de5; end
function purple; set_color -o 574b90; end
function orange; set_color -o f19066; end
function gray; set_color -o 596275; end
function reset_color; set_color normal; end

function fish_prompt
  #set -l code $status

 # set -l prompt (prompt_pwd)
 # set -l base (basename "$prompt")
  set -l prompt (prompt_pwd)
  set -l base (basename "$PWD")

  set -l pp (string replace -r "^$HOME" " ⌁" $PWD)  # Replace home dir with ~
  set -l counter 1
  set -l homeIcon 0

  # Checking what is the first char a / or a ~
  switch $PWD
  case "$HOME*"
  	set -l pp (string replace -r "^$HOME" " ⌁" $PWD)  # Replace home dir with ~
    set homeIcon 1
  case "*"
    printf (hard_blue)"/ "(reset_color)
  end
  # Split the path into parts
  set -l parts (string split "/" (string replace -r '^/' '' $pp))
  for part in $parts
    # check si current repo name
    if test "$part" = "$base"
      printf (hard_blue)$part(reset_color)" >_ "
    else if test $counter = 1
      # logic 
      if test $homeIcon = 1
		printf (blue)$part(reset_color)
      else
		printf (flash_snd)$part(reset_color)
      end
      printf " :\ "
    else
      printf (deep_rose)$part(reset_color)" \ "
    end
    set counter (math $counter + 1)
  end
reset_color
end
