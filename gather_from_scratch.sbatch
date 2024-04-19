#!/bin/bash
#SBATCH --job-name CVEfixes
#SBATCH --output logs/%A.log
#SBATCH --ntasks=1
#SBATCH --partition=milanq
#SBATCH --cpus-per-task=16
#SBATCH --gpus-per-node=1
#SBATCH --time=4-00:00:00

. venv/bin/activate

workers="${SLURM_CPUS_PER_TASK}"
cpus="${SLURM_CPUS_PER_TASK}"

time ./Code/create_CVEfixes_from_scratch.sh --database-name "CVEfixes_{cpus}_cpus_{workers}_workers.db" --num-workers ${workers} | tee logs/CVEfixes_${cpus}_cpus_${workers}_workers.log
