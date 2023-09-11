# Periwinkle
# See LICENSE file for copyright and license details.

SRC = periwinkle periwinkle-daemon.service
OBJ = ${SRC:.c=.o}
HOMEDIR = $(HOME)

all:
	@echo "Usage:"
	@echo "make install - Installs Periwinkle (normal version)"
	@echo "make install-lite - Installs Periwinkle (lite, without configfile)"
	@echo "DO note if you install the lite version, you will have to change the periwinkle-lite file beforehand to make it conform to your settings."
	@echo "make uninstall - Uninstalls Periwinkle"

install: 
	@echo "Thanks for installing Periwinkle!"
	chmod +x periwinkle
	@if [ ! -d "$(HOME)/.config/systemd/user" ]; then \
		mkdir -p "$(HOME)/.config/systemd/user"; \
	fi
	
	cp periwinkle-daemon.service $(HOME)/.config/systemd/user

	$(shell sudo bash -c "cp -f periwinkle /usr/bin/periwinkle")

uninstall:
	rm $(HOME)/.config/systemd/user/periwinkle-daemon.service
	$(shell sudo bash -c "rm -f /usr/bin/periwinkle")

.PHONY: all
