; kernel.s - Main Kernel 16-bit Sederhana
bits 16

kernel_start:
    ; --- PERBAIKAN: Samakan Segment Data dengan Code Segment ---
    mov ax, cs      ; Ambil nilai CS (0x1000) yang diset oleh bootloader
    mov ds, ax      ; Masukkan ke DS
    mov es, ax      ; Masukkan ke ES
    ; -----------------------------------------------------------

    mov si, kernel_msg
    call print_string
    
    ; Loop selamanya di dalam kernel
    jmp $

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

kernel_msg db "Halo! Anda sekarang berada di dalam KERNEL.", 13, 10, 0

