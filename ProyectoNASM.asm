			;Initialization interruption constant
sys_exit equ 0x1	;interruption of output
sys_write equ 0x4	;interruption of writing
sys_read equ 0x3	;interruption of reading
stdin equ 0		;system of input
stdout equ 0x1		;system of output
service equ 0x80	;service of successsful exit

			;Macros to reuse code
%macro write 2	;show screen message
mov ecx, %1
mov edx, %2
mov eax, sys_write
mov ebx, stdout
int service
%endmacro

%macro read 2	;keyboard reading
mov eax, sys_read
mov ebx, stdin
mov ecx, %1
mov edx, %2
int service
%endmacro

%macro indexVector 2		;%1-> first parameter: is the current index. %2-> second parameter:
cmp BYTE[i],%1              ;is the jump function if the current index is equal to the value
je %2                       ;is the function of jump, we jump to the corresponding function.
%endmacro


%macro showInfPost 2	;show message to enter the key to translate
write %1, %2			;%1-> first parameter: positions fil and column 
write msg1, L_msg1      ;show message corresponding to the position of the vector
write v_i,1             ;show the current index
write puntos, L_puntos	;show the tow points --> we get "Enter the content of the <index>: "
jmp intro				;unconditional jump to function to introduce a value. 
%endmacro

%macro showMessage 4	;show message in a position
write %1, %2
write %3, %4
%endmacro


segment .data 
				;screen messages
	msg0 db 27,"[1;3m",27,"[1;35m","Programa sobre CRIPTOGRAFIA."
    L_msg0 equ $- msg0
    msg1 db 27,"[1;34m","Introduce el contenido de la posicion ",0h
    L_msg1 equ $ - msg1
    puntos db ': '
    L_puntos equ $- puntos
	msg3 db 27,"[1;31m","¡CUIDADO! Ese valor ya existe."
	L_msg3 equ $- msg3
	msg4 db 27,"[1;32m","Introduce la clave (6 caracteres como maximo): "
	L_msg4 equ $- msg4
	msg5 db "Solucion: ",27,"[1;94m"
	L_msg5 equ $- msg5
	msg6 db 27,"[1;33m","Otra operacion (S|s/N)?: "
	L_msg6 equ $ - msg6

				;row and column positions
    position1 db 27, "[02;02H"  ;move cursor to row 2 and column 2
    L_position1 equ $- position1
    position2 db 27, "[04;02H"  ;move cursor to row 4 and column 2
    L_position2 equ $- position2
    position3 db 27, "[05;02H"  ;move cursor to row 5 and column 2
    L_position3 equ $- position3
    position4 db 27, "[06;02H"  ;move cursor to row 6 and column 2
    L_position4 equ $- position4
    position5 db 27, "[07;02H"  ;move cursor to row 7 and column 2
    L_position5 equ $- position5
    position6 db 27, "[08;02H"  ;move cursor to row 8 and column 2
    L_position6 equ $- position6
    position7 db 27, "[09;02H"  ;move cursor to row 9 and column 2
    L_position7 equ $- position7
    position8 db 27, "[10;02H"      ;move cursor to row 10 and column 2
    L_position8 equ $- position8
    position9 db 27, "[11;02H"      ;move cursor to row 11 and column 2
    L_position9 equ $- position9
    position10 db 27, "[12;02H"     ;move cursor to row 12 and column 2
    L_position10 equ $- position10
    position11 db 27, "[13;02H"     ;move cursor to row 13 and column 2
    L_position11 equ $- position11
    position12 db 27, "[15;02H"     ;move cursor to row 15 and column 2
    L_position12 equ $- position12
    position13 db 27, "[17;02H"     ;move cursor to row 17 and column 2
    L_position13 equ $- position13
    position14 db 27, "[17;12H"     ;move cursor to row 17 and column 12
    L_position14 equ $- position14
    position15 db 27, "[19;02H"     ;move cursor to row 19 and column 2
    L_position15 equ $- position15
    hideLine times 100 db ' '
    L_hideLine equ $- hideLine
				;clear
	clear db 27, "[2J"
	L_clear equ $- clear
				;Initialize content array
	vKeys times 10 db '0'	;ten position array
	size equ $- vKeys
	keyNumber times 6 db '0'
    sizeKeyNumber equ $- keyNumber
    index db 1		;counter
    i db 1			;other ;counter
				;Declaration variables without initialize
segment .bss
	key resb 2      ;variable that stores the key that we introduce
	v_i resb 1      ;index of array
	resp resb 1     ;variable that stores the user's response

segment .text
	global _start 
	 
