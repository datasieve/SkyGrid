CPP           = g++
CPPFLAGS      = -c -Wall -g
LINK          = g++

ifeq ($(VENDOR),apple)
    LDFLAGS_LINUX = -L/opt/local/lib -llua -lpthread -lncurses
    INCLUDES      = /opt/local/include/
else
    INCLUDES      = /usr/include/lua5.1/
    LDFLAGS_LINUX = -L/usr/lib -llua5.1 -lpthread -lncurses
endif

LDFLAGS       = $(LDFLAGS_LINUX)
RM            = rm


.SUFFIXES:
.SUFFIXES: .o .cpp

.cpp.o:
	$(CPP) -I $(INCLUDES) $(CPPFLAGS) $*.cpp -o $(SRC_DIR)$*.o

all: skygrid

skygrid: skygrid.o commServer.o pose.o robot.o render.o pluginmanager.o warden.o
	$(LINK) $(LDFLAGS) -o $@ $^

clean:
	$(RM) -rf *.o skygrid

skygrid.o:	skygrid.cpp definitions.h commServer.h pose.h robot.h render.h warden.h pluginmanager.h render.cpp
commServer.o:	commServer.cpp commServer.h
pose.o:		pose.cpp pose.h
robot.o:	robot.cpp robot.h pose.h
pluginmanager.o:pluginmanager.cpp pluginmanager.h
warden.o:	pluginmanager.cpp warden.cpp warden.h
render.o:	warden.cpp render.cpp render.h
