///////////////////////////////////////////////////////////////////////////////////////////////////////////
//////TITLE:	ROUTINE TO GENERATE LABELS IN THE DATABASE OF THE SURVEY OF HEALTH SURVEILLANCE PERSONNEL
//////AUTHOR:	PATRICIA MALLMA
//////OUTPUT:	STATA
///////////////////////////////////////////////////////////////////////////////////////////////////////////

**OPENING DATABASE IN EXCEL FROM THE DIRECTORY WHERE IT IS STORED**
clear all
import excel "C:\Users\Patricia\Documents\insight\KOBO\descargas\CUESTIONARIO_INSIGHT_-_VIGILANCIA_EN_SALUD_PÚBLICA_21JULIO_-_all_versions_-_False_-_2022-09-30-22-48-10.xlsx", sheet("CUESTIONARIO INSIGHT - VIGIL...") firstrow clear

drop note*

lab var ig_a01"Interviewer"

lab var ig_id"ID"
lab var ig_a02org"Participant type"

lab define organizacion 1"Gobiernos Regionales" 2"Ministerio de Salud - MINSA" 3"CDC Perú" 4"Instituto Nacional de Salud - INS" 5"Despacho Ministerial de Salud Pública" 6"Ministerio de Desarrollo Agrario y Riego - MIDAGRI" 7"Ministerio del Ambiente - MINAM" 8"Mesa de concertación contra la pobreza" 9"Privados" 10"Instituto Nacional de Estadística e Informática - INEI" 11"RENIEC" 12"Ministerio de Defensa - MINDEF" 13"Asociación Interétnica de Desarrollo de la Selva Peruana - AIDESEP" 14"Periodistas" 15"Instituciones Académicas" 16"Colegios Profesionales" 17"Organismos no Gubernamentales" 18"Organismos Internacionales" 19"Otros"

lab value ig_a02org organizacion

lab var ig_a02esp"Facilities"

lab define especingles 101"GRNGMA" 102"Directorate of Agriculture" 103"Municipality" 201"DIRESA" 202"Epidemiologist at DIRESA" 203"Hospital or Specialized Institute" 204"Health Center" 205"Health Post" 206"Zoonosis Center" 301"General Director of the CDC PERU" 302"Executive Director of the CDC PERU" 303"Team Leader of the CDC PERU" 401"INS Public Health" 402"INS - CENSOPAS" 403"INS - CENAN" 501"MoH Vector Borne Diseases" 502"MoH Immunizations" 503"MOH STI/HIV/Hepatitis" 504"MINSA - DIGESA" 505"MINSA - DIGEMID" 506"MINSA - DIGERD and COE" 507"MINSA - PRONAHEBAS" 508"MINSA - OGTI" 601"ANA" 602"SENASA - National" 603"SENASA - Regional" 604"SERFOR - National" 605"SERFOR - Regional" 606"INIA" 701"SENAMHI" 801"MCCLP" 901"Clinics" 902"Veterinary Services" 1001"INEI" 1101"RENIEC" 1201"MINDEF" 1301"AIDESEP" 1401"Journalists" 1501"Public academic institutions" 1502"Private Academic Institutions" 1601"CMP" 1602"CMVP" 1603"CBP" 1701"NGO" 1801"WHO" 1802"OIE" 1803"FAO" 1804"NAMRU" 1901"Others"

lab value ig_a02esp especingles

lab var ig_a03"Interviewee initials"
lab var ig_a04"Respondent's role or responsibilities at the facility"
lab var ig_a05"Region"
lab var ig_a05o"Specify location"
lab var ig_a06"Province"
lab var ig_a07"Name of NON-care facility"
lab var ig_a08"Name of healthcare facility"
lab var ig_a09"GPS coordinates of the facility"

lab define region 1"Amazonas" 2"Ancash" 3"Apurimac" 4"Arequipa" 5"Ayacucho" 6"Cajamarca" 7"Callao" 8"Cusco" 9"Huancavelica" 10"Huanuco" 11"Ica" 12"Junin" 13"La Libertad" 14"Lambayeque" 15"Lima" 16"Loreto" 17"Madre de Dios" 18"Moquegua" 19"Pasco" 20"Piura" 21"Puno" 22"San Martin" 23"Tacna" 24"Tumbes" 25"Ucayali" 26"OTROS"
lab value ig_a05 region

lab define provincia 101"CHACHAPOYAS" 102"BAGUA"103"BONGARA"104"CONDORCANQUI"105"LUYA"106"RODRIGUEZ DE MENDOZA"107"UTCUBAMBA"201"HUARAZ"202"AIJA"203"ANTONIO RAYMONDI"204"ASUNCION"205"BOLOGNESI"206"CARHUAZ"207"CARLOS FERMIN FITZCARRALD"208"CASMA"209"CORONGO"210"HUARI"211"HUARMEY"212"HUAYLAS"213"MARISCAL LUZURIAGA"214"OCROS"215"PALLASCA"216"POMABAMBA"217"RECUAY"218"SANTA"219"SIHUAS"220"YUNGAY"301"ABANCAY"302"ANDAHUAYLAS"303"ANTABAMBA"304"AYMARAES"305"COTABAMBAS"306"CHINCHEROS"307"GRAU"401"AREQUIPA"402"CAMANA"403"CARAVELI"404"CASTILLA"405"CAYLLOMA"406"CONDESUYOS"407"ISLAY"408"LA UNION"501"HUAMANGA"502"CANGALLO"503"HUANCA SANCOS"504"HUANTA"505"LA MAR"506"LUCANAS"507"PARINACOCHAS"508"PAUCAR DEL SARA SARA"509"SUCRE"510"VICTOR FAJARDO"511"VILCAS HUAMAN"601"CAJAMARCA"602"CAJABAMBA"603"CELENDIN"604"CHOTA"605"CONTUMAZA"606"CUTERVO"607"HUALGAYOC"608"JAEN"609"SAN IGNACIO"610"SAN MARCOS"611"SAN MIGUEL"612"SAN PABLO"613"SANTA CRUZ"701"CALLAO"801"CUSCO"802"ACOMAYO"803"ANTA"804"CALCA"805"CANAS"806"CANCHIS"807"CHUMBIVILCAS"808"ESPINAR"809"LA CONVENCION"810"PARURO"811"PAUCARTAMBO"812"QUISPICANCHI"813"URUBAMBA"901"HUANCAVELICA"902"ACOBAMBA"903"ANGARAES"904"CASTROVIRREYNA"905"CHURCAMPA"906"HUAYTARA"907"TAYACAJA"1001"HUANUCO"1002"AMBO"1003"DOS DE MAYO"1004"HUACAYBAMBA"1005"HUAMALIES"1006"LEONCIO PRADO"1007"MARAÑON"1008"PACHITEA"1009"PUERTO INCA"1010"LAURICOCHA"1011"YAROWILCA"1101"ICA"1102"CHINCHA"1103"NAZCA"1104"PALPA"1105"PISCO"1201"HUANCAYO"1202"CONCEPCION"1203"CHANCHAMAYO"1204"JAUJA"1205"JUNIN"1206"SATIPO"1207"TARMA"1208"YAULI"1209"CHUPACA"1301"TRUJILLO"1302"ASCOPE"1303"BOLIVAR"1304"CHEPEN"1305"JULCAN"1306"OTUZCO"1307"PACASMAYO"1308"PATAZ"1309"SANCHEZ CARRION"1310"SANTIAGO DE CHUCO"1311"GRAN CHIMU"1312"VIRU"1401"CHICLAYO"1402"FERREÑAFE"1403"LAMBAYEQUE"1501"LIMA"1502"BARRANCA"1503"CAJATAMBO"1504"CANTA"1505"CAÑETE"1506"HUARAL"1507"HUAROCHIRI"1508"HUAURA"1509"OYON"1510"YAUYOS"1601"MAYNAS"1602"ALTO AMAZONAS"1603"LORETO"1604"MARISCAL RAMON CASTILLA"1605"REQUENA"1606"UCAYALI"1607"DATEM DEL MARAÑON"1608"PUTUMAYO"1701"TAMBOPATA"1702"MANU"1703"TAHUAMANU"1801"MARISCAL NIETO"1802"GENERAL SANCHEZ CERRO"1803"ILO"1901"PASCO"1902"DANIEL ALCIDES CARRION"1903"OXAPAMPA"2001"PIURA"2002"AYABACA"2003"HUANCABAMBA"2004"MORROPON"2005"PAITA"2006"SULLANA"2007"TALARA"2008"SECHURA"2101"PUNO"2102"AZANGARO"2103"CARABAYA"2104"CHUCUITO"2105"EL COLLAO"2106"HUANCANE"2107"LAMPA"2108"MELGAR"2109"MOHO"2110"SAN ANTONIO DE PUTINA"2111"SAN ROMAN"2112"SANDIA"2113"YUNGUYO"2201"MOYOBAMBA"2202"BELLAVISTA"2203"EL DORADO"2204"HUALLAGA"2205"LAMAS"2206"MARISCAL CACERES"2207"PICOTA"2208"RIOJA"2209"SAN MARTIN"2210"TOCACHE"2301"TACNA"2302"CANDARAVE"2303"JORGE BASADRE"2304"TARATA"2401"TUMBES"2402"CONTRALMIRANTE VILLAR"2403"ZARUMILLA"2501"CORONEL PORTILLO"2502"ATALAYA"2503"PADRE ABAD"2504"PURUS"

lab value ig_a06 provincia

//////////SECTION: B. INFORMACIÓN DEL ESTABLECIMIENTO
lab var ig_b05"Cellular operator offers good service"
lab var ig_b06"Good internet service"
lab var ig_b07"It is notifying unit"

