FROM jupyter/base-notebook

ARG NB_USER=jovyan
ARG NB_UID=1000
ARG NB_GID=100

USER root

WORKDIR /elasticsearch

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

COPY ./spark-3.2.1-bin-hadoop3.2 /elasticsearch/spark-3.2.1-bin-hadoop3.2
COPY ./elasticsearch-hadoop-8.2.2 /elasticsearch/elasticsearch-hadoop-8.2.2

ENV DOCKER_STACKS_JUPYTER_CMD="notebook" 

# RUN pip install -U elasticsearch==8.2.0 numpy pandas jupyter pyspark
RUN pip install -U elasticsearch==8.2.0 numpy pandas pyspark

CMD jupyter trust './recommendations.ipynb'

CMD PYSPARK_DRIVER_PYTHON="jupyter" PYSPARK_DRIVER_PYTHON_OPTS="notebook --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password='' --ip 0.0.0.0 --NotebookApp.port='8888' --ServerApp.token='' --ServerApp.password='' --ServerApp.ip='0.0.0.0' --ServerApp.port='8888' --ServerApp.allow_root=True" /elasticsearch/spark-3.2.1-bin-hadoop3.2/bin/pyspark --driver-memory 4g --driver-class-path /elasticsearch/elasticsearch-hadoop-8.2.2/dist/elasticsearch-spark-20_2.11-8.2.2.jar




# ENTRYPOINT [ "jupyter", "notebook", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--allow-root" ]

# 1. Create structure for services index in elasticsearch

# https://elasticsearch-py.readthedocs.io/en/v8.2.2/async.html#getting-started-with-async
# https://elasticsearch-py.readthedocs.io/en/v8.2.2/api.html#machine-learning-ml
# https://github.com/elastic/elasticsearch-py/blob/main/test_elasticsearch/test_server/test_helpers.py