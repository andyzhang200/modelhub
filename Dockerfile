# Use the AWS Lambda Python 3.13 base image
# FROM registry.sfgitlab.opr.statefarm.org/registry/sfcommunity/python-builder:3.11
# Use the AWS Lambda Python 3.13 base image
FROM public.ecr.aws/lambda/python:3.13

# Set the working directory
WORKDIR /var/task

# Set environment variable to disable SSL verification (not recommended for production)
ENV PIP_NO_VERIFY=1

# Copy your Lambda function code and requirements file
COPY lambdacookies.py ./
COPY requirements.txt ./
COPY pip.conf /root/.pip/pip.conf

ENV HTTP_PROXY="http://host.docker.internal:9000"
ENV HTTPS_PROXY="http://host.docker.internal:9000"
ENV NO_PROXY="localhost,127.0.0.1"
# RUN pip install --upgrade pip setuptools wheel
# Install any dependencies (if you have a requirements.txt)

# Install CA certificates
# RUN yum install -y ca-certificates && update-ca-trust
ENV JFROG_USER=vaiemo
ENV JFROG_PASSWORD=cmVmdGtuOjAxOjE3NjkwNTM1OTY6ZXloM1hYM0c0Q1UwRUVDQWhJWU05M296ZXpI
# RUN pip install --no-cache-dir --extra-index-url https://$JFROG_USER:$JFROG_PASSWORD@packages.ic1.statefarm/artifactory/api/pypi/pypi-remote --no-cache-dir --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt
# Install any dependencies (if you have a requirements.txt)
# Use --trusted-host to bypass SSL verification
# RUN pip install --no-cache-dir --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

# curl -k -x http://host.docker.internal:9000 https://pypi.org

# export HTTP_PROXY=http://host.docker.internal:9000
# export HTTPS_PROXY=http://host.docker.internal:9000
# pip install --extra-index-url https://$JFROG_USER:$JFROG_PASSWORD@packages.ic1.statefarm/artifactory/api/pypi/pypi-remote --no-cache-dir --trusted-host pypi.org --trusted-host files.pythonhosted.org pytz
# In