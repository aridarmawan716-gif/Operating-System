// main.cpp
#include <iostream>
#include <vector>

extern "C" {
    void process_bitcoin_block(uint64_t* data);
}

class BitcoinMiner {
public:
    void start(uint64_t dummy_hash) {
        std::cout << "Memulai proses hashing..." << std::endl;
        process_bitcoin_block(&dummy_hash);
        std::cout << "Hasil hash teroptimasi: " << std::hex << dummy_hash << std::endl;
    }
};

int main() {
    BitcoinMiner miner;
    miner.start(0xABCDE12345);
    return 0;
}

