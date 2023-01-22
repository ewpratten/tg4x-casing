
all: build/filler_left.stl build/filler_right.stl

build/filler_left.stl: cad/filler.scad
	mkdir -p build
	openscad -o build/filler_left.stl -D 'ENABLE_HALVES=[true,false]' cad/filler.scad

build/filler_right.stl: cad/filler.scad
	mkdir -p build
	openscad -o build/filler_right.stl -D 'ENABLE_HALVES=[false,true]' cad/filler.scad