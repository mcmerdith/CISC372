# CISC372
# Matthew Meredith
# merematt@udel.edu

# Compiler
CC = gcc
FLAGS = -g -Wall

.PHONY = all test clean

all: runner

test: runner
	valgrind ./runner.out

%: %.c
	$(CC) $(FLAGS) $< -o $@.out

clean:
	rm *.out