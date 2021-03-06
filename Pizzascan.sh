#!/bin/bash

# Color variables
green='\033[0;32m'
red='\033[0;31m'
# Clear the color after that
clear='\033[0m'

if [ -f  "./host.txt" ]; then
	rm ./host.txt
fi

if [ -d  "./output" ]; then
        rm ./output/*
fi

if [ ! -d  "./bin" ]; then
	mkdir ./bin
fi

if [ ! -d  "./bin/ParamSpider" ]; then
        git clone https://github.com/devanshbatham/ParamSpider.git ./bin/ParamSpider
fi

if [ ! -d  "./bin/SubEnum" ]; then
	git clone https://github.com/bing0o/SubEnum.git ./bin/SubEnum
fi

if [ $2 = "-list" ]; then
	./bin/SubEnum/subenum.sh -d "$1" -o ./domains.txt
elif [ $2 = "-single" ]; then
	echo "$1" > ./domains.txt
fi

clear

while read attk
do
	python3 ./bin/ParamSpider/paramspider.py -d "$attk" -p Bugbounty --exclude js,jpg,png,css,woff,ttf,svg,ashx,gif,svg
done < ./domains.txt

cat ./output/* > ./pspider_out.txt
sed -i '/?utm_source/d' ./pspider_out.txt
sed -i '/?utm_medium/d' ./pspider_out.txt
sed -i '/?C=/d' ./pspider_out.txt

clear

while read url
do
    httpcode=$(curl --insecure -o /dev/null --silent --head --write-out '%{http_code}' "$url" )
    if [ "$httpcode" == "200" ]; then
         echo "$url" >> ./host.txt
	 echo -e "${green}VALID URL FOUND:  $url${clear}"
    else
	 echo -e "${red}INVALID URL:      $url${clear}"
    fi
done < ./pspider_out.txt
sed -i 's/Bugbounty/pizzascan">bugbounty/g' host.txt
sleep 5
clear
python3 -u Find_HTML_inj.py | tee debug.txt && sed -i '/:\s0/d' debug.txt 
