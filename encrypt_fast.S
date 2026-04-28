.text
.global encrypt_asm
.type encrypt_asm, %function

// x0 = data, x1 = key
encrypt_asm:
    eor x0, x0, x1    // XOR data dengan key
    ror x0, x0, #7    // Rotasi bit ke kanan sejauh 7 posisi
    ret

.global decrypt_asm
.type decrypt_asm, %function

// x0 = encrypted_data, x1 = key
decrypt_asm:
    lsl x2, x0, #7    // Kebalikan dari ROR (LSL & LSR kombinasi)
    // Untuk kemudahan, kita gunakan ROR balik
    mov x2, #64
    sub x2, x2, #7
    ror x0, x0, x2    // Rotasi balik ke posisi semula
    eor x0, x0, x1    // XOR balik dengan key untuk kembali ke data asli
    ret

