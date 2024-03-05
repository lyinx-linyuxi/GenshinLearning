# Achitecture lab

## P0: Environment configuration

[tutorial 1: installing tools](https://zhuanlan.zhihu.com/p/480380496)

[tutorial 2: using ```-fcommon``` flags](https://stackoverflow.com/questions/63152352/fail-to-compile-the-y86-simulatur-csapp)

[tutoral 3: modify deprecated interface](https://stackoverflow.com/questions/66291922/tk-h-looks-for-tcl-h-in-usr-include-but-tcl-h-is-in-usr-include-tcl-i-dont-h)

[tutorial 4: comment ```matherr```](https://zhuanlan.zhihu.com/p/545378624) Hack for SunOS, but i used linux, it is fine to comment i think.

```shell
Linux> ./gen-driver.pl
": No such file or directory
Linux> perl gen-driver.pl
#######################################################################
# Test for copying block of size 0;
#######################################################################
        .pos 0
main:   irmovq Stack, %rsp      # Set up stack pointer

        # Set up arguments for copy function and then invoke it
        irmovq $0, %rdx         # src and dst have 0 elements
        irmovq dest, %rsi       # dst array
        irmovq src, %rdi        # src array
        call ncopy
        halt                    # should halt with num nonzeros in %rax
StartFun:
```

出现以上情况那就是GitHub上传的时候将unix风格换行自动纠正成了Windows换行再上传的，使用工具改回来就行。

```shell
Linux> sudo apt-get insatll dos2unix
....
Linux> dos2unix gen-driver.pl
```

建议多使用.gitattributes文件。
