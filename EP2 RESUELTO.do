*EXAMEN2 DE ECONOMETRIA
**CORRER PARA EMPEZAR A RESOLVER CADA PREGUNTA, NO ES NECESARIO DESCARGAR... "LAS PREGUNTAS LO ENCUENTRAS EN GITHUB"

clear all
use "https://raw.githubusercontent.com/chavezgranados/Basic-Econometrics/main/bases/baseEP2.dta", clear

**EP2
**PREGUNTA 1
//a)
tab pobreza estrsocial
tab pobreza estrsocial if pobreza==2 & estrsocial==3
**respuesta: 189
//b) 

tab2 dominio pobreza, cell
tab2 dominio pobreza, row
**respuesta 4.23% de los hogares no pobres se encuentran en costa sur.

//c)

mean ingreso [pw=factor07], over(estrsocial)
display (74894.55-59071.06)
** respuesta: 15823.49

//d)

correlate gasto mph
**respuesta: 0.3414

//PREGUNTA 2
**gastoi = β1+β2ingresoi+β3mphi+β4Di1+β5Di2+ui

gen pobrecito=.
replace pobrecito=0 if pobreza==1 | pobreza==2
replace pobrecito=1 if pobreza==3
tab pobrecito


tab estrsocial
gen dinero=.
replace dinero=1 if estrsocial==1 | estrsocial==2
replace dinero=0 if estrsocial==3 | estrsocial==4 | estrsocial==5 | estrsocial==6

**MODELO DE REGRESION
regress gasto ingreso mph pobrecito dinero

//a)
**Respuesta: Significa que si aumento en 1 sol el ingreso, el gasto 0.38

//b)
**Respuesta: el promedio es de Di1=17726.91

//c)Probar la conjetura H0 : β2 = 0.4.
display (.3841321-0.4)/(.0038903)
*Respuesta= Tcalculado= -4.0788371

//α=5% ==0.05
//α/2= 0.025

display invnormal(0.025)
*tcretico= -1.959964

**Respuesta: Rechazo la H0 y me quedo con la H1

//d)Probar la conjetura H0 : β2+β3 = 3700.
//β2+β3 =/ 3700.
//[0 0 1 1 0 0] 

//e)Calcular detalladamente el intervalo de confianza de β1.
**Respuesta: (-8214.103   -6585.011)

//RESPUESTA 3

**ln(gasto)i = β1+β2ln(ingreso)i+β3mphi+β4Di1+β5Di2+ui

gen ln_gasto=ln(gasto)
gen ln_ingreso=ln(ingreso)

**Modelo de regreso ln
regress ln_gasto ln_ingreso mph pobrecito dinero

//a)
**Respuesta: mi mejor modelo es con ln, por que tiene un Rcuadra mas alto.

//b)
**Respuesta: 0.7070, se debe a que se aplico ln.

//c)Probar la conjetura H0 : β2 = 0.

**H1: No es igual a cero.

display (.3252717 / .003482)
*Respuesta: 93.415192

//α=5% ==0.05
//α/2= 0.025

display invnormal(0.025)
*tcretico= -1.959964

**Respuesta: Rechazo la H0 y me quedo con H1.
