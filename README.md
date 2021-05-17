# flipdiagbmp24
An x86 assembly module that "flips" a 24bpp square BMP image diagonally.

The flipdiagbmp24 procedure has the following declaration acessible for the ANSI C driver module:

```c
void flipdiagbmp24(void *img, int width);
````

## Setup

Compile:
```
mkdir build ; cd $_
cmake ..
make
```
Run:
```
./main images/300x300.bmp
```

Debugging (setup can be found in `.gdbinit`):
```
gdb main
```
## Example output
Before diagonal flip | After diagonal flip
--- | ---
![512x512.bmp](images/512x512.bmp) | ![512x512_flipped.bmp](images/512x512_flipped.bmp)

Before diagonal flip | After diagonal flip
--- | ---
![300x300.bmp](images/300x300.bmp) | ![300x300_flipped.bmp](images/300x300_flipped.bmp)
