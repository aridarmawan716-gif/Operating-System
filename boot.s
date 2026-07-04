; boot.s - Memuat Kernel dari Sektor 2
org 0x7C00
bits 16

start:
    jmp 0:.init_segments

.init_segments:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    ; === PROSES MEMUAT KERNEL ===
    mov ax, 0x1000
    mov es, ax          ; ES = 0x1000
    mov bx, 0           ; ES:BX = 0x1000:0000 (Di sini posisi mov bx, 0 yang benar)

    mov ah, 0x02        ; Fungsi BIOS: Read Sectors
    mov al, 1           ; Jumlah sektor yang dibaca
    mov ch, 0           ; Cylinder 0
    mov cl, 2           ; Sektor 2 (Tempat kernel.bin berada)
    mov dh, 0           ; Head 0
    int 0x13            ; Panggil BIOS Disk Interrupt
    jc disk_error       ; Jika error, lompat ke disk_error

    ; === LOMPAT KE KERNEL ===
    jmp 0x1000:0000     ; Lompat ke alamat memori kernel

disk_error:
    mov si, err_msg
print_loop:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0E
    int 0x10
    jmp print_loop

halt:
    cli
hang:
    hlt
    jmp hang

err_msg db "Gagal memuat kernel!", 13, 10, 0

times 510 - ($ - $$) db 0
dw 0xAA55

