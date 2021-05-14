        bits    32
        section .text
        global  flipdiagbmp24

flipdiagbmp24:			        ; void flipdiagbmp24(void *img, int width);
        ; prologue
        push    ebp
        mov     ebp, esp
        sub     esp, 12
        push    ebx
        push    esi
        push    edi

        mov     esi, [ebp+8]

        ; epilogue
        pop     edi
        pop     esi
        pop     ebx
        mov     esp, ebp
        pop     ebp
        ret
