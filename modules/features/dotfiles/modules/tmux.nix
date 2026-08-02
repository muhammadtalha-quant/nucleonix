{ pkgs, ... }: {
    programs.tmux = {
        enable = true;
        aggressiveResize = true;
        keyMode = "vi";
        prefix = "C-b";
        baseIndex = 1;
        mouse = true;
        disableConfirmationPrompt = true;
        clock24 = false;
        sensibleOnTop = true;
        extraConfig = ''
            set-option -g renumber-windows on
            set -g extended-keys always
            set -g extended-keys-format csi-u
            set -as terminal-features 'xterm*:extkeys'
            set -g allow-passthrough on
            set -ga update-environment TERM
            set -ga update-environment TERM_PROGRAM
        '';
        plugins = with pkgs.tmuxPlugins; [
            {
                plugin = sensible;
            }
            {
                plugin = resurrect;
                extraConfig = ''
                    set -g @resurrect-strategy-nvim 'session'
                    set -g @resurrect-processes 'lazygit'
                    set -g @resurrect-processes 'yazi'
                '';
            }
            {
                plugin = continuum;
                extraConfig = ''
                    set -g @continuum-save-interval '15'
                    set -g @continuum-restore 'on'
                '';
            }
            {
                plugin = dotbar;
                extraConfig = ''
                    set -g @tmux-dotbar-bg "#282828"
                    set -g @tmux-dotbar-fg "#665c54"
                    set -g @tmux-dotbar-fg-current "#ebdbb2"
                    set -g @tmux-dotbar-fg-session "#bdae93"
                    set -g @tmux-dotbar-fg-prefix "#d3869b"
                '';
            }
        ];
    };
}
