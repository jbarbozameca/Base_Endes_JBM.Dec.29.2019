# periodo: El año de la encuesta (por ejemplo "2015")
# codigo_modulo: El código del módulo de la encuesta según la web de INEI (por ejemplo "64","65","413", etc.)
# base: La base de datos específica que se quiere descargar (por ejemplo "RECH1","RECH0", etc.)
# guardar: Si se desea descargar el archivo .sav o se quiere cargar como data frame directamente (usando read_sav del paquete haven)

######################## EJEMPLO PRÁCTICO ############
library(ENDES.PE)
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
View(caracteristicas_vivienda)


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
View(caracteristicas_hogar_abrir)


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
View(miembros_hogar)

### === REC41 - 2018 informacion_parto (información prenatal, parto y postparto) === ####
# Este archivo contiene información sobre atención pre-natal 
# y del parto (personal que atendió y lugar de atención), 
# cobertura antitetánica,control o chequeo médico antes y después del embarazo, 
# peso del bebé al nacer, control postparto, lactancia materna, etc.
REC41=read_sav("Modulo69/REC41.SAV",encoding='UTF-8')
View(REC41)


## === REC42 salud_nino (salud actual del niño)== ####
# Las variables incluidas en la base de datos contienen información 
# sobre la salud actual del niño, además de la opinión sobre síntomas 
# que debe tener para llevarlo a un establecimiento de salud, 
# asi como también la alimentación del niño en los últimos 7 días y 
# en las últimas 24 horas. La salud de la madre sobre algunas enfermedades 
# de la mujer también son mencionadas en esta sección.

REC42=read_sav("638-Modulo70/REC42.SAV",encoding='UTF-8')
View(REC42)

# === REC43 inmunidad_nino (inmunización del niño) ===####
# Este archivo contiene información sobre Inmunización y morbilidad: 
# Vacunas que recibió el bebé, tratamiento recibido para la tos, fiebre, 
# diarrea, establecimiento de salud dónde recibió tratamiento, etc.

REC43=read_sav("638-Modulo70/REC43.SAV",encoding='UTF-8')
View(REC43)


# === REC44 (peso, talla y anemia en niños)=== ####
# Este archivo contiene información sobre peso/talla y anemia de los niños.
REC44=read_sav("638-Modulo74/REC44.SAV",encoding='UTF-8')
View(REC44)


## === RECH6 (antropometría y anemia en niños)=== ####
# Este archivo contiene información sobre Antropometría/Anemia - Niños
RECH6=read_sav("638-Modulo74/RECH6.SAV",encoding='UTF-8')
View(RECH6)





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
View(union3)
union4_final=unir_endes(base1 = union3,
                        base2 = RECH6,
                        tipo_union = "individual")
View(union4_final)
str(union4_final)
### Confirmar cambios para GitHub
