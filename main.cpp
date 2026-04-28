#include <iostream>
#include <iomanip>

extern "C" {
    uint64_t crypto_process(uint64_t data, uint64_t key);
}

int main() {
    uint64_t data_sensitif = 0x55AA55AA12345678; // Contoh Sinyal/API Key
    uint64_t key_rahasia = 0xDEADBEEFCAFEBABE;   // Key unik milikmu

    std::cout << "--- PROGRAM ENKRIPSI KUSTOM ---" << std::endl;
    std::cout << "Data Asli   : 0x" << std::hex << data_sensitif << std::endl;

    // Proses Enkripsi
    uint64_t hasil_enkripsi = crypto_process(data_sensitif, key_rahasia);

    std::cout << "Ter-enkripsi: 0x" << std::hex << hasil_enkripsi << std::endl;
    std::cout << "--------------------------------" << std::endl;

    return 0;
}

