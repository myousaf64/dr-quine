int i = 5;
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int	main(void)
{
	char	file[32];
	char	cmd[128];
	char	*s = "int i = %5$d;%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$cchar%2$cfile[32];%1$c%2$cchar%2$ccmd[128];%1$c%2$cchar%2$c*s = %3$c%4$s%3$c;%1$c%2$cFILE%2$c*f;%1$c%1$c%2$cif (strstr(__FILE__, %3$cSully_%3$c))%1$c%2$c%2$ci--;%1$c%2$cif (i < 0)%1$c%2$c%2$creturn (0);%1$c%2$csprintf(file, %3$cSully_%%d.c%3$c, i);%1$c%2$cf = fopen(file, %3$cw%3$c);%1$c%2$cif (!f)%1$c%2$c%2$creturn (1);%1$c%2$cfprintf(f, s, 10, 9, 34, s, i);%1$c%2$cfclose(f);%1$c%2$csprintf(cmd, %3$cclang -Wall -Wextra -Werror Sully_%%d.c -o Sully_%%d && ./Sully_%%d%3$c, i, i, i);%1$c%2$creturn (system(cmd) != 0);%1$c}%1$c";
	FILE	*f;

	if (strstr(__FILE__, "Sully_"))
		i--;
	if (i < 0)
		return (0);
	sprintf(file, "Sully_%d.c", i);
	f = fopen(file, "w");
	if (!f)
		return (1);
	fprintf(f, s, 10, 9, 34, s, i);
	fclose(f);
	sprintf(cmd, "clang -Wall -Wextra -Werror Sully_%d.c -o Sully_%d && ./Sully_%d", i, i, i);
	return (system(cmd) != 0);
}
