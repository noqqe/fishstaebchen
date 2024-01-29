function fish_prompt --description 'Write out the prompt'
	set -l last_status $status
    set -l normal (set_color normal)

    # Hack; fish_config only copies the fish_prompt function (see #736)
    if not set -q -g __fish_classic_git_functions_defined
        set -g __fish_classic_git_functions_defined

        function __fish_repaint_user --on-variable fish_color_user --description "Event handler, repaint when fish_color_user changes"
            if status --is-interactive
                commandline -f repaint ^/dev/null
            end
        end

        function __fish_repaint_host --on-variable fish_color_host --description "Event handler, repaint when fish_color_host changes"
            if status --is-interactive
                commandline -f repaint ^/dev/null
            end
        end

        function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
            if status --is-interactive
                commandline -f repaint ^/dev/null
            end
        end

        function __fish_repaint_bind_mode --on-variable fish_key_bindings --description "Event handler; repaint when fish_key_bindings changes"
            if status --is-interactive
                commandline -f repaint ^/dev/null
            end
        end

        # initialize our new variables
        if not set -q __fish_classic_git_prompt_initialized
            set -qU fish_color_user
            or set -U fish_color_user -o green
            set -qU fish_color_host
            or set -U fish_color_host -o cyan
            set -qU fish_color_status
            or set -U fish_color_status red
            set -U __fish_classic_git_prompt_initialized
        end
    end

    set -l color_cwd
    set -l prefix
    set -l suffix
    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    set -l prompt_status
    if test $last_status -ne 0
        set prompt_status ' ' (set_color $fish_color_status) "$last_status" "$normal"
    end

    # Status return
    set -l status_copy $status
    set -l status_code $status_copy

    set -l color_normal (set_color normal)
    set -l color_error (set_color $fish_color_error)
    set -l color "$color_normal"

    switch "$status_copy"
        case 0 "$__sol_status_last"
            set status_code
    end

    set -g __sol_status_last $status_copy

    if test "$status_copy" -ne 0
        set color "$color_error"
    end

    if type -q humantime
      set duration (humantime $CMD_DURATION) else
      set duration (echo $CMD_DURATION)
    end

    echo -n -s (set_color yellow) (date "+%F %H:%M ") (set_color $fish_color_user) "$USER" $normal @ (set_color $fish_color_host) (prompt_hostname) $normal ' ' (set_color $color_cwd) (prompt_pwd -D 5) $normal (__fish_git_prompt) (__kube_prompt) $normal $prompt_status " ($duration) " \n $suffix " "
end

# # Do not show execution time on the right side.
function fish_right_prompt
  # do nothing
end
