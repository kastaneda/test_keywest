
all: install config.php db-installed

config.php: config.php.dist
	cp -i $< $@

install: composer.phar
	./composer.phar install

composer.phar:
	wget https://getcomposer.org/composer.phar
	chmod +x composer.phar

db-installed:
	echo "CREATE DATABASE test" | mysql -u root
	echo "SOURCE /vagrant/schema.sql" | mysql -u root test
	echo "SOURCE /vagrant/fixtures.sql" | mysql -u root test
	touch $@

clean:
	rm -rf composer.phar vendor/ config.php db-installed
	#echo "DROP DATABASE test" | mysql -u root

.PHONY: install clean
