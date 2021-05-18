        bits    32
        section .text
        global  flipdiagbmp24
        ; void flipdiagbmp24(void *img, int width);

flipdiagbmp24:			        
        ; prologue
        push    ebp
        mov     ebp, esp
        push    ebx
        push    esi
        push    edi

        ; padded width, pw = ((width * 3 + 3) // 4) * 4
        mov     ebx, [ebp+12]
        lea     ebx, [ebx+ebx*2]
        add     ebx, 3
        shr     ebx, 2
        shl     ebx, 2

        ; calculate left_pixel_ptr
        mov     eax, [ebp+12]
        sub     eax, 2
        mul     ebx
        mov     esi, eax
        add     esi, [ebp+8]

        ; calculate right_pixel_ptr
        mov     eax, [ebp+12]
        sub     eax, 1
        mul     ebx
        add     eax, 3
        mov     edi, eax
        add     edi, [ebp+8]

        ; prepare row iteration counter
        mov     edx, [ebp+12]
        sub     edx, 1

loop_row:
        ; prepare column iteration counter
        mov     ecx, [ebp+12]
        sub     ecx, edx

loop_col:
        ; swap *left_pixel_ptr with *left_pixel_ptr
        ; swap two pixels at once (2 bytes)
        mov     ax, [esi]
        xchg    ax, [edi]
        xchg    ax, [esi]
        ; swap remaining pixel (1 byte)
        mov     al, [esi+2]
        xchg    al, [edi+2]
        xchg    al, [esi+2]

        ; update left_pixel_ptr
        sub     esi, 3

        ; update right_pixel_ptr
        add     edi, ebx

        ; end loop_col
        dec     ecx
        jnz     loop_col

        ; update left_pixel_ptr on row change
        mov     eax, [ebp+12]
        sub     eax, edx
        add     eax, 1
        sub     esi, ebx
        lea     eax, [eax+eax*2]
        add     esi, eax

        ; update right_pixel_ptr on row change
        lea     edi, [esi+ebx+3]

        ; end loop_row
        dec     edx
        jnz     loop_row

        ; epilogue
        pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret

; === registers / addresses ===
; eax - pixel swap temporary register
; ebx - padded width
; ecx - column iteration counter
; edx - row iteration counter
; esi - left_pixel_ptr
; edi - right_pixel_ptr
;
; [ebp+12] - width
; [ebp+8] - *img
