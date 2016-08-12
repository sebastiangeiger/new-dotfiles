function ip_for
	tugboat info $argv | grep "IP:" | sed -E "s/^IP: +//g"
end
