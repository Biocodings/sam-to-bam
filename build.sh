#!/bin/bash
ORG=samtools-2015-08-19
SRC=source
BLD=build
#IP=192.30.252.131
IP=github.com
rm -rf ${ORG}
mkdir -p ${ORG}
rm -rf ${SRC}
mkdir -p ${SRC}

#
echo Download the files
#
cd ${ORG}
git clone git://${IP}/samtools/samtools.git
git clone git://${IP}/samtools/htslib.git
cd ../${SRC}
git clone git://${IP}/t-ogasawara/sam-to-bam.git
cd ../${ORG}/samtools
git checkout 0c5617ecd9c3930024bfcec02ac0796c1abfbd67 >& /dev/null
cd ../htslib
git checkout d75415141386bd7af4a3b0c18ce9c72b58c0895e >& /dev/null
cd ../..

#
echo Create the source files
#
${SRC}/sam-to-bam/run_patch.sh

#
echo Build the program
#
cd ${BLD}/samtools
make
cd ../prefilter
make
cd ../hw_zlib
make
cd ../samtools
mkdir filter.d accelerator.d
ln -s ${PWD}/../prefilter/lib_pre_filter.so filter.d/
ln -s ${PWD}/../hw_zlib/lib_hw_zlib.so accelerator.d/
