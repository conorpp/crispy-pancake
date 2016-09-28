
project=clock_glitcher
outputdir=output_files
verilog=$(wildcard *.v) $(wildcard system/*.v)

all: $(outputdir)/$(project).sof
	nios2-configure-sof $(outputdir)/$(project).sof -d 2


$(outputdir)/$(project).map.rpt:  $(verilog)
		quartus_map $(project)

$(outputdir)/$(project).fit.rpt: $(outputdir)/$(project).map.rpt
		quartus_fit $(project)

$(outputdir)/$(project).sof: $(outputdir)/$(project).fit.rpt
		quartus_asm $(project)

clean:
	rm -f $(outputdir)/*
