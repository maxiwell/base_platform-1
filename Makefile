
SHELL  := /bin/bash

TARGET := platform
EXE    := $(TARGET).x

SRCS    := main.cpp

COMPONENTS := mips memory bus 


OBJS 	:= $(SRCS:.cpp=.o)
INC_DIR := -I. `pkg-config --cflags systemc` `pkg-config --cflags archc` \
		  	   $(foreach c, $(COMPONENTS), -I $(c)) 
LIB_DIR := -L. `pkg-config --libs systemc` `pkg-config --libs archc` \
				$(foreach c, $(COMPONENTS), -L $(c) -l$(c)) 
LIBS 	:= $(LIB_DIR) 
OTHER 	:= -std=c++11  -DAC_GUEST_BIG_ENDIAN  -Wno-deprecated
CFLAGS	:= -g $(OTHER)
CC		:= g++ 

export INC_DIR

all:
	for c in $(COMPONENTS); do 		\
		echo " => Making" $$c ...; 	\
	    cd $$c; $(MAKE); cd ..; 	\
	done;
	echo " => Making sw ..."
	cd sw; $(MAKE)
	echo " => Making platform ..."
	$(MAKE) $(EXE) 

clean:
	for c in $(COMPONENTS); do  		\
		echo " => Making" $$c ...; 		\
	    cd $$c; $(MAKE) clean; cd ..; 	\
	done	
	echo " => Making sw ..."
	cd sw ; $(MAKE) clean
	echo " => Making platform ..."
	rm -f $(OBJS) $(EXE) *~ *.o

#------------------------------------------------------
.SILENT:
#------------------------------------------------------
.SUFFIXES: .cc .cpp .o .x
#------------------------------------------------------
$(EXE): $(OBJS) $(LIBFILES)
	$(CC) $(CFLAGS) $(INC_DIR) -o $(EXE) $(OBJS) $(LIBS)
#------------------------------------------------------
main.o:
	$(CC) $(CFLAGS) $(INC_DIR) -c main.cpp 
#------------------------------------------------------
#all: $(EXE)
#------------------------------------------------------
run: $(EXE)
	./$(EXE) -- sw/hello_world.mips
#------------------------------------------------------
#------------------------------------------------------
distclean: clean
#------------------------------------------------------
.cpp.o:
	$(CC) $(CFLAGS) $(INC_DIR) -c $<
#------------------------------------------------------
.cc.o:
	$(CC) $(CFLAGS) $(INC_DIR) -c $<





