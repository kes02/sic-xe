	JSUB	READ	.CALL READ SUBROUTINE

			.SUBROUTINE TO READ 100-BYTE RECORD
READ	LDX	ZERO	.INITIALIZE INDEX REGISETER TO 0
RLOOP	TD	INDEV	.TEST INPUT DEVICE
	JEQ	RLOOP	.LOOP IF DEVICE IS BUSY
	RD	INDEV	.READ ONE BYTE OF DATA INTO REGISTER A
	STCH	RECORD,X.STORE DATA BYTE INTO RECORD 
	TIX	K100	.ADD 1 TO INDEX REGISTER AND COMPARE NEW VALUE TO 100
	JLT	RLOOP	.LOOP IF INDEX VALUE IS LESS THAT 100
	RSUB
	
INDEV	BYTE	0	.INPUT DEVICE NUMBER
RECORD	RESB	100	.100BYTE BUFFER FOR INPUT RECORD
ZERO	WORD	0
K100	WORD	100	
