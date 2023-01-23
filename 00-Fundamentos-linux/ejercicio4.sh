#!/bin/bash

if [ $# -ne 1 ]
    then
        echo "Se necesitan únicamente un parámetro para ejecutar este script">&2
        exit 1
    fi 
        TEXTO=$(curl -s http://metaphorpsum.com/paragraphs/2/4)
        VECES=$(echo $TEXTO | grep -ow $1 | wc -w) 
        LINEA=$(echo $TEXTO | grep -n $1| head -c 1)
        PALABRA=$(echo $1)
        echo $TEXTO
           if [ $VECES -eq 0 ]
            then
                echo "La palabra $PALABRA no aparece nunca" 
                
          
            elif [ $VECES -eq 1 ]
                then
                    echo "La palabra $PALABRA aparece solo una vez"
                    echo "Aparece unicamente en la línea $LINEA"
                   
            else
            echo "La palabra $PALABRA aparece $VECES veces"
            echo "Aparece por primera vez en la línea $LINEA"
            
        fi