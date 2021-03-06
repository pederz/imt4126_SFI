<div align="center">

  <h1>Synthetic Face Generation Project</h1>
  
  <p>
    The code files for the project Synthetic Face Generation in the course [IMT4126 Biometrics](https://www.ntnu.edu/studies/courses/IMT4126) at NTNU
  </p>
</div>

<br />

The list over the images that has been used from the FRGC dataset are in the file [images_list.txt](images_list.txt).
Both online and local hardware was used in the experiments in this paper. The local hardware that was used was an Ubuntu 20.04 machine, with an Intel 12900K (16 cores and 24 threads), 2 x NVIDIA GeForce 1080 Ti (11 GB GDDR5X), 32 GB DDR5 RAM and a PCIe x4.0 M.2 SSD. The online hardware was Google Colab. Google Colab was runned with a paid subscription (Google Colab Pro+), with GPU as hardware accelerator (NVIDIA Tesla P100 with 16 GB HBM2) and normal runtime shape.

<!-- Table of Contents -->
# :notebook_with_decorative_cover: Table of Contents

- [:cloud: Google Colab](#cloud-google-colab)
  * [Setup](#setup)
  * [Biometric samples alignment](#biometric-samples-alignment)
  * [Latent space projection and generation of synthetic biometric samples](#latent-space-projection-and-generation-of-synthetic-biometric-samples)
  * [Biometric features extraction](#biometric-features-extraction)
    * [Clean before feature extraction](#clean-before-feature-extraction)
    * [Extraction](#extraction)
  * [Similarity comparision](#similarity-comparision)

- [:computer: Local Hardware](#computer-local-hardware)
  * [Setup](#setup-1)
  * [Biometric samples alignment](#biometric-samples-alignment-1)
  * [Latent space projection and generation of synthetic biometric samples](#latent-space-projection-and-generation-of-synthetic-biometric-samples-1)
  * [Biometric features extraction](#biometric-features-extraction-1)
    * [Clean before feature extraction](#clean-before-feature-extraction-1)
    * [Extraction](#extraction-1)
  * [Similarity comparision](#similarity-comparision-1)

# :cloud: Google Colab
All files that are used for Google Colab in the project, are in the [Google Colab](GoogleColab) folder.
<!-- Setup on google colab -->
## Setup
The only setup is the folder structure in Google Drive as described below. 

### Folder Structure
Create the following folders that are shown in the table below in Google Drive, and upload the biometric samples from the subset of the FRGC dataset that is going to be used in the project to the `raw_images` folder. The reason for using Google Drive is to save the files that is used in the project, so it is not lost when the session times out or crashes.

---
| PATH |??Description |
---|---
| `Biometrics/samples/raw_images/` | For the original biometric samples from the subset of the FRGC dataset |
| `Biometrics/samples/aligned_images/` | For the aligned biometric samples (using `align_images.py`) |
| `Biometrics/samples/generated_images/` | For the generated biometric samples and the latent space vectors |
| `Biometrics/samples/embeddings/aligned` | For the biometric features extracted from the aligned biometric samples |
| `Biometrics/samples/embeddings/generated` | For the biometric features extracted from the generated biometric samples |
| `Biometrics/samples/generated_npy/` | For the latent space vectors - Moved from `generated_images` |
| `Biometrics/stylegan2encoder` | Path for the rolux stylegan2encoder repository |

<!-- biometric sample alignment google colab -->
## Biometric Samples Alignment

1. Upload the [Align_Images.ipynb](GoogleColab/Align_Images.ipynb) to Google Colab.
2. Open it in Google Colab
3. Go to 'Edit-> Notebook settings', and in the settings choose the following:
  * Select `GPU` in Hardware accelerator
  * Select `Standard` in Runtime shape
3. Run the cells to align the biometric samples

<!-- biometric sample alignment google colab -->
## Latent space projection and generation of synthetic biometric samples

Ensure that the current paths from the setup section exist in google drive or rewrite the paths in the script:

1. Upload the [StyleGAN2encoder.ipynb](GoogleColab/StyleGAN2encoder.ipynb) to Google Colab.
2. Open it in Google Colab
3. Go to 'Edit-> Notebook settings', and in the settings choose the following:
  * Select `GPU` in Hardware accelerator
  * Select `Standard` in Runtime shape
3. Run the cells to generate latent vectors and synthetic generated biometric samples based on the latent vectors.

NB! When the session times out or crashes, remove or move the aligned facial biometric samples that have already been used in generating the latent vectors and synthetic generated biometric samples. Since the script does not keep tabs on what files already have been generated. Then repeat step 3.

***Please Note:*** If downloading the pre-trained networks fails because of too many downloads or other errors, then do the following:
1. Create the folder `.stylegan2-cache` inside the `Biometrics/stylegan2encoder` folder
2. Then manually download the two files:
* [stylegan2-ffhq-config-f.pkl](http://d36zk2xti64re0.cloudfront.net/stylegan2/networks/stylegan2-ffhq-config-f.pkl)
* [vgg16_zhang_perceptual.pkl](https://drive.google.com/uc?id=1N2-m9qszOeVC9Tq77WxsLnuWwOedQiD2)
3. Upload the files put them in the `.stylegan2-cache` folder, and rename the files to the following:
---
| Original filename |??Renamed filename |
---|---
| `vgg16_zhang_perceptual.pkl` | `f9fdff71e1e2c443ba0b5fbb956da22e_vgg16_zhang_perceptual.pkl` |
| `stylegan2-ffhq-config-f.pkl` | `62233eb618af2672cd321cfb46c72c6a_http___d36zk2xti64re0.cloudfront.net_stylegan2_networks_stylegan2-ffhq-config-f.pkl` |


## Biometric features extraction

### Clean-before-feature-extraction
1. Start with cleaning up the folders `aligned_images` and `generated_images`. Use [move_files.ipynb](GoogleColab/move_files.ipynb).
2. Upload [move_files.ipynb](GoogleColab/move_files.ipynb) to Google Colab
3. Run the cells in `move_files.ipynb`
* Result:
    * `aligned_images` will only contain folders with the name of the subject id of the biometric samples, Eg. `02463d`, with each biometric sample of the subject id inside the folder.
    * `generated_images` will contain the same folders as `aligned_images`, with the subfolders only containing the synthetic generated biometric samples.
    * New folder is created, named `generated_npy`, where all of the latent vectors are stored.

## Similarity comparision


# :computer: Local Hardware
<!-- Setup on local hardware -->

All files that are used for local hardware in the project, are in the [Local Hardware](LocalHardware) folder.

## Setup
Ensure that you have a NVIDIA?? GPU card with CUDA?? architectures 3.5, 5.0, 6.0, 7.0, 7.5, 8.0 and higher than 8.0. List over [CUDA??-enabled GPU cards](https://developer.nvidia.com/cuda-gpus). Version number that was used in the project is in parentheses.

1. Install Ubuntu (20.04.4 LTS Focal Fossa)
2. Install NVIDIA GPU Drivers (510.60.02)
3. Install CUDA Toolkit (11.2)
4. Install Docker Engine (version 20.10.15, build fd82621)
5. Install NVIDIA Container Toolkit (1.9.0-1)
6. Install Anaconda (4.12.0)
* Recommendation: Install GNU Screen or tmux, and use it when running the scripts or docker container.

Create the following folders on the local hardware and take the biometric samples from the subset of the FRGC dataset that is going to be used in the project to the `raw_images` folder:

### Folder Structure
---
| PATH |??Description |
---|---
| `~/biometrics/samples/raw_images/` | For the original biometric samples from the subset of the FRGC dataset |
| `~/biometrics/samples/aligned_images/` | For the aligned biometric samples (using `align_images.py`) |
| `~/biometrics/samples/generated_images/` | For the generated biometric samples and the latent space vectors |
| `~/biometrics/samples/embeddings/aligned` | For the biometric features extracted from the aligned biometric samples |
| `~/biometrics/samples/embeddings/generated` | For the biometric features extracted from the generated biometric samples |
| `~/biometrics/samples/generated_npy/` | For the latent space vectors - Moved from `generated_images` |
| `~/biometrics/stylegan2encoder` | Path for the rolux stylegan2encoder repository |

## Biometric Samples Alignment
To align and crop the faces from the facial biometric samples to an resolution of 1024 ?? 1024 pixels, the run the `align_images.py` from the github repository [StyleGAN2 ??? Encoder/Projector for Official TensorFlow Implementation](https://github.com/rolux/stylegan2encoder/) from Rolux.

1. `cd ~/biometrics/stylegan2encoder`
2. Download [align_image_packages.yml](LocalHardware/align_image_packages.yml) to the current folder
3. Create and activate a conda environment based on `align_image_packages.yml`.
  * `conda env create -f align_image_packages.yml`
  * `conda activate stylegan2encoder`
4. Run the script with the following parameters:  
`python align_images.py ../samples/raw_images/ ../samples/aligned_images/`

## Latent space projection and generation of synthetic biometric samples

1. `cd ~/biometrics/`
2. Download the [Dockerfile](LocalHardware/Dockerfile) and [.dockerignore](LocalHardware/.dockerignore) to the current folder
3. Build the docker image with:  
`docker build . --no-cache -t stylegan2`
4. Run the docker with the following script to use GPU #0:
`docker run --gpus '"device=0"' --mount type=bind,source="$(pwd)"/samples,target=/home/pederz/biometrics/samples stylegan2 ./samples/aligned_images/ ./samples/generated_images/`

If local hardware has multiple GPUs, multiple containers can be runned with selecting a GPU for each container (This is because `project_images.py` only runs on one GPU). Just remember to create subfolders in the aligned_images folder, so the same images are not used as source multiple time:

`docker run --gpus '"device=1"' --mount type=bind,source="$(pwd)"/samples,target=/home/pederz/biometrics/samples stylegan2 ./samples/aligned_images/subfolder1 ./samples/generated_images/`

`docker run --gpus '"device=1"' --mount type=bind,source="$(pwd)"/samples,target=/home/pederz/biometrics/samples stylegan2 ./samples/aligned_images/subfolder2 ./samples/generated_images/`

NB! When the script is killed because of out of memory or other errors, remove or move the aligned facial biometric samples that have already been used in generating the latent vectors and synthetic generated biometric samples. Since the script does not keep tabs on what files already have been generated. Then repeat step 3.

***Please Note:*** If downloading the pre-trained networks fails because of too many downloads or other errors, then do the following:
1. Create the folder `.stylegan2-cache` inside the `~/biometrics/stylegan2encoder` folder if it does not exist. 
2. Then manually download the two files:
* [stylegan2-ffhq-config-f.pkl](http://d36zk2xti64re0.cloudfront.net/stylegan2/networks/stylegan2-ffhq-config-f.pkl)
* [vgg16_zhang_perceptual.pkl](https://drive.google.com/uc?id=1N2-m9qszOeVC9Tq77WxsLnuWwOedQiD2)
3. Move the files to `.stylegan2-cache` folder, and rename the files to the following:
---
| Original filename |??Renamed filename |
---|---
| `vgg16_zhang_perceptual.pkl` | `f9fdff71e1e2c443ba0b5fbb956da22e_vgg16_zhang_perceptual.pkl` |
| `stylegan2-ffhq-config-f.pkl` | `62233eb618af2672cd321cfb46c72c6a_http___d36zk2xti64re0.cloudfront.net_stylegan2_networks_stylegan2-ffhq-config-f.pkl` |


## Biometric features extraction

### Clean before feature extraction
Before conducting the biometric feature extraction process, a clean up on the `aligned_images` and `generated_images` are needed.
1. Download [move.sh](LocalHardware/move.sh) to `~/Biometrics/aligned_images` and `~/Biometrics/generated_images`. 
2. `cd ~/biometrics/aligned_images`
3. `chmod +x move.sh`
4. `./move.sh`
5. `cd ~/biometrics/generated_images`
6. `chmod +x move.sh`
7. `./move.sh`
8. `rm ~/biometrics/aligned_images/move.sh`
9. `rm ~/biometrics/generated_images/move.sh`
* Result:
    * `aligned_images` will only contain folders with the name of the subject id of the biometric samples, Eg. `02463d`, with each biometric sample of the subject id inside the folder.
    * `generated_images` will contain the same folders as `aligned_images`, with the subfolders only containing the synthetic generated biometric samples.
    * New folder is created, named `generated_npy`, where all of the latent vectors are stored.

### Extraction
1. Download [align_image_packages.yml](LocalHardware/align_image_packages.yml) to the current folder


## Similarity comparision
