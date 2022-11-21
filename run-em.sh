#!/bin/bash
#SBATCH -J nma-em
#SBATCH -p CondaPereira-PC
#SBATCH -N 1
#SBATCH --mail-user=szkchris@sina.com
#SBATCH --mail-type=ALL

mpirun -np 8 /software/gromacs_cp2k_v2/gromacs_cp2k-v2.sif gmx_cp2k mdrun -v -deffnm nma-em
