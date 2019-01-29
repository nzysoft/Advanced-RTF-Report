Function USERF && какая-то внешняя функция
Lparameters znh_now
If Vartype(m.znh_now)="N"
  znh_now=Alltrim(Padr(znh_now,20))
Endif
Return Chrtran(m.znh_now," ","-")
