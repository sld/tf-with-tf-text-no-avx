FROM python:3.8.11-slim

RUN pip install --upgrade pip
COPY requirements.txt .
COPY tensorflow_text-2.5.0-cp38-cp38-linux_x86_64.whl ./
COPY tensorflow-2.5.1-cp38-cp38-linux_x86_64.whl ./
RUN pip install -r requirements.txt

# remove unused files
RUN rm requirements.txt tensorflow_text-2.5.0-cp38-cp38-linux_x86_64.whl tensorflow-2.5.1-cp38-cp38-linux_x86_64.whl

ENTRYPOINT ["/bin/bash", "-c"]