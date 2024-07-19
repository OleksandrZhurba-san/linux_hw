#!/bin/bash



ping_url() {
    url=$1
    interval=1
    consecutive_failures=0
    max_failures=3
    max_ping_allowed=30

    while true
    do
        response=$(ping -c 1 $url)
        status=$?

        if [ $status -ne 0 ]
        then
            echo "ping failed"
            consecutive_failures=$((consecutive_failures + 1))
        else
            #response time from ping
            time=$(echo $response | grep 'time=' | sed -E 's/.*time=([0-9.]+) ms.*./\1/')

            if (( $(echo "${time} > ${max_ping_allowed}" | bc -l) )); then
                echo "ping time $time ms > ${max_ping_allowed}ms"
                exit 1
            fi

            consecutive_failures=0
        fi

        if [ $consecutive_failures -ge $max_failures ]; then
            echo "${max_failures} consecutive pings failed"
            exit 1
        fi
        echo "ping ${1} ms=${time}..."
        sleep $interval
    done
}

if [ -z "$1" ]; then
    echo "$0: <url>"
    exit 1
fi

ping_url $1
