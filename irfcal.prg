'Residuos
macro1.makeresids resid01 resid02 resid03 resid04 
'Matriz de varianzas-covarianzas
sym(nvar) covarianza_{%x}
for !m=1 to nvar
for !n=1 to nvar
covarianza_{%x}(!m,!n)=@covp(resid0{!m},resid0{!n})
next
next
'Descomposicion de Cholesky
matrix chol_{%x}=@cholesky(covarianza_{%x})
'Cálculo IRFs
matrix (nvar,nvar) cc0

cc0=chol_{%x}

matrix(horz,nvar) imp1
matrix(horz,nvar) imp2
matrix(horz,nvar) imp3
matrix(horz,nvar) imp4

vector v1=@columnextract(cc0,1)
vector v2=@columnextract(cc0,2)
vector v3=@columnextract(cc0,3)
vector v4=@columnextract(cc0,4)

for !j=1 to nvar
imp1(1,!j) = v1(!j)
imp2(1,!j) = v2(!j)
imp3(1,!j) = v3(!j)
imp4(1,!j) = v4(!j)
next

matrix(nvar,nvar) cc1

for !k=lag+1 to horz
cc1=b1*cc0
vector v1=@columnextract(cc1,1)
vector v2=@columnextract(cc1,2)
vector v3=@columnextract(cc1,3)
vector v4=@columnextract(cc1,4)
for !j=1 to nvar
imp1(!k,!j) = v1(!j)
imp2(!k,!j) = v2(!j)
imp3(!k,!j) = v3(!j)
imp4(!k,!j) = v4(!j)
next
cc0=cc1
next
