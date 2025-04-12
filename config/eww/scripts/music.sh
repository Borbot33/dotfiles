get_position() {
	position=$(playerctl position 2>/dev/null)
	if [[ -n "$position" ]]; then
    	echo "$position"
	else
		echo "0"
	fi
}

get_duration() {
	duration=$(playerctl metadata mpris:length 2>/dev/null)
	if [[ -n "$duration" ]]; then
    	echo $(awk "BEGIN { print $duration / 1000000 }")
	else
		echo "0"
	fi
}

if [[ "$1" == "status" ]]; then
	if [ "$(playerctl status 2>/dev/null)" = "Playing" ]; then
		echo "" 
	else 
		echo ""
	fi
elif [[ "$1" == "listen" ]]; then 
	playerctl --follow metadata --format '{"title": "{{title}}", "artist": "{{artist}}", "cover": "{{mpris:artUrl}}"}' 2>/dev/null | while read -r data; do
		if [[ -n "$data" ]]; then
			echo $data
		else
			echo "{\"title\": \"Not found\", \"artist\": \"Not found\"}"
		fi
	done
elif [[ "$1" == "percentage" ]]; then
	awk "BEGIN { print (($(get_position) / $(get_duration)) * 100) + 0.5 }"
fi