# Dockerfile for bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:tf-nightly

FROM bstriner/cuda-10.1-cudnn7-devel-ubuntu16.04
# nohup docker build . -t tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04 & disown
# docker run -it tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04
# docker login
# docker tag tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04 bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:20190605
# nohup docker push bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:20190605 & disown

#TF
RUN python3 -m pip install keras_preprocessing keras_applications tf-nightly-gpu tfp-nightly pysoundfile cffi
RUN python3 -c "import tensorflow as tf; print(tf.__version__)"
#tf-estimator-nightly tb-nightly 