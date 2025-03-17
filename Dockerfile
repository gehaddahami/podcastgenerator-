FROM ubuntu:latest

RUN apt-get update && apt-get install -y \ 
    python3.10 \
    python3-pip \
    git 
    
# Create a virtual environment and install dependencies
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip
RUN /opt/venv/bin/pip install PyYAML

# Set the virtual environment as the default Python path
ENV PATH="/opt/venv/bin:$PATH"
COPY feed.py /usr/bin/feed.py 

COPY entrypoint.sh /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]
