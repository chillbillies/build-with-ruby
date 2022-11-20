# Chillbillies Ruby Development Environment

Development environment setup is hands-down the worst part of developing: Hours and hours can be spent on installing software, necessary packages, dealing with operating system quirks, etc. These issues become more and more apparent when multiple people are working on a project and the already messy development process can easily get bogged down in communal bug-hunting between slightly different environments.

This repo contains all the files necessary for setting up an entire development environment for building web applications with Ruby. The goal is to take the arduous process of environment setup and boil it down to a simple, reproducible process by leveraging [Docker](https://www.docker.com/).

The following tools have already been setup and are ready to rock:
- Ruby 3.1 with `bundler`, NodeJS and `yarn` 3.2.4
- Two PostgreSQL v15 databases for development and testing
- Redis
- git, curl and neovim
- zsh with the outstanding [oh-my-zsh](https://ohmyz.sh/) framework

## Prerequisites
- [Docker Desktop](https://www.docker.com/)

## Get Started
1. Copy this `docker` directory into your project's directory
2. Fill in the app name in `docker/.env` and optional host ports.

While in that project's `docker` directory run the following commands:

3. `docker compose build`
4. `docker compose up`

## Other Notes
### Ports
We make a couple of assumptions with the ports you use in the container:
- We assume that you use the [Puma gem](https://rubygems.org/gems/puma/versions/3.4.0) (or similar) and have Puma serving on port `3000`.
- We assume that you also use the [Mailcatcher gem](https://rubygems.org/gems/mailcatcher) (or similar), and have port `1080` set to the webmail interface.
 
The default host ports applied in the committed `.env` are:
- `80` for the application and `1080` for email (i.e. on your host browser, your app and webmail will be served on `localhost` and `localhost:1080` respectively). 
- `5432` for the databases
- `6379` for the cache.
These can be changed in `.env` to suite the needs of the developer.

### OS Context
The default, non-root user in the container is `chill` and the work directory is their home directory. Entering the container with: `docker exec -it <YOUR_APP_CONTAINER_NAME_HERE>` will pop you into the zsh shell as the `chill` user.

### Databases
Two databases get created during the build step: `chill_dev` and `chill_test`. See `docker/.build/postgres/create-databases.sql` for respective credentials. The `DB_ROOT_PASSWORD` in `.env` refers to the default `postgres` user in the database.