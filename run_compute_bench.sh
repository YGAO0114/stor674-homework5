#!/bin/bash
#SBATCH --job-name=compute_bench_gpu
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --qos=gpu_access
#SBATCH --time=00:30:00
#SBATCH --mem=8G
#SBATCH --output=compute_bench_%j.out
#SBATCH --error=compute_bench_%j.err

# Load Apptainer module if needed
module load apptainer

# Print job information
echo "Job started on $(date)"
echo "Running on node: $(hostname)"
echo "Job ID: ${SLURM_JOB_ID}"

# Check GPU availability
nvidia-smi

# Run the containerized compute benchmark with GPU support
apptainer run --nv compute-bench_latest.sif

# Print completion time
echo "Job completed on $(date)"