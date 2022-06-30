.model small
.stack 100h
.data
    tenmoi db 100 dup(?) 
    ten db "test1.txt"  ;ten file co san
     
.code 
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    mov si,0  
    ;nhap ten moi cho file
    nhap:
        mov ah,1
        int 21h
        cmp al,13
        jz doiten
        mov tenmoi[si],al
        inc si
        jmp nhap 
    
    doiten:
        mov ah,56h
        lea dx,ten
        lea di,tenmoi
        int 21h
        
    mov ah,4ch
    int 21h
    
    
    main endp
end main