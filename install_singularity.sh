# ######### 
# change this as you need
export SINGULARITY_VERSION=3.11.2 export GO_VERSION=1.20.3 OS=linux ARCH=amd64  
# #########

# #########
# Ensure repositories are up-to-date
# #########

sudo apt-get update
# Install debian packages for dependencies
sudo apt-get install -y \
    build-essential \
    libseccomp-dev \
    libglib2.0-dev \
    pkg-config \
    squashfs-tools \
    cryptsetup \
    crun \
    uidmap \
    git \
    wget

# #########
# install go
# NOTE: if you are updating Go from a older version, make sure you remove /usr/local/go before reinstalling it.
# #########
if [ -d /usr/local/go ]; then sudo rm -Rf /usr/local/go; fi 

wget -q /tmp/go${GO_VERSION}.${OS}-${ARCH}.tar.gz \
  https://dl.google.com/go/go${GO_VERSION}.${OS}-${ARCH}.tar.gz
sudo tar -C /usr/local -xzf /tmp/go${GO_VERSION}.${OS}-${ARCH}.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# #########
# install singularity
# #########

# example: https://github.com/sylabs/singularity/releases/download/v3.11.2/singularity-ce-3.11.2.tar.gz
wget -q https://github.com/sylabs/singularity/releases/download/v${SINGULARITY_VERSION}/singularity-ce-${SINGULARITY_VERSION}.tar.gz
tar xf singularity-ce-${SINGULARITY_VERSION}.tar.gz
pushd singularity-ce-${SINGULARITY_VERSION}

./mconfig && \
make -C builddir && \
sudo make -C builddir install

popd

