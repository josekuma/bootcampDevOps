#!/bin/bash
if [ $# -ne 1 ]; then
echo "El numero de argumentos debe de ser de UNO." >&2
exit 1
else
mkdir -p foo/dummy foo/empty
echo $1 > foo/dummy/file1.txt
touch foo/dummy/file2.txt 
mv foo/dummy/file2.txt foo/empty
fi
