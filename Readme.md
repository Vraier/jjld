# elfIO
- Allows us to read and write elf files
- `nixpkgs` only has version `3.10` which does not work with newer compilers. We manually added `3.12`
- Alternative could be: https://sourceware.org/elfutils/

# Analyze obj Files
- gcc: 
    - `-c` to only compile and not link
- objdump: 
    - `-d` to find assembly instructions
- readelf: 
    - `-a` to print everything

# Useful Material
- Linker writeup from Ian: https://inai.de/documents/Linkers.pdf
- elfIO documentation: https://elfio.sourceforge.net/elfio.pdf