#!/bin/bash

if [ $# -ne 1 ]
then
echo "Error: you need to provide ONE argument at least."
exit 1
else
TEXTO=$(curl -s http://metaphorpsum.com/paragraphs/2/4)
echo $TEXTO
echo "La palabra $(echo $1) aparece $(echo $TEXTO | grep -ow $1 | wc -w) veces"
echo "Aparece por primera vez en la línea $(echo $TEXTO | grep -n $1| head -c 1)"
fi