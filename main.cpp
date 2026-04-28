#include <iostream>
#include <iomanip>

extern "C" {
    // Menghubungkan ke fungsi Assembly melalui jembatan C
    void process_bitcoin_block(uint64_t* data);
}

int main() {
    uint64_t data = 0xABCDE12345; // Data dasar (Block Header)
    uint64_t nonce = 0;
    
    // Target kesulitan: Hash harus lebih kecil dari ini
    // Semakin banyak angka nol di depan (misal 0x0000000...), semakin sulit ditambang
    uint64_t target = 0x00000FFFFFFFFFFF; 
    uint64_t current_hash = 0;

    std::cout << "========================================" << std::endl;
    std::cout << "   BITCOIN MINER SIMULATOR (ARM64 ASM)  " << std::endl;
    std::cout << "========================================" << std::endl;
    std::cout << "Target: 0x" << std::hex << target << std::endl;
    std::cout << "Mencari nonce..." << std::endl;

    while (true) {
        // Kombinasikan data asli dengan nonce yang terus bertambah
        current_hash = data + nonce; 
        
        // Optimasi: Pemrosesan bitwise dilakukan oleh Assembly ARM64
        process_bitcoin_block(&current_hash); 

        // Cek apakah hasil hash memenuhi target (Difficulty)
        if (current_hash < target) {
            std::cout << "\n\n[BINGO!] Block Berhasil Ditambang!" << std::endl;
            std::cout << "Nonce ditemukan : " << std::dec << nonce << std::endl;
            std::cout << "Hasil Hash Final: 0x" << std::hex << current_hash << std::endl;
            std::cout << "----------------------------------------" << std::endl;
            break;
        }

        nonce++;
        
        // Log progress setiap 1 juta percobaan agar terminal tidak terlihat membeku
        if (nonce % 1000000 == 0) {
            std::cout << "Mencoba nonce: " << std::dec << nonce << "...\r" << std::flush;
        }
    }

    return 0;
}

