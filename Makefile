# Periwinkle
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
	@if [ ! -d "$(HOMEDIR)/.config/systemd/user" ]; then \
		mkdir -p "$(HOMEDIR)/.config/systemd/user"; \
	fi
	
	@if [ ! -f "$(HOMEDIR)/.config/systemd/user/periwinkle-daemon.service" ]; then \
		cp periwinkle.service "$(HOMEDIR)/.config/systemd/user"; \
	else \
		echo ""; \
		echo "READ CAREFULLY."; \
		echo "You have installed a new version of the Periwinkle daemon service."; \
		echo 'To activate it again, use "systemctl --user start periwinkle" or "systemctl --user enable periwinkle"'; \
		echo ""; \
		rm -f "$(HOMEDIR)/.config/systemd/user/periwinkle-daemon.service"; \
		cp periwinkle.service "$(HOMEDIR)/.config/systemd/user"; \
	fi	

	$(shell sudo sh -c "cp -f periwinkle /usr/bin/periwinkle")

uninstall:
	rm $(HOMEDIR)/.config/systemd/user/periwinkle.service
	$(shell sudo sh -c "rm -f /usr/bin/periwinkle")

.PHONY: all
