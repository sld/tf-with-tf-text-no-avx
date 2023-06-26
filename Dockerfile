FROM python:3.10.12-slim-bullseye

RUN echo "deb http://ftp.debian.org/debian sid main" | tee -a /etc/apt/sources.list
RUN apt-get update && apt-get -t sid install -y libc6 libstdc++6
RUN sed '/sid main/{s/^/#/}' /etc/apt/sources.list
RUN pip install --upgrade pip
COPY requirements.txt .
COPY tensorflow-2.12.0-cp310-cp310-linux_x86_64.whl ./
RUN pip install -r requirements.txt

# remove unused files
RUN rm requirements.txt tensorflow-2.12.0-cp310-cp310-linux_x86_64.whl

ENTRYPOINT ["/bin/bash", "-c"]