lab define sino 1"Yes" 0"No" 2"I don't know"
lab value ig_b05 ig_b06 ig_b07 sino

**C. SALUD HUMANA**
lab var ig_c03m"Women"
lab var ig_c03h"Men"
lab var ig_c03n"Boys/girls"
lab var ig_c04"Health professionals work at this facility"

**D. SALUD ANIMAL**
lab var ig_d01"Conduct an animal census"
lab value ig_d01 sino

lab var ig_d01cuales1"Pets"
lab var ig_d01cuales2"Horses and donkeys"
lab var ig_d01cuales3"Cattle, sheep and goats"
lab var ig_d01cuales4"Pigs"
lab var ig_d01cuales5"Chickens"
lab var ig_d01cuales6"Wildlife"

lab value ig_d01cuales1-ig_d01cuales6 sino

lab var ig_d01frec"Frequency that a census is conducted"
lab define frec0 1"Monthly" 2"Annually" 3"When necessary"
lab value ig_d01frec frec0

lab var ig_d02pub"Public"
lab var ig_d02priv"Private"

lab var ig_d03vet"Veterinarians"
lab var ig_d03tec"Lab technicians"
lab var ig_d03ofic"Wildlife officers"
lab var ig_d03otr"Others"

//////////SECTION: VIGILANCIA
**A. RECOLECCIÓN DE DATOS (HUMANOS Y ANIMALES)**
lab var vi_a001"Human"
lab var vi_a002"Animal"
lab var vi_a003"Environment"
lab var vi_a000"None"

lab define sino1 1"Yes" 0"No"
lab value vi_a001-vi_a000 sino1

lab var vi_a01"It has the list of priority notifiable diseases in health"
lab value vi_a01 sino

lab var vi_a01quien1"Peru CDC"
lab var vi_a01quien2"OIE" 
lab var vi_a01quien3"SENASA"
lab var vi_a01quien4"Others"

lab value vi_a01quien1-vi_a01quien4 sino1 

lab var vi_a01frec"Frequency of updating these lists"
lab define frec1 1"Quarterly" 2"Annually" 3"Others"
lab value vi_a01frec frec1

lab var vi_a02"There are normative documents with regard to"
lab var vi_a021"Reportable disease reporting"
lab var vi_a022"Surveillance reports"
lab var vi_a023"List of notifiable diseases"
lab var vi_a024"Case definition of notifiable diseases"
lab var vi_a025"Dissemination of results"

lab value vi_a021-vi_a025 sino1

lab var vi_a03"There is a case definition for priority diseases, conditions and syndromes"
lab value vi_a03 sino

lab var vi_a03def"Who defines"
lab define proporciona 1"Peru CDC" 2"OIE" 3"SENASA" 4"Others"
lab value vi_a03def proporciona

lab var vi_a03rec"Receive notifications of cases involving humans, animals or both"
lab define notificacion 1"Humans" 2"Animals" 3"Both"
lab value vi_a03rec notificacion

lab var vi_a041"Leptospirosis" 
lab var vi_a042"Rabies" 
lab var vi_a043"Brucellosis" 
lab var vi_a044"Fasciolosis" 
lab var vi_a045"Echinocococcosis" 
lab var vi_a046"Other"

lab value vi_a041-vi_a046 sino1

lab var vi_a04proc1"Frequency-based prioritization" 
lab var vi_a04proc2"Prioritization based on political priorities" 
lab var vi_a04proc3"Prioritization based on disease severity" 
lab var vi_a04proc4"Others"
lab var vi_a04proc5"Don't know"

lab value vi_a04proc1-vi_a04proc5 sino1

lab var vi_a04inc"This process included the animal sector, and other sectors"
lab value vi_a04inc sino

lab var vi_a051"Tuberculosis" 
lab var vi_a052"HIV/AIDS" 
lab var vi_a053"Malaria" 
lab var vi_a054"Maternal Death" 
lab var vi_a055"STIs" 
lab var vi_a056"Brucellosis" 
lab var vi_a057"ARI" 
lab var vi_a058"Diarrhea" 
lab var vi_a059"Dengue" 
lab var vi_a0510"Covid-19" 
lab var vi_a0511"Others"

lab value vi_a051-vi_a0511 sino1

lab var vi_a07"Facilities participates in antimicrobial resistance testing and/or surveillance"
lab value vi_a07 sino

lab var vi_a07who"Uses WHONet to track antimicrobial resistance"
lab value vi_a07who sino

lab var vi_a08"Provides antimicrobial resistance data to health care facilities to support rational antimicrobial stewardship/usage"
lab value vi_a08 sino

lab var vi_a08frec"Frequency with which it provides data"
lab define frec2 1"Weekly" 2"Monthly" 3"Quarterly" 4"Annually" 5"Others"
lab value vi_a08frec frec2

lab var vi_a08com1"Phone" 
lab var vi_a08com2"Fax" 
lab var vi_a08com3"WhatsApp" 
lab var vi_a08com4"Website" 
lab var vi_a08com5"E-mail" 
lab var vi_a08com6"Physical reports (postal service, delivery)" 
lab var vi_a08com7"USB"
lab var vi_a08com8"Computer applications"
lab var vi_a08com9"Others"

lab value vi_a08com1-vi_a08com9 sino1

**VIGILANCIA PARA DENGUE**
lab var vi_a09"Conducts Dengue Surveillance"
lab value vi_a09 sino

lab var vi_a09_10"The surveillance system has detected outbreaks in the past"
lab value vi_a09_10 sino

lab var vi_a09_15"Data are collected electronically"
lab value vi_a09_15 sino1

lab var vi_a09_15sis1"Excel"
lab var vi_a09_15sis2"Access"
lab var vi_a09_15sis3"NOTI" 
lab var vi_a09_15sis4"DHIS"
lab var vi_a09_15sis5"Otro"

lab value vi_a09_15sis1-vi_a09_15sis5 sino1

lab var vi_a09_15env"Where the data is sent"
lab define dondeenvian 1"Microred" 2"Red" 3"DIRESA" 4"Peru CDC" 5"INS" 6"Others"
lab value vi_a09_15env dondeenvian

lab var vi_a09_15cal1"Inconsistencies"
lab var vi_a09_15cal2"Missing data"
lab var vi_a09_15cal3"Record errors"
lab var vi_a09_15cal4"Others"

lab value vi_a09_15cal1-vi_a09_15cal4 sino

lab var vi_a09_15frec"Frequency that data is sent"
lab define frec3 1"Daily" 2"Weekly" 3"Monthly" 4"Quarterly" 5"Annually" 6"Other"
lab value vi_a09_15frec frec3

lab var vi_a09_15resp"Responsible"
lab define responsable 1"Physician" 2"Epidemiologist" 3"Statistician" 4"Computer technician" 5"Others"
lab value vi_a09_15resp responsable

lab var vi_a09_16"Data are collected using paper"
lab value vi_a09_16 sino

lab var vi_a09_16quien"Provides the registry or form that is used to collect patient data"
lab define recolectar_papel 1"Health Technician" 2"Nurse" 3"Midwife" 4"Physician" 5"Other"
lab value vi_a09_16quien recolectar_papel

lab var vi_a09_16env"Where the data is sent"
lab value vi_a09_16env dondeenvian

lab var vi_a09_16cal1"Inconsistencies"
lab var vi_a09_16cal2"Missing data"
lab var vi_a09_16cal3"Record errors"
lab var vi_a09_16cal4"Others"

lab value vi_a09_16cal1-vi_a09_16cal4 sino

lab var vi_a09_16frec"Frequency that data is sent"
lab value vi_a09_16frec frec3

lab var vi_a09_16resp"Responsible for sending the data"
lab value vi_a09_16resp responsable

**VIGILANCIA BASADA EN INDICADORES**
lab var vi_a10"Indicator-Based Surveillance"
lab value vi_a10 sino

lab var vi_a10_10"The surveillance system has detected outbreaks in the past"
lab value vi_a10_10 sino

lab var vi_a10_11"There are plans to expand this surveillance system in the future"
lab value vi_a10_11 sino


lab var vi_a10_15"Data are collected electronically"
lab value vi_a10_15 sino1

lab var vi_a10_15sis1"Excel"
lab var vi_a10_15sis2"Access"
lab var vi_a10_15sis3"NOTI" 
lab var vi_a10_15sis4"DHIS"
lab var vi_a10_15sis5"Otro"

lab value vi_a10_15sis1-vi_a10_15sis5 sino1

lab var vi_a10_15env"Where the data is sent"
lab value vi_a10_15env dondeenvian

lab var vi_a10_15cal1"Inconsistencies"
lab var vi_a10_15cal2"Missing data"
lab var vi_a10_15cal3"Record errors"
lab var vi_a10_15cal4"Others"

lab value vi_a10_15cal1-vi_a10_15cal4 sino1

lab var vi_a10_15frec"Frequency that data is sent"
lab value vi_a10_15frec frec3

lab var vi_a10_15resp"Responsible"
lab value vi_a10_15resp responsable

lab var vi_a10_16"Data are collected using paper"
lab value vi_a10_16 sino

lab var vi_a10_16quien"Provides the registry or form that is used to collect patient data"
lab value vi_a10_16quien recolectar_papel

lab var vi_a10_16env"Where the data is sent"
lab value vi_a10_16env dondeenvian

lab var vi_a10_16cal1"Inconsistencies"
lab var vi_a10_16cal2"Missing data"
lab var vi_a10_16cal3"Record errors"
lab var vi_a10_16cal4"Others"

lab value vi_a10_16cal1-vi_a10_16cal4 sino

lab var vi_a10_16frec"Frequency that data is sent"
lab value vi_a10_16frec frec3

