#!/bin/bash

# список сайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# файл для зберігання результатівє
logfile="website_status.log"

# очищення лог-файлу перед запуском
>"$logfile"

# цикл для перевірки статусу веб-сайтів
for site in "${websites[@]}"
do
    # команда curl для перевірки доступності сайтів
    if curl -s -L --head --request GET -w "%{http_code}\n" "$site" | grep  '200' > /dev/null
    then
        echo "$site is UP" >> "$logfile"
    else
        echo "$site is DOWN" >> "$logfile"
    fi
done

# вивід результатів
echo "Results written to $logfile"



