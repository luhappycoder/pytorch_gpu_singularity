[![build test push pytorch gpu singularity container](https://github.com/luhappycoder/pytorch_gpu_singularity/actions/workflows/build_test_push.yaml/badge.svg)](https://github.com/luhappycoder/pytorch_gpu_singularity/actions/workflows/build_test_push.yaml)

# PyTorch GPU Singularity Container

## Aim

- Quickly set up medial imaging deep learning research environment on HPC
- GPU acceleration (CUDA and cuDNN included)
- Supported frameworks and packages:

    - PyTorch
    - Scikit-learn
    - SimpleITK
    - Pillow
    - OpenCV
    
## Pre-requisite

- Your host system must has an NVIDIA GPU card and driver installed(don't need to install cuda and cudnn)

- Install singularity on your host

    ```bash
    bash install_singularity.sh
    ```

- Pull singularity image from singularity hub

    ```bash
    singularity pull pytorch_gpu.sif library://luhappycoder/deep-learning/pytorch_gpu:2.0.0

    ```

## Usage

### 1. Enter into singularity container, run command in the container

```bash
# enter into singularityh container: imagine it as SSH into (passwordless) another machine
# --nv: leverage the nvidia gpu card
singularity shell --nv pytorch_gpu.sif
```

You will get:

```bash
Singularity: Invoking an interactive shell within container...

Singularity pytorch_gpu.sif:~>
```

You can type command now, for instance:

```bash
python /path/to/<your_script.py>
```

After finishing your work, type

```bash
exit
```
to exit the container.