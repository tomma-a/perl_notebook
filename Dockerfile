FROM jupyter/base-notebook
USER root
RUN apt update && apt install -y libzmq3-dev gcc build-essential make curl git-core pkg-config openssl libssl
-dev zlib1g-dev cpanminus && cpanm --notest Devel::IPerl && apt clean
EXPOSE 8888
ENV JUPYTER_PORT 8888
ENV JUPYTER_IP 0.0.0.0
ENV JUPYTER_NOTEBOOK_DIR /opt/jupyter
RUN mkdir -p $JUPYTER_NOTEBOOK_DIR
WORKDIR $JUPYTER_NOTEBOOK_DIR
ENTRYPOINT iperl notebook --port $JUPYTER_PORT --ip $JUPYTER_IP --notebook-dir $JUPYTER_NOTEBOOK_DIR --allow-root
