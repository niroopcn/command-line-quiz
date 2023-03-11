<<documentation
Name: Niroop C Naik
Date: Nov 2 2022
Description:
Sample input:
Sample output:
documentation

#!/bin/bash

function signup()
{
    #signup
    newusername=0
    while [ $newusername -eq 0 ]
    do
	read -p "Enter username: " typeduser
	if [ -s username.txt ] #file not empty
	then
	    users=(`cat username.txt`)
	    for user in ${users[@]}
	    do
		    if [ "$user" = "$typeduser" ]
		    then
		        echo "Username already exists"
		        newusername=0
		        break
		    else
		        newusername=1
		    fi
	    done
	else
	    newusername=1
	fi
    done

    newpassword=0
    while [ $newpassword -eq 0 ]
    do
	read -sp "Enter password: " password; echo #'s' is for hidden text
	read -sp "Re-enter password: " passwordverify; echo
	if [ "$password" = "$passwordverify" ]
	then
	    echo "$typeduser" >> username.txt
	    #./Hashing/a.out $password >> password.txt
	    echo "$password" | sha256sum | cut -d ' ' -f1 >> password.txt
	    newpassword=1
	else
	    echo "Password does not match, re-enter password"
	fi
    done
}

function signin()
{
    #sign in
    nameexists=0
    while [ $nameexists -eq 0 ]
    do
	users=(`cat username.txt`)
	read -p "Enter username: " typeduser
	for i in `seq 0 $((${#users[@]}-1))`
	do
	    if [ "${users[$i]}" = "$typeduser" ]
	    then
		nameexists=1
		getpassword=1
		position=$i
		break
	    else
		nameexists=0
	    fi
	done
	if [ $nameexists -eq 0 ]
	then
	    echo "Invalid username: "
	fi
    done
	
    #password
    while [ $getpassword -eq 1 ]
    do
	pass=(`cat password.txt`)
	read -sp "Enter Password: " typedpassword
	echo
	#temppass=`./Hashing/a.out $typedpassword`
	temppass=`echo "$typedpassword" | sha256sum | cut -d ' ' -f1`
	if [ "${pass[$position]}" = "$temppass" ]
	then
	    echo "Sign in successfull"
	    getpassword=0
	else
	    echo "Wrong Password, please re-enter"
	fi
    done
}

function testfunc()
{
    echo -e "1. Take Test\n2. Exit"
    read -p "Enter option: " option
    taketest=0
    while [ $taketest -eq 0 ]
    do
	case $option in
	    1)
		taketest=1
		;;
	    2)
		exit
		;;
	    *)
		echo "Enter Valid option"
		testfunc
		;;
	esac
    done
    if [ $taketest -eq 1 ]
    then
	#rm useranswers.txt
	#touch useranswers.txt
	length=`cat questions.txt | wc -l`
	for i in `seq 5 5 $length`
	do
	    clear
	    head -$i questions.txt | tail -5
	    for j in `seq 10 -1 1`
	    do
		echo -n -e "\r Enter option: $j \c"
		read -t1 opt
		if [ $i -eq 5 -a ${#opt} -gt 0 ] #for 1st answer, when file is empty, test case, then overwrite
		then
		    echo $opt > useranswers.txt
		    break
		elif [ ${#opt} -gt 0 ]			#when file is non empty, 2nd answer onwards, append
		then
		    echo $opt >> useranswers.txt
		    break
		fi
	    done
	    if [ $i -eq 5 -a ${#opt} -eq 0 ]
	    then
		echo e > useranswers.txt
	    elif [ ${#opt} -eq 0 ]
	    then
		echo e >> useranswers.txt
	    fi 
	done
	clear
    fi
}

function compare()
{
    userans=(`cat useranswers.txt`)
    correctans=(`cat correctanswers.txt`)
    length=`cat questions.txt | wc -l`
    index=0
    totalmarks=0
    for i in `seq 5 5 $length`
    do
	head -$i questions.txt | tail -5
	if [ "${userans[$index]}" = "${correctans[$index]}" ]
	then
	    echo "Correct answer: It's option ${correctans[$index]}"
	    totalmarks=$(($totalmarks+1))
	elif [ "${userans[$index]}" = "e" ]
	then
	    echo "TIMEOUT"
	else
	    echo "Wrong answer buddy, your answer is ${userans[$index]} but the correct answer is ${correctans[$index]}"
	fi 
	index=$(($index+1))
    done
    echo "Total Marks: $totalmarks/10"
}

function menu()
{
    echo -e "Menu:\n1. Sign-up\n2. Sign-in\n3. Exit"
    read -p "Enter choice: " choice
    case $choice in
	1) #signup
	    signup
	    menu
	    ;;
	2) #sign-in
	    signin
	    testfunc #to display MCQs and collect answer
	    compare  #comparing user answers and correct answers
	    menu
	    ;;
	3) #exit
	    exit
	    ;;
	*)
	    echo "Invalid choice, please re-enter"
	    menu
	    ;;
    esac
}

menu