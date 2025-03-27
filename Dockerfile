# Stage 1: Base builder
FROM rust:latest AS builder
WORKDIR /app
RUN rustup target add x86_64-unknown-linux-musl
RUN apt update && apt install -y musl-tools
COPY Cargo.toml Cargo.lock ./
COPY . .
RUN cargo build --release --target=x86_64-unknown-linux-musl

# Stage 2: Runtime
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/rust-hello-world /app/
CMD ["/app/rust-hello-world"]
