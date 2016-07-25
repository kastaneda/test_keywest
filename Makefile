
all: install config.php

config.php: config.php.dist
	cp -i $< $@

install: composer.phar
	./composer.phar install

composer.phar:
	wget https://getcomposer.org/composer.phar
	chmod +x composer.phar

clean:
	rm -rf composer.phar vendor/ config.php

.PHONY: install clean
