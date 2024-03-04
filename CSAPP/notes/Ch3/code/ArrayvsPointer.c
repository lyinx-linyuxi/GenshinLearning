#include <stdio.h>
#include <stdlib.h>
/* Difference between arrays and pointers */
int main(){
    // Nested Array
    int arr[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    printf("%p\n", &arr);
    printf("%p\n", &arr + 1);
    printf("%p\n", arr);
    printf("%p\n", arr + 1);
    printf("Arrays\n");
    printf("arr[0] at %p\n", arr[0]);
    printf("arr[1] at %p\n", arr[1]);
    printf("arr[2] at %p\n", arr[2]);
    // arrays are contiguous
    // if address continously adding, you can access element of the next row.
    
    // Multi-level Array
    printf("Pointers\n");
    int** ptr = (int**)malloc(3 * sizeof(int*));
    for (int i = 0; i < 3; i++)
    {
        ptr[i] = (int*)malloc(3 * sizeof(int));
    }
    // 64 bit system, 8 bytes per address, if use int you should modify "3" to "6".
    long long int *p = (long long int*)ptr;
    printf("ptr at %p\n", ptr);
    for (int i = 0; i < 3; i++)
    {
        printf("%dth int is %X\n", i, *p);
        p++;
    }
    printf("ptr at %p\n", ptr);
    printf("ptr[0] at %p\n", ptr[0]);
    printf("ptr[1] at %p\n", ptr[1]);
    printf("ptr[2] at %p\n", ptr[2]);
    // * mean indirect addressing, usually not contiguous between rows.
    // 1 MA to fetch the head of the row, and 1 MA to fetch the element of the row.
    return 0; 
}