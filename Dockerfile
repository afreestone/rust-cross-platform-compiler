FROM rust:latest

RUN apt update && apt upgrade -y
RUN apt install -y g++-mingw-w64-x86-64

RUN rustup target add x86_64-pc-windows-gnu
RUN rustup toolchain install stable-x86_64-pc-windows-gnu

RUN cargo install cargo-tarpaulin
RUN rustup component add clippy
RUN rustup component add rustfmt
RUN cargo install cargo-audit

WORKDIR /app

CMD ["cargo", "build", "--target", "x86_64-pc-windows-gnu"]