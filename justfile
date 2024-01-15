set positional-arguments

in_path := "./src/"
out_path :="./out/"
exec_path := "./exec/"

default:
  @just --list

@build file: 
  nasm -f elf32 {{in_path}}{{file}}.asm -o {{out_path}}{{file}}.o
  ld -m elf_i386 {{out_path}}{{file}}.o -o {{exec_path}}{{file}}

@run file: 
  just build {{file}}
  {{exec_path}}{{file}}
