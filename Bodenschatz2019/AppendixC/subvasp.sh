#!/bin/bash 
#PBS -N coh 
#PBS -l select=1:ncpus=24:mpiprocs=24:mem=60gb,walltime=72:00:00 
#PBS -q workq 
#PBS -j oe 
#PBS -m abe 
#PBS -M cbodens@clemson.edu 
 
echo "START -----------------------" 
qstat -xf $PBS_JOBID 
 
cd $PBS_O_WORKDIR 
source /etc/profile.d/modules.sh 
module purge 
export MODULEPATH=$MODULEPATH:/software/experimental 
module add intel/16.0 
 
export OMP_NUM_THREADS=1 

mpirun -n 24 /common/curium/VASP/vasp.5.4.4-cpu/vasp_std  
 
echo "FINISH ---------------------" 
qstat -xf $PBS_JOBID 
rm -f core.*
