SHELL := /bin/bash
PYTORCH_VERSION = $(file < pytorch_version.txt)
IMAGE_NAME=pytorch_gpu_$(PYTORCH_VERSION).sif

all: build test push

build:
	sudo singularity build -F test.sif ./Singularity

test:
	# test pytorch
	singularity exec --nv test.sif python -c "import torch;print('pytorch version: ' + torch.__version__)"
	
	# test sklearn
	singularity exec  test.sif python -c "import sklearn; sklearn.show_versions()"

	# test simpleitk
	singularity exec test.sif python -c "import SimpleITK as sitk; print('SimpleITK version: ' +  sitk.Version_VersionString())"
		
	# test pillow
	singularity exec test.sif python -c "import PIL; print('PIL version: ' + PIL.__version__)"

	# test opencv
	#singularity exec test.sif python -c "import cv2; print('Opencv version: ' + cv2.__version__)"

push:
	# https://cloud.sylabs.io/library
	# singularity remote login
	singularity push -U test.sif library://luhappycoder/deep-learning/pytorch_gpu:$(PYTORCH_VERSION)
