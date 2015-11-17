#!/bin/sh

list_alldir(){
	local local_dir=$1
	echo $local_dir
    for sub_item in `ls -a $local_dir`
    do
		if [ "$sub_item" = "." ] || [ "$sub_item" = ".." ];then
			continue
		fi
		if [ -f "$local_dir/$sub_item" ] && [ ! -L "$local_dir/$sub_item" ];then
			echo "applying patch $local_dir/$sub_item"
			patch -p1 < "$local_dir/$sub_item"
		elif [ -d "$local_dir/$sub_item" ];then
            echo "$local_dir/$sub_item"
             list_alldir "$local_dir/$sub_item"
		fi
    done
}

list_alldir "/git-resp/myjob/opwrt/opwrt_ap/package/kernel/mac80211/patches"

