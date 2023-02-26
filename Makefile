
SCAD=$(wildcard *.scad)
STL=$(SCAD:.scad=.stl)
GCODE=$(STL:.stl=.gcode)
ZIP=$(STL:.stl=.stl.zip)

MAIN_STL=print.stl
MAIN=print.zip


.PHONY: all clean
.SECONDARY:

all: zip

# Generate STL from OpenSCAD model
stl: $(MAIN_STL)
%.stl: %.scad
	openscad $< -o $@

zip: $(MAIN)
%.zip: %.stl
	zip -9 $@ $<

# Open model in Slic3r GUI
slic3r: $(MAIN_STL)
	slic3r --gui $^

# Generate G-Code from STL model (headless)
%.gcode: %.stl
	slic3r $^
	
	# Patch model: Set bed and nozzle temperature at once
	sed -E -e "s/M190 /M140 /" -i $@

clean:
	@rm -fv $(GCODE) $(STL) $(ZIP)
