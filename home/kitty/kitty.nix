{ config, pkgs, ... }: {

  programs.kitty = {
    enable = true;
    # Reset existing mappings
    keybindings = {
      "ctrl+alt+tab" = "next_tab";
      "ctrl+alt+shift+tab" = "previous_tab";
      # Send Ctrl Tab and Ctrl + Shift + Tab for Tmux navigation
      "ctrl+tab" = "send_text all \\x1b[27;5;9~";
      "ctrl+shift+tab" = "send_text all \\x1b[27;6;9~";
    };
    settings = {
      scrollback_lines = 10000;
      initial_window_width = 1200;
      initial_window_height = 600;
      update_check_interval = 0;
      enable_audio_bell = false;
      confirm_os_window_close = "0";
      remember_window_size = "no";
      disable_ligatures = "never";
      url_style = "curly";
      tab_bar_style = "powerline";
      cursor_shape = "Underline";
      
      # Font
      font_family = "JetBrainsMono Nerd Font";
      
      # Colors
      background = "#" + "1e1e2e";
      foreground = "#" + "cdd6f4";
      color0 = "#" + "45475A";
      color8 = "#" + "585B70";
      color1 = "#" + "F38BA8";
      color9 = "#" + "F38BA8";
      color2 = "#" + "A6E3A1";
      color10 = "#" + "A6E3A1";
      color3 = "#" + "F9E2AF";
      color11 = "#" + "F9E2AF";
      color4 = "#" + "89B4FA";
      color12 = "#" + "89B4FA";
      color5 = "#" + "F5C2E7";
      color13 = "#" + "F5C2E7";
      color6 = "#" + "94E2D5";
      color14 = "#" + "94E2D5";
      color7 = "#" + "BAC2DE";
      color15 = "#" + "A6ADC8";
      cursor = "#" + "f5e0dc";
      cursor_text_color = "#" + "1E1E2E";
      selection_foreground = "#" + "1E1E2E";
      selection_background = "#" + "F5E0DC";
    };
  };
}
