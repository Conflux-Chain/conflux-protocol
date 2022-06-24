#!/bin/bash
function build() {
    nodiff=true
    (git diff --quiet && git diff --cached --quiet) || nodiff=false
    if $nodiff; then
        commitid=$(git rev-parse --short HEAD)
        version=$commitid
        timestamp=$(git show -s --format=%ct HEAD)
    else
        version="Temporary"
        timestamp=$(date +%s)
    fi

    if [[ $OSTYPE == 'darwin'* ]]; then
        date=$(LC_ALL=C date -r $timestamp +"%B %e, %Y")
    else
        date=$(LC_ALL=C date -d '@'$timestamp +"%B %e, %Y")    
    fi
    

    echo "\\newcommand{\\fdate}{"$date"}" > version.tex
    echo "\\newcommand{\\version}{"$version"}" >> version.tex
}

function remove() {
    rm version.tex
}

if [ $1 == "build" ]; then 
    build
fi

if [ $1 == "remove" ]; then 
    remove
fi
