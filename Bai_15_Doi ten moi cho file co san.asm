.model small 
inchuoi macro chuoi
    mov ah,9
    lea dx,chuoi
    int 21h
endm
.stack 100h
.data
    msg1 db "Nhap ten file cu: $" 
    msg2 db 10,13,"Nhap ten file moi: $"
    msg3 db 10,13,"Doi thanh cong.$"    
    old_fname db 30 dup(?),0  ;ten file co san 
    new_fname db 30 dup(?),0   
.code 
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax 
    inchuoi msg1   
    mov si,0  
    ;nhap ten moi cho file
nhap_tencu:
    mov ah,1
    int 21h
    cmp al,13
    je intb2
    mov old_fname[si],al
    inc si
    jmp nhap_tencu 
intb2:
    mov si,0
    inchuoi msg2
nhap_tenmoi:
    mov ah,1
    int 21h
    cmp al,13
    je doiten
    mov new_fname[si],al
    inc si
    jmp nhap_tenmoi    
doiten:
    mov ah,56h
    lea dx,old_fname
    lea di,new_fname
    int 21h 
    inchuoi msg3
thoat:   
    mov ah,4ch
    int 21h
    main endp
end main