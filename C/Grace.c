#include <stdio.h>
/*
	This program writes its own source code into Grace_kid.c.
*/
#define KID "Grace_kid.c"
#define SRC "#include <stdio.h>%1$c/*%1$c%2$cThis program writes its own source code into Grace_kid.c.%1$c*/%1$c#define KID %3$cGrace_kid.c%3$c%1$c#define SRC %3$c%4$s%3$c%1$c#define FT(x) int main(void){FILE *f = fopen(KID, %3$cw%3$c); if (!f) return (1); fprintf(f, SRC, 10, 9, 34, SRC); fclose(f); return (0);}%1$cFT(x)%1$c"
#define FT(x) int main(void){FILE *f = fopen(KID, "w"); if (!f) return (1); fprintf(f, SRC, 10, 9, 34, SRC); fclose(f); return (0);}
FT(x)
