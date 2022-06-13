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

RUN pip install -U numpy pandas dlib cv2 matplotlib

CMD jupyter trust './face_recognition.ipynb'

# CMD PYSPARK_DRIVER_PYTHON="jupyter" PYSPARK_DRIVER_PYTHON_OPTS="notebook --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password='' --ip 0.0.0.0 --NotebookApp.port='8888' --ServerApp.token='' --ServerApp.password='' --ServerApp.ip='0.0.0.0' --ServerApp.port='8888' --ServerApp.allow_root=True" /elasticsearch/spark-3.2.1-bin-hadoop3.2/bin/pyspark --driver-memory 4g --driver-class-path /elasticsearch/elasticsearch-hadoop-8.2.2/dist/elasticsearch-spark-20_2.11-8.2.2.jar

ENTRYPOINT [ "jupyter", "notebook", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--allow-root" ]
