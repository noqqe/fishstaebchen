# Prompt colors
set fish_bind_mode default
set fish_color_autosuggestion bd93f9
set fish_color_cancel -r
set fish_color_command white
set fish_color_comment 6272a4
set fish_color_cwd 50fa7b
set fish_color_cwd_root ff5555
set fish_color_end bd93f9
set fish_color_error ff5555
set fish_color_escape 'bryellow'  '--bold'
set fish_color_history_current --bold
set fish_color_host normal
set fish_color_match --background=brblue
set fish_color_normal normal
set fish_color_operator bryellow
set fish_color_param white
set fish_color_quote 8be9fd
set fish_color_redirection f1fa8c
set fish_color_search_match 'bryellow'  '--background=brblack'
set fish_color_selection 'white'  '--bold'  '--background=brblack'
set fish_color_status ff79c6
set fish_color_user bd93f9
set fish_color_valid_path underline

# General
set fish_key_bindings fish_default_key_bindings

# Pager
set fish_pager_color_completion
set fish_pager_color_description 'B3A06D'  'yellow'
set fish_pager_color_prefix 'white'  '--bold'  '--underline'
set fish_pager_color_progress 'brwhite'  '--background=cyan'

# git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch f1fa8c
set __fish_git_prompt_color_upstream_ahead f4e50e
set __fish_git_prompt_color_upstream_behind f90e2a

# git Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '#'
set __fish_git_prompt_char_untrackedfiles '%'
set __fish_git_prompt_char_stashstate '?'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'
