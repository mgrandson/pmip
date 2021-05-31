.data
	linea:		.asciz	" ============================================\n"
	salto:		.asciz	" \n"
	msja:		.asciz	"                CARGAR ARCHIVO\n"
	msj1m:		.asciz	" Digite ruta del archivo: %s \n\n"
	msj2m:		.asciz	" ¿Que desea realizar?\n\n"
	msj3m:		.asciz	" Opciones:\n\n"
	msj4m:		.asciz	" 1. Convertir texto a minusculas. \n"
	msj5m:		.asciz	" 2. Convertir texto a mayusculas. \n\n"
	msj6m:		.asciz	" Digite opcion: %d \n\n"
	
	@Mensajes de error
	
	msj7e:		.asciz	" Archivo no encontrado.\n"
	msj8e:		.asciz	" Archivo vacio.\n"
	msj9e:		.asciz	" Archivo no valido.\n"
	msj10e:		.asciz	" Opcion invalida.\n"
	
	@Formatos
	
	fmts:		.asciz	"%s"
	fmtd:		.asciz	"%d"
	
	ruta:		.skip	250
	
.text

.global main
	main:
				PUSH	{LR}
				
				LDR		R0, =salto
				BL		printf
				
				@Imprimiendo mensaje de bienvenida
				
				LDR		R0, =linea
				BL		printf
				LDR		R0, =msja
				BL		printf
				LDR		R0, =linea
				BL		printf
				
				LDR		R0, =salto
				BL		printf
				
				@Solicitando archivo
				
				LDR		R0, =msj1m
				BL		printf
				
				@Solicitando opcion
				
				LDR		R0, =msj2m
				BL		printf
				LDR		R0, =msj3m
				BL		printf
				LDR		R0, =msj4m
				BL		printf
				LDR		R0, =msj5m
				BL		printf
				LDR		R0, =msj6m
				BL		printf
				
				POP		{PC}
	exit:
				MOV		R7, #1
				SVC		0
