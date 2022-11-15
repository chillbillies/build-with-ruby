# Chillbillies Ruby Development Stack

This repo contains the essential tools needed for Ruby web application development ready to go with [Docker](https://www.docker.com/). It includes the following...

### Services
- Ruby 3.1 with `bundler`, NodeJS and `yarn` 3.2.4
- Two PostgreSQL-15 databases for development and testing
- Redis cache

### Opinionated Niceties
- git, curl and neovim
- zsh with the outstanding [oh-my-zsh](https://ohmyz.sh/) framework

## Prerequisites
- [Docker](https://www.docker.com/)

## Get Started
1. Copy this `docker` directory into your project's directory
2. Fill in the app name and host ports in `docker/.env` *(optional)*

While in that project's `docker` directory run the following commands:
3. `docker compose build`
4. `docker compose up`

## Host Port City
We make a couple of assumptions with the ports you use in the container:
- We assume that you use the [Puma gem](https://rubygems.org/gems/puma/versions/3.4.0) (or similar) and have Puma serving on port `3000`.
- We assume that you also use the [Mailcatcher gem](https://rubygems.org/gems/mailcatcher) (or similar), and have port `1080` set to the webmail interface.
 
The default host ports applied in the committed `.env` are:
- `8080` for the application and `1080` for email (i.e. on your host browser, your app and webmail will be served on `localhost:8080` and `localhost:1080` respectively). 
- `44022` for the databases
- `6379` for the cache.
These can be changed in `.env` to suite the needs of the developer. For example, changing `HOST_APP_PORT` to 80 will allow you just view `localhost` on your browser without specifying a port.

## OS Context
The default, non-root user in the container is `chillbilly` and the work directory is set as `/var/www/app`. We recommend entering the container as `chillbilly` explicitly like so: `docker exec -itu chillbilly <YOUR_APP_CONTAINER_NAME_HERE>`. Ideally, you would never need to have root-level access to your application, but the root user is available to `exec` into and run whatever would need to be run.

## Databases
Two databases get created during the build step: `local_dev` and `local_test`. See `postgres/create-databases.sql` for respective credentials. The `DB_ROOT_PASSWORD` in `.env` refers to the default `postgres` user in the database, but your application should connect to those databases with their dedicated users--local_dev and local_test-- respectively.

