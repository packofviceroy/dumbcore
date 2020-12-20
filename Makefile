BIN_NAME=dumbcore
CFLAGS=-nostdlib

all: 
	mkdir -p ./build
	gcc ./src/main.c $(CFLAGS) -O3 -o ./build/$(BIN_NAME)

debug:
	mkdir -p ./debug/build
	gcc ./src/main.c $(CFLAGS) -g3 -o ./debug/build/$(BIN_NAME)

release:
	mkdir -p ./release/build
	gcc ./src/main.c $(CFLAGS) -O3 -o ./release/build/$(BIN_NAME)
