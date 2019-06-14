FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
# tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
RUN apt-get install -y screen terminator tmux vim wget 
RUN apt-get install -y aptitude build-essential cmake g++ gfortran git pkg-config software-properties-common
RUN apt-get install -y unrar
RUN apt-get install -y ffmpeg
RUN apt-get install -y gnuplot-x11
RUN apt-get install -y python3 python3-dev python3-pip
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools wheel cython
RUN python3 -m pip install --upgrade tf-nightly-gpu tf-estimator-nightly tfp-nightly tb-nightly numpy h5py dill matplotlib mock
RUN python3 -m pip install protobuf==3.8.0
RUN python3 -c "import tensorflow"
