# Docker Image

# By breaking this down into small steps, Docker can cache each step
# so that subsequent `docker build`s are faster!

# Base of docker container - `alpine` is a stripped down version of node
FROM node:10.16.0-alpine

# Working directory and place where docker will put everything
# You "made it up" here an now - it doesn't have to be specific
WORKDIR /app

# Copy just the package.json file across to the container.
# the left side is your local and the right is the container.
# re. caching, we don't copy the whole app yet, as we don't need it just now.
COPY package.json /app

# copying the package.json allowed up to install the npm packages
# so lets do that now
RUN npm i

# Now copy the whole app over to the container / image
COPY . /app

# run this bad boy to kick off the application
CMD ["npm", "start"]