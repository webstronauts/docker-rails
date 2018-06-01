<div align="center">

# docker-rails 🐳

An opiniated [Docker](https://www.docker.com/) container for [Rails](https://rubyonrails.org/) applications.

<hr />

[![License](https://img.shields.io/github/license/webstronauts/docker-rails.svg)](LICENSE.md)
[![Docker Automated build](https://img.shields.io/docker/automated/webstronauts/rails.svg)](https://hub.docker.com/r/webstronauts/rails/)
[![Docker Build Status](https://img.shields.io/docker/build/webstronauts/rails.svg)](https://hub.docker.com/r/webstronauts/rails/builds/)

</div>

## Usage

Create a `Dockerfile` in your Rails project;

```dockerfile
FROM webstronauts/rails
```

You can then build and run the Docker image:

```console
$ docker build -t my-rails-app .
$ docker run -it --rm --name my-rails-app my-rails-app
```

## Author(s)

Robin van der Vleuten ([@robinvdvleuten](https://twitter.com/robinvdvleuten)) - [The Webstronauts](https://www.webstronauts.co?utm_source=github&utm_medium=readme&utm_content=docker-rails)
