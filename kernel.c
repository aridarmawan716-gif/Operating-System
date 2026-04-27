// Fungsi untuk mencetak string ke layar pada mode teks 16-bit
void main() {
    char* video_memory = (char*)0xb8000; // Alamat memori video untuk mode teks
    *video_memory = 'K';                 // Cetak huruf 'K'
    *(video_memory + 1) = 0x07;          // Atribut warna (putih di latar hitam)
}

