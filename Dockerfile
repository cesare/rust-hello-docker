FROM jimmycuadra/rust as build-env
RUN mkdir /work
Add . /work
WORKDIR /work
RUN cargo build --release --verbose

FROM debian:jessie
RUN mkdir -p /usr/local/bin
COPY --from=build-env /work/target/release/hello /usr/local/bin/hello
ENTRYPOINT ["/usr/local/bin/hello"]
