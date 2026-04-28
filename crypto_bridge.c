#include <stdint.h>

// Menghubungkan ke fungsi yang ada di file Assembly
extern uint64_t sha256_step_asm(uint64_t data);

void process_bitcoin_block(uint64_t* data) {
    if (data != 0) {
        // Memanggil fungsi assembly untuk optimasi
        *data = sha256_step_asm(*data);
    }
}

