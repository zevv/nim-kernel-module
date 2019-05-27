#include <stdio.h>
#include <linux/module.h>

FILE *stdout;
FILE *stderr;

size_t fwrite(void *ptr, size_t size, size_t nmemb, FILE *stream)
{
	printk(ptr);
	return 0;
}

int fflush(FILE *stream)
{
	return 0;
}

void exit(int status)
{
}