lab var vi_a10_16resp"Responsible for sending the data"
lab value vi_a10_16resp responsable

**VIGILANCIA BASADA EN EVENTOS**
lab var vi_a11"Event-Based Surveillance"
lab value vi_a11 sino

lab var vi_a11_10"The surveillance system has detected outbreaks in the past"
lab value vi_a11_10 sino

lab var vi_a11_11"There are plans to expand this surveillance system in the future"
lab value vi_a11_11 sino


lab var vi_a11_15"Data are collected electronically"
lab value vi_a11_15 sino1

lab var vi_a11_15sis1"Excel"
lab var vi_a11_15sis2"Access"
lab var vi_a11_15sis3"NOTI" 
lab var vi_a11_15sis4"DHIS"
lab var vi_a11_15sis5"Others"

lab value vi_a11_15sis1-vi_a11_15sis5 sino1

lab var vi_a11_15env"Where the data is sent"
lab value vi_a11_15env dondeenvian

lab var vi_a11_15cal1"Inconsistencies"
lab var vi_a11_15cal2"Missing data"
lab var vi_a11_15cal3"Record errors"
lab var vi_a11_15cal4"Others"

lab value vi_a11_15cal1-vi_a11_15cal4 sino1

lab var vi_a11_15frec"Frequency that data is sent"
lab value vi_a11_15frec frec3

lab var vi_a11_15resp"Responsible for sending the data"
lab value vi_a11_15resp responsable

lab var vi_a11_16"Data are collected using paper"
lab value vi_a11_16 sino

lab var vi_a11_16quien"Provides the registry or form that is used to collect patient data"
lab value vi_a11_16quien recolectar_papel

lab var vi_a11_16env"Where the data is sent"
lab value vi_a11_16env dondeenvian

lab var vi_a11_16cal1"Inconsistencies"
lab var vi_a11_16cal2"Missing data"
lab var vi_a11_16cal3"Record errors"
lab var vi_a11_16cal4"Others"

lab value vi_a11_16cal1-vi_a11_16cal4 sino

lab var vi_a11_16frec"Frequency that data is sent"
lab value vi_a11_16frec frec3

lab var vi_a11_16resp"Responsible for sending the data"
lab value vi_a11_16resp responsable

**VIGILANCIA BASADA EN LA PARTICIPACIÓN DE LA COMUNIDAD**
lab var vi_a12"Community-Based Surveillance"
lab value vi_a12 sino

lab var vi_a12_10"The surveillance system has detected outbreaks in the past"
lab value vi_a12_10 sino

lab var vi_a12_11"There are plans to expand this surveillance system in the future"
lab value vi_a12_11 sino


lab var vi_a12_15"Data are collected electronically"
lab value vi_a12_15 sino1

lab var vi_a12_15sis1"Excel"
lab var vi_a12_15sis2"Access"
lab var vi_a12_15sis3"NOTI" 
lab var vi_a12_15sis4"DHIS"
lab var vi_a12_15sis5"Others"

lab value vi_a12_15sis1-vi_a12_15sis5 sino1

lab var vi_a12_15env"Where the data is sent"
lab value vi_a12_15env dondeenvian

lab var vi_a12_15cal1"Inconsistencies"
lab var vi_a12_15cal2"Missing data"
lab var vi_a12_15cal3"Record errors"
lab var vi_a12_15cal4"Others"

lab value vi_a12_15cal1-vi_a12_15cal4 sino1

lab var vi_a12_15frec"Frequency that data is sent"
lab value vi_a12_15frec frec3

lab var vi_a12_15resp"Responsible for sending the data"
lab value vi_a12_15resp responsable

lab var vi_a12_16"Data are collected using paper"
lab value vi_a12_16 sino

lab var vi_a12_16quien"Provides the registry or form that is used to collect patient data"
lab value vi_a12_16quien recolectar_papel

lab var vi_a12_16env"Where the data is sent"
lab value vi_a12_16env dondeenvian

lab var vi_a12_16cal1"Inconsistencies"
lab var vi_a12_16cal2"Missing data"
lab var vi_a12_16cal3"Record errors"
lab var vi_a12_16cal4"Others"

lab value vi_a12_16cal1-vi_a12_16cal4 sino

lab var vi_a12_16frec"Frequency that data is sent"
lab value vi_a12_16frec frec3

lab var vi_a12_16resp"Responsible for sending the data"
lab value vi_a12_16resp responsable

**VIGILANCIA SINDRÓMICA**
lab var vi_a13"Syndromic Surveillance"
lab value vi_a13 sino

lab var vi_a13_10"The surveillance system has detected outbreaks in the past"
lab value vi_a13_10 sino

lab var vi_a13_11"There are plans to expand this surveillance system in the future"
lab value vi_a13_11 sino

lab var vi_a13_15"Data are collected electronically"
lab value vi_a13_15 sino1

lab var vi_a13_15sis1"Excel"
lab var vi_a13_15sis2"Access"
lab var vi_a13_15sis3"NOTI" 
lab var vi_a13_15sis4"DHIS"
lab var vi_a13_15sis5"Others"

lab value vi_a13_15sis1-vi_a13_15sis5 sino1

lab var vi_a13_15env"Where the data is sent"
lab value vi_a13_15env dondeenvian

lab var vi_a13_15cal1"Inconsistencies"
lab var vi_a13_15cal2"Missing data"
lab var vi_a13_15cal3"Record errors"
lab var vi_a13_15cal4"Others"

lab value vi_a13_15cal1-vi_a13_15cal4 sino1

lab var vi_a13_15frec"Frequency that data is sent"
lab value vi_a13_15frec frec3

lab var vi_a13_15resp"Responsible for sending the data"
lab value vi_a13_15resp responsable

lab var vi_a13_16"Data are collected using paper"
lab value vi_a13_16 sino

lab var vi_a13_16quien"Provides the registry or form that is used to collect patient data"
lab value vi_a13_16quien recolectar_papel

lab var vi_a13_16env"Where the data is sent"
lab value vi_a13_16env dondeenvian

lab var vi_a13_16cal1"Inconsistencies"
lab var vi_a13_16cal2"Missing data"
lab var vi_a13_16cal3"Record errors"
lab var vi_a13_16cal4"Others"

lab value vi_a13_16cal1-vi_a13_16cal4 sino

lab var vi_a13_16frec"Frequency that data is sent"
lab value vi_a13_16frec frec3

lab var vi_a13_16resp"Responsible for sending the data"
lab value vi_a13_16resp responsable

**VIGILANCIA CENTINELA**
lab var vi_a14"Sentinel Surveillance"
lab value vi_a14 sino

lab var vi_a14_10"The surveillance system has detected outbreaks in the past"
lab value vi_a14_10 sino

lab var vi_a14_11"There are plans to expand this surveillance system in the future"
lab value vi_a14_11 sino


lab var vi_a14_15"Data are collected electronically"
lab value vi_a14_15 sino1

lab var vi_a14_15sis1"Excel"
lab var vi_a14_15sis2"Access"
lab var vi_a14_15sis3"NOTI" 
lab var vi_a14_15sis4"DHIS"
lab var vi_a14_15sis5"Others"

lab value vi_a14_15sis1-vi_a14_15sis5 sino1

lab var vi_a14_15env"Where the data is sent"
lab value vi_a14_15env dondeenvian

lab var vi_a14_15cal1"Inconsistencies"
lab var vi_a14_15cal2"Missing data"
lab var vi_a14_15cal3"Record errors"
lab var vi_a14_15cal4"Others"

lab value vi_a14_15cal1-vi_a14_15cal4 sino1

lab var vi_a14_15frec"Frequency that data is sent"
lab value vi_a14_15frec frec3

lab var vi_a14_15resp"Responsible for sending the data"
lab value vi_a14_15resp responsable

lab var vi_a14_16"Data are collected using paper"
lab value vi_a14_16 sino

lab var vi_a14_16quien"Provides the registry or form that is used to collect patient data"
lab value vi_a14_16quien recolectar_papel

lab var vi_a14_16env"Where the data is sent"
lab value vi_a14_16env dondeenvian

lab var vi_a14_16cal1"Inconsistencies"
lab var vi_a14_16cal2"Missing data"
lab var vi_a14_16cal3"Record errors"
lab var vi_a14_16cal4"Others"

lab value vi_a14_16cal1-vi_a14_16cal4 sino

lab var vi_a14_16frec"Frequency that data is sent"
lab value vi_a14_16frec frec3

lab var vi_a14_16resp"Responsible for sending the data"
lab value vi_a14_16resp responsable

**VIGILANCIA BASADA EN EL MEDIO AMBIENTE**
lab var vi_a15"Environment-Based Surveillance"
lab value vi_a15 sino

lab var vi_a15_10"The surveillance system has detected outbreaks in the past"
lab value vi_a15_10 sino

lab var vi_a15_11"There are plans to expand this surveillance system in the future"
lab value vi_a15_11 sino

lab var vi_a15_15"Data are collected electronically"
lab value vi_a15_15 sino1

lab var vi_a15_15sis1"Excel"
lab var vi_a15_15sis2"Access"
lab var vi_a15_15sis3"NOTI" 
lab var vi_a15_15sis4"DHIS"
lab var vi_a15_15sis5"Others"

lab value vi_a15_15sis1-vi_a15_15sis5 sino1

lab var vi_a15_15env"Where the data is sent"
lab value vi_a15_15env dondeenvian

lab var vi_a15_15cal1"Inconsistencies"
lab var vi_a15_15cal2"Missing data"
lab var vi_a15_15cal3"Record errors"
lab var vi_a15_15cal4"Others"

lab value vi_a15_15cal1-vi_a15_15cal4 sino1

