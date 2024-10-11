FROM nikolaik/python-nodejs:python3.10-nodejs18-bullseye

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    git \
    make \
    wget \
    curl

# Install foundry using foundryup
RUN curl -L https://foundry.paradigm.xyz | bash && ~/.foundry/bin/foundryup
ENV PATH="/root/.foundry/bin:${PATH}"

COPY . .

RUN pip3 install -r /app/requirements.txt

RUN virtualenv slither_venv

RUN . slither_venv/bin/activate && pip3 install slither-analyzer==0.10.3 solc-select==1.0.4

WORKDIR /app