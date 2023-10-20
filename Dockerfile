FROM debian:bullseye

WORKDIR /app

# Copy your application code to the container
COPY ars0n-framework/ .

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Create a .keys directory in the container
RUN mkdir -p /root/.keys

# Create a keystore file in the .keys directory and set environment variables
RUN echo 'export SLACK_TOKEN=""' > /root/.keys/keystore
RUN echo 'export GITHUB_PAT=""' >> /root/.keys/keystore
RUN echo 'export SHODAN_API_KEY=""' >> /root/.keys/keystore
RUN echo 'export HACKERONE_USER=""' >> /root/.keys/keystore
RUN echo 'export HACKERONE_API_KEY=""' >> /root/.keys/keystore

# Print a message to indicate whether the .keys directory was found
RUN echo '[+] Keys directory found.' > /root/.keys/keystore

# Install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Run the non-interactive script
CMD ["python3", "install.py"]