lab var vi_a15_15frec"Frequency that data is sent"
lab value vi_a15_15frec frec3

lab var vi_a15_15resp"Responsible for sending the data"
lab value vi_a15_15resp responsable

lab var vi_a15_16"Data are collected using paper"
lab value vi_a15_16 sino

lab var vi_a15_16quien"Provides the registry or form that is used to collect patient data"
lab value vi_a15_16quien recolectar_papel

lab var vi_a15_16env"Where the data is sent"
lab value vi_a15_16env dondeenvian

lab var vi_a15_16cal1"Inconsistencies"
lab var vi_a15_16cal2"Missing data"
lab var vi_a15_16cal3"Record errors"
lab var vi_a15_16cal4"Others"

lab value vi_a15_16cal1-vi_a15_16cal4 sino

lab var vi_a15_16frec"Frequency that data is sent"
lab value vi_a15_16frec frec3

lab var vi_a15_16resp"Responsible for sending the data"
lab value vi_a15_16resp responsable

**OTRA INFORMACION
lab var vi_a18"Uses meteorological and climatic data"
lab value vi_a18 sino

lab var vi_a19"Maps are created with surveillance data"
lab value vi_a19 sino

lab var vi_a20"Mathematical modeling of disease is performed"
lab value vi_a20 sino

lab var vi_a20tip1"Prediction models" 
lab var vi_a20tip2"Risk models" 
lab var vi_a20tip3"Risk factor analysis" 
lab var vi_a20tip4"Transmission models, including R0 calculation" 
lab var vi_a20tip5"Others"

lab value vi_a20tip1-vi_a20tip5 sino1

lab var vi_a21"Spatial/geographic modeling"
lab value vi_a21 sino

lab var vi_a23"There are plans to implement new electronic tools in the future"
lab value vi_a23 sino

format vi_a23manho %td

lab var vi_a23cuales1"Leptospirosis"
lab var vi_a23cuales2"Rabies"
lab var vi_a23cuales3"Brucellosis"
lab var vi_a23cuales4"Fasciolosis"
lab var vi_a23cuales5"Echinocococcosis"
lab var vi_a23cuales6"Tuberculosis"
lab var vi_a23cuales7"HIV/AIDS"
lab var vi_a23cuales8"Malaria"
lab var vi_a23cuales9"Maternal Death" 
lab var vi_a23cuales10"STIs"
lab var vi_a23cuales11"Influenza"
lab var vi_a23cuales12"Others" 

lab value vi_a23cuales1-vi_a23cuales12 sino1

lab var vi_a241"Health center" 
lab var vi_a242"Hospital"
lab var vi_a243"Institutes" 
lab var vi_a244"Others"

lab value vi_a241-vi_a244 sino1

/////////SECTION: INVESTIGACIÓN DE BROTES
lab var br_a011"Occurrence of a new or re-emerging disease"
lab var br_a012"Increase in the number of cases"
lab var br_a013"Cases in excess of the epidemiological corridor"
lab var br_a014"Rumors"
lab var br_a015"Indicated by higher authorities"
lab var br_a016"Others"

lab value br_a011-br_a016 sino1

lab var br_a02"It has team"
lab value br_a02 sino1

lab var br_a02equi"Number of teams"

lab var br_a02conf1"Physician"
lab var br_a02conf2"Epidemiologist"
lab var br_a02conf3"Veterinarian" 
lab var br_a02conf4"Nurses"
lab var br_a02conf5"Community health workers"
lab var br_a02conf6"Biologists" 
lab var br_a02conf7"Others"

lab value br_a02conf1-br_a02conf7 sino1

lab var br_a02act1"Place visit" 
lab var br_a02act2"Sample collection"
lab var br_a02act3"Conducting the investigation"
lab var br_a02act4"Case identification" 
lab var br_a02act5"Report" 
lab var br_a02act6"Others"

lab value br_a02act1-br_a02act6 sino1

lab var br_a04"There was another outbreak"
lab value br_a04 sino

********PIENSE EN EL BROTE MÁS RECIENTE
lab var br_a04esp1"Humans"
lab var br_a04esp2"Pets"
lab var br_a04esp3"Horses and donkeys"
lab var br_a04esp4"Cattle"
lab var br_a04esp5"Sheep and goats"
lab var br_a04esp6"Pigs"
lab var br_a04esp7"Chickens"
lab var br_a04esp8"Wildlife"
lab var br_a04esp9"Others"

lab value br_a04esp1-br_a04esp9 sino1

lab var br_a04per"Number of persons affected"

lab var br_a04llam1"Health care staff at this facility noticed a change"
lab var br_a04llam2"A specific positive laboratory test drew attention to a change in the patient"
lab var br_a04llam3"A community alert"
lab var br_a04llam4"Notification from higher authorities"
lab var br_a04llam5"Others"

lab value br_a04llam1-br_a04llam5 sino1

lab var br_a04mue0"None"
lab var br_a04mue1"Blood"
lab var br_a04mue2"Urine"
lab var br_a04mue3"Stool"
lab var br_a04mue4"Rectal swab" 
lab var br_a04mue5"Respiratory swab (mouth/nose/throat)" 
lab var br_a04mue6"Tissue biopsy"
lab var br_a04mue7"Others"

lab value br_a04mue0-br_a04mue7 sino1

lab var br_a04rec1"Physician"
lab var br_a04rec2"Epidemiologist"
lab var br_a04rec3"Veterinarian"
lab var br_a04rec4"Nurses"
lab var br_a04rec5"Community health workers"
lab var br_a04rec6"Biologists" 
lab var br_a04rec7"Others"

lab value br_a04rec1-br_a04rec7 sino1

lab var br_a04inf"There is a report"
lab value br_a04inf sino

lab var br_a04comp1"Microred"
lab var br_a04comp2"Red"
lab var br_a04comp3"DIRESA"
lab var br_a04comp4"Peru CDC"
lab var br_a04comp5"INS"
lab var br_a04comp6"SENASA"
lab var br_a04comp7"SERFOR"
lab var br_a04comp8"Establishments of the same level in other jurisdictions"	
lab var br_a04comp9"Others"

lab value br_a04comp1-br_a04comp9 sino1

/////////SECTION: ANÁLISIS, REPORTES E INTERPRETACIÓN
lab var ai_a02"Have diagram illustrating how data is reported at each level"
lab value ai_a02 sino

lab var ai_a03"Have diagrams that illustrate how feedback is provided within and between human, animal and environmental health surveillance systems"
lab value ai_a03 sino

lab var ai_a03sof"Softwares used to prepare surveillance reports"

lab var ai_a03sof1"None" 
lab var ai_a03sof2"Excel"
lab var ai_a03sof3"Noti" 
lab var ai_a03sof4"Netlab" 
lab var ai_a03sof5"EpiInfo" 
lab var ai_a03sof6"Mapping program with GIS" 
lab var ai_a03sof7"Stata" 
lab var ai_a03sof8"R" 
lab var ai_a03sof9"SPSS" 
lab var ai_a03sof10"Others"

lab value ai_a03sof1-ai_a03sof10 sino1

lab var ai_a04"Your office receives surveillance reports"
lab value ai_a04 sino

lab var ai_a04ofi1"Peru CDC" 
lab var ai_a04ofi2"INS" 
lab var ai_a04ofi3"DIRESA" 
lab var ai_a04ofi4"RED" 
lab var ai_a04ofi5"Microred" 
lab var ai_a04ofi6"RIS" 
lab var ai_a04ofi7"Others"

lab value ai_a04ofi1-ai_a04ofi7 sino1

lab var ai_a04frec"Frequency"
lab value ai_a04frec frec3

lab var ai_a04inf1"Telephone"
lab var ai_a04inf2"Fax"
lab var ai_a04inf3"WhatsApp"
lab var ai_a04inf4"Website"
lab var ai_a04inf5"E-mail"
lab var ai_a04inf6"Physical reports (postal service, delivery)"
lab var ai_a04inf7"USB"
lab var ai_a04inf8"Computer applications" 
lab var ai_a04inf9"Others" 

lab value ai_a04inf1-ai_a04inf9 sino1

lab var ai_a04tip1"Case-based reports" 
lab var ai_a04tip2"Ad hoc rumors" 
lab var ai_a04tip3"Summaries" 
lab var ai_a04tip4"Other"

lab value ai_a04tip1-ai_a04tip4 sino1

lab var ai_a05"The reports are standardized"
lab value ai_a05 sino

lab var ai_a071"Politicians"
lab var ai_a072"Policy makers"
lab var ai_a073"Civil organizations"
lab var ai_a074"Community"
lab var ai_a075"Other"

lab value ai_a071-ai_a075 sino1

lab var ai_a08"Send reports to other agencies"
lab value ai_a08 sino

lab var ai_a08cua1"WHO"
lab var ai_a08cua2"OIE"
lab var ai_a08cua3"GLASS"
lab var ai_a08cua4"PAHO"
lab var ai_a08cua5"FAO"
lab var ai_a08cua6"Other ministries"

lab value ai_a08cua1-ai_a08cua6 sino1

lab var ai_a08frec"Frequency"
lab value ai_a08frec frec3

lab var ai_a08env1"Telephone"
lab var ai_a08env2"Fax"
lab var ai_a08env3"WhatsApp"
lab var ai_a08env4"Website"
lab var ai_a08env5"E-mail"
lab var ai_a08env6"Physical reports (postal service, delivery)"
lab var ai_a08env7"USB"
lab var ai_a08env8"Computer applications" 
lab var ai_a08env9"Other" 

lab value ai_a08env1-ai_a08env9 sino1

lab var ai_a09"Request data or information from other entities"
lab value ai_a09 sino

