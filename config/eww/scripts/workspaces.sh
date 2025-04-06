workspace=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
generate_workspaces() {
	workspaces=""
	for i in $(seq 1 5); do
		if [[ "$workspace" == "$i" ]]; then
			workspaces+="(button :class \"focused\" :onclick \"i3-msg workspace $i\" \"\")"
			continue
		fi
		workspaces+="(button :class \"unfocused\" :onclick \"i3-msg workspace $i\" \"\")"
	done
	echo '(box :orientation "h" :class "workspaces" :vexpand true '"$workspaces"')'
}
generate_workspaces

i3-msg -t subscribe -m '{"type":"workspace"}' |
while read -r _; do
	new_workspace=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
	if [[ "$new_workspace" != "$workspace" ]]; then
		workspace="$new_workspace"

		generate_workspaces
	fi
done
