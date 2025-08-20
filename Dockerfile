# Use a slim Python 3.11 image as the base
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Expose the port the application will run on
EXPOSE 8080

# Define the command to run the application
# Cloud Run will set the PORT environment variable, so we use it here
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]
