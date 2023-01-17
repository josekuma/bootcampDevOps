if [ $# -ne 2 ]
then
echo "Error: you need to provide TWO arguments at least." >&2
exit 1
else
PALABRA=$2
TEXTO=$(curl -s $1)
VECES=$(echo $TEXTO | grep -ow $PALABRA | wc -w)
LINEA=$(echo $TEXTO | grep -n $PALABRA| head -c 1)
echo $TEXTO
if [ $VECES -eq 0 ]
then
echo "La palabra $PALABRA no aparece nunca" 
else
echo "La palabra $(echo $PALABRA) aparece $VECES veces"
if [ $VECES -eq 1 ]
then
echo "Aparece unicamente en la línea $LINEA"
else
echo "Aparece por primera vez en la línea $LINEA"
fi
fi
fi