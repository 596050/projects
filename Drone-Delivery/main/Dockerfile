FROM jupyter/base-notebook

ARG NB_USER=jovyan
ARG NB_UID=1000
ARG NB_GID=100

USER root

WORKDIR /main

RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get install -y ant && \
    apt-get clean;

RUN apt-get update && \
    apt-get install -y ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME

ENV DOCKER_STACKS_JUPYTER_CMD="notebook" 

RUN pip install -U numpy pandas dlib cv2 matplotlib _pickle

CMD jupyter trust './face_recognition.ipynb'

ENTRYPOINT [ "jupyter", "notebook", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--allow-root" ]
