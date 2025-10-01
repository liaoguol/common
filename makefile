project = launch
object = cwnd
cflags = -c -O3 -DUNICODE -finput-charset=UTF-8
lflags = -mwindows -static -s -fexec-charset=GBK 
path_obj = build/obj
path_exe = build
vpath %.o build/obj
vpath %.exe build
.PHONY:all
all:$(addsuffix .exe,$(project))
$(addsuffix .exe,$(project)):$(addsuffix .o,$(object)) 
	g++ -o $(addprefix $(path_exe)\,$(addsuffix .exe,$(project))) $(addprefix $(path_obj)/,$(addsuffix .o,$(object))) $(lflags)
$(addsuffix .o,$(object)):resource.h
$(addsuffix .o,$(object)):%.o:%.h
$(addsuffix .o,$(object)):%.o:%.cpp
	g++ -o $(addprefix $(path_obj)\,$@) $< $(cflags)
.PHONY:clean
clean:
	rm $(addprefix $(path_obj)/,*.*) 

