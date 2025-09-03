# Use an official Python image as the base
FROM python:3.9-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY . ${WORKDIR}

# Install dependencies
RUN python -m pip install --no-cache-dir -r requirements.txt

# Make entrypoint.sh executable
RUN chmod +x /app/entrypoint.sh

# Change the working directory to lounch app and database
WORKDIR /app/babyshop_app

# Expose port 80
EXPOSE 8025

# This is the command that will be executed on container launch
ENTRYPOINT ["/bin/sh", "-c", "/app/entrypoint.sh"]