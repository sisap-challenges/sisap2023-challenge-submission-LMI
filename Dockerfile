# Define base image/operating system
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install software
RUN apt-get update && apt-get install -y --no-install-recommends build-essential curl ca-certificates
# RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda3 -b
RUN rm -f Miniconda3-latest-Linux-x86_64.sh

# Copy files and directory structure to working directory
COPY . . 
#COPY bashrc ~/.bashrc
ENV PATH=/miniconda3/bin:${PATH}

SHELL ["/bin/bash", "--login", "-c"]
RUN conda init bash
#RUN echo 'export PATH=/miniconda3/bin:$PATH' > ~/.bashrc

RUN conda create -n lmi  python=3.8
RUN conda install -n lmi matplotlib pandas scikit-learn
RUN conda run -n lmi pip install h5py flake8 setuptools tqdm faiss-cpu
RUN conda run -n lmi pip install torch --index-url https://download.pytorch.org/whl/cpu
RUN conda run -n lmi pip install --editable .

# Set container's working directory - this is arbitrary but needs to be "the same" as the one you later use to transfer files out of the docker image
#WORKDIR result


# Run commands specified in "run.sh" to get started

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
#ENTRYPOINT [ "/bin/bash", "/sisap23-run.sh"]
