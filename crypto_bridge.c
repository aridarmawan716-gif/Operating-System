#include <stdint.h>

// Fungsi enkripsi kustom di Assembly
extern uint64_t encrypt_core(uint64_t data, uint64_t key);

uint64_t crypto_process(uint64_t data, uint64_t key) {
    return encrypt_core(data, key);
}

