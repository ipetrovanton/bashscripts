echo Введите первое число
read a
echo Введите второе число
read b
echo Введите арифметический знак
read c

if [ $c = '*' ] ;then
c='\*'
fi

result=`expr $a "$c" $b`
echo $result