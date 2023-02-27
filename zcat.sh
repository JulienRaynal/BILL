# For each folder in our current folder
for GROUP in */;
    # Create a new folder with same name prefixed with data for each detected folder
    do NEWDIR=$(echo data$GROUP | tr -d /);
    mkdir $NEWDIR;
    # For each barcode folder (containing 1 or multiple barcodes) 
    for BARCODE in ${GROUP}*pass/*/;  
        do 
        # Computes a filename using the barcode
        FILENAME=$(echo $BARCODE | cut -d '/' -f1,3 | tr / -).fq.stats;
        # For each file in the barcode folder
        for FILES in ${BARCODE}*.fastq.gz;
            # Concatenates the barcode files content in a file (1 file per barcode)
            do zcat $FILES >> $NEWDIR/$FILENAME; 
        done; 
    echo ==================== $BARCODE ================;  
    done; 
done;
