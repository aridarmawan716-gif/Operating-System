.text
.global encrypt_core
.type encrypt_core, %function

// x0 = data, x1 = key (secret key)
encrypt_core:
    eor x0, x0, x1    // XOR data dengan key
    ror x0, x0, #13   // Rotasi bit ke kanan sejauh 13 (Primanya acak)
    rev x0, x0        // Balikkan urutan byte (Endian swap)
    add x0, x0, #0xFF // Tambahkan nilai offset konstan
    ret

