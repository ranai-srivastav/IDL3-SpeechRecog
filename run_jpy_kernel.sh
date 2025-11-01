#!/bin/bash
#SBATCH --job-name=IDL2_FaceRecog
#SBATCH --output=notebook_%j.log
#SBATCH --error=notebook_%j.err
#SBATCH --time=12:00:00           # 8 hours as specified in your interact command
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --partition=GPU-shared   # Same as your interact command
#SBATCH --gres=gpu:v100-32:1     # Specifically requesting V100-32GB GPU as in your interact command
#SBATCH --account=cis250019p     # Same allocation account as your interact command

# Load necessary modules (adjust for your environment)
module load anaconda3
echo "Loaded Anaconda"

# Activate your conda environment (adjust path as needed)
conda deactivate
source activate /ocean/projects/cis250019p/mzhang23/TA/HW3P2/envs/hw3p2_env
echo "hw3p2_env loaded successfully"

# Set PYTHONNOUSERSITE to prevent conflicts with user site packages
export PYTHONNOUSERSITE=1

sleep 0.1
echo "Starting jupyter ..."
jupyter notebook --no-browser --ip=0.0.0.0

# Set the working directory
cd /jet/home/srivastr/idl/IDL3-SpeechRecog

# Execute the notebook
# jupyter nbconvert --to notebook --execute HW2P2_Starter_Notebook.ipynb --output HW2P2_Executed.ipynb --ExecutePreprocessor.timeout=-1