_start: 
		;set to zero
		xor eax, eax
		xor ebx, ebx
		xor ecx, ecx
		xor edx, edx

		Call clearScreen
		showMessage position1, L_position1, msg0, L_msg0	;show "Programa sobre CRIPTOGRAFIA."
		
		;initialize counters
		mov BYTE[index],0
		mov BYTE[i],0

		mov esi, vKeys	;store the first value of the position of vKeys
		mov edi , 0	;control value
		introKey:	;function to introduce values corresponding to the position of the vector
			mov cl, BYTE[i]	;save index i to register
			add cl, '0'	;get corresponding ascii value 
			mov BYTE[v_i], cl	;store the ascii value in the variable v_i
			Call showIntro		;we show the message corresponding to the position of the vector
			
			intro:				;we introduce the value/key
			read key,2	;key reading
			mov al, BYTE[key]	;store the key content in register al
			mov bl,BYTE[key]	;store the key content in another register which we will verify 
			                    ;with the previous elements of the vector
			                    
			;check if the key entered already exists 
			xor ecx, ecx	;set register ecx to zero
			verify:	;we verify
				mov al, BYTE[vKeys+ecx]		;we access the element of the position vector 
				                            ;indicated by the memory address of the ecx register
				cmp al, bl	;check if the key entered is equal to any of the previous keys
				je re_enter	;if equals we ask the user again to enter the key in the same position
				Call incrementIndex		;if else we increment the index to continue comparing
				
				fill:		;function to store the key entered and increment the registers edi, esi and index i
				;~ ;store in the corresponding position of the array
				mov [esi], bl	
			   ;increment esi, edi and index i
				inc esi
				inc edi	
				inc BYTE[i]
			    showMessage	position12, L_position12,hideLine, L_hideLine	;hide --"¡CUIDADO! Ese valor ya existe."--
				cmp edi, size	;verify the size of array with his current index 
				jb introKey	;if the current index is minor repeat the function
									;when full array
				Call introKeyNumber		;jump function that will ask the user to enter the key of numbers to translate

incrementIndex:		;function increment the index to continue comparing
	inc ecx
	cmp ecx, size	;we check that the index does not exceed the size of the vector
	jb verify		;if the index is not exceed the size, we compare again
	ret


re_enter:			;function, we ask the user again to enter the key in the same position
                    ;when the previously entered key already exists
    showMessage position12,L_position12, msg3,L_msg3	;"¡CUIDADO! Ese valor ya existe."
    jmp introKey

showIntro:	;function control index vector
	indexVector 0,post1
	indexVector 1,post2
	indexVector 2,post3	
	indexVector 3,post4
	indexVector 4,post5
	indexVector 5,post6
	indexVector 6,post7
	indexVector 7,post8
	indexVector 8,post9
	indexVector 9,post10
	ret	

			;show "Introduce el contenido de la posicion "
post1:
	;show message for introduce the key 
	showInfPost position2, L_position2
	
post2:
	;show message for introduce the key
	showInfPost position3, L_position3
	
post3:
	;show message for introduce the key
	showInfPost position4, L_position4
	
post4:
	;show message for introduce the key
	showInfPost position5, L_position5
	
post5:
	;show message for introduce the key
	showInfPost position6, L_position6
	
post6:
	;show message for intEroduce the key
	showInfPost position7, L_position7
	
post7:
	;show message for introduce the key
	showInfPost position8, L_position8
	
post8:
	;show message for introduce the key
	showInfPost position9, L_position9
	
post9:
	;show message for introduce the key
	showInfPost position10, L_position10
	
post10:
	;show message for introduce the key
	showInfPost position11, L_position11

				
introKeyNumber:			;we ask the user to enter the key of numbers to translate
	showMessage position12,L_position12, msg4,L_msg4	;show "Introduce la clave (6 caracteres como maximo): "
	mov ebp, keyNumber
	mov edi, 0
	ciclo_lectura:  ;read the new array of numbers
		read ebp, 1
		inc ebp
		inc edi
		cmp edi, sizeKeyNumber
		jb ciclo_lectura	;read the key the numbers to translate with a maximum size of six characters
	Call translateKey

translateKey:			;we translate the key numbers
	showMessage position13,L_position13, msg5,L_msg5	;show "Solucion: "
	mov esi, keyNumber
	mov edi, 0
	write position14, L_position14
	ciclo_impresion:		;we travel the key of numbers
		mov al,BYTE[keyNumber+edi]
		add al, 17	;convert key to character/translate
		mov BYTE[keyNumber+edi], al
		write esi, 1	;show the translated key
		inc esi
		inc edi
		cmp edi, 6		;we check that the index does not exceed the size of the key of numbers
	jb ciclo_impresion		;repeat the function when the index is less than the size
		showMessage position15, L_position15,msg6, L_msg6		;show "Otra operacion (S|s/N)?: "
		read resp,2		;continue or not
		mov al, BYTE[resp]
		cmp al, 'S'
		je keyContinue
		cmp al, 's'
		je keyContinue
		cmp al, 'N'
		Call exit

keyContinue:		;we hide the message "Otra operacion (S|s/N)?: "  && "Solucion: "  && key Numbers
	write position12, L_position12
	write hideLine, L_hideLine
	write position13, L_position13
	write hideLine, L_hideLine
	write position14, L_position14
	write hideLine, L_hideLine
	write position15, L_position15
	write hideLine, L_hideLine
	Call introKeyNumber			;we re-enter the key of numbers

exit:       ;exit
	mov eax, sys_exit  
	mov ebx, stdin 
	int service


clearScreen:    ;clear screen
	push rcx
	push rdx
	
	write clear, L_clear
	
	pop rcx
	pop rdx
	ret