lab var ai_a09cua1"Peru	CDC"
lab var ai_a09cua2"MINAM"
lab var ai_a09cua3"SENASA"
lab var ai_a09cua4"Other"

lab value ai_a09cua1-ai_a09cua4 sino1

lab var ai_a09frec"Frequency"
lab value ai_a09frec frec3

lab var ai_a09sol1"Telephone"
lab var ai_a09sol2"Fax"
lab var ai_a09sol3"WhatsApp"
lab var ai_a09sol4"Website"
lab var ai_a09sol5"E-mail"
lab var ai_a09sol6"Physical reports (postal service, delivery)"
lab var ai_a09sol7"USB"
lab var ai_a09sol8"Computer applications" 
lab var ai_a09sol9"Other"

lab value ai_a09sol1-ai_a09sol9 sino1

lab var ai_a100"None"
lab var ai_a101"WHO"
lab var ai_a102"OIE" 
lab var ai_a103"GLASS" 
lab var ai_a104"PAHO"
lab var ai_a105"FAO"
lab var ai_a106"IHR" 
lab var ai_a107"Other"

lab value ai_a100-ai_a107 sino1

lab var ai_a10rep1"Biomedical data"
lab var ai_a10rep2"Sociodemographic data"
lab var ai_a10rep3"Geographic data (such as maps)" 
lab var ai_a10rep4"Behavioral factors"
lab var ai_a10rep5"Other"

lab value ai_a10rep1-ai_a10rep5 sino1

lab var ai_a10como1"Telephone"
lab var ai_a10como2"Fax"
lab var ai_a10como3"WhatsApp"
lab var ai_a10como4"Website"
lab var ai_a10como5"E-mail"
lab var ai_a10como6"Physical reports (postal service, delivery)"
lab var ai_a10como7"USB"
lab var ai_a10como8"Computer applications" 
lab var ai_a10como9"Other"

lab value ai_a10como1-ai_a10como9 sino1

lab var ai_a10frec"Frequency"
lab value ai_a10frec frec3

lab var ai_a110"None"
lab var ai_a111"WHO"
lab var ai_a112"OIE" 
lab var ai_a113"GLASS"
lab var ai_a114"OPS"
lab var ai_a115"FAO"
lab var ai_a116"IHR"
lab var ai_a117"Other"

lab value ai_a110-ai_a117 sino1

lab var ai_a11rep1"Biomedical data"
lab var ai_a11rep2"Sociodemographic data"
lab var ai_a11rep3"Geographic data (such as maps)" 
lab var ai_a11rep4"Behavioral factors"
lab var ai_a11rep5"Other"

lab value ai_a11rep1-ai_a11rep5 sino1

lab var ai_a11frec"Frequency"
lab value ai_a11frec frec3

lab var ai_a11rec1"Telephone"
lab var ai_a11rec2"Fax"
lab var ai_a11rec3"WhatsApp"
lab var ai_a11rec4"Website"
lab var ai_a11rec5"E-mail"
lab var ai_a11rec6"Physical reports (postal service, delivery)"
lab var ai_a11rec7"USB"
lab var ai_a11rec8"Computer applications" 
lab var ai_a11rec9"Other" 

lab value ai_a11rec1-ai_a11rec9 sino1

lab var ai_b011"Programming"
lab var ai_b012"Decision making"
lab var ai_b013"Performance evaluation"
lab var ai_b014"Other"

lab value ai_b011-ai_b014 sino1

lab var ai_b02"Frequency"
lab value ai_b02 frec3

lab var ai_b03"Frequency"
lab value ai_b03 frec3

lab var ai_b05"Spatial/geographic modeling of disease risk performed"
lab value ai_b05 sino

lab var ai_b05tip1"Prediction models"
lab var ai_b05tip2"Risk models"
lab var ai_b05tip3"Risk factor analysis"
lab var ai_b05tip4"Transmission models, including calculation of R0"
lab var ai_b05tip5"Other"

lab value ai_b05tip1-ai_b05tip5 sino1

lab var ai_b08"Condition during the year that affects their ability to report"
lab value ai_b08 sino

lab var ai_b08cua1"Internet problems"
lab var ai_b08cua2"Lack of personnel"
lab var ai_b08cua3"Shortage of supplies"
lab var ai_b08cua4"Other"

lab value ai_b08cua1-ai_b08cua4 sino1

lab var ai_b171"Politicians"
lab var ai_b172"Policy makers"
lab var ai_b173"Civil organizations"
lab var ai_b174"Community"
lab var ai_b175"Other"

lab value ai_b171-ai_b175 sino1

lab var ai_b181"Summary tables" 
lab var ai_b182"Bar graphs, histograms, etc"
lab var ai_b183"Trend graphs" 
lab var ai_b184"Risk maps"
lab var ai_b185"Disease incidence or prevalence maps"
lab var ai_b186"Dashboards"
lab var ai_b187"Other"
lab var ai_b180"None"

lab value ai_b181-ai_b180 sino1

lab var ai_b19"The results of the data allow you to make health forecasts"
lab value ai_b19 sino

lab var ai_b20"Reliance on reported data"
lab value ai_b20 sino


/////////SECTION: COMUNICACIÓN Y DISEMINACIÓN
lab var cd_a01"Your institution is involved in communications between human health, animal health and/or environmental health"
lab value  cd_a01 sino

lab var cd_a01tip"Type"
lab define ctipo 1"Human-animal" 2"Human-environmental" 3"Animal-environmental" 4"Human-animal-environmental"
lab value cd_a01tip ctipo

lab var cd_a04"They would report this case"
lab value cd_a04 sino

lab var cd_a04qui1"Peru CDC"
lab var cd_a04qui2"INS"
lab var cd_a04qui3"DIGESA"
lab var cd_a04qui4"COE"
lab var cd_a04qui5"SENASA"
lab var cd_a04qui6"SERFOR"
lab var cd_a04qui7"MINAM"
lab var cd_a04qui8"Other"

lab value cd_a04qui1-cd_a04qui8 sino1

lab var cd_a04com1"Telephone"
lab var cd_a04com2"Fax"
lab var cd_a04com3"WhatsApp"
lab var cd_a04com4"Website"
lab var cd_a04com5"E-mail"
lab var cd_a04com6"Physical reports (postal service, delivery)"
lab var cd_a04com7"USB"
lab var cd_a04com8"Computer applications" 
lab var cd_a04com9"Other" 

lab value cd_a04com1-cd_a04com9 sino1

lab var cd_a05"There are better ways to communicate"
lab value cd_a05 sino

lab var cd_a06"Other institutions contacting them or their office"
lab value cd_a06 sino

lab var cd_a06cua1"CDC"
lab var cd_a06cua2"INS"
lab var cd_a06cua3"DIGESA"
lab var cd_a06cua4"COE"
lab var cd_a06cua5"SENASA"
lab var cd_a06cua6"SERFOR"
lab var cd_a06cua7"MINAM"
lab var cd_a06cua8"Other"

lab value cd_a06cua1-cd_a06cua8 sino1

lab var cd_a06com1"Telephone"
lab var cd_a06com2"Fax"
lab var cd_a06com3"WhatsApp"
lab var cd_a06com4"Website"
lab var cd_a06com5"E-mail"
lab var cd_a06com6"Physical reports (postal service, delivery)"
lab var cd_a06com7"USB"
lab var cd_a06com8"Computer applications" 
lab var cd_a06com9"Other"

lab value cd_a06com1-cd_a06com9 sino1

lab var cd_a070"None"
lab var cd_a071"Individual risk reduction"
lab var cd_a072"Health education"
lab var cd_a073"General community information"
lab var cd_a074"Outbreaks"
lab var cd_a075"Disease risk to humans or animals" 
lab var cd_a076"Other"

lab value cd_a071-cd_a076 sino1

lab var cd_a07frec"Frequency"
lab value cd_a07frec frec3

lab var cd_a07com1"Website"
lab var cd_a07com2"Newsletters"
lab var cd_a07com3"Newspapers"
lab var cd_a07com4"Radio"
lab var cd_a07com5"E-mail"
lab var cd_a07com6"Journals"
lab var cd_a07com7"Scientific publications"
lab var cd_a07com8"Meetings"
lab var cd_a07com9"Press"
lab var cd_a07com10"Other"

lab value cd_a07com1-cd_a07com10 sino1

/////////SECTION: POLITICAS
lab var po_a01"There are policies for collaborative surveillance of One Health"
lab value po_a01 sino

lab var po_a02"There are legal frameworks that have been standardized across all sectors"
lab value po_a02 sino

lab var po_a03"Legal frameworks governing all aspects of monitoring are sufficient"
lab value po_a03 sino

lab var po_a05"There are strategic frameworks and plans for coordinated surveillance"
lab value po_a05 sino

lab var po_a06"There are regional differences in the legal frameworks for surveillance"
lab value po_a06 sino

lab var po_a06fom"There is a plan to encourage animal disease reporting"
lab value po_a06fom sino

lab var po_a06imp"There is a plan to address factors that may prevent owners/farmers from reporting animal diseases"
lab value po_a06imp sino

lab var po_a07"There is a multisectoral collaboration policy on zoonotic diseases in the country"
lab value po_a07 sino

lab var po_a07reu"They meet"
lab value po_a07reu sino

lab var po_a07frec"Frequency"
lab value po_a07frec frec3

lab var po_a08"There is a plan to strengthen PAHO's international sanitary regulation"
lab value po_a08 sino

lab var po_a09"There is a plan to coordinate the functions of the International Health Regulations between environmental and agricultural responders"
lab value po_a09 sino

lab var po_a10"Any assessment of laws, regulations or administrative requirements has been carried out"
lab value po_a10 sino 

