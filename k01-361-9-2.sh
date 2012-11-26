#!/bin/bash
clear
echo ""
echo "Разработчик: Кустов Даниил"
echo "Группа: K01-361"
echo "Описание: Данная программа выводит права пользователя к файлу"
echo ""
echo "Начать выполнение? (y/n): ";
yn='y'
while [ $yn = "y" -o $yn = "Y" ]; do                                             # проверка на наличие файла
                                        read yn; 
                                        if [ $yn = "y" -o $yn = "Y" ]; then
	clear
	echo "Введите путь к файлу:"
	read f
	clear
	while ! [ -e $f ]; do echo "Такого файла не существует. Повторить? (y/n)"
		           read yn
		           if [ $yn = "y" -o $yn = "Y" ]; then
		                                                clear
		                                                echo "Введите путь к файлу:"
		                                                read f
		           elif [ $yn = "n" -o $yn = "N" ]; then
		                                                  clear  
		                                                  echo "Программа завершена!"
								  echo "Разработчик: Кустов Даниил"
								  echo "Группа: K01-361"
		                                                  exit 0
		           else 
		           while ! [ $yn = "n" -o $yn = "N" -o $yn = "y" -o $yn = "Y" ]
		                            do
		                            echo "Ошибка ввода! Введите y/n:"
		                            read yn
		                            if [ $yn = "y" -o $yn = "Y" ]; then
					    clear
		                            echo "Введите путь к файлу:"
		                            read f
		                            elif [ $yn = "n" -o $yn = "N" ]; then 
										   clear
		                                                                   echo "Программа завершена!"
									           echo "Разработчик: Кустов Даниил"
									           echo "Группа: K01-361"
		                                                                   exit 0
		                                                                   
		                            fi
		          done
		          fi
	done
	clear

	echo "Введите имя пользователя"
	read u
	clear 
	while ! [ $(getent passwd $u ) ]; do                                                 # проверка на наличие пользователя
                           echo "Такого пользователя не существует. Повторить? (y/n)"
		           read yn
		           if [ $yn = "y" -o $yn = "Y" ]; then
		                                                clear
		                                                echo "Введите имя пользователя:"
		                                                read u								
		           elif [ $yn = "n" -o $yn = "N" ]; then
		                                                  clear  
		                                                  echo "Программа завершена!"
								  echo "Разработчик: Кустов Даниил"
								  echo "Группа: K01-361"
		                                                  exit 0
		           else 
		           while ! [ $yn = "n" -o $yn = "N" -o $yn = "y" -o $yn = "Y" ]
		                            do
		                            echo "Ошибка ввода! Введите y/n:"
		                            read yn
		                            if [ $yn = "y" -o $yn = "Y" ]; then
					    clear
		                            echo "Введите имя пользователя:"
		                            read u
		                            elif [ $yn = "n" -o $yn = "N" ]; then 
		                                                                   echo "Программа завершена!"
									           echo "Разработчик: Кустов Даниил"
									           echo "Группа: K01-361"
		                                                                   exit 0

		                            fi
		          done
		          fi
	done
	clear


	x=$(echo "$(ls -ld $f)")    # Права на файл f
	string1=$x
	longf=${#string1}
	string2=$u
	longu=${#string2}
	length1=$longu
	y=${string1:15:length1}
	grp=$(groups $u)           # группа нашего пользователя
	string3=$grp
	lgg=${#string3}
	let "longg=$lgg-3" #
	let "longg = $longg / 2"   # длина слова группы пользователя
	length3=$longg
	q=${string3:0:length3}
	string4=$f
	lgf=${#string4}
	let "pos=$longf-$lgf-$longg-21"
	position1=$pos
	length2=$longg
	z=${string1:position1:length2}  
 
	if [ $u == $y ]; then      # условие для одинаковых имен пользователей
 			 m=1
	else if [ $q = $z ]; then  # условие для одинаковых групп
			     m=4
	else m=7                   # условие для постороннего пользователя
	fi
	fi
	position3=$m
	a=${string1:position3:3}
	if [ $a == "rwx" ]; then echo "Данный пользователь может: ЧИТАТЬ/ПИСАТЬ/ИСПОЛНЯТЬ"
	fi
	if [ $a == "rw-" ]; then echo "Данный пользователь может: ЧИТАТЬ/ПИСАТЬ"
	fi
	if [ $a == "-wx" ]; then echo "Данный пользователь может: ПИСАТЬ/ИСПОЛНЯТЬ"
	fi
	if [ $a == "r-x" ]; then echo "Данный пользователь может: ЧИТАТЬ/ИСПОЛНЯТЬ"
	fi
	if [ $a == "-w-" ]; then echo "Данный пользователь может: ПИСАТЬ"
	fi
	if [ $a == "r--" ]; then echo "Данный пользователь может: ЧИТАТЬ"
	fi
	if [ $a == "--x" ]; then echo "Данный пользователь может: ИСПОЛНЯТЬ"
	fi
	if [ $a == "---" ]; then echo "Данный пользователь может: НИЧЕГО"
	fi
        echo "Повторить? (y/n): ";
	yn=y
				elif [ $yn = "n" -o $yn = "N" ]; then             
						echo "Прекращено пользователем."
						clear
				else  echo "Ошибка ввода! Введите y/n:"
				      yn=y
				fi
done
clear
echo "Программа завершена!"
echo "Разработчик: Кустов Даниил"
echo "Группа: K01-361"
