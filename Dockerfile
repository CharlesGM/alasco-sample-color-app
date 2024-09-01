# Use a Python base image
FROM python:3.9-slim

# Set environment variable for the page color
ENV PAGE_COLOUR=white

# Set the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the PYTHONPATH to include the working directory
ENV PYTHONPATH=/usr/src/app

# Run tests and ensure that failures cause the build to fail
# RUN pytest tests/ || { echo 'Tests failed'; exit 1; }

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]
