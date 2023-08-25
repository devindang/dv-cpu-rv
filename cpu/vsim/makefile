.PHONY: com sim clean

PATH = ../bench/*.v ../rtl/*.v ../rtl/../*.v

all: 	clean com sim

# check if wave.do exist.
ifeq ($(wildcard wave.do),wave.do)
	wvcfg:=1
else
	wvcfg:=0
endif

com:
	vlib work
	vmap work work
	vlog -l com.log -work work $(PATH)
sim:
ifeq (wvcfg,1)
	vsim -l sim.log -do "run -all"
else
	vsim -l sim.log -do "run -all" -do sim.do
endif

clean:
	rm -rf 	./work transcript modelsi,.ini vsim.wlf	\\
			*.vcd wlft* vish* *.log

