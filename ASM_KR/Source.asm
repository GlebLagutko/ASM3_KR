.686
.model flat
.stack


public _FindNOK
public _ShiftMatrix



NOD macro expression1, expression2

	mov ebx, expression2;
	mov eax, expression1;

	_begin:
	cmp eax,0
	je _end
	cmp eax,ebx
	cdq
	je _end;
	jg aGreater
	xchg eax,ebx
	idiv ebx
	mov eax,edx
	jmp _begin
	aGreater:
	idiv ebx;
	mov eax,edx;
	
	jmp _begin
	cdq;
	_end:
endm

.data
	

.code

_ShiftMatrix proc


     push	ebp
	 mov	ebp,		esp
     mov eax,dword ptr[ebp + 16]
	 mov edx,dword ptr[ebp + 12]
	 mov esi,dword ptr[ebp + 8]

	 mov ecx,dword ptr[edx];
	 ; lines
	 _loop1 :

	 mov edi,dword ptr[eax + ecx*4 - 4]
	 mov dword ptr[edx],ecx
	 mov ecx,dword ptr[edx + 4]
	 ; change lines

	 _loop2 :
	  mov edx,dword ptr[ebp + 12]
	  mov ebx,dword ptr[edx + 8]
	  mov eax, dword ptr[edx + 4]
	  sub eax,ebx
	  .if(ecx > eax)
	  mov eax,ecx
	  add eax,ebx
	  mov esi,dword ptr[edx + 4]
	  sub eax,esi
	  mov esi,dword ptr[ebp + 8]
	  mov edx,dword ptr[edi + ecx*4 -4]
	  
	  mov dword ptr[esi + eax*4 - 4],edx
	  .else
	   mov edx,dword ptr[edi + ecx*4 -4]
	  mov eax,ecx
	  add eax,ebx
	  mov dword ptr[esi + eax*4 -4],edx
	  .endif
	 
	 loop _loop2
	mov edx,dword ptr[ebp + 12]
	mov ecx,dword ptr[edx + 4]

	 _loop3 :
	 mov edx,dword ptr[esi + ecx*4 -4]
	 mov dword ptr[edi + ecx*4 -4],edx
	 loop _loop3
	 mov edx,dword ptr[ebp + 12]
	 mov ecx,dword ptr[edx + 4]
	 
	  mov edx,dword ptr[ebp + 12]
	 mov eax,dword ptr[ebp + 16]
     mov ecx,dword ptr[edx]	
	 mov dword ptr[eax + ecx*4 - 4],edi
	 loop _loop1
	 pop ebp
	 ret 4;

_ShiftMatrix endp

_FindNOK proc

    push	ebp
	 mov	ebp,		esp
 	mov edi, dword ptr[ebp + 12];
	mov ecx, dword ptr[ebp + 8];
	mov eax,dword ptr[edi + ecx*4 -4]
	mov esi,eax
	sub ecx,1
	
	cycle1 :
	mov eax,dword ptr[edi + ecx*4 -4]
	NOD esi,eax
	mov eax,dword ptr[edi + ecx*4 -4]
	imul esi,eax
	mov eax,esi
	idiv ebx
	mov esi,eax
	loop cycle1

	mov eax,esi
	
	
	pop ebp
	ret 4;
_FindNOK endp
end