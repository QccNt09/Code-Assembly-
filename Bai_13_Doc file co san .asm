.model small
.stack 100h
.data
    msg1 db "noi dung file la: $" 
    noidung db 100 dup("$")
    ten db "test1.txt" 
    pf dw ?
.code 
main proc
    mov ax,@data
    mov ds,ax 
    mov ah,9
    lea dx,msg1
    int 21h 
;open file
    mov ah,3Dh
    mov al,0
    lea dx, ten
    int 21h
    mov pf,ax 
;read file
    mov ah,3Fh
    mov bx,pf
    mov cx,250
    lea dx,noidung    
    int 21h
;close file
    mov ah,3Eh
    mov bx,pf
    int 21h 
    mov ah,9
    lea dx,noidung
    int 21h   
;thoat 
    mov ah,4ch
    int 21h    
    main endp
end main 