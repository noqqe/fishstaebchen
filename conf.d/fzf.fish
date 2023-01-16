set -q FZF_TMUX_HEIGHT; or set -U FZF_TMUX_HEIGHT "40%"
set -q FZF_DEFAULT_OPTS; or set -U FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT"
set -q FZF_LEGACY_KEYBINDINGS; or set -U FZF_LEGACY_KEYBINDINGS 1
set -q FZF_DISABLE_KEYBINDINGS; or set -U FZF_DISABLE_KEYBINDINGS 0
set -q FZF_PREVIEW_FILE_CMD; or set -U FZF_PREVIEW_FILE_CMD "head -n 10"
set -q FZF_PREVIEW_DIR_CMD; or set -U FZF_PREVIEW_DIR_CMD "ls"

if test "$FZF_DISABLE_KEYBINDINGS" -ne 1
    if test "$FZF_LEGACY_KEYBINDINGS" -eq 1
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \co '__fzf_open'
        bind \cg '__fzf_search_git_log'

        if ! test "$fish_key_bindings" = fish_default_key_bindings
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \co '__fzf_open'
            bind -M insert \cg '__fzf_search_git_log'
        end
    else
        bind \ct '__fzf_find_file'
        bind \cr '__fzf_reverse_isearch'
        bind \ec '__fzf_cd'
        bind \eo '__fzf_open'
        bind \cg '__fzf_search_git_log'

        if ! test "$fish_key_bindings" = fish_default_key_bindings
            bind -M insert \ct '__fzf_find_file'
            bind -M insert \cr '__fzf_reverse_isearch'
            bind -M insert \ec '__fzf_cd'
            bind -M insert \eo '__fzf_open'
            bind -M insert \cg '__fzf_search_git_log'
        end
    end

    if not bind --user \t >/dev/null 2>/dev/null
        if set -q FZF_COMPLETE
            bind \t '__fzf_complete'
            if ! test "$fish_key_bindings" = fish_default_key_bindings
                bind -M insert \t '__fzf_complete'
            end
        end
    end
end

function _fzf_uninstall -e fzf_uninstall
    bind --user \
        | string replace --filter --regex -- "bind (.+)( '?__fzf.*)" 'bind -e $1' \
        | source

    set --names \
        | string replace --filter --regex '(^FZF)' 'set --erase $1' \
        | source

    functions --erase _fzf_uninstall
end

function __fzf_search_git_log --description "Search the output of git log and preview commits. Replace the current token with the selected commit hash."
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo '_fzf_search_git_log: Not in a git repository.' >&2
    else
        # see documentation for git format placeholders at https://git-scm.com/docs/git-log#Documentation/git-log.txt-emnem
        # %h gives you the abbreviated commit hash, which is useful for saving screen space, but we will have to expand it later below
        set log_fmt_str '%C(bold blue)%h%C(reset) - %C(cyan)%ad%C(reset) %C(yellow)%d%C(reset) %C(normal)%s%C(reset)  %C(dim normal)[%an]%C(reset)'
        set selected_log_lines (
            git log --no-show-signature --color=always --format=format:$log_fmt_str --date=short | \
            fzf --ansi \
                --multi \
                --tiebreak=index \
                --prompt="Search Git Log> " \
                --preview='git show --color=always --stat --patch {1}' \
                --query=(commandline --current-token) \
                $fzf_git_log_opts
        )
        if test $status -eq 0
            for line in $selected_log_lines
                set abbreviated_commit_hash (string split --field 1 " " $line)
                set full_commit_hash (git rev-parse $abbreviated_commit_hash)
                set --append commit_hashes $full_commit_hash
            end
            commandline --current-token --replace (string join ' ' $commit_hashes)
        end
    end

    commandline --function repaint
end
