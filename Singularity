Bootstrap: docker
From: nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
#tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04
%environment
    LC_ALL=C
	export LC_ALL
%post

    # Update list of available packages, then upgrade them
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
    
    # Utility and support packages
    apt-get install -y screen terminator tmux vim wget 
    apt-get install -y aptitude build-essential cmake g++ gfortran git \
        pkg-config software-properties-common
    apt-get install -y unrar
    apt-get install -y ffmpeg
    apt-get install -y gnuplot-x11
	
    apt-get install -y python3 python3-dev python3-pip
    pip3 install --upgrade cython tf-nightly-gpu tf-estimator-nightly tfp-nightly tb-nightly numpy h5py dill matplotlib

    # Clean up
    apt-get -y autoremove
    rm -rvf /var/lib/apt/lists/*  
