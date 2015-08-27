# Path to your oh-my-fish.
set fish_path $HOME/.fish/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

Plugin "brew"
Plugin "rvm"
Plugin "git-flow"

set grc_plugin_execs head
Plugin "grc"
functions -e ls # Use default coloring and not grc
alias ls='ls -G'

Plugin "jump"
Plugin "mc"
Plugin "tmux"
Plugin "title"
Plugin "peco"
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

#Theme "robbyrussell"
#Theme "integral"
Theme "l"
function fish_right_prompt
  set -l red (set_color red)
  set -l normal (set_color normal)

  if [ "$rpdir" != (pwd) ]
    set ruby_info $red (command rvm-prompt)
    echo -n -s $ruby_info $normal
    set -g rpdir (pwd)
  end
end

function __fix_gem_path --on-variable PWD
  set -xg GEM_PATH (echo $GEM_PATH | sed -e 's/ \//:\//g')
end
__fix_gem_path

for dir in ~/local/*
  set -x PATH $PATH {$dir}/bin
end
set -x PATH $PATH /Library/TeX/texbin
