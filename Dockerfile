FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (default 8080 if not set)
EXPOSE ${PORT:-8080}

# Run Gunicorn server
CMD ["gunicorn", "--workers=4", "--bind", "0.0.0.0:${PORT}", "app:app"]