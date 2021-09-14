perm() {
  local items="$1"
  local out="$2"
  local i
  [[ "$items" == "" ]] && echo "$out" && return
  for (( i=0; i<${#items}; i++ )) ; do
    perm "${items:0:i}${items:i+1}" "$out${items:i:1}"
  done
  }
touch out1.txt
touch out2.txt
touch out3.txt
perm $1 > out1.txt
compgen -c > out2.txt
sort -o out1.txt out1.txt
sort -o out2.txt out2.txt
comm -12 out1.txt out2.txt | tee out3.txt > /dev/null
if [ -s out3.txt ]; then
	echo -n -e "YES \t"
fi

while read p; do
  echo -n -e "$p \t" 
done < out3.txt
echo " "

if [ ! -s out3.txt ]; then
	echo -n -e "NO $1"
fi
