#!/bin/bash

#SBATCH --job-name [CVEfixes]
#SBATCH --output slurm/%A_%a.log
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --partition=milanq
#SBATCH --time=3-00:00:00

# NUM_WORKERS=( 4 8 16 32 64 )

# workers="${NUM_WORKERS[$SLURM_ARRAY_TASK_ID-1]}"

. venv/bin/activate

srun --ntasks=1 --cpus-per-task="$SLURM_CPUS_PER_TASK" ./Code/create_CVEfixes_from_scratch.sh --database-name "CVEfixes.db"
