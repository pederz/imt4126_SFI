# imt4126_SFI
Synthetic Face Generation Project

## Local Hardware Setup
Ensure that you have a NVIDIA® GPU card with CUDA® architectures 3.5, 5.0, 6.0, 7.0, 7.5, 8.0 and higher than 8.0. List over CUDA https://developer.nvidia.com/cuda-gpus

1. Install Ubuntu 20.04.4 LTS (Focal Fossa)
2. Install CUDA 10.2
3. Install cuDNN SDK X.XX
4. Install TensorRT X.XX

## Face extraction from facial biometric samples

### Local Hardware
To align and crop the faces from the facial biometric samples to an resolution of 1024 × 1024 pixels, the run the `align_images.py` from the github repository [StyleGAN2 — Encoder/Projector for Official TensorFlow Implementation](https://github.com/rolux/stylegan2encoder/) from Rolux.

Run the script with the following parameters:
`python align_images.py raw_images/ aligned_images/`

### Google Colab


## Projection to latent space and synthetic generation of facial biometric samples from the latent space

### StyleGAN2 Encoder (Google Colab)  

Ensure that the current paths exist in google drive or rewrite the paths in the script:

---
| PATH | Description |
---|---
| `/Biometrics/samples/aligned_images/` | For the aligned facial biometric samples |
| `/Biometrics/samples/generated_images/` | For the generated biometric samples and the latent space vectors |
| `/Biometrics/stylegan2encoder` | Path for the rolux stylegan2encoder repo |

1. Upload the `StyleGAN2encoder.ipynb` to Google Colab.
2. Open the `StyleGAN2encoder.ipynb` in Google Colab
3. Go to 'Edit-> Notebook settings', and in the settings choose the following:
  * Select `GPU` in Hardware accelerator
  * Select `Standard` in Runtime shape
3. Run the cells to generate latent vectors and synthetic generated facial biometric samples based on the latent vectors.
* NB! When the session times out, delete the aligned facial biometric samples that have already been used in generating the latent vectors and synthetic generated facial biometric samples. Since the script does not keep tabs on what files already have been generated. Then repeat step 3.

### StyleGAN2 Encoder (Local Hardware).
