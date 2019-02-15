FROM nvcr.io/nvidia/tensorflow:18.05-py3


USER root

################## DONT CHANGE BELOW ########################3
# Common DLI installs/config
# Install nginx version with extras
RUN apt-get update && apt-get install -y wget && wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add - && apt-get -y install software-properties-common && add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" && apt-get update && apt-get install -y --no-install-recommends openresty supervisor curl wget git && rm -rf /var/lib/apt/lists/*
#add-apt-repository -y ppa:nginx/stable && apt-get -y update &&  apt-get install -y  --no-install-recommends nginx supervisor curl wget git && rm -rf /var/lib/apt/lists/*

RUN mkdir /dli
WORKDIR /dli


# DIGITS env vars, not used everywhere, but keep them here as common globals anyways
ENV DIGITS_URL_PREFIX=/digits
ENV DIGITS_JOBS_DIR=/dli/data/digits
ENV DIGITS_LOGFILE_FILENAME=$DIGITS_JOBS_DIR/digits.log

# Set startup
ENTRYPOINT $WORKDIR/startup_script.sh
################## DONT CHANGE ABOVE ########################3

################## BASE SERVICES BELOW, CHANGE WITH CAUTION ########################3
# Install assessment harness services & Jupyter
RUN apt-get update && apt-get install --upgrade -y --no-install-recommends \
        python3-venv \
        redis-server && \
    python3 -m venv /usr/local/assessment && \
    /usr/local/assessment/bin/pip install --upgrade pip && \
    /usr/local/assessment/bin/pip install celery flask redis jupyter

# Install Jupyter, etc.
RUN python3  -m pip install -U pip==8.0.1 && pip install -U pip
RUN pip install --ignore-installed ipython jupyter
################## BASE SERVICES ABOVE, CHANGE WITH CAUTION ########################3


################## TASK SPECIFIC BELOW, CHANGE AS NEEDED ########################3
# Install task specific stuff
RUN mkdir -p /dli/data/tensorboard

# Use specific versions needed for tensorboard
RUN apt-get update && apt-get install -y --no-install-recommends \
      git \
      protobuf-compiler \
      graphviz \
      unzip && \
    pip install \
      numpy==1.12.0 \
      bleach==1.5.0 \
      keras \
      pydot \
      faker \
      babel \
      opencv-python \
      matplotlib \
      sklearn \
      html5lib==0.9999999 \
      graphviz \
      gensim \
      torch \
      torchvision \
      pydot-ng && \
    rm -rf /var/lib/apt/lists/*

ENV PYTHONWARNINGS="ignore"
#RUN echo "import warnings; warnings.filterwarnings('ignore')" >> /root/.ipython/profile_default/startup/disable_warnings.py
#COPY dli/service/jupyter/custom/* /root/.jupyter/custom/
################## TASK SPECIFIC ABOVE, CHANGE AS NEEDED ########################3
