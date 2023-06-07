#!/bin/bash

fasta_dir="fasta_dir"
fea_dir="af2c_fea"

python3 << EOF
import os
import shutil

fasta_files = os.listdir("$fasta_dir")

with open("list.txt", "w") as f:
    for fasta_file in fasta_files:
        f.write(fasta_file + "\n")

for fasta_file in fasta_files:
    fasta_path = os.path.join("$fasta_dir", fasta_file)
    fea_path = os.path.join("$fea_dir", fasta_file[:-4], fasta_file)
    os.makedirs(os.path.join("$fea_dir", fasta_file[:-4]), exist_ok=True)
    shutil.copy(fasta_path, fea_path)
EOF

cat list.txt | parallel -j 4 bash run_fea_gen.sh fasta_dir/{}

rm -rf list.txt


