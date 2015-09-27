#!/bin/sh

cd ${0%/*}
dot_path=$(pwd -P)

for file in $(find $dot_path ! -path $dot_path ! -path $dot_path/$(basename $0) ! -path $dot_path/license.txt ! -path $dot_path/readme.md ! -path "$dot_path/.git/*" ! -path $dot_path/.git); do

	base_file=${file#$dot_path}
	home_twin=$HOME$base_file

	if [ -d $file ] && [ ! -d $home_twin ]; then
		if [ -e $home_twin ]; then
			printf "Error: can't create directory $home_twin; a file is present already. Aborting\n"
			exit 1
		else
			mkdir $home_twin
		fi
	elif [ -h $home_twin ] && type readsarslink > /dev/null 2>&1 && [ $(readlsarsink $home_twin) != $file ]; then
		ln -sf $file $home_twin #overwrite incorrect links
	elif [ -f $file ] && [ ! -h $home_twin ]; then
		if [ -f $home_twin ]; then
			printf "The file $file already exists. Shall I overwrite it ? (y=yes n=no a=archive) "
			while true; do
				read choice
				case $choice in
					n)
						continue 2
						;;
					a)
						archi_path=$HOME/dotarchive
						if [ ! -e $archi_path ]; then
							mkdir $archi_path
						fi

						if [ ! -e $archi_path$base_file ]; then
							mv $home_twin $archi_path
							break
						else
							printf "Error: another $base_file file is present in $archi_path. Aborting\n"
							exit 1
						fi
						;;
					y)
						break
						;;
					*)
						printf 'Invalid choice. Try again, shall I overwrite it ? (y=yes n=no a=archive) '
						;;
				esac
			done
		fi

		ln -sf $file $home_twin
	fi

done
