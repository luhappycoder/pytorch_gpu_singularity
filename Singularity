Bootstrap: docker

From: continuumio/miniconda3:22.11.1

%files
    pytorch_version.txt /opt

%post
export PATH=/opt/conda/bin:$PATH

#update
apt-get update
apt-get install -y tree
conda update conda 

pip install --upgrade pip

#pytorch
conda install -y -c pytorch -c nvidia pytorch=$(head -n 1 /opt/pytorch_version.txt) torchvision torchaudio pytorch-cuda=11.8 

#scikit-learn
conda install -y -c anaconda scikit-learn

#simpleitk
conda install -y -c simpleitk simpleitk

#pillow
conda install -y -c anaconda pillow 

#opencv
pip install opencv-contrib-python


