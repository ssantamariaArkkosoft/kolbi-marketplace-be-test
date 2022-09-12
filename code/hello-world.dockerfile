# Use an official lightweight Python image.
# https://hub.docker.com/_/python
FROM node:16

# Install production dependencies.
RUN npm i

#Default port 
EXPOSE 3000

# Copy local code to the container image.
WORKDIR /app
COPY . .

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
