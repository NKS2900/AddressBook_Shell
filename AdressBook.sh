#!/bin/bash +x

echo "-----------Address Book-----------"

firstn=0
lastn=0
con=0
ci=0
st=0
z=0
e=0
edit=0
del=0
end=5
choice=0

#add user in addressBook
function adduser()
{
	echo "----Personal Details----"

	read -p "Enter FirstName: " fname
	patn='^[a-zA-Z]{3,}$'
		if [[ $fname =~ $patn ]]
		then
			FirstName[$firstn]=$fname
			((firstn++))
		else
			echo "Invalid name..."
		fi

	read -p "Enter Last Name: " lname
	patn='^[a-zA-Z]{3,}$'
	if [[ $lname =~ $patn ]]
	then
		LastName[$lastn]=$lname
		((lastn++))
	else
		echo "Incalid Lname..."
	fi

	read -p "Enter cotact no: " contact
	patm='^(91[ ])*[0-9]{10}$'
	if [[ $contact =~ $patm ]]
	then
		Mobile[$con]=$contact
		((con++))
	else
		echo "Enter valid contact.."
	fi

	read -p "Enter city     : " city
	CT[$ci]=$city
	((ci++))

	read -p "Enter State    : " state
	ST[$st]=$state
	((st++))

	read -p "Enter zip	: " zip
	patt='^[0-9]{6}$'
	if [[ $zip =~ $patt ]]
	then
		ZIP[$z]=$zip
		((z++))
	else
		echo "Invalid Zip..."
	fi

	read -p "Enter Email    : " em
        pate='^[a-zA-Z0-9]{3,}[@][a-zA-Z]{3,}[.][a-z]{2,}$'
	if [[ $em =~ $pate ]]
	then
		EMAIL[$e]=$em
        	((e++))
	else
		echo "invalid Email..."
	fi

	echo "Record Added: "  $fname"  "$lname"   " $contact"   "$city"   "$state"  "$zip"   "$em

}

#Edit user in AddressBook
function editUser(){

	read -p "Enter the name U want to Edit: " edbyname
	for(( i=0; i < ${#FirstName[@]}; i++ ))
	do
		if [[ ${FirstName[$i]} == $1 ]]
		then
			edit=$i
		fi
	done

	read -p "Enter NEW Name: " nname
	read -p "Enter NEW Lname: " nlname
	read -p "Enter NEW Contact: " ncon
	read -p "Enter NEW City: " ncity
	read -p "Enter NEW Dist: " ndist
	read -p "Enter NEW State: " nstate
	read -p "Enter NEW ZIP: " nzip
	read -p "Enter NEW Email: " nmail
	FirstName[$edit]=$nname
	LastName[$edit]=$nlname
	Mobile[$edit]=$ncon
	CT[$edit]=$ncity
	ST[$edit]=$nstate
	ZIP[$edit]=$nzip
	EMAIL[$edit]=$nmeil

}

#delet UserFrom AddressBook

function deletUser(){
read -p "Enter Name u want to delet: " dname

for (( i=0; i<${#FirstName[@]}; i++ ))
	do
		if [[ ${FirstName[$i]} == $dname ]]
		then
			del=$i
			break
		else
			echo "Record not found..."
		fi
	done
		unset FirstName[$del]
		unset LastName[$del]
		unset Mobile[$del]
		unset CT[$del]
		unset ST[$del]
		unset ZIP[$del]
		unset EMAIL[$del]

}


#Serching user in AdressBook
function SerchUser(){

read -p "Enter FirstName U want TO search: " usearch

echo "------------------------Address Book-------------------------"
echo "========================================================================"
echo "FirstName   LastName   Contact   city    State    Zip    Email"
echo "========================================================================"
for (( i=0; i<${#FirstName[@]}; i++ ))
                do
                        if [[ ${FirstName[$i]} == $usearch ]]
                        then
                                search=$i
				echo ${FirstName[$search]}"    "${LastName[$search]}"   "${Mobile[$search]}"    "${CT[$search]}"    "${ST[$search]}"    "${ZIP[$search]}"    "${EMAIL[$search]}

			elif [[ ${#FirstName[@]} == $i ]]
			then
				echo "Record not Found..!!!"
			fi
                done

echo "========================================================================"
}

#Display All User Data In Table

function Display(){
echo "------------------------Address Book-------------------------"
echo "========================================================================"
echo "FirstName   LastName   Contact     city    State    Zip      Email"
echo "========================================================================"

for (( i=0; i < ${#FirstName[@]}; i++ ))
do
	echo ${FirstName[$i]}"     "${LastName[$i]}"     "${Mobile[$i]}"      "${CT[$i]}"    "${ST[$i]}"     "${ZIP[$i]}"    "${EMAIL[$i]}
done
echo "========================================================================"

}

until [ $end -eq 6 ]
do

case $choice in

	        1)  adduser;;

        	2)  editUser;;

       		3)  deletUser;;

	        4)  Display;;

		5)  SerchUser;;

	        *)  echo "Invalid option...!!!!!!";;
esac

read -p "
         1.Add User
         2.Edit
         3.Delet
         4.Display
	 5.Serch Adress
	 6.Exit --- " choice

if [ $choice -eq 6 ]
 then
         ((end++))
 fi


done
