#!/bin/bash
for D in *.png; do
    if [ -e "${D}" ]; then
        #echo "${D}"
	dir=$(cut -c 1-6 <<<"$D")
	#echo "$dir"
	if [ -e "$dir" ]
	then
	    mv "$D" "$dir"/
	else
	    mkdir "$dir"
	    mv "$D" "$dir"/
        fi
    fi
done
