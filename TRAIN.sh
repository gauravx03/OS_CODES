read -p "Enter the File Name: " fname

if [ ! -e "$fname" ];
then
  touch $fname
  echo "File Created Successfully"
else
  echo "File Already Exists"
fi

while true
do

echo "1. Display Train Records"
echo "2. Insert Train Record"
echo "3. Search Train Record"
echo "4. Delete Train Record"
echo "5. Update Train Record"
echo "6. Exit"

read -p "Enter your choice: " ch
case $ch in

1)
echo "Contents of the File: "
sort -n "$fname"
;;

2)
read -p "Enter the Train Number: " num

if grep -wq "$num" "$fname";
then 
echo "Record Already Exists"
else
read -p "Enter The train name: " name
echo "$num" "$name" >> "$fname"
echo "Record inserted Successfully"
fi
;;


3)
read -p "Enter the Train Number: " num

if grep -w "$num" "$fname";
then
echo "Record Found"
else
echo "Record Not Found"
fi
;;

4)
read -p "Enter the train Number to delete: " num

if grep -wq "$num" "$fname";
then
grep -vw "$num" "$fname" > temp.txt
mv temp.txt "$fname"
echo "Record Deleted Successfully"
else
echo "Record Not Found"
fi
;;

5)
read -p "Enter the train Number to Update: " num
if grep -wq "$num" "$fname";
then
read -p "Enter the name for update: " name
grep -vw "$num" "$fname" > temp.txt
echo "$num" "$name" >> temp.txt
mv temp.txt "$fname"
echo
echo "Record Updated Successfully"
else
echo "Record Not Found"
fi
;;

6)
echo "Existing"
break
;;

*)
echo "Invalid Choice"
;;

esac

done