#!/bin/bash
xcode_black="default"
xcode_magenta="#ff7ab2"
xcode_cyan="#dabaff"
xcode_red="#ff8170"
xcode_white="#dfdfe0"
xcode_purple="#b281eb"
xcode_visual_grey="#7f8c92"
xcode_comment_grey="#dfdfe0"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$xcode_white"
set "message-bg" "$xcode_black"

set "message-command-fg" "$xcode_white"
set "message-command-bg" "$xcode_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$xcode_white"
setw "window-status-bg" "$xcode_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$xcode_black"
setw "window-status-activity-fg" "$xcode_white"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$xcode_comment_grey"
set "window-active-style" "fg=$xcode_white"

set "pane-border-fg" "$xcode_white"
set "pane-border-bg" "$xcode_magenta"
set "pane-active-border-fg" "$xcode_white"
set "pane-active-border-bg" "$xcode_purple"

set "display-panes-active-colour" "$xcode_magenta"
set "display-panes-colour" "$xcode_cyan"

set "status-bg" "$xcode_black"
set "status-fg" "$xcode_white"

set "@prefix_highlight_fg" "$xcode_black"
set "@prefix_highlight_bg" "$xcode_magenta"
set "@prefix_highlight_copy_mode_attr" "fg=$xcode_black,bg=$xcode_purple"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@xcode_widgets")
time_format=$(get "@xcode_time_format" "%R")
date_format=$(get "@xcode_date_format" " %d/%m/%Y")

set "status-position" "top"
set "status-right" ""
# set "status-right" "#[fg=$xcode_white,bg=$xcode_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$xcode_white,bg=$xcode_xcode]#[fg=$xcode_black,bg=$xcode_red]#[fg=$xcode_white, bg=$xcode_visual_grey]${status_widgets} #[fg=$xcode_green,bg=$xcode_visual_grey,nobold,nounderscore,noitalics]#[fg=$xcode_black,bg=$xcode_green,bold] #h #[fg=$xcode_yellow,
# bg=$xcode_green]#[fg=$xcode_visual_grey,bg=$xcode_yellow]"
set "status-left" "#[fg=$xcode_black,bg=$xcode_cyan,bold] #S #{prefix_highlight}#[fg=$xcode_cyan,bg=$xcode_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$xcode_black,bg=$xcode_black,nobold,nounderscore,noitalics]#[fg=$xcode_white,bg=$xcode_magenta] #I  #W #[fg=$xcode_magenta,bg=$xcode_purple,nobold,nounderscore,noitalics]"

set "window-status-current-format" "#[fg=$xcode_black,bg=$xcode_purple] #[fg=$xcode_white,bg=$xcode_purple,nobold] #I  #W #[fg=$xcode_purple,bg=$xcode_magenta,nobold,nounderscore,noitalics]"
