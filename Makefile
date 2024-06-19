# Periwinkle - Fish shell edition
# See LICENSE file for copyright and license details.

SRC = periwinkle periwinkle-daemon.service
OBJ = ${SRC:.c=.o}
HOMEDIR = $(HOME)

all:
	@echo "Usage:"
	@echo "make install - Installs Periwinkle (normal version)"
	@echo "make uninstall - Uninstalls Periwinkle"

install:
	@echo "Thanks for installing Periwinkle!"
	chmod +x periwinkle

	$(shell sudo sh -c "cp -f periwinkle /usr/bin/periwinkle")

uninstall:
	$(shell sudo sh -c "rm -f /usr/bin/periwinkle")

.PHONY: all
