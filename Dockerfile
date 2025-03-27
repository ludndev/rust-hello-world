# Stage 1: Base builder
FROM rust:latest AS builder
WORKDIR /app
COPY Cargo.toml Cargo.lock ./
RUN cargo fetch
COPY . .
RUN cargo build --release

# Stage 2: Runtime
FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/target/release/rust-hello-world /app/
RUN ["/app/rust-hello-world"]
