;TITLE: Strng Reversal
;AUTHOR: Simon Lally-Shultz

INCLUDE Irvine32.inc

mPRNT       MACRO    str_

            push     edx

            mov      edx, str_
            call     writeString

            pop      edx

            ENDM

mSWAP       MACRO    p1, p2

            push     eax
     
            mov      al, p1
            mov      ah, p2

            XOR      al, ah
            XOR      ah, al
            XOR      al, ah

            mov      p1, al
            mov      p2, ah

            pop      eax

            ENDM

.data

myStr       BYTE    'mystring', 0

.code

strRev      PROC

            push    ebp
            mov     ebp, esp

            push    ebx
            push    edx
            push    edi

            mov     ebx, [ebp+8]
            mov     edx, ebx
            mov     edi, ebx

            push    edi
            call    strLen

            add     edx, eax
            dec     edx

rev:

            cmp     ebx, edx
            jg      endl
            mSWAP   [edx], [ebx]

            dec     edx
            inc     ebx
            jmp     rev

endl:

            pop     edi
            pop     edx
            pop     ebx
            pop     ebp

            ret     4

strRev      ENDP

strLen      PROC

            push    ebp
            mov     ebp, esp

            push    edx
            push    ecx

            mov     eax, 0
            mov     edx, [ebp+8]

isChar:

            mov     ch, [edx+eax]
            cmp     ch, 0
            je      isNull
            inc     eax
            jmp     isChar

isNull:

            pop     ecx
            pop     edx
            pop     ebp

            ret     4

strLen      ENDP

main        PROC

            push    OFFSET myStr
            call    strRev

            mPRNT   OFFSET myStr            

            exit

main        ENDP

            end     main
