.data

	@ Mensajes generales
	linea:		.asciz	" ============================================\n"
	lineafin:
	salto:		.asciz	" \n"
	saltofin:
	msja:		.asciz	"                CARGAR ARCHIVO\n"
	msjafin:
	
	msj1r:		.asciz	" Digite ruta del archivo: "
	msj1rfin:
	msj2r:		.asciz	" Ruta del archivo: "
	msj2rfin:
	
	msj2p:		.asciz	" ¿Que desea realizar? \n"
	msj2pfin:
	
	msj3m:		.asciz	" Opciones:\n\n"
	msj3mfin:
	msj4m:		.asciz	" 1. Convertir texto a minusculas. \n"
	msj4mfin:
	msj5m:		.asciz	" 2. Convertir texto a mayusculas. \n"
	msj5mfin:
	msj5:		.asciz	" 3. Salir. \n\n"
	msj5fin:
	
	msj6m:		.asciz	" Digite opcion: "
	msj6mfin:
	msj7m:		.asciz	" Opcion digitada: "
	msj7mfin:
	msj8e:		.asciz	" \n¡Opcion invalida! \n"
	msj8efin:
	
	msj9:		.asciz	" \n Convirtiendo a mayusculas. \n"
	msj9fin:
	
	msj10:		.asciz	" \n Convirtiendo a minusculas. \n"
	msj10fin:
	
	msj11:		.asciz	" \n Hasta luego.\n\n "
	msj11fin:
	
	msj7x:		.asciz	" Opcion digitada: %d"
	msj7xfin:	
	
	errmsj:		.asciz " Creacion fallida.\n"
	errmsjfin:	
	
	ruta:		.byte	255
	rutafin:	.fill	255, 1, 0
	newfile: 	.asciz "/home/pi/mip115/practicax/proyecto/newfile.txt"
	
	instr:  .asciz  " This Is Our Test String that we Will Convert.\n"
	outstr:	.fill	255, 1, 0
	
	fmt1:		.asciz	"%d"
	opcion:		.word	1
	
.text

