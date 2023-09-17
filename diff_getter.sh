$(echo "" > compare.txt)
FILENAMES=()
COUNTER=0
for FILE in ./*.vcf; do 
	FILENAMES[${#FILENAMES[@]}]=$FILE;
done;
IFS=$'\n' SORTED=($(sort <<<"${FILENAMES[*]}")); unset IFS;

for ((idx=0; idx<${#SORTED[@]} - 1; ++idx)); do
	echo "$idx" "${SORTED[idx]}"
	echo "$((idx + 1)) "${SORTED[((idx + 1))]}
	$(cat ${SORTED[idx]}  | grep -v "##" | cut -d$'\t'  -f2 > ${SORTED[idx]}.txt)
	$(cat ${SORTED[idx + 1]}  | grep -v "##" | cut -d$'\t'  -f2 > ${SORTED[idx + 1]}.txt)
	$(echo "#" ${SORTED[idx]} et ${SORTED[idx+1]} >> compare.txt)
	diff ${SORTED[idx]}.txt ${SORTED[idx + 1]}.txt >> compare.txt
done

