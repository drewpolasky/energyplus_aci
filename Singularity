BootStrap: docker
From: ubuntu:16.04

%setup


%files

%environment
export PATH=/opt/EnergyPlus/:$PATH

%apprun energyplus
exec /opt/EnergyPlus/energyplus "$@"

%apprun runenergyplus
exec /opt/EnergyPlus/runenergyplus "$@"


%post
    # commands to be executed inside container during bootstrap
    # add python and install some packages
    apt-get update -y && apt-get upgrade -y 
    apt install -y build-essential
    apt-get install -y git cmake gcc binutils \
      patch \
      g++ bzip2 ca-certificates \
      libglib2.0-0 libxext6 libsm6 libxrender1 \
      mercurial subversion \
      libcanberra-gtk* \
      autoconf wget sed \
   
    mkdir -p /storage/home
    mkdir -p /storage/work
    mkdir -p /gpfs/scratch
    mkdir -p /gpfs/group
    mkdir -p /var/spool/torque
    
    # Make symlinks
    ln -s `which qmake-qt5` /usr/local/bin/qmake
    ln -s `which moc-qt5` /usr/local/bin/moc
    ln -s `which rcc-qt5` /usr/local/bin/rcc
    ln -s `which vim` /usr/local/bin/vi
    
    apt-get install -y dos2unix
    cd /tmp

    cd /opt
    mkdir EnergyPlus && cd EnergyPlus
    wget https://github.com/NREL/EnergyPlus/releases/download/v9.1.0/EnergyPlus-9.1.0-08d2e308bb-Linux-x86_64.sh

    chmod +x EnergyPlus-9.1.0-08d2e308bb-Linux-x86_64.sh
    sed -i s/"read line leftover"/line=y/g EnergyPlus-9.1.0-08d2e308bb-Linux-x86_64.sh
    sed -i s/"read install_directory"/"install_directory=\/opt\/EnergyPlus\/"/g EnergyPlus-9.1.0-08d2e308bb-Linux-x86_64.sh
    sed -i s/"read link_directory"/"#read link_directory"/g EnergyPlus-9.1.0-08d2e308bb-Linux-x86_64.sh
    ./EnergyPlus-9.1.0-08d2e308bb-Linux-x86_64.sh
