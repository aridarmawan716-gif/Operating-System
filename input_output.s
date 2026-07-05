; input_output.s - Program Input/Output Keyboard Sederhana
bits 16
org 0x1000      ; Kita setel agar berjalan di alamat yang sama dengan kernel

start:
    ; Sinkronisasi segmen memori
    mov ax, cs
    mov ds, ax
    mov es, ax

    ; Tampilkan pesan selamat datang awal
    mov si, welcome_msg
    call print_string

main_loop:
    ; === FUNGSI INPUT: Baca Keyboard ===
    mov ah, 0x00        ; Fungsi BIOS: Ambil Karakter dari Keyboard
    int 0x16            ; Panggil Interrupt. Hasil karakter disimpan di AL
    
    ; Cek apakah user menekan tombol 'Enter' (ASCII 13)
    cmp al, 13
    je enter_pressed

    ; === FUNGSI OUTPUT: Cetak Karakter ===
    mov ah, 0x0E        ; Fungsi BIOS: Teletype Output (Cetak huruf di AL)
    int 0x10            ; Panggil Interrupt
    jmp main_loop       ; Ulangi terus untuk karakter berikutnya

enter_pressed:
    ; Jika Enter ditekan, cetak baris baru (New Line)
    mov si, newline
    call print_string
    jmp main_loop       ; Kembali ke loop utama

print_string:
    mov ah, 0x0E
.loop:
    lodsb
    or al, al
    jz .done
    int 0x10
    jmp .loop
.done:
    ret

; Area Data / Variabel teks
welcome_msg db "Program I/O Aktif! Silakan ketik sesuatu: ", 13, 10, 0
newline     db 13, 10, 0

