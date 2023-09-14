#!/usr/bin/env bash

_qw_completions() {
    local numargs=${#COMP_WORDS[@]}

    # If the first argument is being typed
    if ((numargs == 2)); then
        if [[ ! -d ~/.qw/env ]]; then
            return
        fi
        local profile_suggestions=($(cd ~/.qw/env && echo *))
        local option_suggestions=("--list" "--remove" "--rename" "--regen_conf")
        local all_suggestions=("${profile_suggestions[@]}" "${option_suggestions[@]}")

        COMPREPLY=($(compgen -W "${all_suggestions[*]}" -- ${COMP_WORDS[1]}))
    elif ((numargs == 3)); then
        # If the second argument for --remove or --rename is being typed
        if [[ "${COMP_WORDS[1]}" == "--remove" || "${COMP_WORDS[1]}" == "--rename" || "${COMP_WORDS[1]}" == "--regen_conf" ]]; then
            if [[ ! -d ~/.qw/env ]]; then
                return
            fi
            local profile_suggestions=($(cd ~/.qw/env && echo *))
            COMPREPLY=($(compgen -W "${profile_suggestions[*]}" -- ${COMP_WORDS[2]}))
        fi
    fi
}

complete -F _qw_completions qw
