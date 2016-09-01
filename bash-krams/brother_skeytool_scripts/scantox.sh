#!/bin/bash -e

scan_path=~/Dokumente/Scans
scan_path_tmp=$(mktemp -d)
debug=false
resolution=300
output_filename=scan_$(date +%Y%m%d%H%M%S)
output_file="$scan_path/$output_filename"
output_file_tmp="$scan_path_tmp/$output_filename%03d.tiff"

if $debug; then
    exec &> /tmp/scan_logfile.log
fi

function checkscanpath() {
    if [[ ! -d $scan_path ]]; then
        mkdir -p $scan_path
    fi
}

function scantox() {
    scanimage --device-name "$device" --resolution $resolution -l 0 -t 0 \
-x 210.00 -y 295.00 --format=tiff --batch=$output_file_tmp --verbose
}

function convert2() {
    if [[ "$1" == "pic" ]]; then
        c=0
        for file in $(find $scan_path_tmp -type f); do
            convert $file -quality 90 $output_file-$c.jpg
            c=$[$c+1]
        done
    elif [[ "$1" == "file" ]]; then
        convert $scan_path_tmp/* $output_file.pdf
    fi
}

function finish() {
    if [[ -d $scan_path_tmp ]]; then
        rm -r $scan_path_tmp
    fi
}

function openscanwith() {
    if [[ $1 == "file" ]]; then
        xdg-open $scan_path &
    elif [[ $1 == "mail" ]]; then
        xdg-open --attach $output_file.pdf &
    fi
}
