# imt4126_SFI
Synthetic Face Generation Project

## Setup on local hardware
Ensure that you have a NVIDIA® GPU card with CUDA® architectures 3.5, 5.0, 6.0, 7.0, 7.5, 8.0 and higher than 8.0. List over [CUDA®-enabled GPU cards](https://developer.nvidia.com/cuda-gpus)

1. Install Ubuntu 20.04.4 LTS (Focal Fossa)
2. Install CUDA 10.2
3. Install cuDNN SDK X.XX
4. Install TensorRT X.XX


Create the following folders on the local hardware and take the biometric samples from the subset of the FRGC dataset that is going to be used in the project to the `raw_images` folder:

---
| PATH | Description |
---|---
| `~/Biometrics/samples/raw_images/` | For the original biometric samples from the subset of the FRGC dataset |
| `~/Biometrics/samples/aligned_images/` | For the aligned biometric samples (using `align_images.py`) |
| `~/Biometrics/samples/generated_images/` | For the generated biometric samples and the latent space vectors |
| `~/Biometrics/samples/embeddings/aligned` | For the biometric features extracted from the aligned biometric samples |
| `~/Biometrics/samples/embeddings/generated` | For the biometric features extracted from the generated biometric samples |
| `~/Biometrics/samples/generated_npy/` | For the latent space vectors - Moved from `generated_images` |
| `~/Biometrics/stylegan2encoder` | Path for the rolux stylegan2encoder repository |

## Setup in Google Colab

Create the following folders in Google Drive and upload the biometric samples from the subset of the FRGC dataset that is going to be used in the project to the `raw_images` folder. The reason for using Google Drive is to save the files that is used in the project, so it is not lost when the session times out or crashes.

---
| PATH | Description |
---|---
| `Biometrics/samples/raw_images/` | For the original biometric samples from the subset of the FRGC dataset |
| `Biometrics/samples/aligned_images/` | For the aligned biometric samples (using `align_images.py`) |
| `Biometrics/samples/generated_images/` | For the generated biometric samples and the latent space vectors |
| `Biometrics/samples/embeddings/aligned` | For the biometric features extracted from the aligned biometric samples |
| `Biometrics/samples/embeddings/generated` | For the biometric features extracted from the generated biometric samples |
| `Biometrics/samples/generated_npy/` | For the latent space vectors - Moved from `generated_images` |
| `Biometrics/stylegan2encoder` | Path for the rolux stylegan2encoder repository |

## Face extraction from the biometric samples

### Local Hardware
To align and crop the faces from the facial biometric samples to an resolution of 1024 × 1024 pixels, the run the `align_images.py` from the github repository [StyleGAN2 — Encoder/Projector for Official TensorFlow Implementation](https://github.com/rolux/stylegan2encoder/) from Rolux.

1. `cd ~/Biometrics/stylegan2encoder`
2. Run the script with the following parameters:  
`python align_images.py ../samples/raw_images/ ../samples/aligned_images/`

### Google Colab

1. Upload the [Align_Images.ipynb](Align_Images.ipynb) to Google Colab.
2. Open it in Google Colab
3. Go to 'Edit-> Notebook settings', and in the settings choose the following:
  * Select `GPU` in Hardware accelerator
  * Select `Standard` in Runtime shape
3. Run the cells to align the biometric samples

## Projection to latent space and synthetic generation of facial biometric samples from the latent space

### StyleGAN2 Encoder (Google Colab)  

Ensure that the current paths from the setup section exist in google drive or rewrite the paths in the script:

1. Upload the [StyleGAN2encoder.ipynb](StyleGAN2encoder.ipynb) to Google Colab.
2. Open it in Google Colab
3. Go to 'Edit-> Notebook settings', and in the settings choose the following:
  * Select `GPU` in Hardware accelerator
  * Select `Standard` in Runtime shape
3. Run the cells to generate latent vectors and synthetic generated biometric samples based on the latent vectors.

NB! When the session times out or crashes, remove or move the aligned facial biometric samples that have already been used in generating the latent vectors and synthetic generated biometric samples. Since the script does not keep tabs on what files already have been generated. Then repeat step 3.

***Please Note:*** If downloading the pre-trained network fails because of too many downloads or other errors, then do the following:
1. Create the folder `.stylegan2-cache` inside the `Biometrics/stylegan2encoder` folder if it does not exist. 
2. Then manually download the two files:
* [stylegan2-ffhq-config-f.pkl](http://d36zk2xti64re0.cloudfront.net/stylegan2/networks/stylegan2-ffhq-config-f.pkl)
* 
3. Upload the files put them in the `.stylegan2-cache` folder, and rename the files to the following:
---
| Original filename | Renamed filename |
---|---
| `vgg16_zhang_perceptual.pkl` | `f9fdff71e1e2c443ba0b5fbb956da22e_vgg16_zhang_perceptual.pkl` |
| `stylegan2-ffhq-config-f.pkl` | `62233eb618af2672cd321cfb46c72c6a_http___d36zk2xti64re0.cloudfront.net_stylegan2_networks_stylegan2-ffhq-config-f.pkl` |
Or just copy the files from [.stylegan2-cache](.stylegan2-cache/) in this repository and upload it to the `.stylegan2-cache` folder inside the `Biometrics/stylegan2encoder` folder.

### StyleGAN2 Encoder (Local Hardware).
---
| PATH | Description |
---|---
| `~/Biometrics/samples/aligned_images/` | For the aligned facial biometric samples |
| `~/Biometrics/samples/generated_images/` | For the generated biometric samples and the latent space vectors |
| `~/Biometrics/stylegan2encoder` | Path for the rolux stylegan2encoder repo |

1. Upload the `StyleGAN2encoder.ipynb` to Google Colab.
2. 

NB! When the script is killed because of out of memory or other errors, remove or move the aligned facial biometric samples that have already been used in generating the latent vectors and synthetic generated biometric samples. Since the script does not keep tabs on what files already have been generated. Then repeat step 3.
