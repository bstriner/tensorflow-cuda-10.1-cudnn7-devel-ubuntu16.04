# Dockerfile for bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04

FROM bstriner/cuda-10.1-cudnn7-devel-ubuntu16.04
# nohup docker build . -t tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04 & disown
# docker run -it tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04
# docker login
# docker tag tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04 bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:20190605
# nohup docker push bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:20190605 & disown

#TF
RUN apt-get install git
RUN mkdir -p /pkg
WORKDIR /pkg
RUN git clone https://github.com/tensorflow/tensorflow.git
WORKDIR /pkg/tensorflow
ENV PYTHON_BIN_PATH /usr/bin/python3
ENV USE_DEFAULT_PYTHON_LIB_PATH 1
ENV TF_NEED_JEMALLOC 1
ENV TF_NEED_GCP 0
ENV TF_NEED_HDFS 0
ENV TF_ENABLE_XLA 1
ENV TF_NEED_OPENCL_SYCL 0
ENV CUDA_TOOLKIT_PATH /usr/local/cuda
ENV TF_CUDA_VERSION 10.1
ENV TF_CUDNN_VERSION 7.6.0
ENV TF_CUDA_COMPUTE_CAPABILITIES 3.5,6.1
ENV TF_NEED_ROCM 0
ENV TF_NEED_CUDA 1
ENV TF_NEED_TENSORRT 0
ENV CUDNN_INSTALL_PATH /usr
ENV TF_CUDA_CLANG 0
ENV GCC_HOST_COMPILER_PATH /usr/bin/gcc
ENV TF_NEED_MPI 0
ENV CC_OPT_FLAGS "-mavx -mavx2 -mfma -mfpmath=both -msse4.2"
ENV TF_SET_ANDROID_WORKSPACE 0
RUN python3 -m pip install keras_preprocessing keras_applications
RUN ./configure
RUN bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
RUN ./bazel-bin/tensorflow/tools/pip_package/build_pip_package --nightly_flag /pkg/tensorflow_pkg
RUN ls /pkg/tensorflow_pkg/
RUN python3 -m pip install /pkg/tensorflow_pkg/*.whl
WORKDIR /pkg
#RUN python3 -m pip install --upgrade tfp-nightly
RUN python3 -m pip install --upgrade pysoundfile cffi
RUN python3 -c "import tensorflow as tf; print(tf.__version__)"

#TFP
WORKDIR /pkg
RUN git clone https://github.com/tensorflow/probability.git
WORKDIR /pkg/probability
RUN mv /usr/bin/python /usr/bin/python-bak
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN bazel build --copt=-O3 --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2 :pip_pkg
RUN mkdir -p /pkg/probability_pkg
RUN ./bazel-bin/pip_pkg /pkg/probability_pkg
RUN rm /usr/bin/python
RUN mv /usr/bin/python-bak /usr/bin/python
RUN ls /pkg/probability_pkg/
RUN python3 -m pip install --upgrade /pkg/probability_pkg/*.whl
WORKDIR /pkg
RUN python3 -c "import tensorflow_probability as tfp; print(tfp.__version__)"
# Test