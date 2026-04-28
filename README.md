# Bitcoin Hashing Optimization (ARM64)

Program sederhana untuk mensimulasikan optimasi hashing Bitcoin menggunakan kombinasi tiga bahasa pemrograman.

## Arsitektur
* **C++**: Logika aplikasi dan manajemen data.
* **C**: Interface jembatan antara High-level dan Low-level.
* **ARM64 Assembly**: Optimasi operasi bitwise (Rotate & XOR) langsung di register CPU.

## Cara Kompilasi (Termux/ARM64)
```bash
# Assembly
gcc -c sha256_fast.S -o sha256_fast.o

# C Bridge
gcc -c crypto_bridge.c -o crypto_bridge.o

# C++ Main & Linking
g++ main.cpp crypto_bridge.o sha256_fast.o -o btc_program

# Jalankan
./btc_program

