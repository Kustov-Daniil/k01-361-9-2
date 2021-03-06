#!/bin/bash
clear
echo ""
echo "Разработчик: Кустов Даниил"
echo "Группа: K01-361"
echo "Описание: Данная программа выводит права пользователя к файлу"
echo ""
echo "Начать выполнение? (y/n): ";
yn='y'
while [ $yn = "y" -o $yn = "Y" ]; do                                             # проверка существования файла
                                        read yn; 
                                        if [ $yn = "y" -o $yn = "Y" ]; then
	clear
	echo "Введите путь к файлу:"
	read FILENAME
	clear
	while ! [ -e $FILENAME ]; do echo "Такого файла не существует. Повторить? (y/n)"
		           read yn
		           if [ $yn = "y" -o $yn = "Y" ]; then
		                                                clear
		                                                echo "Введите путь к файлу:"
		                                                read FILENAME
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
		                            read FILENAME
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
	read USER
	clear 
	while ! [ $(getent passwd $USER ) ]; do                                                 # проверка существования пользователя
                           echo "Такого пользователя не существует. Повторить? (y/n)"
		           read yn
		           if [ $yn = "y" -o $yn = "Y" ]; then
		                                                clear
		                                                echo "Введите имя пользователя:"
		                                                read USER								
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
		                            read USER
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
	GR=$(groups $USER)                # группа нашего пользователя
	string1=$GR
	lg=${#string1}
	let "GROUPLENGTH =$lg-3"
	let "GROUPLENGTH = $GROUPLENGTH/2"    # длина слова группы пользователя
	length1=$GROUPLENGTH
	GROUP=${string1:0:length1}
	
	rwx=$(echo $(stat -c %A $FILENAME))          # Права на файл 
	USERFILE=$(echo $(stat -c %U $FILENAME))     # Пользователь файла 
	GROUPFILE=$(echo $(stat -c %G $FILENAME))    # Группа файла 
		
	if [ $USER == $USERFILE ]; then        # условие для одинаковых имен пользователей
 			     m="1"
	else if [ $GROUP == $GROUPFILE ]; then  # условие для одинаковых групп
			     m="4"
	else m="7"                               # условие для постороннего пользователя
	fi
	fi
	string2=$rwx
	position2=$m
	a=${string2:position2:3}
	echo "Файл: $FILENAME"
	echo "Пользователь: $USER"
	if [ $a == "rwx" ]; then echo "Полномочия: ЧИТАТЬ/ПИСАТЬ/ИСПОЛНЯТЬ"
	fi
	if [ $a == "rw-" ]; then echo "Полномочия: ЧИТАТЬ/ПИСАТЬ"
	fi
	if [ $a == "-wx" ]; then echo "Полномочия: ПИСАТЬ/ИСПОЛНЯТЬ"
	fi
	if [ $a == "r-x" ]; then echo "Полномочия: ЧИТАТЬ/ИСПОЛНЯТЬ"
	fi
	if [ $a == "-w-" ]; then echo "Полномочия: ПИСАТЬ"
	fi
	if [ $a == "r--" ]; then echo "Полномочия: ЧИТАТЬ"
	fi
	if [ $a == "--x" ]; then echo "Полномочия: ИСПОЛНЯТЬ"
	fi
	if [ $a == "---" ]; then echo "Данный пользователь ничего не может делать с файлом"
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
