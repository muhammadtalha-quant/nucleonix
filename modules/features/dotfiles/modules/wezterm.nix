{ lib, ... }: {
    programs = {
        wezterm = {
            enable = true;
            settings = {
                color_scheme = "Noctalia";
                adjust_window_size_when_changing_font_size = false;
                font_size = 14;
                hide_tab_bar_if_only_one_tab = true;
                window_padding = {
                    left = 0;
                    right = 0;
                    top = 0;
                    bottom = 0;
                };
                font = lib.generators.mkLuaInline ''wezterm.font("JetBrainsMono NFM")'';
            };
            /*
              settings = {
                  remember_window_size = true;
                  background_opacity = 1;
                  confirm_os_window_close = 0;
                  enable_audio_bell = false;
                  scrollback = "never";
                  notify_on_cmd_finish = "invisible 5.0";
                  hide_window_decorations = "yes";
                  scrollback_lines = 100000;
                  enabled_layouts = "splits,stack";
              };
              shellIntegration.enableFishIntegration = true;
              enableGitIntegration = true;
              keybindings = {
                  "ctrl+shift+c" = "copy_to_clipboard";
                  "ctrl+shift+v" = "paste_from_clipboard";
                  "ctrl+shift+up" = "scroll_line_up";
                  "ctrl+shift+down" = "scroll_line_down";
                  "page_up" = "scroll_page_up";
                  "page_down" = "scroll_page_down";
                  "ctrl+shift+t" = "no_op";
                  "ctrl+shift+q" = "no_op";
                  "ctrl+shift+left" = "no_op";
                  "ctrl+shift+right" = "no_op";
                  "ctrl+shift+enter" = "no_op";
                  "ctrl+alt+enter" = "no_op";
                  "ctrl+alt+left" = "no_op";
                  "ctrl+alt+right" = "no_op";
                  "ctrl+alt+up" = "no_op";
                  "ctrl+alt+down" = "no_op";
                  "ctrl+shift+home" = "no_op";
                  "ctrl+left" = "no_op";
                  "ctrl+right" = "no_op";
                  "ctrl+up" = "no_op";
                  "ctrl+down" = "no_op";
                  "ctrl+shift+equal" = "change_font_size all +2.0";
                  "ctrl+shift+minus" = "change_font_size all -2.0";
                  "ctrl+shift+backspace" = "change_font_size all 0";
              };
              extraConfig = ''
                  include themes/noctalia.conf
              '';
            */
        };
    };
}
