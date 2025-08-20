# Use a slim Python 3.11 image as the base
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
# This is a key step to ensure Gunicorn is available
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Expose the port the application will run on
EXPOSE 8080

# Define the command to run the application using Gunicorn
# This is the correct way to run a production Flask app on Cloud Run.
# The `$`PORT variable is automatically provided by the Cloud Run environment.
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "book-appointment-backend-python:app"]
