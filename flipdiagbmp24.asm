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

        ; padded width, pw = ((width * 3 + 3) // 4) * 4
        mov     eax, [ebp+12]
        lea     eax, [eax+eax*2]
        add     eax, 3
        shr     eax, 2
        shl     eax, 2
        mov     [ebp-4], eax

        ; calculate left_pixel_ptr
        mov     eax, [ebp+12]
        sub     eax, 2
        mul     dword [ebp-4]
        mov     esi, eax
        add     esi, [ebp+8]

        ; calculate right_pixel_ptr
        mov     eax, [ebp+12]
        sub     eax, 1
        mul     dword [ebp-4]
        add     eax, 3
        mov     edi, eax
        add     edi, [ebp+8]

loop_row:

loop_col:


        ; epilogue
        pop     edi
        pop     esi
        pop     ebx
        mov     esp, ebp
        pop     ebp
        ret

; === variables ===
; esi - left_pixel_ptr
; edi - right_pixel_ptr
;
; [ebp+12] - width
; [ebp+8] - *img
; [ebp-4] - padded width
