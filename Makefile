
update: submodule update build

submodule:
	git submodule init; \
	git submodule update; true

clone:
	git clone https://git.torproject.org/torbutton.git; \
	git clone https://git.torproject.org/tor-launcher.git

update-torbutton:
	cd torbutton; \
	git pull

update-tor-launcher:
	cd tor-launcher; \
	git pull

update: update-torbutton update-tor-launcher

build-torbutton:
	cp -R torbutton i2pbutton && \
	cd i2pbutton && \
	sed -i 's|.svn|.git|g' makexpi.sh &&  \
	./makexpi.sh

build-tor-launcher: clean-tor-launcher
	cp -R tor-launcher i2p-launcher && \
	cd i2p-launcher && \
	make package

build: build-tor-launcher build-torbutton

clean-torbutton:
	cd i2pbutton && rm -rf torbutton pkg

clean-tor-launcher:
	cd i2p-launcher && rm -rf tor-launcher && make clean

clean: clean-tor-launcher clean-torbutton
	rm -rf i2p-launcher i2pbutton

find:
	find . -name *.xpi
