RC		= rustc
NAMES	= Colleen Grace Sully

PHONY += all
all: $(NAMES)

$(NAMES): %: %.rs
	$(RC) $< -o $@

PHONY += clean
clean:
	rm -f Grace_kid.rs Sully_*

PHONY += fclean
fclean: clean
	rm -f $(NAMES)

PHONY += re
re: fclean all

.PHONY: $(PHONY)
