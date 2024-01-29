# Machine-Level Representation of Programs

C and Assembly languge

## Tools

### GCC commands

```bash
gcc -o target -c source -Og
```

Compile flags:

- -O: optimize
- -o: output filename
- -E: pre-process,generate .i file
- -S: pre-process and compile, generate .asm or .s file
- -c: pre-process, compile and assembly,generate .obj or .o file

### Disassembler

```shell
objdump -d sum
```

- -d:disassemble

### GDB

I used it when doing OS labs.It is really powerful.However, you should add debug flag when compiling.(gdb need the debug information)

commonly used flags:

- l:list code nearby
- b:set breakpoints ```b main.c:253```
- d:delete all breakpoints
- s:step, if a function step in
- n:next line(source code)
- si:step (in) assembly code
- ni:next assembly code
- p:print a variable or something else
- d:you can even disassembly in gdb
- x/24xb \<start\>: d 0010H:0018H,show data

## Assembly basic

I have learned 80x86 assembly language which,however,is 16-bit and intel syntax.

%e: extend,32-bit
%r: register:64-bit