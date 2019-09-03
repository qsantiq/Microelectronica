COMP = iverilog#Compilador
WFV = gtkwave#Visor de forma de onda
SINT = yosys#Sintetizador
SINT_SCRIPT = yos.ys#Script con instrucciones para sintesis
VCD = mux.vcd# Archivo VCD
TESTBENCH_0 = mux_tb#Testbench
CONDUCTUAL_0 = mux_c.v#Archivo con descripcion conductual
ESTRUCTURAL_0 = mux_e.v#Archivo con descripcion estructural
THIS_00 =_c#Cadena a reemplazar
FORTHIS_00 =_e#Reemplazo de la cadena
THIS_01 = _COND#Cadena a reemplazar
FORTHIS_01 = _ESTR#Reemplazo de la cadena
TARGET_GTKW= mux.gtkw

help:
	cat README

All: compile sed autoinst gtk clean 	

compile: sed
	vvp $(TESTBENCH_0)
	$(COMP) -o $(TESTBENCH_0) $(TESTBENCH_0).v
	
sed: yosys
	sed 's/$(THIS_00)/$(FORTHIS_00)/g' $(ESTRUCTURAL_0) > $(ESTRUCTURAL_0).temp && mv $(ESTRUCTURAL_0).temp $(ESTRUCTURAL_0);
	sed 's/$(THIS_01)/$(FORTHIS_01)/g' $(ESTRUCTURAL_0) > $(ESTRUCTURAL_0).temp && mv $(ESTRUCTURAL_0).temp $(ESTRUCTURAL_0)

yosys:
	$(SINT) $(SINT_SCRIPT)
	
gtk:
	$(WFV) $(VCD) $(TARGET_GTKW)

autoinst: $(TESTBENCH_0).v
	emacs --batch $(TESTBENCH_0).v -f verilog-auto -f save-buffer

clean:
	rm -f *.o *.vcd