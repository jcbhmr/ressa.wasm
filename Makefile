build-release:
	cargo component build --release

build:
	cargo component build

setup:
	rustup target add wasm32-unknown-unknown
	rustup target add wasm32-wasi
	rustup target add wasm32-wasi-preview1-threads
	command -v cargo-binstall || curl -fsSL https://gist.github.com/jcbhmr/bb74f61f0fc2d1d464d0a51af6712509/cargo-binstall-install.sh | sh
	command -v cargo-component || cargo binstall cargo-component -y
	command -v jco || npm install -g @bytecodealliance/jco

bindings-js:
	jco transpile target/wasm32-wasi/debug/*.wasm -o target/js/debug
