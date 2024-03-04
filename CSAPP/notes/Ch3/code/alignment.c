#include <stdio.h>
#include <stdlib.h>
int main(){
    // remember it?
    struct User
    {
        char username[10];
        char password[10];
        int uid;
        int gid;
        char home[10];
    };
    // how many byres are there in the struct?
    // 38? is it?
    printf("Size of struct User: %d\n", sizeof(struct User));
    // padding at end
    return 0;
}