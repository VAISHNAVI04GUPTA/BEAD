#!/bin/bash

# Job settings for CSF cluster
#SBATCH --job-name=bead_all_models
#SBATCH --output=logs/all_models_output_%j.log
#SBATCH --error=logs/all_models_error_%j.log
#SBATCH --time=24:00:00
#SBATCH --partition=standard
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G

# Activate environment
source ~/.bashrc
conda activate bead_env

# Navigate to BEAD working directory
cd $HOME/BEAD

# List of models
normflow_models=("Planar" "Radial" "RealNVP" "MAF")
conv_vae_models=("ConvVAE" "BetaVAE")

# Iterate over all model combinations
for nf_model in "${normflow_models[@]}"; do
    for vae_model in "${conv_vae_models[@]}"; do
        model_name="${nf_model}_${vae_model}"
        
        echo "Running $model_name..."
        
        # Run training
        bead run --mode train \
                 --model "$model_name" \
                 --sample monotop_200_A \
                 --epochs 500 \
                 --save-interval 100
        
        # Generate plots
        bead run --mode plot \
                 --sample monotop_200_A
    done
done

echo "All model combinations completed."
