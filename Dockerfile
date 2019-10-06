# Dockerfile for bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:tf-nightly

FROM bstriner/cuda-10.1-cudnn7-devel-ubuntu16.04
# docker build . -t bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:tf-nightly
# docker login
# docker push bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:tf-nightly
# docker run -it bstriner/tensorflow-cuda-10.1-cudnn7-devel-ubuntu16.04:tf-nightly

#TF
RUN python3 -m pip install --upgrade \
	keras \
	keras_preprocessing \
	keras_applications \
	tensorflow-gpu==1.15.0rc2 \
	tensorflow-probability \
	pysoundfile \
	cffi \
	kaldiio \
	imageio \
	scipy \
	matplotlib \
	tensorflow-gan \
	sentencepiece
RUN python3 -c "import tensorflow as tf; print(tf.__version__)"
