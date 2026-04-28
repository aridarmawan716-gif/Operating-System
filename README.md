Low-level Bitcoin hashing simulation optimized for ARM64.
Demonstrates seamless integration of C++ logic, C bridging,
and direct ARM64 Assembly register manipulation for performance.
Developed and compiled in Termux (Android).

---

# ARM64 Optimized Bitcoin Hashing Simulation

A high-performance demonstration of multi-language system programming. This project explores the intersection of high-level logic and hardware-specific optimization.

## 🛠 Tech Stack
- **C++**: High-level application logic & data management.
- **C**: Low-level ABI bridging.
- **ARM64 Assembly**: Manual bitwise rotation and XOR optimization for SHA-256 steps.

## 🚀 Key Features
- **Register Optimization**: Direct use of `x0` and `x1` registers to bypass compiler overhead.
- **Cross-Language Linking**: Practical implementation of `extern "C"` and assembly symbol linking.
- **Mobile Development**: Developed and compiled entirely within a **Termux (Android)** environment.

## 🔨 Build Instructions
```bash
# Compile Assembly
gcc -c sha256_fast.S -o sha256_fast.o

# Compile C Bridge
gcc -c crypto_bridge.c -o crypto_bridge.o

# Link with C++ Main
g++ main.cpp crypto_bridge.o sha256_fast.o -o btc_program

# Run
./btc_program


