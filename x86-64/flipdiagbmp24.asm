        bits    64
        section .text
        global  flipdiagbmp24
        ; void flipdiagbmp24(void *img, int width);

flipdiagbmp24:			        
        ; prologue

        ; padded width, pw = ((width * 3 + 3) // 4) * 4
        mov     r8d, esi
        lea     r8d, [r8d+r8d*2+3]
        and     r8d, -4

        ; calculate left_pixel_ptr
        lea     eax, [esi-2]
        imul    eax, r8d
        lea     r9, [rax+rdi]

        ; calculate right_pixel_ptr
        lea     eax, [esi-1]
        imul    eax, r8d
        lea     r10, [rax+rdi+3]

        ; prepare row iteration counter
        lea     edx, [esi-1]

loop_row:
        ; prepare column iteration counter
        mov     ecx, esi
        sub     ecx, edx

loop_col:
        ; swap *left_pixel_ptr with *left_pixel_ptr
        ; swap two pixels at once (2 bytes)
        mov     ax, [r9]
        xchg    ax, [r10]
        xchg    ax, [r9]
        ; swap remaining pixel (1 byte)
        mov     al, [r9+2]
        xchg    al, [r10+2]
        xchg    al, [r9+2]

        ; update left_pixel_ptr
        sub     r9, 3

        ; update right_pixel_ptr
        add     r10, r8

        ; end loop_col
        dec     ecx
        jnz     loop_col

        ; update left_pixel_ptr on row change
        mov     eax, esi
        sub     eax, edx
        inc     eax
        sub     r9, r8
        lea     eax, [eax+eax*2]
        add     r9, rax

        ; update right_pixel_ptr on row change
        lea     r10, [r9+r8+3]

        ; end loop_row
        dec     edx
        jnz     loop_row

        ; epilogue
        ret

; === registers / addresses ===
; eax - pixel swap temporary register
; r8d - padded width
; ecx - column iteration counter
; edx - row iteration counter
; r9 - left_pixel_ptr
; r10 - right_pixel_ptr
;
; rsi - width
; rdi - *img
