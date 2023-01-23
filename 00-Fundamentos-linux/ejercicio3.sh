#!/bin/bash
if [ $# -eq 0 ]; then
    mkdir -p foo/dummy foo/empty
    echo "Me encanta la bash" > foo/dummy/file1.txt
    touch foo/dummy/file2.txt 
    cat foo/dummy/file1.txt>> foo/dummy/file2.txt
    mv foo/dummy/file2.txt foo/empty
    exit 0
fi
if [ $# -ne 1 ]; then
    echo "El numero de argumentos debe de ser de UNO." >&2
    exit 1
fi
    mkdir -p foo/dummy foo/empty
    echo $1 > foo/dummy/file1.txt
    touch foo/dummy/file2.txt 
    cat foo/dummy/file1.txt>> foo/dummy/file2.txt
    mv foo/dummy/file2.txt foo/empty
    exit 0
