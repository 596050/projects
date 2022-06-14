FROM jupyter/base-notebook

ARG NB_USER=jovyan
ARG NB_UID=1000
ARG NB_GID=100

USER root

RUN apt-get update  && \
    apt-get install build-essential cmake libgl1 -y
    #RUN apt-get ffmpeg libsm6 libxext6  -y
# RUN apt-get install build-essential cmake pkg-config libx11-dev libatlas-base-dev libgtk-3-dev libboost-python-dev -y
COPY requirements.txt requirements.txt
RUN pip install -U -r requirements.txt

ENV JUPYTER_ENABLE_LAB=yes

# ENV DOCKER_STACKS_JUPYTER_CMD="notebook" 


WORKDIR /main

# CMD jupyter trust './face_recognition.ipynb'

# ENTRYPOINT [ "jupyter", "notebook", "--ip='*'", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--allow-root" ]
