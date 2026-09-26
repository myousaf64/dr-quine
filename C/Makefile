CC		= clang
CFLAGS	= -Wall -Wextra -Werror
NAMES	= Colleen Grace Sully

PHONY += all
all: $(NAMES)

$(NAMES): %: %.c
	$(CC) $(CFLAGS) $< -o $@

PHONY += clean
clean:
	rm -f Grace_kid.c Sully_*

PHONY += fclean
fclean: clean
	rm -f $(NAMES)

PHONY += re
re: fclean all

.PHONY: $(PHONY)
