# Compile the print library into an object file
gcc -c -nostdlib -fno-builtin my_print.c -o my_print.o

# Compile main into an object file
gcc -c -nostdlib -fno-builtin my_main.c -o my_main.o

# Link the two object files together into the final executable
ld my_main.o my_print.o -o my_main