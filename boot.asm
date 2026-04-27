[org 0x7c00]

mov dx, 0x3f8   ; Alamat Serial Port COM1
mov al, 'H'
out dx, al      ; Kirim karakter 'H' ke serial
mov al, 'i'
out dx, al
mov al, '!'
out dx, al

jmp $

times 510-($-$$) db 0
dw 0xaa55

