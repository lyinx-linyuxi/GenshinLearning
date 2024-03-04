#include <stdio.h>
#include <stdlib.h>
char big_array[1L<<24];
char huge_array[1L<<32];
int global_var = 0;
int useless(   ){
    return 0;
}
int main(){
    void *p1, *p2, *p3, *p4;
    int local;
    p1 = malloc(1L<<28);
    p2 = malloc(1L<<8);
    p3 = malloc(1L<<32);
    p4 = malloc(1L<<8);
}