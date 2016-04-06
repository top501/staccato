SHELL = /bin/sh

CC = g++
CFLAGS = -Wall -Wextra -pedantic -g -O0
ALL_FLAGS = -std=c++11 -pthread

TARGET = main

SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:%.cpp=%.o)

.PHONY: all
all: $(TARGET) 

$(TARGET): $(OBJS)
	$(CC) $(ALL_FLAGS) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $@

%.o: %.cpp
	$(CC) -c $(ALL_FLAGS) $(CFLAGS) $< -o $@

.PHONY: clean
clean:
	rm $(TARGET) 2>/dev/null || true
	rm $(OBJS) 2>/dev/null || true
	rm .depend 2>/dev/null || true

.PHONY: run
run: $(TARGET)
	./$(TARGET)

.PHONY: dep
dep: $(SRCS)
	$(CC) $(ALL_FLAGS) $(CFLAGS) -MM $^  > .depend

-include .depend