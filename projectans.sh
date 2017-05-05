#!bin/bash
echo "				    "
echo " ===print file information=== "
echo " current directory:$PWD "
filecount=`ls -l | grep ^- | wc -l`
dircount=`ls -l | grep ^d | wc -l`
result=`expr $filecount + $dircount`
echo " the number of elements:$result "

direc=`ls -l | grep ^d | rev | cut -d' ' -f1 | rev`
filess=`ls -l | grep ^- | rev | cut -d' ' -f1 | rev`
imfiles=`ls -l | grep ^p | rev | cut -d' ' -f1 | rev`
number=1
files=`ls | sort -d`
for files in *
do
	while [ "$number" -le "$result" ]
		do

echo "                                    "
		echo [$number] : `stat -c %n $files`
echo "-------------INFORMATION------------"

if [ "`stat -c %F $files`" = "디렉토리" ]
then
	echo [31m"file type : `stat -c %F $files`"
echo [0m"file size :  `stat -c %s $files`"
echo  creation time : `stat -c %z $files`
echo  permission : `stat -c %a $files`
echo  absolute path : `pwd $files`
echo  relative path : "./"`stat -c %n $files`

echo "-------------------------------------"
echo "                                     "

cd $files
maindir=`pwd | rev | cut -d '/' -f1 | rev`
for files in *
do

if [ -z "`ls`" ]
then
	break;
	cd ..
else
        echo "     "`stat -c %n $files`
        echo "     -----------INFORMATION----------"

if [ "`stat -c %F $files`" = "디렉토리" ]
	then
		echo "     "[31m"file type : `stat -c %F $files`"
                echo "     "[0m"file size : `stat -c %s $files`"
                echo "     "creation time : `stat -c %z $files`
                echo "     "permission : `stat -c %a $files`
                echo "     "absolute path : `pwd $files`
                echo "     "relative path : "./""$maindir/"`stat -c %n $files`
                echo "     ------------------------------------"
                echo "                                    "
	elif [ "`stat -c %F $files`" = "FIFO" ]
	then
		echo "     "[34m"file type : `stat -c %F $files`"
	        echo "     "[0m"file size : `stat -c %s $files`"
	        echo "     "creation time : `stat -c %z $files`
	        echo "     "permission : `stat -c %a $files`
	        echo "     "absolute path : `pwd $files`
		echo "     "relative path : "./""$maindir/"`stat -c %n $files`
		echo "     ------------------------------------"
	        echo "                                    "
	
	else
		echo "     "[0m"file type : `stat -c %F $files`"	
		echo "     "file size : `stat -c %s $files`
		echo "     "creation time : `stat -c %z $files`
		echo "     "permission : `stat -c %a $files`
		echo "     "absolute path : `pwd $files`
		echo "     "relative path : "./""$maindir/"`stat -c %n $files`
		echo "     ------------------------------------"
		echo "	    				  "
	fi
fi
			done
cd ..

elif [ "`stat -c %F $files`" = "FIFO" ]
then
	echo [34m"file type : `stat -c %F $files`"
echo [0m"file size :  `stat -c %s $files`"
echo  creation time : `stat -c %z $files`
echo  permission : `stat -c %a $files`
echo  absolute path : `pwd $files`
echo  relative path : "./"`stat -c %n $files`

echo "-------------------------------------"
echo "                                     "

else
	echo [0m"file type : `stat -c %F $files`"
echo [0m"file size :  `stat -c %s $files`"
echo  creation time : `stat -c %z $files`
echo  permission : `stat -c %a $files`
echo  absolute path : `pwd $files`
echo  relative path : "./"`stat -c %n $files`

echo "-------------------------------------"
echo "                                     "

fi

number=`expr $number + 1`
	break;
	done

done
