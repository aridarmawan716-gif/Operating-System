.global _start

.section .data
    msg_prompt:   .ascii "Masukkan teks: "
    msg_result:   .ascii "Hasil Enkripsi: "

    // Kunci enkripsi tetap ditaruh di data section
    xor_key:      .byte 0xAA  

.section .bss
    .lcomm buffer, 256

.section .text
_start:
    // 1. Cetak prompt ke layar
    mov x0, #1                // stdout
    ldr x1, =msg_prompt
    mov x2, #15               // Langsung masukkan angka panjang teks "Masukkan teks: "
    mov x8, #64               // sys_write
    svc #0

    // 2. Baca input dari keyboard
    mov x0, #0                // stdin
    ldr x1, =buffer
    mov x2, #256
    mov x8, #63               // sys_read
    svc #0
    
    // Simpan panjang karakter input yang dibaca ke x3
    mov x3, x0                

    // 3. Proses enkripsi dengan XOR
    ldr x1, =buffer
    ldr x4, =xor_key
    ldrb w4, [x4]

xor_loop:
    cbz x3, print_result      // Jika counter x3 habis, lompat ke print
    ldrb w5, [x1]
    eor w5, w5, w4            // Operasi XOR bitwise
    strb w5, [x1]
    
    add x1, x1, #1            // Maju ke byte berikutnya
    sub x3, x3, #1            // Kurangi counter
    b xor_loop

print_result:
    // 4. Cetak label hasil
    mov x0, #1                // stdout
    ldr x1, =msg_result
    mov x2, #16               // Langsung masukkan angka panjang teks "Hasil Enkripsi: "
    mov x8, #64               // sys_write
    svc #0

    // 5. Cetak isi buffer hasil enkripsi
    mov x0, #1                // stdout
    ldr x1, =buffer
    mov x2, #256              
    mov x8, #64               // sys_write
    svc #0

exit_program:
    // 6. Keluar program
    mov x0, #0
    mov x8, #93               // sys_exit
    svc #0

