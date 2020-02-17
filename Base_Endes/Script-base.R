# periodo: El año de la encuesta (por ejemplo "2015")
# codigo_modulo: El código del módulo de la encuesta según la web de INEI (por ejemplo "64","65","413", etc.)
# base: La base de datos específica que se quiere descargar (por ejemplo "RECH1","RECH0", etc.)
# guardar: Si se desea descargar el archivo .sav o se quiere cargar como data frame directamente (usando read_sav del paquete haven)

######################## EJEMPLO PRÁCTICO ############
devtools::install_github("horaciochacon/ENDES.PE")
library(tidyverse)
library(haven)
library(survey)
salud=consulta_endes(periodo = 2017, 
                     codigo_modulo = 414, 
                     base = "CSALUD01", 
                     guardar = TRUE)
persona=consulta_endes(periodo = 2017, 
                       codigo_modulo = 64, 
                       base = "RECH1", 
                       guardar = TRUE)
vivienda=consulta_endes(periodo = 2017, 
                        codigo_modulo = 65, 
                        base = "RECH23", 
                        guardar = TRUE)
hogar=consulta_endes(periodo = 2017, 
                     codigo_modulo = 64, 
                     base = "RECH0", 
                     guardar = TRUE)

# Cargando las base de datos 
SALUD=read_sav("Modulo414/CSALUD01.sav", encoding = 'UTF-8')

##### BASE DE DATOS ORIGINAL 2018 ####
library(ENDES.PE)
library(tidyverse)
library(haven)
library(survey)

vivienda=consulta_endes(periodo = 2018, 
                        codigo_modulo = 64, 
                        base = "RECH0", 
                        guardar = TRUE)

vivienda2=consulta_endes(periodo = 2018, 
                         codigo_modulo = 65, 
                         base = "RECH0",
                         guardar = TRUE)
vivienda3=consulta_endes(periodo = 2018, 
                         codigo_modulo = 67, 
                         base = "RECH0",
                         guardar = TRUE)
vivienda4=consulta_endes(periodo = 2018, 
                         codigo_modulo = 69, 
                         base = "RECH0",
                         guardar = TRUE)
vivienda5=consulta_endes(periodo = 2018, 
                         codigo_modulo = 70, 
                         base = "RECH0",
                         guardar = TRUE)
vivienda6=consulta_endes(periodo = 2018, 
                         codigo_modulo = 74, 
                         base = "RECH0",
                         guardar = TRUE)

#===RECH23-2018(servicios básicos de vivienda)=====####
# Las variables incluidas en la base de datos contienen 
# información sobre las características estructurales y de los servicios 
# básicos que tiene la vivienda: Agua (fuente de abastecimiento, almacenaje, etc.) 
# tipo se servicio higiénico, forma de desechar la basura, 
# tipo de material de construcción predominante de la vivienda, 
# entre otros, como indicativos de las condiciones materiales 
# de vida del hogar entrevistado.

caracteristicas_vivienda=read_sav("Modulo65/RECH23.SAV",encoding='UTF-8')


# == RECH0 - 2018 (vivienda)=== #####
# Esta base de datos esta conformada por un grupo de variables, 
# que contienen información en base a las preguntas que se encuentran 
# en la carátula del Cuestionario del Hogar, estas preguntas buscan obtener 
# información sobre las principales características del hogar que son necesarias 
# para la ENDES 2010 como: ubicación geográfica y muestral de la vivienda, 
# fecha de la entrevista, número de miembros del hogar, número de mujeres 
# elegibles del hogar, número de niños elegibles para peso, 
# talla y prueba de anemia, resultado final de la encuesta, etc.

caracteristicas_hogar_abrir=read_sav("Modulo64/RECH0.SAV",encoding='UTF-8')


## === RECH1 - 2018 (cuestionario de hogar) === ####
#Esta base de datos contiene información de cada una de las personas 
# incluidas en la lista de miembros del hogar, esta información ha sido 
# obtenida mediante un conjunto de preguntas que se encuentran en la sección 
# llamada "Listado del Hogar" del Cuestionario del Hogar. 
# Estas preguntas buscan información de temas como: 
# la relación de parentesco con el jefe del hogar, lugar de residencia, 
# sexo, edad, estado civil, si tiene partida de nacimiento, educación, 
# y supervivencia y residencia de los padres biológicos.
miembros_hogar=read_sav("Modulo64/RECH1.SAV",encoding='UTF-8')

### === REC41 - 2018 informacion_parto (información prenatal, parto y postparto) === ####
# Este archivo contiene información sobre atención pre-natal 
# y del parto (personal que atendió y lugar de atención), 
# cobertura antitetánica,control o chequeo médico antes y después del embarazo, 
# peso del bebé al nacer, control postparto, lactancia materna, etc.
REC41=read_sav("Modulo69/REC41.SAV",encoding='UTF-8')


## === REC42 salud_nino (salud actual del niño)== ####
# Las variables incluidas en la base de datos contienen información 
# sobre la salud actual del niño, además de la opinión sobre síntomas 
# que debe tener para llevarlo a un establecimiento de salud, 
# asi como también la alimentación del niño en los últimos 7 días y 
# en las últimas 24 horas. La salud de la madre sobre algunas enfermedades 
# de la mujer también son mencionadas en esta sección.

