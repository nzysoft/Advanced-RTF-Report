FUNCTION USERF && какая-то внешняя функция
LPARAMETERS znh_now
IF VARTYPE(m.znh_now)="N"
	znh_now=ALLTRIM(PADR(znh_now,20))
ENDIF
RETURN CHRTRAN(m.znh_now," ","-")
