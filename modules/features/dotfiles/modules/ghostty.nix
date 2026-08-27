{
  programs.ghostty = {
    enable = true;

    settings = {
      background-opacity = 0.90000;
      background-blur = true;
      clipboard-read = "allow";
      clipboard-write = "allow";
      window-decoration = "none";
      window-inherit-working-directory = false;
      confirm-close-surface = false;
      copy-on-select = false;
      cursor-style = "bar";
      font-size = 14;

      keybind = [
        "ctrl+shift+equal=increase_font_size:2"
        "ctrl+shift+minus=decrease_font_size:2"
        "ctrl+shift+backspace=reset_font_size"
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+v=unbind"
        "ctrl+shift+e=unbind"
        "ctrl+shift+o=unbind"
        "ctrl+a=unbind"
        "ctrl+shift+page_up=scroll_page_up"
        "ctrl+shift+page_down=scroll_page_down"
        "ctrl+shift+home=scroll_to_top"
        "ctrl+shift+end=scroll_to_bottom"
        "ctrl+shift+up=scroll_page_lines:-1"
        "ctrl+shift+down=scroll_page_lines:1"
      ];

      mouse-hide-while-typing = true;
      notify-on-command-finish = "unfocused";
      notify-on-command-finish-action = "no-bell,notify";
      notify-on-command-finish-after = "5s";
      scrollback-limit = 100000;
      theme = "stylix";
    };
  };
}
