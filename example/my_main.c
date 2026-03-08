extern void my_print(const char *str);

void my_exit(int status) {
    // rax = 60 (sys_exit syscall number on x86_64)
    // rdi = status code
    __asm__ volatile (
        "syscall"
        : 
        : "a"(60), "D"(status)
        : "memory"
    );
}

// _start is the true entry point of an ELF executable
void _start() {
    my_print("Hello, bare-metal world!\n");
    
    my_exit(0);
}