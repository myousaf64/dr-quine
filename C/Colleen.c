#include <stdio.h>

/*
	This program prints its own source code.
*/

void	print_source(char *s)
{
	printf(s, 10, 9, 34, s);
}

int	main(void)
{
	/*
		The string below holds the whole program.
	*/
	char	*s = "#include <stdio.h>%1$c%1$c/*%1$c%2$cThis program prints its own source code.%1$c*/%1$c%1$cvoid%2$cprint_source(char *s)%1$c{%1$c%2$cprintf(s, 10, 9, 34, s);%1$c}%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$c/*%1$c%2$c%2$cThe string below holds the whole program.%1$c%2$c*/%1$c%2$cchar%2$c*s = %3$c%4$s%3$c;%1$c%1$c%2$cprint_source(s);%1$c%2$creturn (0);%1$c}%1$c";

	print_source(s);
	return (0);
}
