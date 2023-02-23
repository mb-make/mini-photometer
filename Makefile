
SCAD=$(wildcard *.scad)
STL=$(SCAD:.scad=.stl)
GCODE=$(STL:.stl=.gcode)

MAIN_STL=main.stl


.PHONY: all clean
.SECONDARY:

all: main.gcode

# Generate STL from OpenSCAD model
%.stl: %.scad
	openscad $< -o $@

# Open model in Slic3r GUI
slic3r: $(MAIN_STL)
	slic3r --gui $^

# Generate G-Code from STL model (headless)
%.gcode: %.stl
	slic3r $^
	
	# Patch model: Set bed and nozzle temperature at once
	sed -E -e "s/M190 /M140 /" -i $@

clean:
	@rm -fv $(GCODE) $(STL)

