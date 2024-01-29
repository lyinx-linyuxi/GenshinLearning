#include <stdio.h>
#include <string.h>
int main(){
    char str[100];
    gets(str);
    printf("%d\n", strlen(str));
}