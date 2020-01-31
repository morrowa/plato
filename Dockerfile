FROM morrowa/remarkable-toolchain AS dep-builder

WORKDIR /root/build

COPY src/wrapper/ src/wrapper/
COPY thirdparty/ thirdparty/

RUN cd thirdparty && ./build-remarkable-deps.sh

# TODO: do I really need a second build step?

FROM dep-builder

WORKDIR /root/build

COPY --from=dep-builder /root/build/libs/ libs/

COPY Cargo.toml Cargo.toml
COPY Cargo.lock Cargo.lock

RUN cargo fetch --target=arm-unknown-linux-gnueabihf

COPY . /root/build/

RUN . /opt/oecore-x86_64/environment-setup-cortexa9hf-neon-oe-linux-gnueabi && export CARGO_TARGET_ARM_UNKNOWN_LINUX_GNUEABIHF_RUSTFLAGS="-C link-arg=--sysroot=${SDKTARGETSYSROOT}" && cargo build --release --target=arm-unknown-linux-gnueabihf