#! /bin/bash
# this secripts from a tutorial by Brad on https://www.youtube.com/watch?v=v-F3YLd6oMw

# echo command
echo Hello World!

#Variable 
NAME="Moh"
echo "MY name is $NAME"
echo "MY name is ${NAME}"

# User input
read -p "Enter your firt name:" FNAME
echo "Hello $NAME!"

# If statement

if ["$FNAME" == "Moh"]
then 
  echo "You are Moh"
elif ["$FNAME" == "JACK"]
then
  echo "you are jack"
else
  echo "you are not Moh"  
fi

# comparision (-eq -ne -gt -ge -lt -le)
N1=100
N2=100
if [N1 -le N2]
then 
  echo "$N1 is less than or equal than $N2"
fi

# FILE conditions
# -d directory?
# -e exist?
# -f file?
# -g group id set on a file?
# -u user id set on a file?
# -r readable?
# -w writable?
# -x executable? 
# -s nonzero size?

FILE="text.txt"
if [-f $FILE]
then
 echo "this is a file"
fi

# CASE STATEMENT
read -p "Are you a studnet?" ANSWER
case "$ANSWER" in 
   [yY] | [yY][eE][sS])
     echo "You are eligable for this!"
	 ;;
   [nN] | [nN][oO])
   ;;
   *) 
     echo "Please regester as a studnet!"
	 ;;
esac


# Simple loops
NAMES="Ali Brad Jack"
for NAME in $NAMES
  do 
     echo "Hello $NAME"
done	 
	
# rename files
FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES
 do 
   echo "renaming $FILE to new-$FILE"
   mv $FILE $NEW-$FILE
done


# while loop- read through a file line by line
LINE=1
while read -r CURRENT_LINE
  do 
   echo "$LINE: $CURRENT_LINE"
   ((LINE++))
  done < "./test-1.txt"
  
# function 
function sayHi(){
 echo "Hi!"
}
sayHi

function sayHello(){
 echo "Hello $1! I am a function!"
}
sayHello Moh







