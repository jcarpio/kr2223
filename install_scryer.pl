Installing Scryer Prolog

1. Install Ubuntu 20.04.LTS (Install server if low on disk space)
2. sudo apt-get update
3. sudo apt-get install build-essential

4. In ubuntu server it will be useful to have Guest additions installed to be able to copy and paste
    https://vlade.medium.com/instalar-virtualbox-guest-additions-en-ubuntu-server-20-04-d62d48928000

5. curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
    1) default options

6. sudo apt-get install pkg-config
7. sudo apt-get install libssl-dev
8. sudo apt-get install m4

9. git clone https://github.com/mthom/scryer-prolog
    cd scryer-prolog
    cargo run --release
