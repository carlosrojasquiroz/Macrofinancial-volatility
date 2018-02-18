' Bootstrap
for !h=1 to nsimul
stom(resid01, resid01_2)
stom(resid02, resid02_2)
stom(resid03, resid03_2)
stom(resid04, resid04_2)
' Estos residuos se remuestrean con reemplazo 
vector resid01_3 = @resample(resid01_2)
vector resid02_3 = @resample(resid02_2)
vector resid03_3 = @resample(resid03_2)
vector resid04_3 = @resample(resid04_2)
delete resid01_2 resid02_2 resid03_2 resid04_2
' Paso los residuos remuestreados a series
mtos(resid01_3, resid01_rs)
mtos(resid02_3, resid02_rs)
mtos(resid03_3, resid03_rs)
mtos(resid04_3, resid04_rs)
delete resid01_3 resid02_3 resid03_3 resid04_3
'Generar nuevas series a partir de los residuos remuestreados
include serresample.prg
'Estimación del sistema con las nuevas series
smpl 2005.1 2016.4
series var1=S_var1
series var2=S_var2
series var3=S_var3
series var4=S_var4
include sistema.prg
matrix (nvar,nvar) B2
scalar vv
vv=0
'Primera ecuación
for !j=1 to nvar
B2(1,!j) = C(!j+vv)
next
vv=5
'Segunda ecuación
for !j=1 to nvar
B2(2,!j) = C(!j+vv)
next
vv=10
'Tercera ecuación
for !j=1 to nvar
B2(3,!j) = C(!j+vv)
next
vv=15
'Cuarta ecuación
for !j=1 to nvar
B2(4,!j) = C(!j+vv)
next
'Función Impulso Respuesta
include irfcalc_b.prg
vector boot_1=@columnextract(imp1,4)
vector boot_2=@columnextract(imp2,4)
vector boot_3=@columnextract(imp3,4)
vector boot_4=@columnextract(imp4,4)
matrix(horz,nsimul) b1_{%x}
matrix(horz,nsimul) b2_{%x}
matrix(horz,nsimul) b3_{%x}
matrix(horz,nsimul) b4_{%x}
for !n=1 to horz
matrix b1_{%x}(!n, !h)=boot_1(!n)
matrix b2_{%x}(!n, !h)=boot_2(!n)
matrix b3_{%x}(!n, !h)=boot_3(!n)
matrix b4_{%x}(!n, !h)=boot_4(!n)
next
delete boot_1 boot_2 boot_3 boot_4
next