lab var po_a10inf"There is a report of the findings"
lab value po_a10inf sino

lab var po_a11"The veterinary sector has some legislation "
lab value po_a11 sino

lab var po_a12"In the implementation of COVID-19 activities"
lab value po_a12 sino

lab var po_a13"In the implementation of the International Health Regulations (IHR)"
lab value po_a13 sino

lab var po_a15"Proportion of the national health budget allocated to public health"

lab var po_a16"Money is allocated directly to surveillance activities"

lab var po_a18"There is a continuous distribution of funds"
lab value po_a18 sino

lab var po_a19"There is timely distribution of funds"
lab value po_a19 sino

lab var po_a21"There are mechanisms in place to monitor financial execution"
lab value po_a21 sino

/////////SECTION: INTEROPERABILIDAD
lab var in_a01"That best describes the exchange of data"
lab define interoperar 1"There is limited capacity to support standardized data exchange at the individual level between systems with specific implementation or at the local level. Data exchange is based on peer-to-peer interfaces, which require more effort for implementation and manual intervention during exchange" 2"There is capacity for automated data exchange support using internationally recognized standards in the exchange of individual data in limited contexts. More effort is required to ensure that data exchange standards are integrated into systems" 3"Defined national standards based on international standards are used to support data exchange at the individual level. Most applications have integrated data standards with well-developed interoperability verification regimes. Medium implementation efforts are required to perform data exchange" 4"Minimal effort is required to perform data exchange.  Applications are implemented mostly according to plan, with the required quality of interoperability. Most components conform to adopted or de facto standards and are certified and interoperable" 5"Applications do not require specialized engineering effort or expertise to implement interoperability. All data exchanges are based on certified interoperability standards. Robust maintenance and upgrade processes are planned and include feedback to standards development organizations for improvement"
lab value in_a01 interoperar

lab var in_a01tip"Type of information/data system"
lab define tipo 1"Excel" 2"Access" 3"DHIS 2" 4"GIS" 5"Other"
lab value in_a01tip tipo 

lab var in_a02"The system includes a master list of establishments (SML or MFL)"
lab value in_a02 sino

lab var in_a02no"If not, does the system have a built-in facility list that acts as an EML?"
lab value in_a02no sino

lab var in_a02mec"There is a working mechanism in place to keep the EML updated"
lab value in_a02mec sino

lab var in_a03"Percentage of health facilities that have geographic coordinates attached to them"
lab define percentage 0"None" 1"1% - 25% of facilities" 2"26% - 50% of facilities" 3"51% - 75% of facilities" 4"76% - 100% of facilities"
lab value in_a03 percentage

lab var in_a04"Coordinate system used to record geographical coordinates"
lab define coordenada 1"UTM (Universal Transverse Mercator)" 2"Degrees with decimals" 3"Degrees and minutes with decimals" 4"Degrees, minutes and seconds"
lab value in_a04 coordenada

lab var in_a05"System uses unique identifiers for districts and regions"
lab value in_a05 sino

lab var in_a05mar"If so, is there a framework or agreement, so that these lists of unique identifiers are available for general use by other programs, e.g., human resources, logistics, finance, implementing partners?"
lab value in_a05mar sino

lab var in_a06"Other information that is available in this system"
lab define otrasa 1"Human Resources" 2"Logistics" 3"Finance" 0"None of the following"
lab value in_a06 otrasa

lab var in_a061"Human Resources"
lab var in_a062"Logistics"
lab var in_a063"Finance"
lab var in_a060"None of the above"

lab value in_a061-in_a060 sino1

lab var in_a07"The system interoperates with any other information/data system"
lab value in_a07 sino

lab var in_a07sis"Other information/data systems with which it interoperates"

lab var in_a07sis1"With its Management"
lab var in_a07sis2"With its Ministry" 
lab var in_a07sis3"With other Ministries"
lab var in_a07sis4"Other"

lab value in_a07sis1-in_a07sis4 sino1

lab var in_a08"The system integrates with an integrated monitoring and response system"
lab value in_a08 sino

lab var in_a09"The raw data from this system is shared"
lab value in_a09 sino

lab var in_a09frec"Frequency of raw data sharing"
lab value in_a09frec frec3

lab var in_a10"The analysis reports produced by this system are shared"
lab value in_a10 sino1

lab var in_a10frec"Frequency with which analysis reports are shared"
lab value in_a10frec frec3

lab var in_a11a"Accept data through automated methods"
lab var in_a11b"Send data through automated methods"
lab var in_a11c"Provide a REST-like interface to facilitate data exchange"
lab var in_a11d"Provide a data exchange interface with multiple layers of security (password/token) or the ability to support trusted relationships (oAuth)"
lab var in_a11e"Support messaging using HL7 Fast Healthcare Interoperability Resource (FHIR) STU3 and FHIR STU4 directly or by a mediated process"
lab var in_a11f"Support export of manual data in Excel format or an Excel-compatible format, such as delimited text files"
lab var in_a11g"Support conversion from HL7 Version 2.3.1 to HL7 Version 2.5.1"
lab var in_a11h"Support HL7 Version 2.5.1"
lab var in_a11i"Support HL7 Version 3 Release 2 Clinical Document Architecture (CDA)"
lab var in_a11j"Support HL7 Continuity of Care Document (CCD)"
lab var in_a11k"Support HL7 Fast Healthcare Interoperability Resources (FHIR)"
lab var in_a11l"Support Aggregate Data eXchange (ADX) profile for aggregated data exchange"
lab var in_a11m"Support W3C eXtensible Markup Language (XML) for XML data exchange"
lab var in_a11n"Support WHATWG and W3C Hypertext markup language (HTML) version 5"
lab var in_a11o"Support JavaScript Object Notation (JSON) for data exchange"
lab var in_a11p"Support ISO Unicode Transformation Format (UTF-8) encoding"
lab var in_a11q"Generate system messages/emails/notifications"
lab var in_a11r"Provide an Application Programming Interface (API)"
lab var in_a11s"Provide the capability to support data exchange according to the latest version of the IHE IT Infrastructure Technical Framework, Volume 2"
lab var in_a11t"SupportDICOM (Digital Imaging and Communications in Medicine) for the exchange of medical images"

lab define medida 0"None" 1"Somewhat" 2"Completely" 3"Don't know"
lab value in_a11a-in_a11t medida

lab var in_a12_0"They have a figure showing the system architecture"
lab value in_a12_0 sino

lab var in_a121"Noti"
lab var in_a122"Netlab"
lab var in_a123"Excel"
lab var in_a124"Access"
lab var in_a125"EpiInfo"
lab var in_a126"Otros"

lab value in_a121-in_a126 sino1

lab var in_a12e"Did you mention more than one system?"
lab value in_a12e sino1

lab var in_a12int"Each is interoperable with the other"
lab define interoperable 2"Yes, all" 1"Yes, some" 0"No" 3"Don't know"
lab value in_a12int interoperable

lab var in_a12pla"There are plans to make them interoperable"
lab value in_a12pla sino

lab var in_a13"Raw data contain personal identifiers or are anonymized"
lab define identificadores 1"They have personal identifiers" 2"They are previously anonymized"
lab value in_a13 identificadores

lab var in_a13anon"The anonymization procedure is manual or automated"
lab define anonimos 1"Manual" 2"Automated"
lab value in_a13anon anonimos

lab var in_a15"There is documentation that includes definitions of Inputs/outputs"
lab value in_a15 sino

lab var in_a16"There is documentation on transformations that are performed on the original data"
lab value in_a16 sino

/////////SECTION: CAPACITACION
lab var ca_a01"The facility has designated funds to support training"
lab value ca_a01 sino

lab var ca_a02"The facility has a designated training coordinator"
lab value ca_a02 sino1

lab var ca_a031"Physician"
lab var ca_a032"Epidemiologist"
lab var ca_a033"Obstetrician"
lab var ca_a034"Veterinarian"
lab var ca_a035"Nurses"
lab var ca_a036"Statistician"
lab var ca_a037"Data entry clerk"
lab var ca_a038"Other"

lab value ca_a031-ca_a038 sino1

lab var ca_a04"Frequency"
lab value ca_a04 frec3

lab var ca_a05"Have a system to track who has been trained"
lab value ca_a05 sino1

lab var ca_a06"Has a train-the-trainer program"
lab value ca_a06 sino1

lab var ca_b01"The organization/facility provides training"
lab value ca_b01 sino

lab var ca_b021"Case definition"
lab var ca_b022"Types of surveillance"
lab var ca_b023"Reporting of surveillance data"
lab var ca_b024"Identification of stakeholders"
lab var ca_b025"National and international regulations"
lab var ca_b026"List of notifiable diseases"
lab var ca_b027"Epidemiological methods"
lab var ca_b028"Field epidemiology"
lab var ca_b029"Use of electronic data systems"
lab var ca_b0210"Data quality assurance"
lab var ca_b0211"Risk communication"
lab var ca_b0212"Human research"
lab var ca_b0213"Data Management (Use of REDCap, LIS, etc.)"
lab var ca_b0214"Qualitative research"
lab var ca_b0215"Environmental Sampling Techniques"
lab var ca_b0216"Animal Surveillance Data Reporting"
lab var ca_b0217"Use of animals in research"
lab var ca_b0218"Handling and Sampling of Wildlife Animals"
lab var ca_b0219"List of notifiable diseases in animals"
lab var ca_b0220"Handling and Sampling of Livestock and Domestic Animals"
lab var ca_b0221"General biosecurity and biosafety"
lab var ca_b0222"Geographic location system including GPS"
lab var ca_b0223"Climate and health"
lab var ca_b0224"Others"

lab value ca_b021-ca_b0224 sino1

