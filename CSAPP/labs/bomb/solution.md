# bomb lab

bomb lab solution.

All solutions may be just part.

## Phase 1

According to the ```string_length``` return value, the string length is 52 bytes. And either ```%rsi``` or ```%rdi``` stores the pointer that points to the start of the string.
Use ```x/52xb %rsi/%rdi``` to inspect the value and chanslate into characters.

## Phase 2

At the beginning, determine the first number is 1(try and observe the behavior).The you'll find the next number is 2 times of previous number.

## Phase 3

2 number inputs,1 for case swith,and the other is used to determine whether to bomb.

answers can be:

- 0 207
- 1 311
- 2 707
- 3 256
- 4 389
- 5 206
- 6 682
- 7 327
- First number bigger than 7 will explode bomb

## Phase4

2 inputs only. Second one must be 0, according the end of code ```phase_4```. And the first input is calculated in ```func4```, the only one branch is that the first input value satisfy the condition of 2 conditional jumps(calculate them,and you'll find it is 7). Other branch will modify ```%eax``` and return. However, after ```func4```, ```%eax``` will be test if it is 0, if not, bomb!

## Phase5

After reading code, you'll find the match string is ```0x66 0x6c 0x79 0x65 0x72 0x73```, but it's not your input. Your input will be translated accoding the table at 0x4024b0, the bias(index) is your input's lower byte in ascii. ```0x?9 0x?f 0x?e 0x?5 0x?6 0x?7``` is fine(? canbe anything legal). So **ionuvw** is one of the answers(Ionuvm, iONUVw, ionu6w....).

## Phase6

A Linked list sort, 6 nodes are here, so you input will firstly be checked whether it is legal and unique. And then, all the numbers will be complemented by 7. And then, modify the linklist according sequence(not your input). You should sort it from higest to lowest.

## secret_phase

This phase will call ```func7``` which makes recursive calls, and there are so many branches, i can't figure out what they are doing but i manage to find the answer. Branch 1 in line 0x40120b will leads to wrong return value, so never let %rdi equals 0(when too many recursive calls). And according the phase code, target return value is 2, and there exsits branches that add 1 to %eax, double %eax, let %eax equals 0 and return. So you need to arrange them to get the value 2. And you'll find the branch makes ```%eax``` equals 0 and return is **je**, so you can determine the result is 22.
