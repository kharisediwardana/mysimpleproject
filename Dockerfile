FROM google/cloud-sdk:slim

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    apt-transport-https

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
    > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    gpg --dearmor > /usr/share/keyrings/cloud.google.gpg

RUN apt-get update && apt-get install -y \
    kubectl \
    google-cloud-sdk-gke-gcloud-auth-plugin \
    python3-venv \
    python3-pip \
 && apt-get clean

WORKDIR /app
COPY . /app

RUN python3 -m venv /venv && \    
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install flask

ENV PATH="/venv/bin:$PATH"

EXPOSE 8000
CMD ["python", "app.py"]
