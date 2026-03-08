static int my_strlen(const char *str) {
    int len = 0;
    while (str[len] != '\0') {
        len++;
    }
    return len;
}

void my_print(const char *str) {
    int len = my_strlen(str);

    // Linux x86_64 sys_write system call via inline assembly
    // rax = 1 (sys_write syscall number)
    // rdi = 1 (file descriptor for stdout)
    // rsi = pointer to the string
    // rdx = length of the string
    __asm__ volatile (
        "syscall"
        : // No return output needed
        : "a" (1), "D" (1), "S" (str), "d" (len)
        : "rcx", "r11", "memory" // Registers modified by the syscall instruction
    );
}