lab var ca_c01"Case definition"
lab var ca_c02"Types of surveillance"
lab var ca_c03"Reporting of surveillance data"
lab var ca_c04"Identification of stakeholders"
lab var ca_c05"National and international regulations"
lab var ca_c06"List of notifiable diseases"
lab var ca_c07"Epidemiological methods"
lab var ca_c08"Field epidemiology"
lab var ca_c09"Use of electronic data systems"
lab var ca_c10"Data quality assurance"
lab var ca_c11"Risk communication"
lab var ca_c12"Human research"
lab var ca_c13"Data Management (Use of REDCap, LIS, etc.)"
lab var ca_c14"Qualitative research"
lab var ca_c15"Environmental Sampling Techniques"
lab var ca_c16"Animal Surveillance Data Reporting"
lab var ca_c17"Use of animals in research"
lab var ca_c18"Handling and Sampling of Wildlife Animals"
lab var ca_c19"List of notifiable diseases in animals"
lab var ca_c20"Handling and Sampling of Livestock and Domestic Animals"
lab var ca_c21"General biosecurity and biosafety"
lab var ca_c22"Geographic location system including GPS"
lab var ca_c23"Climate and health"

lab value ca_c01-ca_c23 sino

lab var ca_c24"Other"
lab value ca_c24 sino1

lab var ca_c25frec"The most recent training was"
lab define frec4 1"Last quarter" 2"Last year" 3"More than one year ago"
lab value ca_c25frec frec4

/////////SECTION: LABORATORIO
/////////SECTION: A. VIGILANCIA Y RESPUESTA
lab var lab_a01"The laboratory participates in the surveillance of infectious diseases"
lab value lab_a01 sino

lab var lab_a01phum0"None"
lab var lab_a01phum1"Anthrax"
lab var lab_a01phum2"Arbovirosis"
lab var lab_a01phum3"Brucellosis"
lab var lab_a01phum4"Cholera"
lab var lab_a01phum5"Dengue"
lab var lab_a01phum6"Diphtheria"
lab var lab_a01phum7"Carrion's disease"
lab var lab_a01phum8"Chagas disease"
lab var lab_a01phum9"Acute Diarrheal Disease"
lab var lab_a01phum10"Yellow Fever"
lab var lab_a01phum11"Hepatitis B"
lab var lab_a01phum12"HIV infection and AIDS"
lab var lab_a01phum13"Hospital-acquired infections"
lab var lab_a01phum14"Acute respiratory infections, pneumonias and SOB/asthma"
lab var lab_a01phum15"Influenza"
lab var lab_a01phum16"Leishmaniasis"
lab var lab_a01phum17"Leptospirosis"
lab var lab_a01phum18"Loxocelism"
lab var lab_a01phum19"Malaria"
lab var lab_a01phum20"Meningococcal meningitis"
lab var lab_a01phum21"Ophidism"
lab var lab_a01phum22"Human plague"
lab var lab_a01phum23"Poliomyelitis"
lab var lab_a01phum24"Human rabies"
lab var lab_a01phum25"Rubella"
lab var lab_a01phum26"Measles"
lab var lab_a01phum27"SARS"
lab var lab_a01phum28"Syphilis"
lab var lab_a01phum29"Tetanus"
lab var lab_a01phum30"Typhoid typhus"
lab var lab_a01phum31"Pertussis (Whooping cough)"
lab var lab_a01phum32"Tuberculosis"
lab var lab_a01phum33"Smallpox"
lab var lab_a01phum34"Other"

lab value lab_a01phum0-lab_a01phum34 sino1

lab var lab_a01pani0"None"
lab var lab_a01pani1"Enzootic abortion of sheep (ovine chlamydiosis)"
lab var lab_a01pani2"Acarapisosis of honey bees"
lab var lab_a01pani3"Contagious agalactia"
lab var lab_a01pani4"Bovine anaplasmosis"
lab var lab_a01pani5"Equine infectious anemia"
lab var lab_a01pani6"Caprine arthritis/encephalitis"
lab var lab_a01pani7"Bovine babesiosis"
lab var lab_a01pani8"Infectious avian bronchitis"
lab var lab_a01pani9"Infectious Bursitis (Gumboro disease)"
lab var lab_a01pani10"Bovine genital campylobacteriosis"
lab var lab_a01pani11"Anthrax"
lab var lab_a01pani12"Swine cysticercosis"
lab var lab_a01pani13"Avian chlamydiosis"
lab var lab_a01pani14"Heartwater"
lab var lab_a01pani15"Lumpy skin disease"
lab var lab_a01pani16"Porcine epidemic diarrhea"
lab var lab_a01pani17"Bovine viral diarrhea"
lab var lab_a01pani18"Dourine"
lab var lab_a01pani19"Japanese encephalitis"
lab var lab_a01pani20"Equine encephalomyelitis (Eastern)"
lab var lab_a01pani21"Equine encephalomyelitis (Western)"
lab var lab_a01pani22"Venezuelan equine encephalomyelitis"
lab var lab_a01pani23"Nipah virus encephalomyelitis"
lab var lab_a01pani24"Bovine Spongiform Encephalopathy (BSE)"
lab var lab_a01pani25"Aujeszky's disease"
lab var lab_a01pani26"Marek's disease"
lab var lab_a01pani27"Nairobi disease"
lab var lab_a01pani28"Newcastle disease"
lab var lab_a01pani29"Seneca Valley Disease"
lab var lab_a01pani30"Epizootic Hemorrhagic Disease (EHD)"
lab var lab_a01pani31"Rabbit hemorrhagic disease"
lab var lab_a01pani32"Swine vesicular disease"
lab var lab_a01pani33"Duck viral enteritis/Duck plague (Coronaviridae)"
lab var lab_a01pani34"Enterotoxemia in alpacas"
lab var lab_a01pani35"Sheep epididymitis (Brucella ovis)"
lab var lab_a01pani36"Echinococcosis/hydatidosis"
lab var lab_a01pani37"Vesicular stomatitis"
lab var lab_a01pani38"Foot and mouth disease"
lab var lab_a01pani39"Malignant catarrhal fever"
lab var lab_a01pani40"Alpaca fever (Streptococcus animalpyogenes)"
lab var lab_a01pani41"West Nile fever"
lab var lab_a01pani42"Rift Valley fever"
lab var lab_a01pani43"Crimean-Congo hemorrhagic fever"
lab var lab_a01pani44"Q fever"
lab var lab_a01pani45"Transmissible gastroenteritis"
lab var lab_a01pani46"Equine influenza"
lab var lab_a01pani47"Inclusion body hepatitis"
lab var lab_a01pani48"Duck virus hepatitis"
lab var lab_a01pani49"Tropilaelaps mite infestation of honey bees"
lab var lab_a01pani50"Hive beetle infestation (Aethina tumida)"
lab var lab_a01pani51"Avian influenza"
lab var lab_a01pani52"Highly pathogenic type A influenza in birds other than poultry and wild birds"
lab var lab_a01pani53"Avian infectious laryngotracheitis"
lab var lab_a01pani54"Leishmaniasis"
lab var lab_a01pani55"Bluetongue"
lab var lab_a01pani56"Leptospirosis"
lab var lab_a01pani57"Enzootic bovine leukosis"
lab var lab_a01pani58"Guinea pig lymphadenitis"
lab var lab_a01pani59"American foulbrood of honey bees"
lab var lab_a01pani60"European honey bee foulbrood"
lab var lab_a01pani61"Maedi-visna"
lab var lab_a01pani62"Contagious equine metritis"
lab var lab_a01pani63"Myiasis"
lab var lab_a01pani64"Avian mycoplasmosis (M gallisepticum)"
lab var lab_a01pani65"Avian mycoplasmosis (M synoviae)"
lab var lab_a01pani66"Myxomatosis"
lab var lab_a01pani67"Staphylococcus aureus"
lab var lab_a01pani68"Swine enzootic pneumonia"
lab var lab_a01pani69"Paratuberculosis"
lab var lab_a01pani70"Contagious bovine pleuropneumonia"
lab var lab_a01pani71"Rinderpest"
lab var lab_a01pani72"Peste des petits ruminants"
lab var lab_a01pani73"African horse sickness"
lab var lab_a01pani74"African swine fever"
lab var lab_a01pani75"Classical swine fever"
lab var lab_a01pani76"Equine pyroplasmosis"
lab var lab_a01pani77"Contagious caprine pleuropneumonia"
lab var lab_a01pani78"Scrapie"
lab var lab_a01pani79"Pneumonia pneumonia"
lab var lab_a01pani80"Rabies"
lab var lab_a01pani81"Equine rhinopneumonia (HVE-1)"
lab var lab_a01pani82"Turkey rhinotracheitis"
lab var lab_a01pani83"Infectious rhinotracheitis vina / infectious pustular vulvovaginitis"
lab var lab_a01pani84"Salmonellosis (S abortusovis)"
lab var lab_a01pani85"Salmonellosis of guinea pigs"
lab var lab_a01pani86"Hemorrhagic septicemia"
lab var lab_a01pani87"Porcine reproductive and respiratory syndrome"
lab var lab_a01pani88"Surra (Trypanosoma evansi)"
lab var lab_a01pani89"Theileriosis"
lab var lab_a01pani90"Avian typhosis"
lab var lab_a01pani91"Trichomonosis"
lab var lab_a01pani92"Trypanosomosis (transmitted by tsetse)"
lab var lab_a01pani93"Trichinellosis"
lab var lab_a01pani94"Avian tuberculosis"
lab var lab_a01pani95"Bovine tuberculosis"
lab var lab_a01pani96"Tularemia"
lab var lab_a01pani97"Varroasis of honey bees"
lab var lab_a01pani98"Camel pox"
lab var lab_a01pani99"Sheep pox and goat pox"
lab var lab_a01pani100"Other"

