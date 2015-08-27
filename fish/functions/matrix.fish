function matrix
	set -x LC_ALL C
set -x GREP_COLOR "1;32"
tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | grep --color "[^ ]"
end
