in_path := "./src/"
asm_path := in_path / "asm/"
c_path := in_path / "c/"
out_path :="./out/"
exec_path := "./exec/"

default:
  @just --list

@build file: 
  nasm -f elf32 {{asm_path}}{{file}}.asm -o {{out_path}}{{file}}.o

@c-from-asm ofile cfile:
  gcc -m32 {{out_path}}{{ofile}}.o {{c_path}}{{cfile}}.c -o {{exec_path}}{{ofile}} 

@link file:
  ld -m elf_i386 {{out_path}}{{file}}.o -o {{exec_path}}{{file}}

@ffi file: 
  gcc -m32 -no-pie {{out_path}}{{file}}.o -o {{exec_path}}{{file}}

@run file: 
  just build {{file}}
  just link {{file}}
  {{exec_path}}{{file}}

@ffi-run file:
  just build {{file}}
  just ffi {{file}}
  {{exec_path}}{{file}}

@c-run-from-asm ofile cfile:
  just build {{ofile}}
  just c-from-asm {{ofile}} {{cfile}}
  {{exec_path}}{{ofile}}
