#!/bin/bash

mkdir -p foo/dummy foo/empty
cd foo/dummy
touch file1.txt file2.txt
echo $1>>file1.txt