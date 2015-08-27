function npm-exec
	begin
set -lx PATH (npm bin) $PATH
eval $argv
end
end
