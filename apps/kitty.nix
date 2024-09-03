     
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
#░  ░░░░  ░░        ░░        ░░        ░░  ░░░░  ░░░      ░░░░      ░░░   ░░░  ░░        ░
#▒  ▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒  ▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒    ▒▒  ▒▒  ▒▒▒▒▒▒▒
#▓     ▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓    ▓▓▓▓  ▓▓▓▓▓▓▓▓  ▓▓▓▓  ▓▓  ▓  ▓  ▓▓      ▓▓▓
#█  ███  ██████  ████████  ████████  ████████  █████  ████  ██  ████  ██  ██    ██  ███████
#█  ████  ██        █████  ████████  ████████  ██████      ████      ███  ███   ██  ███████
#██████████████████████████████████████████████████████████████████████████████████████████

{ config, lib, pkgs, ... }:

{
  # Create the fastfetch config file if it doesn't exist
  home.file.".config/kitty/kitty.conf".text = ''


disable_ligatures never

cursor_shape underline

cursor_blink_interval 0.5

#: The interval (in seconds) at which to blink the cursor. Set to zero
#: to disable blinking.

scrollback_lines 6000

mouse_hide_wait 1.0

# url_color #f5369c
url_style curly

#: The color and style for highlighting URLs on mouse-over. url_style
#: can be one of: none, single, double, curly

open_url_with default

detect_urls yes

remember_window_size  no
initial_window_width  1400
initial_window_height 950



window_border_width 0.5pt

window_margin_width 0 0 0 10

confirm_os_window_close 0


tab_bar_style powerline

#: The tab bar style, can be one of:

#: fade
#:     Each tab's edges fade into the background color (see tab_fade)
#: slant
#:     Tabs look like the tabs in a physical file
#: separator
#:     Tabs are separated by a configurable separator (see tab_separator)
#: powerline
#:     Tabs are shown as a continuous line with "fancy" separators (see tab_powerline_style)
#: hidden
#:     The tab bar is hidden. If you use this, you might want to create a mapping
#:     for the https://sw.kovidgoyal.net/kitty/actions/#select-tab action which presents you with a list
#:     of tabs and allows for easy switching to a tab.

tab_bar_min_tabs 2

#: The minimum number of tabs that must exist before the tab bar is
#: shown

# tab_switch_strategy previous

#: The algorithm to use when switching to a tab when the current tab
#: is closed. The default of previous will switch to the last used
#: tab. A value of left will switch to the tab to the left of the
#: closed tab. A value of right will switch to the tab to the right of
#: the closed tab. A value of last will switch to the right-most tab.

# tab_fade 0.25 0.5 0.75 1

#: Control how each tab fades into the background when using fade for
#: the tab_bar_style. Each number is an alpha (between zero and one)
#: that controls how much the corresponding cell fades into the
#: background, with zero being no fade and one being full fade. You
#: can change the number of cells used by adding/removing entries to
#: this list.
# tab_separator ">"


#: The separator between tabs in the tab bar when using separator as
#: the tab_bar_style.

tab_powerline_style round

#: The powerline separator style between tabs in the tab bar when
#: using powerline as the tab_bar_style, can be one of: angled,
#: slanted, or round.

background_opacity 1

#: The opacity of the background. A number between 0 and 1, where 1 is
#: opaque and 0 is fully transparent.  This will only work if
#: supported by the OS (for instance, when using a compositor under
#: X11). Note that it only sets the background color's opacity in
#: cells that have the same background color as the default terminal
#: background. This is so that things like the status bar in vim,
#: powerline prompts, etc. still look good.  But it means that if you
#: use a color theme with a background color in your editor, it will
#: not be rendered as transparent.  Instead you should change the
#: default background color in your kitty config and not use a
#: background color in the editor color scheme. Or use the escape
#: codes to set the terminals default colors in a shell script to
#: launch your editor.  Be aware that using a value less than 1.0 is a
#: (possibly significant) performance hit.  If you want to dynamically
#: change transparency of windows set dynamic_background_opacity to
#: yes (this is off by default as it has a performance cost). Changing
#: this setting when reloading the config will only work if
#: dynamic_background_opacity was enabled in the original config.

# background_image none

#: Path to a background image. Must be in PNG format.

# background_image_layout tiled

#: Whether to tile or scale the background image.

# background_image_linear no

#: When background image is scaled, whether linear interpolation
#: should be used.

# dynamic_background_opacity no

#: Allow changing of the background_opacity dynamically, using either
#: keyboard shortcuts (increase_background_opacity and
#: decrease_background_opacity) or the remote control facility.
#: Changing this setting by reloading the config is not supported.

# background_tint 0.0

#: How much to tint the background image by the background color. The
#: tint is applied only under the text area, not margin/borders. Makes
#: it easier to read the text. Tinting is done using the current
#: background color for each window. This setting applies only if
#: background_opacity is set and transparent windows are supported or
#: background_image is set.

# dim_opacity 0.75

#: How much to dim text that has the DIM/FAINT attribute set. One
#: means no dimming and zero means fully dimmed (i.e. invisible).

# selection_foreground #000000

#: The foreground for text selected with the mouse. A value of none
#: means to leave the color unchanged.

# selection_background #fffacd

#: Advanced {{{

# shell .
shell_integration disabled

#: The shell program to execute. The default value of . means to use
#: whatever shell is set as the default shell for the current user.
#: Note that on macOS if you change this, you might need to add
#: --login and --interactive to ensure that the shell starts in
#: interactive mode and reads its startup rc files.

editor nano

#: The terminal editor (such as ``vim`` or ``nano``) to use when
#: editing the kitty config file or similar tasks.

# close_on_child_death no


allow_remote_control yes

kitty_mod ctrl+shift

map kitty_mod+c copy_to_clipboard

map kitty_mod+v paste_from_clipboard

map kitty_mod+q close_window
map kitty_mod+d next_window
map kitty_mod+a previous_window
map kitty_mod+w move_window_forward
map kitty_mod+s move_window_backward
# map kitty_mod+` move_window_to_top
# map kitty_mod+r start_resizing_window
# map kitty_mod+r start_resizing_window
# map kitty_mod+1 first_window
# map kitty_mod+2 second_window
# map kitty_mod+3 third_window
# map kitty_mod+4 fourth_window
# map kitty_mod+5 fifth_window
# map kitty_mod+6 sixth_window
# map kitty_mod+7 seventh_window
# map kitty_mod+8 eighth_window
# map kitty_mod+9 ninth_window
# map kitty_mod+0 tenth_window
#: }}}

#: Tab management {{{

# map kitty_mod+right next_tab
# map kitty_mod+left  previous_tab
map kitty_mod+z new_tab
map kitty_mod+x     close_tab
# map shift+cmd+w     close_os_window
# map kitty_mod+alt+d     move_tab_forward
# map kitty_mod+alt+a     move_tab_backward
# map kitty_mod+alt+t set_tab_title

# fonts

font_family      JetBrainsMono Nerd Font

# The basic colors
foreground              #CDD6F4
background              #282828
selection_foreground    #1E1E2E
selection_background    #F5E0DC

# Cursor colors
cursor                  #F5E0DC
cursor_text_color       #1E1E2E

# URL underline color when hovering with mouse
url_color               #F5E0DC

# Kitty window border colors
active_border_color     #B4BEFE
inactive_border_color   #6C7086
bell_border_color       #F9E2AF

# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

# Tab bar colors
active_tab_foreground   #11111B
active_tab_background   #CBA6F7
inactive_tab_foreground #CDD6F4
inactive_tab_background #181825
tab_bar_background      #11111B

# Colors for marks (marked text in the terminal)
mark1_foreground #1E1E2E
mark1_background #B4BEFE
mark2_foreground #1E1E2E
mark2_background #CBA6F7
mark3_foreground #1E1E2E
mark3_background #74C7EC

# The 16 terminal colors

# black
color0 #45475A
color8 #585B70

# red
color1 #F38BA8
color9 #F38BA8

# green
color2  #A6E3A1
color10 #A6E3A1

# yellow
color3  #F9E2AF
color11 #F9E2AF

# blue
color4  #89B4FA
color12 #89B4FA

# magenta
color5  #F5C2E7
color13 #F5C2E7

# cyan
color6  #94E2D5
color14 #94E2D5

# white
color7  #BAC2DE
color15 #A6ADC8
  
    ''; 
}
