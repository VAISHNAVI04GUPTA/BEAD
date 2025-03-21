# 🛠️ Shell Scripts for BEAD Model Execution

This directory contains shell scripts used to run and manage the **BEAD anomaly detection models** on the **CSF cluster**.

---

## 🚀 **1. `train_model.sh`**
### 📌 **Purpose:**  
- Runs the **Planar_ConvVAE** model on the `monotop_200_A` sample.  
- Trains the model for **500 epochs** and saves checkpoints every **100 epochs**.  
- Generates **plots** after training.  

### ⚙️ **Execution Steps:**
```bash
sbatch train_model.sh
