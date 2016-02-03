all: make

edit:
	cd src && ./edit.bash

lint:
	cd src && ./lint.bash

make:
	cd src && ./make.bash

mrun:
	cd src && ./mrun.bash

test:
	cd src && ./test.bash

vend:
	cd src/vendor && ./update.bash
