if [ $# -ne 2 ]
    then
        echo "Se necesitan únicamente dos parámetros para ejecutar este script" >&2
        exit 1
fi

    PALABRA=$(echo $2)
    TEXTO=$(curl -s $1)
    VECES=$(echo $TEXTO | grep -ow $PALABRA | wc -w)
    LINEA=$(echo $TEXTO | grep -n $PALABRA| head -c 1)
    echo $TEXTO

    if [ $VECES -eq 0 ]
        then
        echo "La palabra $PALABRA no aparece nunca" 
        exit 1
    fi

    if [ $VECES -eq 1 ]
        then
            echo "La palabra $PALABRA solo aparece una vez"
            echo "Aparece unicamente en la línea $LINEA"
            exit 1
        fi
    echo "La palabra $PALABRA aparece $VECES veces"    
    echo "Aparece por primera vez en la línea $LINEA"
    exit 1
    