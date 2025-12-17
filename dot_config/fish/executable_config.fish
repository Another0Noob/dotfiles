function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Use starship
    starship init fish | source
    fzf --fish | source
    atuin init fish | source
    direnv hook fish | source
    zoxide init fish | source

    # Aliases
    alias ls 'eza -a --icons'
    alias cd 'z'

end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/migu/.lmstudio/bin
# End of LM Studio CLI section
# Created by `pipx` on 2025-11-15 22:10:24
set PATH $PATH /home/migu/.local/bin
set PATH $PATH /home/migu/.cargo/bin
set PATH $PATH /home/migu/go/bin

set -Ux EDITOR zeditor
