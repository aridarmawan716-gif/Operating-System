#include <iostream>
#include <cstdio>
#include <memory>
#include <string>
#include <array>
#include <unistd.h>

// Fungsi untuk mengambil data JSON dari Termux API
std::string get_battery_json() {
    std::array<char, 128> buffer;
    std::string result;
    // Memanggil perintah resmi termux-battery-status
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen("termux-battery-status", "r"), pclose);
    if (!pipe) return "Gagal";
    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
        result += buffer.data();
    }
    return result;
}

int main() {
    while (true) {
        std::cout << "\033[2J\033[1;1H"; // Clear screen
        std::cout << "========================================" << std::endl;
        std::cout << "    BATTERY MASTER (SUCCESS VERSION)    " << std::endl;
        std::cout << "========================================" << std::endl;

        std::string data = get_battery_json();
        
        // Menampilkan data mentah dari sensor Android
        std::cout << data << std::endl;

        std::cout << "----------------------------------------" << std::endl;
        std::cout << "Status: Membaca sensor via Termux:API..." << std::endl;
        std::cout << "Update setiap 5 detik. Ctrl+C untuk stop." << std::endl;
        
        sleep(5);
    }
    return 0;
}

