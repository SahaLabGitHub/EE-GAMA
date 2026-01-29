#!/bin/bash
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=3999MB
#SBATCH --array=1-187

source ~/.bashrc
ulimit -s unlimited
# Gaussian 16 env setup
g16root=/sharedapps/Commercial-Software/Gaussian
GAUSS_SCRDIR=.
export g16root GAUSS_SCRDIR

set +e  # Some commands in the profile script return non-zero status
. $g16root/g16/bsd/g16.profile
set -e

# Place your Gaussian commands below
time g16 -p=16 gama_high_${SLURM_ARRAY_TASK_ID}.gjf

#time  g16 -p=16 gama_high_2.gjf 
