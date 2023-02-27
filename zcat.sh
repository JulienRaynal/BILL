for GROUP in */;
    do NEWDIR=$(echo test$GROUP | tr -d /);
    mkdir $NEWDIR;
    for BARCODE in ${GROUP}*pass/*/;  
        do 
        FILENAME=$(echo $BARCODE | cut -d '/' -f1,3 | tr / -).fq.stats;
        for FILES in ${BARCODE}*.fastq.gz;
           do zcat $FILES >> $NEWDIR/$FILENAME; 
        done; 
    echo ==================== $BARCODE ================;  
    done; 
done;
