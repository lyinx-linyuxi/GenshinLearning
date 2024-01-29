#include<stdio.h>
void swtch(int a);
int main()
{
	int a;
	scanf("%d", &a);
	swtch(a);
	return 0;
}

void swtch(int a)
{
	switch (a)
	{
	case 0:printf("hello world");break;
	case 1000:printf("hello");break;
	default:printf("world");
	}
}