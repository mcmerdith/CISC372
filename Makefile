# CISC372
# Matthew Meredith
# merematt@udel.edu

# Compiler
ifdef MPI
	CC = mpicc
	THREAD_COUNT = 8
else
	CC = gcc
endif
FLAGS = -g -Wall

# Directives
.PHONY = current run clean

# Macro to get executor prefix
ifdef TEST
	RUNNER_PREFIX = valgrind ./$1
else
	RUNNER_PREFIX = ./$1
endif

# MPI programs are run with srun
ifdef MPI
ifdef NO_POOL
	EXEC_PREFIX = mpiexec -n $(THREAD_COUNT) $(RUNNER_PREFIX)
else
	EXEC_PREFIX = srun -n $(THREAD_COUNT) $(RUNNER_PREFIX)
endif
else
	EXEC_PREFIX = $(RUNNER_PREFIX)
endif

# Macro to run a list of files
LINK = $(CC) $(FLAGS) $1 -o $2

# Current project
CURRENT = hw/2/hw2.out

current: $(CURRENT)

run: $(CURRENT)
	@echo Running $(<F)
	@$(call EXEC_PREFIX,$<)

hw1: hw/1/hw1.out

hw2: hw/2/hw2.out

# Simple single-file compile and link command
%.out: %.c
	@echo Compiling and linking $< =\> $@
	@$(CC) $(FLAGS) $< -o $@

# Multi-file compile only command
%.o: %.c
	@echo Compiling $< =\> $@
	@$(CC) -c $(FLAGS) $< -o $@

# Remove all binaries and object files
clean:
	@echo Removing binaries
	@find . -name "*.out" -type f -delete
	@echo Removing objects
	@find . -name "*.o" -type f -delete
