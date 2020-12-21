BIN_NAME=dumbcore
CFLAGS=-ffreestanding -std=gnu99 -O2 -Wall -Wextra
LDFLAGS=-ffreestanding -nostdlib

all: 
	mkdir -p ./build
	gcc -c ./src/boot.s -o ./build/boot.o -fPIE
	gcc -c ./src/main.c -o ./build/main.o $(CFLAGS)
	gcc -T ./src/linker.ld -o ./build/$(BIN_NAME) $(LDFLAGS) ./build/boot.o ./build/main.o -lgcc
	cp -r ./src/isodir ./build
	cp ./build/$(BIN_NAME) ./build/isodir/boot
	grub-mkrescue -o ./build/dumbcore.iso ./build/isodir
	rm -f ./build/main.o ./build/boot.o

debug:
	mkdir -p ./debug/build
	gcc ./src/main.c $(LDFLAGS) $(CFLAGS) -g3 -o ./debug/build/$(BIN_NAME)

release:
	mkdir -p ./release/build
	gcc ./src/main.c $(LDFLAGS) $(CFLAGS) -O3 -o ./release/build/$(BIN_NAME)

clean:
	rm -rf ./build
	rm -rf ./release
	rm -rf ./debug
