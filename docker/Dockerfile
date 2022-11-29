FROM ruby:2.7.4-alpine

# User config and creation
ARG username=chill
RUN adduser -u 808 -D $username && \
    chown -R ${username}:${username} /home/${username} && \
	chown -R ${username}:${username} /usr/local/bundle

# Install dependencies
RUN apk update && \
    apk add \
    git \
    curl \
    build-base \
    nodejs \
    npm

# Yarn for frontend package management
RUN npm install --global yarn

# Bundler for backend package management
RUN gem update --system && \
    gem install bundler

# Serve app on:
EXPOSE 80

# Email server interface on:
EXPOSE 1080

USER $username
WORKDIR /home/${username}