FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-key adv --no-tty --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub
RUN apt-key adv --no-tty --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN apt-get update && apt-get -y upgrade
RUN apt-get install python3 python3-pip build-essential cmake -y
RUN useradd -ms /bin/bash pederz
ADD stylegan2encoder/ /home/pederz/biometrics/
RUN mkdir -p /home/pederz/biometrics/samples
RUN chown -R pederz:pederz /home/pederz/
USER pederz
ENV PATH /home/pederz/.local/bin:$PATH
ENV TF_XLA_FLAGS "--tf_xla_cpu_global_jit --tf_xla_auto_jit=2"

RUN python3 -m pip install --upgrade pip setuptools
RUN python3 -m pip install tensorflow-gpu==1.14
RUN python3 -m pip install scipy==1.3.3
RUN python3 -m pip install requests==2.22.0
RUN python3 -m pip install Pillow==6.2.1
RUN python3 -m pip install keras==2.3.1
RUN python3 -m pip install dlib
RUN python3 -m pip install tdqm

WORKDIR /home/pederz/biometrics/

ENTRYPOINT ["python3","./project_images.py"]
