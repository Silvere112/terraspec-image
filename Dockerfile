FROM golang:buster
WORKDIR /home
RUN git clone https://github.com/nhurel/terraspec.git
WORKDIR terraspec
RUN go build
ENV PATH="/home/terraspec:${PATH}"
RUN echo $PATH
WORKDIR /home

RUN apt-get update
RUN apt-get install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update
RUN apt-get install terraform
