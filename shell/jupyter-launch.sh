#!/usr/bin/env bash
url=$(/usr/bin/env jupyter server list 2>/dev/null | /usr/bin/sed -n 2p |/usr/bin/cut -d' ' -f1)

if [[ $url == 'http:'* ]]; then
	echo "$url"
	/usr/bin/xdg-open "$url"
else
	nohup /usr/bin/env jupyter-lab --ip 0.0.0.0 --port 13011 &
fi
