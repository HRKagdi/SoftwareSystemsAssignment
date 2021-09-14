mkdir temp_activity
cd temp_activity

touch temp{1..50}.txt

for f in temp{1..25}.txt; do 
    mv -- "$f" "${f%.txt}.md"
done


for f in temp{1..25}.md; do 
    mv -- "$f" "${f%.md}_modified.md"
done


for f in temp{26..50}.txt; do 
    mv -- "$f" "${f%.txt}_modified.txt"
done

zip txt_compresses.zip *.txt

rm *.txt
