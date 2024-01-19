in_path := "./src"
asm_path := in_path / "asm"
x86_asm_path := asm_path / "x86/"
x64_asm_path := asm_path / "x64/"
c_path := in_path / "c/"
out_path :="./out/"
exec_path := "./exec/"

# default recipe 
default:
  @just --list

# build asm for x64
@build_x64 file:
  nasm -f elf64 {{x64_asm_path}}{{file}}.asm -o {{out_path}}{{file}}_x86_64.o

# build asm for x86
@build_i386 file: 
  nasm -f elf32 {{x86_asm_path}}{{file}}.asm -o {{out_path}}{{file}}_i386.o

# build c file with asm library x64
@c_from_asm_x64 ofile cfile:
  gcc -m64 {{out_path}}{{ofile}}_x86_64.o {{c_path}}{{cfile}}.c -o {{exec_path}}{{ofile}}_x86_64

# build c file with asm library x86
@c_from_asm_i386 ofile cfile:
  gcc -m32 {{out_path}}{{ofile}}_i386.o {{c_path}}{{cfile}}.c -o {{exec_path}}{{ofile}}_i386

# link object file to make executable x64
@link_i386 file:
  ld -m elf_i386 {{out_path}}{{file}}_i386.o -o {{exec_path}}{{file}}_i386

# link object file to make executable x86
@link_x64 file:
  ld -m elf_x86_64 {{out_path}}{{file}}_x86_64.o -o {{exec_path}}{{file}}_x86_64

# build asm that uses external c functions x64
@ffi_x64 file:
  gcc -m64 {{out_path}}{{file}}_x86_64.o -o {{exec_path}}{{file}}_x86_64

# build asm that uses external c functions x86
@ffi_i386 file:
  gcc -m32 {{out_path}}{{file}}_i386.o -o {{exec_path}}{{file}}_i386

# assemble, link and run x64
@run_x64 file:
  just build_x64 {{file}}
  just link_x64 {{file}}
  {{exec_path}}{{file}}_x86_64

# assemble, link and run x86
@run_i386 file:
  just build_i386 {{file}}
  just link_i386 {{file}}
  {{exec_path}}{{file}}_i386

# assemble and build to use external c functions x64
@run_ffi_x64 file:
  just build_x64 {{file}}
  just ffi_x64 {{file}}
  {{exec_path}}{{file}}_x86_64

# assemble and build to use external c functions x86
@run_ffi_i386 file:
  just build_i386 {{file}}
  just ffi_i386 {{file}}
  {{exec_path}}{{file}}_i386

# assemble and build to use asm in c x64
@run_c_from_asm_x64 ofile cfile:
  just build_x64 {{ofile}}
  just c_from_asm_x64 {{ofile}} {{cfile}}
  {{exec_path}}{{ofile}}_x86_64

# assemble and build to use asm in c x86
@run_c_from_asm_i386 ofile cfile:
  just build_i386 {{ofile}}
  just c_from_asm_i386 {{ofile}} {{cfile}}
  {{exec_path}}{{ofile}}_i386