REC42=read_sav("638-Modulo70/REC42.SAV",encoding='UTF-8')

# === REC43 inmunidad_nino (inmunización del niño) ===####
# Este archivo contiene información sobre Inmunización y morbilidad: 
# Vacunas que recibió el bebé, tratamiento recibido para la tos, fiebre, 
# diarrea, establecimiento de salud dónde recibió tratamiento, etc.

REC43=read_sav("638-Modulo70/REC43.SAV",encoding='UTF-8')


# === REC44 (peso, talla y anemia en niños)=== ####
# Este archivo contiene información sobre peso/talla y anemia de los niños.
REC44=read_sav("638-Modulo74/REC44.SAV",encoding='UTF-8')


## === RECH6 (antropometría y anemia en niños)=== ####
# Este archivo contiene información sobre Antropometría/Anemia - Niños
RECH6=read_sav("638-Modulo74/RECH6.SAV",encoding='UTF-8')





#===Uniones ===####
union1=unir_endes(base1 = REC41, 
                              base2 = REC42,
                              tipo_union = "individual")
union2=unir_endes(base1=union1,
                  base2=REC43,
                  tipo_union = "individual")
union3=unir_endes(base1=union2,
                  base2=REC44,
                  tipo_union = "individual")

data_final_endes=unir_endes(base1 = union3,
                            base2 = RECH6,
                            tipo_union = "individual")
View(data_final_endes)
str(data_final_endes)
##### ANÁLISIS DE DATOS ORIGINAL 2018 ####
attach(data_final_endes)
nueva_data=data.frame(M1,M1A,M1B,M2A,M2B,M2C,M2D,M2E,M2G,M2N,M3A,M3B,M3C,M3E,M3G,M4,M5,M8,M9,M13,M17,M18,M19,
                      V453,V457,V463Z,V466,
                      H2,H3,H4,H5,H6,H7,H8,H9,H11,H11B,H22,H31,H31B,H31C,
                      HC61,V447A)

View(nueva_data)
library(dplyr)
### OUTCOME: FIEBRE
summary(nueva_data$H22)
table(nueva_data$H22)

### OUTCOME: DIARREA
summary(nueva_data$H11)
table(nueva_data$H11)

### OUTCOME: SÍNTOMA RESPIRATORIO=TOS
summary(nueva_data$H31)
table(nueva_data$H31)

nueva_data$M1=as.numeric(nueva_data$M1)
nueva_data$M1A=factor(nueva_data$M1A)
nueva_data$M1B=as.numeric(nueva_data$M1B)
nueva_data$M2A=factor(nueva_data$M2A)
nueva_data$M2B=factor(nueva_data$M2B)
nueva_data$M2C=factor(nueva_data$M2C)
nueva_data$M2D=factor(nueva_data$M2D)
nueva_data$M2E=factor(nueva_data$M2E)
nueva_data$M2G=factor(nueva_data$M2G)
nueva_data$M2N=factor(nueva_data$M2N)
nueva_data$M3A=factor(nueva_data$M3A)
nueva_data$M3B=factor(nueva_data$M3B)
nueva_data$M3C=factor(nueva_data$M3C)
nueva_data$M3E=factor(nueva_data$M3E)
nueva_data$M3G=factor(nueva_data$M3G)
nueva_data$M4=as.numeric(nueva_data$M4)
nueva_data$M5=as.numeric(nueva_data$M5)
nueva_data$M8=as.numeric(nueva_data$M8)
nueva_data$M9=as.numeric(nueva_data$M9)
nueva_data$M13=as.numeric(nueva_data$M13)
nueva_data$M17=factor(nueva_data$M17)
nueva_data$M18=factor(nueva_data$M18)
nueva_data$M19=as.numeric(nueva_data$M19)
nueva_data$V453=as.numeric(nueva_data$V453)
nueva_data$V457=factor(nueva_data$V457)
nueva_data$V463Z=factor(nueva_data$V463Z)
nueva_data$V466=factor(nueva_data$V466)
nueva_data$H2=factor(nueva_data$H2)
nueva_data$H3=factor(nueva_data$H3)
nueva_data$H4=factor(nueva_data$H4)
nueva_data$H5=factor(nueva_data$H5)
nueva_data$H6=factor(nueva_data$H6)
nueva_data$H7=factor(nueva_data$H7)
nueva_data$H8=factor(nueva_data$H8)
nueva_data$H9=factor(nueva_data$H9)
nueva_data$H11=factor(nueva_data$H11)
nueva_data$H11B=factor(nueva_data$H11B)
nueva_data$H22=factor(nueva_data$H22)
nueva_data$H31=factor(nueva_data$H31)
nueva_data$H31B=factor(nueva_data$H31B)
nueva_data$H31C=factor(nueva_data$H31C)
nueva_data$HC61=factor(nueva_data$HC61)
nueva_data$V447A=as.numeric(nueva_data$V447A)

str(nueva_data)
View(nueva_data)

library(tableone)

tabla_categoricos=CreateTableOne(data = nueva_data)
tabla_categoricos

library(compareGroups)
tabla2=compareGroups(data = nueva_data, H11 ~  V447A)

