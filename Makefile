# CISC372
# Matthew Meredith
# merematt@udel.edu

# Compiler
CC = gcc
FLAGS = -g -Wall

.PHONY = all current test testcurrent clean

CURRENT = hw/1/hw1
OLD = 

FILES = $(CURRENT) $(OLD)

all: $(FILES:%=%.out)

current: $(CURRENT:%=%.out)

test: $(FILES:%=%.valgrind)

testcurrent: $(CURRENT:%=%.valgrind)

%.valgrind: %.out
	@echo Running $@ with valgrind
	@valgrind ./$<

%.out: %.c
	@echo Compiling $< =\> $@
	@$(CC) $(FLAGS) $< -o $@

clean:
	@echo Removing compiled binaries
	@rm -rf $(FILES:%=%.out)