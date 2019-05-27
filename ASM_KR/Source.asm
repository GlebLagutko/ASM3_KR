.686
public _lcm
public _ShiftMatrix
.model flat
.stack

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


    
	 mov edx,dword ptr[esp + 8]
	 mov eax,dword ptr[edx + 4]
	 mov ebx,dword ptr[edx + 8]
	 mark2:
	 cmp eax,ebx
	 jg mark1
	 sub ebx,eax
	 jmp mark2
	 mark1:
	 mov dword ptr[edx + 8],ebx
     mov eax,dword ptr[esp + 12]
	 mov ecx,dword ptr[edx];
	 ; getlines
	 _loop1 :

	 mov edi,dword ptr[eax + ecx*4 - 4]
	 mov dword ptr[edx],ecx
	 mov ecx,dword ptr[edx + 4]
	 ; change lines

	 _loop2 :
	  mov edx,dword ptr[esp + 8]
	  mov ebx,dword ptr[edx + 8]
	  mov eax, dword ptr[edx + 4]
	  sub eax,ebx
	  .if(ecx > eax)
	  mov eax,ecx
	  add eax,ebx
	  mov esi,dword ptr[edx + 4]
	  sub eax,esi
	  mov esi,dword ptr[esp + 4]
	  mov edx,dword ptr[edi + ecx*4 -4]
	  
	  mov dword ptr[esi + eax*4 - 4],edx
	  .else
	   mov edx,dword ptr[edi + ecx*4 -4]
	  mov eax,ecx
	  add eax,ebx
	  mov dword ptr[esi + eax*4 -4],edx
	  .endif
	 
	 loop _loop2
	mov edx,dword ptr[esp + 8]
	mov ecx,dword ptr[edx + 4]

	 _loop3 :
	 mov edx,dword ptr[esi + ecx*4 -4]
	 mov dword ptr[edi + ecx*4 -4],edx
	 loop _loop3
	 mov edx,dword ptr[esp + 8]
	 mov ecx,dword ptr[edx + 4]
	 
	  mov edx,dword ptr[esp + 8]
	 mov eax,dword ptr[esp + 12]
     mov ecx,dword ptr[edx]	
	 mov dword ptr[eax + ecx*4 - 4],edi
	 loop _loop1

	 ret 

_ShiftMatrix endp

_lcm proc

    
 	mov edi, dword ptr[esp + 8];
	mov ecx, dword ptr[esp + 4];
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

	ret 
_lcm endp
end