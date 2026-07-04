; boot.s - Bootloader 16-bit menggunakan NASM

org 0x7C00          ; Memberitahu assembler bahwa kode ini dimuat di alamat 0x7C00
bits 16             ; Mode 16-bit (Real Mode)

start:
    ; 1. Inisialisasi Segment Register ke 0
    jmp 0:.init_segments

.init_segments:
    xor ax, ax      ; Mengosongkan register AX (AX = 0)
    mov ds, ax
    mov es, ax
    mov ss, ax
    
    ; 2. Inisialisasi Stack Pointer
    mov sp, 0x7C00

    ; 3. Cetak Karakter Menggunakan BIOS Interrupt
    mov si, msg     ; Masukkan alamat memori pesan ke SI

print_loop:
    lodsb           ; Ambil 1 byte dari [SI] ke AL, lalu SI++
    or al, al       ; Cek apakah karakter = 0 (Null terminator)
    jz halt         ; Jika 0, selesai cetak

    mov ah, 0x0E    ; BIOS teletype output
    mov bh, 0       ; Page number 0
    mov bl, 0x07    ; Warna standar text
    int 0x10        ; Panggil BIOS Video Interrupt
    jmp print_loop

halt:
    cli             ; Matikan interrupt
hang:
    hlt             ; Hentikan CPU
    jmp hang

; Data Pesan
msg db "Hello, OS 16-Bit dari NASM!", 13, 10, 0  ; 13, 10 adalah Carriage Return & Line Feed (\r\n)

; 4. Boot Signature (Wajib 512 byte dan diakhiri 0xAA55)
times 510 - ($ - $$) db 0   ; Isi sisa byte yang kosong dengan angka 0 hingga byte ke-510
dw 0xAA55                   ; 2 byte terakhir diisi signature boot (0x55 dan 0xAA)

