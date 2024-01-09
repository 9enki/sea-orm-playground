FROM rust:1.74-slim as builder

WORKDIR /root/app

ENV CARGO_HOME=/root/.cargo

RUN apt update -y && apt upgrade -y
RUN apt install -y libssl-dev pkg-config postgresql-client && rm -rf /var/lib/apt/lists/*
COPY Cargo.toml Cargo.lock /root/app/
COPY src ./src
RUN --mount=type=cache,target=/root/.cargo/registry \
    --mount=type=cache,target=/root/.cargo/git \
    --mount=type=cache,target=/root/app/target \
    cargo build && mv target/debug/sea-orm-playground /usr/local/bin/

COPY bakery.sql /root/app
COPY entrypoint.sh /root/app
RUN chmod +x /root/app/entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
