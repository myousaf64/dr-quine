NASM	= nasm
NFLAGS	= -f elf64
CC		= gcc
NAMES	= Colleen Grace Sully

PHONY += all
all: $(NAMES)

$(NAMES): %: %.o
	$(CC) $< -o $@

%.o: %.s
	$(NASM) $(NFLAGS) $< -o $@

PHONY += clean
clean:
	rm -f *.o Grace_kid.s Sully_*

PHONY += fclean
fclean: clean
	rm -f $(NAMES)

PHONY += re
re: fclean all

.PHONY: $(PHONY)