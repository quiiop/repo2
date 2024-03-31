CC = gcc
CFLAGS = -Wall -Wextra -pedantic -std=c11

# List of source files
SRCS = func1.c func2.c

# Object files corresponding to each source file
OBJS = $(SRCS:.c=.o)

# Target library
LIB = libmylib.a

# Target
TARGET = main
TARGET_SRC = main.c

# Default rule to build the library
all: $(TARGET)

# Rule to build the Target
$(TARGET): $(LIB)
	$(CC) $(CFLAGS) $(TARGET_SRC) -o $@ -L. -lmylib

# Rule to build the library
$(LIB): $(OBJS)
	ar rcs $@ $^

# Rule to build object files
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Clean rule
clean:
	rm -f $(OBJS) $(LIB)
