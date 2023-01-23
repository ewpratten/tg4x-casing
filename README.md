
![./assets/render.png]

# TG4X case

This repository contains the OpenSCAD source code for a custom [TG4X](https://github.com/MythosMann/tg4x) case.

The goal of this project was to build an insert to protect the middle PCB from accidental damage while in my backpack.

## Compiling

The main source file describes the whole insert/case object. This is too big for many 3D printers, so a Makefile is used to automate the process of slicing the model into a "left" and "right" half. To do this, just run:

```sh
make
```

The resulting STLs will be written to `./build`
