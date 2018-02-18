'-------------------------------------------------------------------------------------
'Código escrito para el paper "Volatilidad macrofinanciera y política 
'monetaria óptima en Guatemala"
'-------------------------------------------------------------------------------------
' (c) Carlos Rojas Quiroz
'-------------------------------------------------------------------------------------
' Lima, Febrero del 2018
'-------------------------------------------------------------------------------------
'-------------------------------------------------------------------------------------
' Estimación del modelo VAR restringido (1 lag)
'-------------------------------------------------------------------------------------
wfcreate(page=Estimacion) VAR_R q 1990.1 2019.4
for %x cyc_bcpib cyc_cgob cyc_cpriv cyc_credflow cyc_credmeflow cyc_credmestock cyc_credmnflow cyc_credmnstock cyc_credstock cyc_dep cyc_exbs cyc_fbkf cyc_fbkex cyc_impbs cyc_pib cyc_pibsocios cyc_pic cyc_tcrer index_sp500vol index_tcvol index_wtivol sp_sp500mean sp_spread	sp_spreadme sp_spreadmn
copy(o) Calculos::Variables\{%x} VAR_R::Estimacion\
next
'Estimación del sistema restringido
for %x pib 
series var1=index_sp500vol 
series var2=sp_spread
series var3=cyc_pic 
series var4=cyc_{%x}
include sistema.prg
'Características
scalar nvar		=4 		'Número de variables
scalar nparam =5 		'Número de parámetros estimados por ecuación
scalar numel	=48 	'Número de observaciones
scalar lag		=1 		'Número de rezagos
'Matriz de parámetros
coef F=C
matrix (nvar,nvar) B1
scalar vv
vv=0
'Primera ecuación
for !j=1 to nvar
B1(1,!j) = F(!j+vv)
next
vv=5
'Segunda ecuación
for !j=1 to nvar
B1(2,!j) = F(!j+vv)
next
vv=10
'Tercera ecuación
for !j=1 to nvar
B1(3,!j) = F(!j+vv)
next
vv=15
'Cuarta ecuación
for !j=1 to nvar
B1(4,!j) = F(!j+vv)
next
'Función Impulso Respuesta
scalar horz
horz=16
include irfcalc.prg
vector x_1_irf=@columnextract(imp1,4)
vector x_2_irf=@columnextract(imp2,4)
vector x_3_irf=@columnextract(imp3,4)
vector x_4_irf=@columnextract(imp4,4)
delete v1 v2 v3 v4 imp1 imp2 imp3 imp4
'Boostrap para obtener Intervalo de Confianza
scalar nsimul
nsimul=10000
include bootstrap_1.prg
include confidence.prg
next
delete cyc_bcpib cyc_cgob cyc_cpriv cyc_credflow cyc_credmeflow cyc_credmestock cyc_credmnflow cyc_credmnstock cyc_credstock cyc_dep cyc_exbs cyc_fbkf cyc_fbkex cyc_impbs cyc_pib cyc_pibsocios cyc_pic cyc_tcrer index_sp500vol index_tcvol index_wtivol sp_sp500mean sp_spread	sp_spreadme sp_spreadmn
