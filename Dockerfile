# Use a slim Ubuntu image as the base
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd

# Add /usr/games to the PATH
ENV PATH="${PATH}:/usr/games"

# Add a script to verify the installation
COPY check_installation.sh /check_installation.sh
RUN chmod +x /check_installation.sh
RUN /check_installation.sh

# Copy the application files
COPY . /app
WORKDIR /app

# Make the script executable
RUN chmod +x wisecow.sh

# Expose the service port
EXPOSE 4499

# Set the entrypoint and default command
CMD ["sh", "-c", "./wisecow.sh && /bin/bash"]
