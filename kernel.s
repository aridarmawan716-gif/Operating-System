; kernel.s - Main Kernel 16-bit Sederhana
bits 16

kernel_start:
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

