.686
.model flat

public _dodaj

.code
_dodaj PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	mov eax, [ebp + 8] ; a
	mov ebx, [ebp + 12] ; b

	ror eax, 23 ; chcemy mie� wyk�adnik z przodu
	ror ebx, 23

	cmp al, bl
		jae dalej

	xchg eax, ebx ; musinie zamieni� liczby kolejno�ci� by eax >= ebx

	dalej:
	
	mov cl, al ; wyk�adnik a
	sub cl, bl ; r�nica wyk�adnik�w

	mov esi, eax;
	mov edi, ebx;

	shr esi, 9 ; sama mantysa a
	shr edi, 9 ; sama mantysa b

	bts esi, 23 ; niejawne jedynki
	bts edi, 23

	shr edi, cl ; przesuni�cie mantysy b
	
	add esi, edi ; dodanie mantys

	bt esi, 24
		jc modyfikacja
		jmp niemod

	modyfikacja:
	inc al
	shr esi, 1 ; normalizacja mantysy wyniku

	niemod:

	btr esi, 23 ; niejawna jedynka
	mov ecx, esi
	rol ecx, 9
	mov cl, al
	ror ecx, 9
	mov eax, ecx

	; za�adowanie eax na szczyt rejestru koprocesora
	push eax
	fld dword ptr [esp]
	add esp, 4

	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
_dodaj ENDP

END