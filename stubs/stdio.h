#include <stddef.h>

typedef void *FILE;
extern FILE *stdout;
extern FILE *stderr;

size_t fwrite(void *ptr, size_t size, size_t nmemb, FILE *stream);
int fflush(FILE *stream);
void exit(int status);



