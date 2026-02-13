function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function apply-my-theme --on-variable=my_theme
    fish_config theme choose $my_theme
end

set -U my_theme Catppuccin\ Mocha

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    abbreviations

    starship init fish | source
    fzf --fish | source
    atuin init fish | source
    direnv hook fish | source
    zoxide init fish | source
    batman --export-env | source

end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/migu/.lmstudio/bin
# End of LM Studio CLI section
# Created by `pipx` on 2025-11-15 22:10:24
set -gx PATH $PATH ~/.local/bin
set -gx PATH $PATH ~/.cargo/bin
set -gx PATH $PATH ~/go/bin
set -x PNPM_HOME ~/.local/share/pnpm

if not contains $PNPM_HOME $PATH
    set -x PATH $PNPM_HOME $PATH
end

set -gx EDITOR nvim
