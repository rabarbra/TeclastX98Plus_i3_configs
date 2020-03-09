if [[ "$1" == "grow" ]]; then
	`i3-msg resize grow height 5 px or 5 ppt || i3-msg resize grow width 5 px or 5 ppt`
elif [[ "$1" == "shrink" ]]; then
	`i3-msg resize shrink width 5 px or 5 ppt || i3-msg resize shrink height 5 px or 5 ppt`
fi
