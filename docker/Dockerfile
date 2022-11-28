FROM ruby:2.7.4-alpine

# ------------ Root Related Stuff ------------
# User config and creation
ARG username=chill
RUN adduser -u 808 -D $username && \
    chown -R ${username}: /home/${username} && \
	chown -R ${username}: /usr/local/bundle
WORKDIR /home/${username}

# Install dependencies and dev QoL
RUN apk update && \
    apk add \
    neovim \
    git \
    curl \
    zsh \
    build-base


# NodeJS and Yarn 3 for frontend
RUN apk add --update npm && \
    npm install --global yarn && \
    corepack enable && \
    corepack prepare yarn@3.2.4 --activate

# Gems and Bundler
RUN gem update --system && \
    gem install bundler

# ------------ User Related Stuff -----------
USER $username
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Serve app on:
EXPOSE 80

# Email server interface on:
EXPOSE 1080

#CMD ["/bin/zsh"]
