COMPILER = clang
CCFLAGS = -Wall -Wextra -O -std=gnu99 --pedantic
OBJECTS = ./bin/game.o ./bin/main.o ./bin/render.o


all: autopongo

autopongo: $(OBJECTS)
	$(COMPILER) $(CCFLAGS) $(OBJECTS) -lncurses -o autopongo

$(OBJECTS) : ./bin/%.o : ./src/%.c
	mkdir -p bin
	$(COMPILER) $(CCFLAGS) ./src/$*.c -c -o $@

clean:
	rm $(OBJECTS) autopongo -f

re: clean autopongo
