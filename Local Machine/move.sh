#!/bin/bash
if [[ "$PWD" = */generated_images ]]; then
	if [ ! -d "../generated_npy" ]; then
		mkdir "../generated_npy"
	fi
	echo "Folder is generated_images"
	for file in *; do
       		if [ -f $file ]; then
                	if [[ $file == *.npy ]]; then
                        	mv "$file" "../generated_npy/$file"
                	elif [[ $file == *.png ]]; then
                        	dir=$(cut -c 1-6 <<<"$file")
				echo "$file"
				echo "$dir"
                        	if [ ! -e "$dir" ]; then
					mkdir "$dir"
                        	fi
                                mv "$file" "$dir"/
                	fi
        	fi
	done
elif [[ "$PWD" = */aligned_images ]]; then
	echo "Folder is aligned_images"
	for file in *; do
                if [ -f $file ]; then
                        if [[ $file == *.png ]]; then
                                dir=$(cut -c 1-6 <<<"$file")
                                if [ ! -e "$dir" ]; then
					mkdir "$dir"
				fi
                                mv "$file" "$dir"/
                        fi
                fi
        done
else
	echo "You are not running the file in generated_images or aligned_images folder"
fi
