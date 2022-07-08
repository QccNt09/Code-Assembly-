.model small
.stack 100h
.data 
    msg1 db "Nhap ten file: $"
    msg2 db 10,13,"Xoa thanh cong$"
    ten db 30 dup(?),0
    pf dw ?
.code
main proc 
    mov ax,@data
    mov ds,ax 
    mov es,ax 
;nhap ten file can xoa
    mov ah,9
    lea dx,msg1
    int 21h 
    mov si,0
nhap_filename: 
    mov ah,1
    int 21h
    cmp al,0Dh
    je delete
    mov ten[si],al
    inc si
    jmp nhap_filename    
delete:   
    mov ah,41h
    lea dx, ten
    int 21h
    mov ah,9
    lea dx,msg2
    int 21h
thoat:
    mov ah,4ch
    int 21h    
    main endp
end main