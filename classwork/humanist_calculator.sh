#!/bin/bash

function enterTask {
read -p "Enter first number: " a
read -p "Enter second number: " b
read -p "Enter an arithmetic sign: " c
arr=($a $b $c)
}

#не надо мудрить с =~ (эквивалент egrep)
function wordToNumber {
        s=$1
        echo $s
        if [[ $s = [Nn][OoUu][Ll]* ]] ;then d=0  
        elif [[ $s = [AaOoEeIi][DdTt][IiEe]* || $s = [Rr]* ]] ;then d=1
        elif [[ $s = [DdTt][VvWw]* ]] ;then d=2
        elif [[ $s = [TtDd][Rr][IiEe]* ]] ;then d=3
        elif [[ $s = [CcHhJj][HhEeIiAa]* ]] ;then d=4    
        elif [[ $s = [Pp][\'AaYy]* ]] ;then d=5
        fi
}

enterTask
buf=()

for((i=0;i<2;i++))
    do
        wordToNumber ${arr[$i]}
        buf[$i]=$d
done

#обратная кавычка для упаковки исполняемого кода
e=`echo ${arr[2]} | grep [PpBb][Ll][UuOo][SsZz]`
#узнать длину переменной ниже через #
#кавычки должны быть двойными при сравнении строк в переменных
if [ "$e" != "" ] ;then
    e="+"
else
    e="-"
fi

echo Ответ: `expr "${buf[0]}" "$e" "${buf[1]}"`



