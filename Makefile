ifndef OSTYPE
OSTYPE=$(shell uname -s|awk '{print tolower($$0)}')
endif
ifeq "$(OSTYPE)" "linux"
GCCFLAGS = -fPIC -shared
endif
ifeq "$(OSTYPE)" "darwin"
GCCFLAGS = -fPIC -shared -flat_namespace -undefined suppress -fno-common
endif

ERL  = $(ERL_TOP)/bin/erl
ERLC = $(ERL_TOP)/bin/erlc


all: ebin/gsm0338.beam priv/gsm0338.so


ebin/gsm0338.beam: src/gsm0338.erl
	$(ERLC) -o ebin src/gsm0338.erl


priv/gsm0338.so: c_src/gsm0338.c
	gcc $(GCCFLAGS) -I $(ERL_TOP)/erts/emulator/beam/ -o priv/gsm0338.so c_src/gsm0338.c


ebin/gsm0338_test.beam: src/gsm0338_test.erl
	$(ERLC) -o ebin src/gsm0338_test.erl


test: priv/gsm0338.so ebin/gsm0338.beam ebin/gsm0338_test.beam
	$(ERL) -pa ../gsm0338/ebin -s gsm0338_test test -s init stop


shell:
	$(ERL) -pa ../gsm0338/ebin


clean:
	rm -f priv/*.so ebin/*.beam