.global main
	main:
		
		PUSH	{R4, LR}
		
		// Imprimiendo encabezado
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =salto		
		MOV		R2, #(saltofin - salto)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =linea		
		MOV		R2, #(lineafin - linea)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msja		
		MOV		R2, #(msjafin - msja)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =linea		
		MOV		R2, #(lineafin - linea)
		MOV		R7, #4
		SVC		0
		
		// Solicitando la ruta del archivo
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =salto		
		MOV		R2, #(saltofin - salto)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj1r
		MOV		R2, #(msj1rfin - msj1r) @ Tamanio de prompt
		MOV		R7, #4			@ Escribir
		SVC		0
		
		// Lectura de la ruta desde teclado
		MOV		R0, #0			@ Entrada estandar [stdin] (teclado)
		LDR		R1, =ruta		@ Direccion del buffer
		MOV		R2, #100		@ Numero maximo de caracteres de entrada
		MOV		R7, #3			@ Leer
		SVC		0
		
		// Imprimiendo ruta ingresada
		
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =salto		
		MOV		R2, #(saltofin - salto)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj2r		
		MOV		R2, #(msj2rfin - msj2r)
		MOV		R7, #4			@ Escribir
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =ruta	
		MOV		R2, #100
		MOV		R7, #4			@ Escribir
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =salto		
		MOV		R2, #(saltofin - salto)
		MOV		R7, #4
		SVC		0
		
		//Solicitud de opcion
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj2p		@ ¿Que desea realizar?
		MOV		R2, #(msj2pfin - msj2p)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =salto		
		MOV		R2, #(saltofin - salto)
		MOV		R7, #4
		SVC		0
		
		// Mostrando opciones
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj3m
		MOV		R2, #(msj3mfin - msj3m)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj4m
		MOV		R2, #(msj4mfin - msj4m)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj5m
		MOV		R2, #(msj5mfin - msj5m)
		MOV		R7, #4
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj5
		MOV		R2, #(msj5fin - msj5)
		MOV		R7, #4
		SVC		0
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj6m		@ Digite opcion:
		MOV		R2, #(msj6mfin - msj6m)
		MOV		R7, #4
		SVC		0
		
		// Lectura de opcion
		
		/*MOV		R0, #0			@ Entrada estandar [stdin] (teclado)
		LDR		R1, =opcion		@ Direccion del buffer
		MOV		R2, #1			@ Numero maximo de caracteres de entrada
		MOV		R7, #3			@ Leer
		SVC		0*/
		
		LDR		R0, =fmt1
		LDR		R1, =opcion
		BL		scanf
		
		// Imprimiendo opcion seleccionada
		
		/*MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =msj7m		
		MOV		R2, #(msj7mfin - msj7m)
		MOV		R7, #4			@ Escribir
		SVC		0
		
		MOV		R0, #1			@ Salida estandar [stdout] (monitor)
		LDR		R1, =opcion		
		MOV		R2, #1
		MOV		R7, #4			@ Escribir
		SVC		0*/
		
		/*** CADENA DE PRUEBA ***/
		
		LDR	R0, =instr	@ start of input string
		LDR	R1, =outstr	@ address of output string
		MOV	R4, #12
		MOV	R5, #13
		
		/*** FIN CADENA PRUEBA ***/
		
		
		/****** MINUSCULAS *******/
		
		LDR		R3, =opcion
		LDR		R3, [R3]
		
		// if opcion == 1
		CMP		R3, #1
		BLE		minus
		
		/**** FIN MINUSCULAS ****/
		
		
		/****** MAYUSCULAS *******/
		
		LDR		R3, =opcion
		LDR		R3, [R3]
		
		// if opcion == 2
		CMP		R3, #2
		BLE		mayus
		
		/**** FIN MAYUSCULAS ****/
		
		/****** SALIR *******/
		
		LDR		R3, =opcion
		LDR		R3, [R3]
		
		// if opcion == 3
		CMP		R3, #3
		BLE		salir
		
		/**** FIN SALIR ****/
		
		
		// if R0 != 1 ir a invalida
		CMP		R0, #1
		BNE     invalida		
		
		POP		{PC}
	exit:
		MOV  R7, #1
		SVC	0
		
	invalida:
			MOV		R0, #1			@ Salida estandar [stdout] (monitor)
			LDR		R1, =msj8e
			MOV		R2, #(msj8efin - msj8e)
			MOV		R7, #4
			SVC		0
			B		exit
			
	salir:
			MOV		R0, #1			@ Salida estandar [stdout] (monitor)
			LDR		R1, =msj11
			MOV		R2, #(msj11fin - msj11)
			MOV		R7, #4
			SVC		0
			B		exit
			
	mayus: 
			PUSH	{R4-R5}	@ Guardar los registros que se utilizan
			MOV		R4, R1
			
			// El bucle es hasta que el byte al que apunta R1 sea distinto de cero
		
			loop:
				LDRB	R5, [R0], #1		@cargar caracter y puntero de incremento
			
				// If R5 > 'z' luego ir a contador
					CMP		R5, #'z'		@es la letra > 'z'?
					BGT		contador
					
				// Else if R5 < 'a' luego ir a end if
					CMP		R5, #'a'
					BLT		contador		@ ir a end if
				
				// if Llegamos aquí entonces la letra está en minúscula, así que conviértala.
					SUB		R5, #('a'-'A')
				
				contador:					@ end if
					STRB	R5, [R1], #1	@ Almacenar carácter para dar salida a str
					CMP		R5,	#0			@ Verificar si el caracter es nulo
					BNE		loop			@ Volver al loop si el carácter no es nulo
					SUB		R0, R1, R4  	@ Obtener la longitud restando los punteros
					POP		{R4-R5}			@ Restaurar el registro que usamos.
					B		imprimir		@ Retornar
					
	minus:			
			PUSH	{R4-R5}					@ Guardar los registros que se utilizan
			MOV		R4, R1
			
			// El bucle es hasta que el byte al que apunta R1 sea distinto de cero
		
			loop2:
				LDRB	R5, [R0], #1		@cargar caracter y puntero de incremento
			
				// If R5 > 'Z' luego ir a contador
					CMP		R5, #'Z'		@es la letra > 'Z'?
					BGT		contador2
					
				// Else if R5 < 'A' then ir a end if
					CMP		R5, #'A'
					BLT		contador2		@ ir a end if
				
				// if Llegamos aquí entonces la letra está en mayuscula, así que conviértala.
					SUB		R5, #('A'-'a')
				
				contador2:					@ end if
					STRB	R5, [R1], #1	@ Almacenar carácter para dar salida a str
					CMP		R5,	#0			@ Verificar si el caracter es nulo
					BNE		loop2			@ Volver al loop si el carácter no es nulo
					SUB		R0, R1, R4  	@ Obtener la longitud restando los punteros
					POP		{R4-R5}			@ Restaurar el registro que usamos.
					B		imprimir		@ Retornar e imprimir cadena convertida
	
	imprimir:
	
				/* Configure los parámetros para imprimir nuestro número hexadecimal
				 y luego llame a Linux para hacerlo. */
				
				MOV	R2,R0					@ el código de retorno es la longitud de la cadena

				MOV	R0, #1	    			@ 1 = StdOut [Salida Estandar]
				LDR	R1, =outstr 			@ Cadena para imprimir
				MOV	R7, #4	    			@ llamada al sistema de escritura
				SVC	0 	    				@ Llame al sistema para generar la cadena
				B	exit	
			
			
			