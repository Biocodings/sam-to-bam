# sam-to-bam
A fast genome file format converter

HOW TO BUILD
1. Download a script
   wget https://github.com/t-ogasawara/sam-to-bam/raw/master/build.sh
2. Run it
   bash build.sh

HOW TO RUN
A. SAM-to-BAM (note: the number, (#phsical_cores - 1)*SMT), should be specified after -@. E.g., 184=(24-1)*8)
   build/samtools/samtools sam2bam -@184 -Obam -oout.bam in.sam

