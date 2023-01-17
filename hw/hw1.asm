	LDA	#0	.A register에 0 저장
	STA	RESULT	.RESULT애 1을 미리 지정
COMPARE	LDCH	STR1,X 	.A register에 str1의 주소값이 들어가있음
	STA	TMP	.TMP<-A의 값 저장	
	LDCH	STR2,X	.A<-str2의 주소값 저장
	COMP	TMP	.A와 TMP를 비교
	JEQ	EQUAL	.값이 동일하면 EQUAL로 감
	JLT	SMALL	.값이 작으면 SMALL로 감
	JGT	LARGE	.값이 크면 LARGE로 감
SMALL	LDA	#1	.A<-1 저장
	STA	RESULT	.문자열이 다르기 때문에 1 저장
	LDCH	CHG	.A<-'G'저장
	STCH	STR3,X	.STR3<-'G'저장
	TIX	STRLEN	.문자열 길이 체크
	JLT	COMPARE	.문자열을 다 확인하지 않았다면 COMPARE로 돌아감
	JEQ	LAST	.문자열의 마지막이면 LAST로
EQUAL	LDCH	CHE	.A<-'E'저장
	STCH	STR3,X 	.STR3<-'E'저장
	TIX	STRLEN	
	JLT	COMPARE	.문자열 길이를 다 확인하지 않았다면 COMPARE로 돌아감
	JEQ	LAST	.문자열의 마지막이면
LARGE	LDA	#1
	STA	RESULT
	LDCH	CHL	.A<-'L'저장
	STCH	STR3,X	.STR3<-'L'저장
	TIX	STRLEN	.문자열 길이 다 확인했는지
	JLT	COMPARE	.문자열 길이를 다 확인하지 않았다면 COMPARE로 돌아감
	JEQ	LAST	.문자열의 마지막이면
LAST	TIX	LAST	.X register에 1추가
TMP	RESW	1	.1word 변수
RESULT	RESW	1	.1word 변수
STR3	RESB	5	.1byte 변수
STR1	BYTE	C'abcde'.ccdee
STR2	BYTE	C'abcde'.eedcc
STRLEN	WORD	5
CHG	BYTE	C'G'
CHL	BYTE	C'L'
CHE	BYTE	C'E'
