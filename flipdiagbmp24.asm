        bits        32
        section     .text
        global      flipdiagbmp24

        ; void flipdiagbmp24(void *img, int width);

flipdiagbmp24:
	    push        ebp
	    mov	        ebp, esp

	    mov	        eax, [ebp+8]	    ;address of *img
	    mov	        ecx, [ebp+12]	    ;width
        nop

	    pop	        ebp
	    ret
