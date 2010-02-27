ifndef OSTYPE
OSTYPE=$(shell uname -s|awk '{print tolower($$0)}')
endif
ifeq "$(OSTYPE)" "linux"
GCCFLAGS = -fPIC -shared
endif
ifeq "$(OSTYPE)" "darwin"
GCCFLAGS = -fPIC -shared -flat_namespace -undefined suppress -fno-common
endif


all: ebin/gsm0338.beam priv/gsm0338.so


ebin/gsm0338.beam: src/gsm0338.erl
	$(ERL_TOP)/bin/erlc -o ebin src/gsm0338.erl


priv/gsm0338.so: c_src/gsm0338.c
	gcc $(GCCFLAGS) -I $(ERL_TOP)/erts/emulator/beam/ -o priv/gsm0338.so c_src/gsm0338.c


shell:
	$(ERL_TOP)/bin/erl -pa ../gsm0338/ebin


clean:
	rm -f priv/*.so ebin/*.beam
