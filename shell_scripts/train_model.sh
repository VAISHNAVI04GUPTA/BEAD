#!/bin/bash

# Job settings for CSF cluster
#SBATCH --job-name=bead_train
#SBATCH --output=logs/train_output_%j.log
#SBATCH --error=logs/train_error_%j.log
#SBATCH --time=24:00:00
#SBATCH --partition=standard
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G

# Activate the BEAD environment
source ~/.bashrc
conda activate bead_env

# Navigate to the BEAD working directory
cd $HOME/BEAD

# Run the training job
bead run --mode train \
         --model Planar_ConvVAE \
         --sample monotop_200_A \
         --epochs 500 \
         --save-interval 100

# Generate plots
bead run --mode plot \
         --sample monotop_200_A

echo "Training and plotting completed."