lab value lab_a01pani0-lab_a01pani100 sino1

lab var lab_a02"Performs surveillance of biological samples"
lab value lab_a02 sino

lab var lab_a02esp1"Human"
lab var lab_a02esp2"Domestic animal"
lab var lab_a02esp3"Wild animal"
lab var lab_a02esp4"Vectors"
lab var lab_a02esp5"Water"
lab var lab_a02esp6"Soil"
lab var lab_a02esp7"Air"

lab value lab_a02esp1-lab_a02esp7 sino1

lab var lab_a02poe"Have any Standard Operating Procedure manual"
lab value lab_a02poe sino

lab var lab_a03"Conducts genomic surveillance"
lab value lab_a03 sino

lab var lab_a03ana1"PCR for pathogen identification"
lab var lab_a03ana2"Molecular genotyping (RFLP, MLST, RAPD, etc.)"
lab var lab_a03ana3"NGS: whole genome sequencing"
lab var lab_a03ana4"NGS: 16s and metagenomics"

lab value lab_a03ana1-lab_a03ana4 sino1 

lab var lab_a03int"Interfaces with genome databases"
lab value lab_a03int sino

lab var lab_a03sis"There is a sequence analysis system"
lab value lab_a03sis sino

lab var lab_a041"Immunology"
lab var lab_a042"Viral serology"
lab var lab_a043"Analysis of domestic animal samples"
lab var lab_a044"Analysis of samples from wildlife animals"
lab var lab_a045"Human Specimen Analysis"
lab var lab_a046"Molecular Testing/Virus Detection"
lab var lab_a047"Viral Isolation"
lab var lab_a048"Tissue culture"
lab var lab_a049"Gene sequencing"

lab value lab_a041-lab_a049 sino1

lab var lab_a04ser3"ELISA"
lab var lab_a04ser4"Virus neutralization test"

lab value lab_a04ser3-lab_a04ser4 sino1

lab var lab_a04mol9"Nucleic acid extraction (automated or manual)"
lab var lab_a04mol10"In-house PCR/Conventional PCR"
lab var lab_a04mol11"qRT-PCR"

lab value lab_a04mol9-lab_a04mol11 sino1

lab var lab_a04gen15"Whole genome sequencing"
lab var lab_a04gen16"Amplicon sequencing"
lab var lab_a04gen17"Metagenomic sequencing"
lab var lab_a04gen18"Bioinformatics Analysis with proprietary pipelines"
lab var lab_a04gen19"Bioinformatics Analysis with free tools"

lab value lab_a04gen15-lab_a04gen19 sino1

lab var lab_a05"Handles biological samples/samples"
lab value lab_a05 sino

lab var lab_a05nores"Obtain results of the samples sent"
lab value lab_a05nores sino

lab var lab_a06"Receives surveillance data or samples from any private entity"
lab value lab_a06 sino

lab var lab_a07"Has a biobank"
lab value lab_a07 sino

lab var lab_a07nmue"Samples currently held in the biobank"

lab var lab_a07tipm"Type of samples"
lab define muestrasbio 1"Animal" 2"Human" 3"Both" 4"Other"
lab value lab_a07tipm muestrasbio

lab var lab_a07tiem"Time that they will be maintained"
lab define tiempomantendra  1"Less than 1 week" 2"1 week to 1 month" 3"1 to 12 months" 4"More than 1 year"
lab value lab_a07tiem tiempomantendra


lab var lab_a08"The laboratory receives field samples during the investigation"
lab value lab_a08 sino

lab var lab_a09"The laboratory provides training on sample collection and transport"
lab value lab_a09 sino

lab var lab_a10"The laboratory have agreements with health facilities for the collection and transport of samples"
lab value lab_a10 sino

lab var lab_a11" The laboratory sends samples or isolates to a reference laboratory"
lab value lab_a11 sino

lab var lab_a121"At this facility"
lab var lab_a122"Regional laboratory"
lab var lab_a123"INS"
lab var lab_a124"Other"

lab value lab_a121-lab_a124 sino1

lab var lab_a13"There are SOPs for laboratory processes"
lab value lab_a13 sino

lab var lab_a13sop1"INS"
lab var lab_a13sop2"Region"
lab var lab_a13sop3"Same establishment"
lab var lab_a13sop4"Other"

lab value lab_a13sop1-lab_a13sop4 sino1

lab var lab_a14"The organization has a sample tracking system in place"
lab value lab_a14 sino

lab var lab_a14tip"Type of tracking system"
lab define seguimientom 1"Electronic" 2"Paper" 3"Both"
lab value lab_a14tip seguimientom

lab var lab_a15"Has a bar-coding system"
lab value lab_a15 sino

lab var lab_a16"Where samples are stored"
lab define almacenar 1"Here" 2"At another facility" 3"Don't know"
lab value lab_a16 almacenar

lab var lab_a16esp"Where else are they sent"
lab define otroestable 1"Hospital" 2"Regional laboratory" 3"INS" 4"Other"
lab value lab_a16esp otroestable

lab var lab_a17"Metadata and other sample information securely stored in a central database"
lab value lab_a17 sino

lab var lab_a17_1"Metadata can be linked to samples and subsequent lab results"
lab value lab_a17_1 sino

lab var lab_a18"Only authorized personnel may access archived sample records"
lab value lab_a18 sino

/////////SECTION: B. REPORTES DE LABORATORIO
lab var lab_b01"Notification related to zoonotic viruses has been established and implemented"
lab value lab_b01 sino

lab var lab_b02"Copies of SOPs, manuals and laboratory workbooks are available"
lab value lab_b02 sino

lab var lab_b03"Test results with reference intervals and/or alert/critical values are reported"
lab value lab_b03 sino

lab var lab_b04"Laboratory reports identify the laboratory"
lab value lab_b04 sino

lab var lab_b05"Laboratory archives results data "
lab value lab_b05 sino

lab var lab_b05tiem"How often is it archived"
lab value lab_b05tiem frec3

/////////SECTION: C. SISTEMA DE GESTIÓN DE DATOS DE LABORATORIO [SGDL]
lab var lab_c01"The laboratory has a Laboratory Data Management System"
lab value lab_c01 sino

lab var lab_c01inf1"Specimen received"
lab var lab_c01inf2"Specimen stored"
lab var lab_c01inf3"Specimen analyzed"
lab var lab_c01inf4"Specimen shipped"
lab var lab_c01inf5"Specimen destroyed"
lab var lab_c01inf6"Other" 

lab value lab_c01inf1-lab_c01inf6 sino1

lab var lab_c01cop"This system is backed up weekly"
lab value lab_c01cop sino

lab var lab_c01res"The system is connected to a backup power source"
lab value lab_c01res sino

lab var lab_c02"There is a reporting system for the data collected"
lab value lab_c02 sino

lab var lab_c02frec"Frequency of reports"
lab value lab_c02frec frec3

lab var lab_c03"The system is integrated with the information system of the Ministry of Health"
lab value lab_c03 sino

lab var lab_c03tip1"Date and type of sample"
lab var lab_c03tip2"Date of test"
lab var lab_c03tip3"Tests performed and results"
lab var lab_c03tip4"Comments to help interpret the results"
lab var lab_c03tip5"Other"

lab value lab_c03tip1-lab_c03tip5 sino1

/////////SECTION: PARA EL SECTOR SALUD [MINSA/DIRESA]
lab var dire_01"The institutional operational plan includes surveillance activities"
lab value dire_01 sino

lab var dire_02"The office of epidemiology within its organizational chart"
lab define organigrama 1"Advisory unit" 2"Line unit" 3"Support unit" 4"Only one functional unit"
lab value dire_02 organigrama

lab var dire_04"Human resources in epidemiology are sufficient"
lab value dire_04 sino

lab var dire_05"Technological infrastructure and equipment are sufficient"
lab value dire_05 sino

lab var dire_08"Have a budget"
lab define sinopre 1"Yes" 0"No" 2"No institutional plans" 3"Don't know"
lab value dire_08 sinopre

/////////SECTION: PARA CDC
lab var cdc_02"CDC organization responds to the need for outbreak and epidemic care"
lab value cdc_02 sino

lab var cdc_03"Sufficient budget is allocated to CDC"
lab value cdc_03 sino

lab var cdc_05"Budget is available for all surveillance activities"
lab define sinocdc 1"Yes" 2"Only for some" 0"No" 3"Don't know"
lab value cdc_05 sinocdc

lab var cdc_06"Budget available for epidemiological research"
lab value cdc_06 sino

lab var cdc_07"Action plans receive funding"
lab value cdc_07 sino

lab var cdc_08"Financing arrives on time"
lab value cdc_08 sino

lab var cdc_09"The technological infrastructure is adequate and sufficient"
lab value cdc_09 sino

lab var cdc_10"It has the necessary mechanisms in place to ensure the protection of data"
lab value cdc_10 sino

lab var cdc_11"It has backup systems for the data that is collected"
lab value cdc_11 sino

lab var cdc_12"Periodicity of backups"
lab define frecuenciacdc 1"Daily" 2"Weekly" 3"Monthly" 4"Other"
lab value cdc_12 frecuenciacdc

lab var cdc_13"Have sufficient staff for the investigation of outbreaks"
lab value cdc_13 sino

lab var cdc_15"They have training plans for the formation of human resources"
lab value cdc_15 sino

lab var cdc_16"Periodicity"
lab define frecuenciacdc1 1"Monthly" 2"Quarterly" 3"Semiannually" 4"Annually" 5"Other"
lab value cdc_16 frecuenciacdc1

lab var cdc_16o"Specify"