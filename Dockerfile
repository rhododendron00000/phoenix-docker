FROM elixir:latest
RUN apt-get update -y && \
  apt-get install inotify-tools -y && \
  mix local.hex --force && \
  mix local.rebar --force && \
  mix archive.install hex phx_new --force && \
  mkdir /app
COPY . /app
WORKDIR /app
RUN mix deps.get && \
  mix do compile