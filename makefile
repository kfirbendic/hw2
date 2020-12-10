# These are variables. We usually define CC, CCLINK, CFLAGS, and OBJS
CC=gcc
CCLINK=$(CC) # Read variable CC using $(CC)
CFLAGS=-g -Wall -std=c99
OBJS=file0.o file1.o file2.o file3.o file4.o main.o
EXEC=prog.exe
RM=rm -fr *.exe $(OBJS)
# The first rule is invoked by default.
# We can also invoke it (or any other rule) manually with "make all" - 
# note that "all" is the rule's name!
$(EXEC): $(OBJS)
	$(CCLINK) $(OBJS) -o $(EXEC)

main.o: main.c file0.h file1.h file2.h file3.h file4.h
	$(CC) $(CFLAGS) -c main.c

file0.o: file0.c file0.h file1.h file2.h file4.h
	$(CC) $(CFLAGS) -c file0.c	


file1.o: file1.c file1.h file0.h file4.h
	$(CC) $(CFLAGS) -c file1.c

file2.o: file2.c file0.h file1.h file2.h
	$(CC) $(CFLAGS) -c file2.c	

file3.o: file3.c file0.h file1.h file2.h file3.h
	$(CC) $(CFLAGS) -c file3.c	

file4.o: file4.c file1.h file3.h file4.h
	$(CC) $(CFLAGS) -c file4.c	


# Custom rule - we can invoke it manually by calling "make clean"
# We usually have a "clean" rule to delete any automatically generated files
clean:
	$(RM)