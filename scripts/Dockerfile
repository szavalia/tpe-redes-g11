# Use a minimal base image suitable for your application
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the pre-compiled build to the container
ARG BUILD_ID
COPY ./builds/$BUILD_ID /app/build

# Install serve for static file serving
RUN yarn global add serve

# Specify the command to run your application
CMD [ "serve", "-s", "build" ]
