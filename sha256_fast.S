.text
.global sha256_step_asm
.type sha256_step_asm, %function

sha256_step_asm:
    // x0 adalah register pertama di ARM64 (seperti rdi di x64)
    // ROR (Rotate Right) di ARM64
    ror x1, x0, #13
    eor x0, x1, x0    // EOR adalah XOR di ARM
    ret

