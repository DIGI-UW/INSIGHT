////////////////////////////////////////////////////////////////////////////////////////////
//////TITLE:	SYNTAX TO GENERATE REPORT ON THE SURVEY OF HEALTH SURVEILLANCE PERSONNEL
//////AUTHOR:	PATRICIA MALLMA
//////OUTPUT:	WORD DOCUMENT 
////////////////////////////////////////////////////////////////////////////////////////////

///////OPENING DATABASE FROM THE DIRECTORY WHERE IT IS STORED
clear 
use "C:\Users\Patricia\Documents\insight\KOBO\descargas\BD\BD_total_n.dta", clear
g N=1

putdocx begin, footer(foot1) 
putdocx table ftr = (1, 2), border(all, nil) tofooter(foot1)
putdocx table ftr(1, 1) = ("Final Report")
putdocx table ftr(1, 2) = ("Page "), pagenumber
putdocx table ftr(1, 2) = ("/"), totalpages append
putdocx table ftr(1, 2), halign(right)

// Add a title
putdocx paragraph, style(Title) font(, 30)
putdocx text ("Final Report - INSIGHT")

////////////
putdocx paragraph
putdocx text ("Acronyms to be used in the following report: "), linebreak
putdocx text ("GRNGMA: "), bold 
putdocx text ("Natural Resources Management and Environmental"), linebreak 
putdocx text ("INS - CENSOPAS: "), bold 
putdocx text ("INS National Center of Occupational Health and Environmental Protection "), linebreak 
putdocx text ("INS - CENAN: "), bold 
putdocx text ("INS National Center for Feeding and nutrition"), linebreak 
putdocx text ("MINSA - DIGESA: "), bold 
putdocx text ("MINSA General Directorate of Environmental Health"), linebreak  
putdocx text ("MINSA - DIGEMID: "), bold 
putdocx text ("MINSA General Directorate of Medication, Supplies and Drugs"), linebreak  
putdocx text ("MINSA - DIGERD and COE: "), bold 
putdocx text ("MINSA General Directorate of Disaster Risk Management and National Defense in Health"), linebreak  
putdocx text ("MINSA - PRONAHEBAS: "), bold 
putdocx text ("MINSA National Program of Hemotherapy and Blood Banks"), linebreak  
putdocx text ("MINSA - OGTI: "), bold 
putdocx text ("MINSA General Office of Information Technologies"), linebreak  
putdocx text ("ANA: "), bold 
putdocx text ("National Water Autorithy"), linebreak  
putdocx text ("SENASA - National: "), bold 
putdocx text ("National Service of Agricultural Quality - National"), linebreak  
putdocx text ("SENASA - Regional: "), bold 
putdocx text ("National Service of Agricultural Quality - Regional"), linebreak  
putdocx text ("SERFOR - National: "), bold 
putdocx text ("Forestry National Service - National"), linebreak  
putdocx text ("SERFOR - Regional: "), bold 
putdocx text ("Forestry National Service - Regional"), linebreak 
putdocx text ("INIA: "), bold 
putdocx text ("National Institute of Agricultural Innovation"), linebreak 
putdocx text ("SENAMHI: "), bold 
putdocx text ("National Service of Meteorology and Hidrology"), linebreak 
putdocx text ("MCCLP: "), bold 
putdocx text ("Anti-poverty Roundtable"), linebreak 
putdocx text ("INEI: "), bold 
putdocx text ("National Institute of Statistics and Informatic"), linebreak 
putdocx text ("RENIEC: "), bold 
putdocx text ("National Registry of Identication and Civil Status"), linebreak 
putdocx text ("MINDEF: "), bold 
putdocx text ("Ministry of Defense"), linebreak 
putdocx text ("AIDESEP: "), bold 
putdocx text ("Interetnic Association for the Development of the Peruvian Amazon Rainforest"), linebreak 
putdocx text ("CMP: "), bold 
putdocx text ("Peruvian College of Physicians"), linebreak
putdocx text ("CMVP: "), bold 
putdocx text ("Peruvian College of Veterinarians"), linebreak
putdocx text ("CBP: "), bold 
putdocx text ("Peruvian College of Biologists"), linebreak
putdocx text ("NGO: "), bold 
putdocx text ("Non-Governmental Organizations"), linebreak 
putdocx text ("WHO: "), bold 
putdocx text ("World Health Organization"), linebreak 
putdocx text ("OIE: "), bold 
putdocx text ("World Organization for Animal Health"), linebreak 
putdocx text ("FAO: "), bold 
putdocx text ("Food and Agriculture Organization of the United Nations"), linebreak  
putdocx text ("NAMRU: "), bold 
putdocx text ("US Naval Medical Research Unit"), linebreak 

putdocx pagebreak

// Add a heading
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("1. General Information on the Facilities")

// Table
table (ig_a02esp), statistic(freq) statistic(percent) 
collect style cell border_block, border(right, pattern(nil))
collect style column, width(asis)
collect preview
collect style putdocx, title("Table 1: Participant profile")  halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

table (ig_a05) (ig_a02esp) if ig_a02esp==101 | ig_a02esp==102 | ig_a02esp==103 | ig_a02esp==201 | ig_a02esp==202 | ig_a02esp==203 | ig_a02esp==204 | ig_a02esp==205 | ig_a02esp==206 | ig_a02esp==602 | ig_a02esp==603 | ig_a02esp==604 | ig_a02esp==605 | ig_a02esp==901 | ig_a02esp==902, statistic(count ig_a05) nformat(%6.0f) 
collect style cell, margin(left right, width(5))
collect style cell border_block, border(right, pattern(nil))
collect style column, width(asis)
collect preview
collect style putdocx, title("Table 2: Distribution of participants by region") width(50%) halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(9))
putdocx collect

////
collect clear
quietly: table (ig_a02esp) (N) if ig_b05!=. | ig_b06!=. | ig_b07!=., statistic(frequency) nformat(%6.0f) name(table1) totals(N) 
quietly: table (ig_a02esp) (ig_b05) if ig_b05!=. | ig_b06!=. | ig_b07!=., statistic(percent, across(ig_b05)) statistic(count ig_b05) nformat(%6.1f) name(table1) totals(ig_b05) append
quietly: table (ig_a02esp) (ig_b06) if ig_b05!=. | ig_b06!=. | ig_b07!=., statistic(percent, across(ig_b06)) statistic(count ig_b06) nformat(%6.1f) name(table1) totals(ig_b06) append
quietly: table (ig_a02esp) (ig_b07) if ig_b05!=. | ig_b06!=. | ig_b07!=., statistic(percent, across(ig_b07)) statistic(count ig_b07) nformat(%6.1f) name(table1) totals(ig_b07) append

collect layout (ig_a02esp) (N ig_b05[1] ig_b06[1] ig_b07[1]) 
collect style header N, level(hide)
collect style header ig_b05, level(hide)
collect style header ig_b06, level(hide)
collect style header ig_b07, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview

collect style putdocx, title("Table 3: Physical characteristics of facilities ")  halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

/////
putdocx paragraph, style(Heading1) 
putdocx text ("Human Health")

collect clear
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_c03m) statistic(sd ig_c03m) statistic(mean ig_c03h) statistic(sd ig_c03h) statistic(mean ig_c03n) statistic(sd ig_c03n) statistic(mean ig_c04) statistic(sd ig_c04) listwise 

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[ig_c03m ig_c03h ig_c03n ig_c04]#result[column1], nformat(%6.0f)
collect style cell var[ig_c03m ig_c03h ig_c03n ig_c04]#result[column2 column3], nformat(%6.1f)
collect style cell var[ig_c03m ig_c03h ig_c03n ig_c04]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 4: Distribution of monthly visits and number of health professionals working at the facility") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

****AT THE END OF THE REPORT TO CORRECT VALUES IN TABLE 4
table (ig_a02esp) (var) if ig_c04>0, statistic(mean ig_c04) statistic(sd ig_c04) statistic(n ig_c04) listwise 
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_c03m) statistic(sd ig_c03m) listwise 
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_c03h) statistic(sd ig_c03h) listwise 
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_c03n) statistic(sd ig_c03n) listwise 
****

putdocx pagebreak

/////
putdocx paragraph, style(Heading1) 
putdocx text ("Animal Health")

collect clear
quietly: table (ig_a02esp) (N) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(frequency) nformat(%6.0f) name(table2) totals(N) 
quietly: table (ig_a02esp) (ig_d01) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(percent, across(ig_d01)) nformat(%6.1f) name(table2) totals(ig_d01) append
quietly: table (ig_a02esp) (ig_d01cuales1) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(percent, across(ig_d01cuales1)) nformat(%6.1f) name(table2) totals(ig_d01cuales1) append
quietly: table (ig_a02esp) (ig_d01cuales2) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(percent, across(ig_d01cuales2)) nformat(%6.1f) name(table2) totals(ig_d01cuales2) append
quietly: table (ig_a02esp) (ig_d01cuales3) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(percent, across(ig_d01cuales3)) nformat(%6.1f) name(table2) totals(ig_d01cuales3) append
quietly: table (ig_a02esp) (ig_d01cuales4) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(percent, across(ig_d01cuales4)) nformat(%6.1f) name(table2) totals(ig_d01cuales4) append
quietly: table (ig_a02esp) (ig_d01cuales5) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(percent, across(ig_d01cuales5)) nformat(%6.1f) name(table2) totals(ig_d01cuales5) append
quietly: table (ig_a02esp) (ig_d01cuales6) if ig_d01!=. | ig_d01cuales1!=. | ig_d01cuales2!=. | ig_d01cuales3!=. | ig_d01cuales4!=. | ig_d01cuales5!=. | ig_d01cuales6!=., statistic(percent, across(ig_d01cuales6)) nformat(%6.1f) name(table2) totals(ig_d01cuales6) append

collect layout (ig_a02esp) (N ig_d01 ig_d01cuales1[1] ig_d01cuales2[1] ig_d01cuales3[1] ig_d01cuales4[1] ig_d01cuales5[1] ig_d01cuales6[1]) 

collect style header N, level(hide)
collect style header ig_d01cuales1, level(hide)
collect style header ig_d01cuales2, level(hide)
collect style header ig_d01cuales3, level(hide)
collect style header ig_d01cuales4, level(hide)
collect style header ig_d01cuales5, level(hide)
collect style header ig_d01cuales6, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 5: Animal census characteristics") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if ig_d01frec!=., statistic(frequency) nformat(%6.0f) name(table2_1) totals(N) 
quietly: table (ig_a02esp) (ig_d01frec) if ig_d01frec!=., statistic(percent, across(ig_d01frec)) nformat(%6.1f) name(table2_1) totals(ig_d01frec) append

collect layout (ig_a02esp) (N ig_d01frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)
collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 6: Animal census characteristics") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////
lab var ig_d02"Total"
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d02) statistic(sd ig_d02) listwise

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[ig_d02]#result[column1], nformat(%6.0f)
collect style cell var[ig_d02]#result[column2 column3], nformat(%6.1f)
collect style cell var[ig_d02 ig_d02pub ig_d02priv]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)

collect style cell border_block, border(right, pattern(nil))

collect preview
collect style putdocx, title("Table 7: Number of veterinarians working") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

******
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d02pub) statistic(sd ig_d02pub) statistic(mean ig_d02priv) statistic(sd ig_d02priv) listwise

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[ig_d02pub ig_d02priv]#result[column1], nformat(%6.0f)
collect style cell var[ig_d02pub ig_d02priv]#result[column2 column3], nformat(%6.1f)
collect style cell var[ig_d02pub ig_d02priv]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)

collect style cell border_block, border(right, pattern(nil))

collect preview
collect style putdocx, title("Table 7.1: Number of veterinarians working by sector") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

******AT THE END OF THE REPORT TO CORRECT VALUES IN TABLE 7.1
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d02pub) statistic(sd ig_d02pub) listwise 
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d02priv) statistic(sd ig_d02priv) listwise 
***

///////
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d03vet) statistic(sd ig_d03vet) statistic(mean ig_d03tec) statistic(sd ig_d03tec) statistic(mean ig_d03ofic) statistic(sd ig_d03ofic) statistic(mean ig_d03otr) statistic(sd ig_d03otr) listwise 

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[ig_d03vet ig_d03tec ig_d03ofic ig_d03otr]#result[column1], nformat(%6.0f)
collect style cell var[ig_d03vet ig_d03tec ig_d03ofic ig_d03otr]#result[column2 column3], nformat(%6.1f)
collect style cell var[ig_d03vet ig_d03tec ig_d03ofic ig_d03otr]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)
collect style cell border_block, border(right, pattern(nil))

collect preview
collect style putdocx, title("Table 8: Number of veterinarians working") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

******AT THE END OF THE REPORT TO CORRECT VALUES IN TABLE 8
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d03vet) statistic(sd ig_d03vet) listwise 
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d03tec) statistic(sd ig_d03tec) listwise 
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d03ofic) statistic(sd ig_d03ofic) listwise 
table (ig_a02esp) (var), statistic(count N) statistic(mean ig_d03otr) statistic(sd ig_d03otr) listwise 
**

putdocx pagebreak

///////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("2. Disease Surveillance")

/////////
quietly: table (ig_a02esp) (N) if vi_a000!=. | vi_a001!=. | vi_a002!=. | vi_a003!=., statistic(frequency) nformat(%6.0f) name(table3) totals(N) 
quietly: table (ig_a02esp) (vi_a000) if vi_a000!=. | vi_a001!=. | vi_a002!=. | vi_a003!=., statistic(percent, across(vi_a000)) nformat(%6.1f) name(table3) totals(vi_a000) append
quietly: table (ig_a02esp) (vi_a001) if vi_a000!=. | vi_a001!=. | vi_a002!=. | vi_a003!=., statistic(percent, across(vi_a001)) nformat(%6.1f) name(table3) totals(vi_a001) append
quietly: table (ig_a02esp) (vi_a002) if vi_a000!=. | vi_a001!=. | vi_a002!=. | vi_a003!=., statistic(percent, across(vi_a002)) nformat(%6.1f) name(table3) totals(vi_a002) append
quietly: table (ig_a02esp) (vi_a003) if vi_a000!=. | vi_a001!=. | vi_a002!=. | vi_a003!=., statistic(percent, across(vi_a003)) nformat(%6.1f) name(table3) totals(vi_a003) append

collect layout (ig_a02esp) (N vi_a000[1] vi_a001[1] vi_a002[1] vi_a003[1]) 

collect style header N, level(hide)
collect style header vi_a000, level(hide)
collect style header vi_a001, level(hide)
collect style header vi_a002, level(hide)
collect style header vi_a003, level(hide)

collect style cell N, nformat(%6.0f)
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 9: Conduct public health surveillance for humans, animals or environment") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a01!=. | vi_a01quien1!=. | vi_a01quien2!=. | vi_a01quien3!=. | vi_a01quien4!=., statistic(frequency) nformat(%6.0f) name(table4) totals(N) 

quietly: table (ig_a02esp) (vi_a01) if vi_a01!=. | vi_a01quien1!=. | vi_a01quien2!=. | vi_a01quien3!=. | vi_a01quien4!=., statistic(percent, across(vi_a01)) nformat(%6.1f) name(table4) totals(vi_a01) append

quietly: table (ig_a02esp) (vi_a01quien1) if vi_a01!=. | vi_a01quien1!=. | vi_a01quien2!=. | vi_a01quien3!=. | vi_a01quien4!=., statistic(percent, across(vi_a01quien1)) nformat(%6.1f) name(table4) totals(vi_a01quien1) append

quietly: table (ig_a02esp) (vi_a01quien2) if vi_a01!=. | vi_a01quien1!=. | vi_a01quien2!=. | vi_a01quien3!=. | vi_a01quien4!=., statistic(percent, across(vi_a01quien2)) nformat(%6.1f) name(table4) totals(vi_a01quien2) append

quietly: table (ig_a02esp) (vi_a01quien3) if vi_a01!=. | vi_a01quien1!=. | vi_a01quien2!=. | vi_a01quien3!=. | vi_a01quien4!=., statistic(percent, across(vi_a01quien3)) nformat(%6.1f) name(table4) totals(vi_a01quien3) append

quietly: table (ig_a02esp) (vi_a01quien4) if vi_a01!=. | vi_a01quien1!=. | vi_a01quien2!=. | vi_a01quien3!=. | vi_a01quien4!=., statistic(percent, across(vi_a01quien4)) nformat(%6.1f) name(table4) totals(vi_a01quien4) append

collect layout (ig_a02esp) (N vi_a01 vi_a01quien1[1] vi_a01quien2[1] vi_a01quien3[1] vi_a01quien4[1]) 

collect style header N, level(hide)
collect style header vi_a01quien1, level(hide)
collect style header vi_a01quien2, level(hide)
collect style header vi_a01quien3, level(hide)
collect style header vi_a01quien4, level(hide)

collect style cell N, nformat(%6.0f)
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 10: List of priority notifiable diseases in health and who provides it") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a01frec!=., statistic(frequency) nformat(%6.0f) name(table5) totals(N) 
quietly: table (ig_a02esp) (vi_a01frec) if vi_a01frec!=., statistic(percent, across(vi_a01frec)) nformat(%6.1f) name(table5) totals(vi_a01frec) append

collect layout (ig_a02esp) (N vi_a01frec)
collect style header N, level(hide)
collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 11: List of priority notifiable diseases in health") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a021!=. | vi_a022!=. | vi_a023!=. | vi_a024!=. | vi_a025!=., statistic(frequency) nformat(%6.0f) name(table6) totals(N) 
quietly: table (ig_a02esp) (vi_a021) if vi_a021!=. | vi_a022!=. | vi_a023!=. | vi_a024!=. | vi_a025!=., statistic(percent, across(vi_a021)) nformat(%6.1f) name(table6) totals(vi_a021) append
quietly: table (ig_a02esp) (vi_a022) if vi_a021!=. | vi_a022!=. | vi_a023!=. | vi_a024!=. | vi_a025!=., statistic(percent, across(vi_a022)) nformat(%6.1f) name(table6) totals(vi_a022) append
quietly: table (ig_a02esp) (vi_a023) if vi_a021!=. | vi_a022!=. | vi_a023!=. | vi_a024!=. | vi_a025!=., statistic(percent, across(vi_a023)) nformat(%6.1f) name(table6) totals(vi_a023) append
quietly: table (ig_a02esp) (vi_a024) if vi_a021!=. | vi_a022!=. | vi_a023!=. | vi_a024!=. | vi_a025!=., statistic(percent, across(vi_a024)) nformat(%6.1f) name(table6) totals(vi_a024) append
quietly: table (ig_a02esp) (vi_a025) if vi_a021!=. | vi_a022!=. | vi_a023!=. | vi_a024!=. | vi_a025!=., statistic(percent, across(vi_a025)) nformat(%6.1f) name(table6) totals(vi_a025) append

collect layout (ig_a02esp) (N vi_a021[1] vi_a022[1] vi_a023[1] vi_a024[1] vi_a025[1]) 

collect style header N, level(hide)
collect style header vi_a021, level(hide)
collect style header vi_a022, level(hide)
collect style header vi_a023, level(hide)
collect style header vi_a024, level(hide)
collect style header vi_a025, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 12: There are normative documents with regard to") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a03!=. | vi_a03def!=., statistic(frequency) nformat(%6.0f) name(table7) totals(N) 
quietly: table (ig_a02esp) (vi_a03) if vi_a03!=. | vi_a03def!=., statistic(percent, across(vi_a03)) nformat(%6.1f) name(table7) totals(vi_a03) append
quietly: table (ig_a02esp) (vi_a03def) if vi_a03!=. | vi_a03def!=., statistic(percent, across(vi_a03def)) nformat(%6.1f) name(table7) totals(vi_a03def) append

collect layout (ig_a02esp) (N vi_a03[1] vi_a03def) 

collect style header N, level(hide)
collect style header vi_a03, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 13: Case definition for priority diseases, conditions and syndromes and who defines it") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a03rec!=., statistic(frequency) nformat(%6.0f) name(table7_1) totals(N) 
quietly: table (ig_a02esp) (vi_a03rec) if vi_a03rec!=., statistic(percent, across(vi_a03rec)) nformat(%6.1f) name(table7_1) totals(vi_a03rec) append

collect layout (ig_a02esp) (N vi_a03rec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 14: Characteristics of health surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a041!=. | vi_a042!=. | vi_a043!=. | vi_a044!=. | vi_a045!=. | vi_a046!=., statistic(frequency) nformat(%6.0f) name(table8) totals(N) 
quietly: table (ig_a02esp) (vi_a041) if vi_a041!=. | vi_a042!=. | vi_a043!=. | vi_a044!=. | vi_a045!=. | vi_a046!=., statistic(percent, across(vi_a041)) nformat(%6.1f) name(table8) totals(vi_a041) append
quietly: table (ig_a02esp) (vi_a042) if vi_a041!=. | vi_a042!=. | vi_a043!=. | vi_a044!=. | vi_a045!=. | vi_a046!=., statistic(percent, across(vi_a042)) nformat(%6.1f) name(table8) totals(vi_a042) append
quietly: table (ig_a02esp) (vi_a043) if vi_a041!=. | vi_a042!=. | vi_a043!=. | vi_a044!=. | vi_a045!=. | vi_a046!=., statistic(percent, across(vi_a043)) nformat(%6.1f) name(table8) totals(vi_a043) append
quietly: table (ig_a02esp) (vi_a044) if vi_a041!=. | vi_a042!=. | vi_a043!=. | vi_a044!=. | vi_a045!=. | vi_a046!=., statistic(percent, across(vi_a044)) nformat(%6.1f) name(table8) totals(vi_a044) append
quietly: table (ig_a02esp) (vi_a045) if vi_a041!=. | vi_a042!=. | vi_a043!=. | vi_a044!=. | vi_a045!=. | vi_a046!=., statistic(percent, across(vi_a045)) nformat(%6.1f) name(table8) totals(vi_a045) append
quietly: table (ig_a02esp) (vi_a046) if vi_a041!=. | vi_a042!=. | vi_a043!=. | vi_a044!=. | vi_a045!=. | vi_a046!=., statistic(percent, across(vi_a046)) nformat(%6.1f) name(table8) totals(vi_a046) append

collect layout (ig_a02esp) (N vi_a041[1] vi_a042[1] vi_a043[1] vi_a044[1] vi_a045[1] vi_a046[1])
 
collect style header N, level(hide)
collect style header vi_a041, level(hide)
collect style header vi_a042, level(hide)
collect style header vi_a043, level(hide)
collect style header vi_a044, level(hide)
collect style header vi_a045, level(hide)
collect style header vi_a046, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 15: Zoonotic diseases of major importance in the country/your region/in the area assigned to your facility") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10)) 
putdocx collect

****
quietly: table (ninguno_zoo) () if vi_a046==1, statistic(frequency) statistic(percent) name(table8_1)
quietly: table (nosabe_zoo) () if vi_a046==1, statistic(frequency) statistic(percent) name(table8_1) append
quietly: table (mala_zoo) () if vi_a046==1, statistic(frequency) statistic(percent) name(table8_1) append
quietly: table (leish_zoo) () if vi_a046==1, statistic(frequency) statistic(percent) name(table8_1) append
quietly: table (ofidi_zoo) () if vi_a046==1, statistic(frequency) statistic(percent) name(table8_1) append
quietly: table (loxo_zoo) () if vi_a046==1, statistic(frequency) statistic(percent) name(table8_1) append
quietly: table (dengue_zoo) () if vi_a046==1, statistic(frequency) statistic(percent) name(table8_1) append

collect layout (ninguno_zoo[1] nosabe_zoo[1] mala_zoo[1] leish_zoo[1] ofidi_zoo[1] loxo_zoo[1] dengue_zoo[1])(result) 

collect label levels ninguno_zoo 1 "N=143", modify
collect label levels nosabe_zoo 1 "N=143", modify
collect label levels mala_zoo 1 "N=143", modify
collect label levels leish_zoo 1 "N=143", modify
collect label levels ofidi_zoo 1 "N=143", modify
collect label levels loxo_zoo 1 "N=143", modify
collect label levels dengue_zoo 1 "N=143", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 15.1: Some answers from the other option") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect


//////
quietly: table (ig_a02esp) (N) if vi_a04proc1!=. | vi_a04proc2!=. | vi_a04proc3!=. | vi_a04proc4!=. | vi_a04proc5!=., statistic(frequency) nformat(%6.0f) name(table9) totals(N)
quietly: table (ig_a02esp) (vi_a04proc1) if vi_a04proc1!=. | vi_a04proc2!=. | vi_a04proc3!=. | vi_a04proc4!=. | vi_a04proc5!=., statistic(percent, across(vi_a04proc1)) nformat(%6.1f) name(table9) totals(vi_a04proc1) append
quietly: table (ig_a02esp) (vi_a04proc2) if vi_a04proc1!=. | vi_a04proc2!=. | vi_a04proc3!=. | vi_a04proc4!=. | vi_a04proc5!=., statistic(percent, across(vi_a04proc2)) nformat(%6.1f) name(table9) totals(vi_a04proc2) append
quietly: table (ig_a02esp) (vi_a04proc3) if vi_a04proc1!=. | vi_a04proc2!=. | vi_a04proc3!=. | vi_a04proc4!=. | vi_a04proc5!=., statistic(percent, across(vi_a04proc3)) nformat(%6.1f) name(table9) totals(vi_a04proc3) append
quietly: table (ig_a02esp) (vi_a04proc4) if vi_a04proc1!=. | vi_a04proc2!=. | vi_a04proc3!=. | vi_a04proc4!=. | vi_a04proc5!=., statistic(percent, across(vi_a04proc4)) nformat(%6.1f) name(table9) totals(vi_a04proc4) append
quietly: table (ig_a02esp) (vi_a04proc5) if vi_a04proc1!=. | vi_a04proc2!=. | vi_a04proc3!=. | vi_a04proc4!=. | vi_a04proc5!=., statistic(percent, across(vi_a04proc5)) nformat(%6.1f) name(table9) totals(vi_a04proc5) append

collect layout (ig_a02esp) (N vi_a04proc1[1] vi_a04proc2[1] vi_a04proc3[1] vi_a04proc4[1] vi_a04proc5[1]) 

collect style header N, level(hide)
collect style header vi_a04proc1, level(hide)
collect style header vi_a04proc2, level(hide)
collect style header vi_a04proc3, level(hide)
collect style header vi_a04proc4, level(hide)
collect style header vi_a04proc5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 16: Process that was used to prioritize zoonotic diseases of major public health importance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a04inc!=., statistic(frequency) nformat(%6.0f) name(table9_1) totals(N)
quietly: table (ig_a02esp) (vi_a04inc) if vi_a04inc!=., statistic(percent, across(vi_a04inc)) nformat(%6.1f) name(table9_1) totals(vi_a04inc) append

collect layout (ig_a02esp) (N vi_a04inc)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 17: This process included the animal sector, as well as the environment and other relevant sectors") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(frequency) nformat(%6.0f) name(table10) totals(N)

quietly: table (ig_a02esp) (vi_a051) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a051)) nformat(%6.1f) name(table10) totals(vi_a051) append

quietly: table (ig_a02esp) (vi_a052) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a052)) nformat(%6.1f) name(table10) totals(vi_a052) append

quietly: table (ig_a02esp) (vi_a053) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a053)) nformat(%6.1f) name(table10) totals(vi_a053) append

quietly: table (ig_a02esp) (vi_a054) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a054)) nformat(%6.1f) name(table10) totals(vi_a054) append

quietly: table (ig_a02esp) (vi_a055) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a055)) nformat(%6.1f) name(table10) totals(vi_a055) append

quietly: table (ig_a02esp) (vi_a056) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a056)) nformat(%6.1f) name(table10) totals(vi_a056) append

quietly: table (ig_a02esp) (vi_a057) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a057)) nformat(%6.1f) name(table10) totals(vi_a057) append

quietly: table (ig_a02esp) (vi_a058) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a058)) nformat(%6.1f) name(table10) totals(vi_a058) append

quietly: table (ig_a02esp) (vi_a059) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a059)) nformat(%6.1f) name(table10) totals(vi_a059) append

quietly: table (ig_a02esp) (vi_a0510) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a0510)) nformat(%6.1f) name(table10) totals(vi_a0510) append

quietly: table (ig_a02esp) (vi_a0511) if vi_a051!=. | vi_a052!=. | vi_a053!=. | vi_a054!=. | vi_a055!=. | vi_a056!=. | vi_a057!=. | vi_a058!=. | vi_a059!=. | vi_a0510!=. | vi_a0511!=., statistic(percent, across(vi_a0511)) nformat(%6.1f) name(table10) totals(vi_a0511) append

collect layout (ig_a02esp) (N vi_a051[1] vi_a052[1] vi_a053[1] vi_a054[1] vi_a055[1] vi_a056[1] vi_a057[1] vi_a058[1] vi_a059[1] vi_a0510[1] vi_a0511[1]) 

collect style header N, level(hide)
collect style header vi_a051, level(hide)
collect style header vi_a052, level(hide)
collect style header vi_a053, level(hide)
collect style header vi_a054, level(hide)
collect style header vi_a055, level(hide)
collect style header vi_a056, level(hide)
collect style header vi_a057, level(hide)
collect style header vi_a058, level(hide)
collect style header vi_a059, level(hide)
collect style header vi_a0510, level(hide)
collect style header vi_a0511, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 18: Diseases of major importance in the country/your region/in the area assigned to your facility") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

****
quietly: table (croni_imp) () if vi_a0511==1, statistic(frequency) statistic(percent) name(table10_11)
quietly: table (lepto_imp) () if vi_a0511==1, statistic(frequency) statistic(percent) name(table10_11) append
quietly: table (anemia_imp) () if vi_a0511==1, statistic(frequency) statistic(percent) name(table10_11) append

collect layout (croni_imp[1] lepto_imp[1] anemia_imp[1])(result) 

collect label levels croni_imp 1 "N=154", modify
collect label levels lepto_imp 1 "N=154", modify
collect label levels anemia_imp 1 "N=154", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 18.1: Some answers from the other option") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.1 Antimicrobial resistance testing and/or surveillance")

//////
quietly: table (ig_a02esp) (N) if vi_a07!=., statistic(frequency) nformat(%6.0f) name(table10_1) totals(N)
quietly: table (ig_a02esp) (vi_a07) if vi_a07!=., statistic(percent, across(vi_a07)) nformat(%6.1f) name(table10_1) totals(vi_a07) append

collect layout (ig_a02esp) (N vi_a07)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 19: Facilities participates in antimicrobial resistance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////
quietly: table (ig_a02esp) (N) if vi_a07who!=. | vi_a08!=., statistic(frequency) nformat(%6.0f) name(table11) totals(N)
quietly: table (ig_a02esp) (vi_a07who) if vi_a07who!=. | vi_a08!=., statistic(percent, across(vi_a07who)) nformat(%6.1f) name(table11) totals(vi_a07who) append
quietly: table (ig_a02esp) (vi_a08) if vi_a07who!=. | vi_a08!=., statistic(percent, across(vi_a08)) nformat(%6.1f) name(table11) totals(vi_a08) append

collect layout (ig_a02esp) (N vi_a07who vi_a08[1]) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 20: Characteristics of antimicrobial resistance surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a08frec!=., statistic(frequency) nformat(%6.0f) name(table11_1) totals(N)
quietly: table (ig_a02esp) (vi_a08frec) if vi_a08frec!=., statistic(percent, across(vi_a08frec)) nformat(%6.1f) name(table11_1) totals(vi_a08frec) append

collect layout (ig_a02esp) (N vi_a08frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 21: Characteristics of antimicrobial resistance surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(frequency) nformat(%6.0f) name(table12) totals(N)

quietly: table (ig_a02esp) (vi_a08com1) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com1)) nformat(%6.1f) name(table12) totals(vi_a08com1) append

quietly: table (ig_a02esp) (vi_a08com2) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com2)) nformat(%6.1f) name(table12) totals(vi_a08com2) append

quietly: table (ig_a02esp) (vi_a08com3) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com3)) nformat(%6.1f) name(table12) totals(vi_a08com3) append

quietly: table (ig_a02esp) (vi_a08com4) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com4)) nformat(%6.1f) name(table12) totals(vi_a08com4) append

quietly: table (ig_a02esp) (vi_a08com5) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com5)) nformat(%6.1f) name(table12) totals(vi_a08com5) append

quietly: table (ig_a02esp) (vi_a08com6) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com6)) nformat(%6.1f) name(table12) totals(vi_a08com6) append

quietly: table (ig_a02esp) (vi_a08com7) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com7)) nformat(%6.1f) name(table12) totals(vi_a08com7) append

quietly: table (ig_a02esp) (vi_a08com8) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com8)) nformat(%6.1f) name(table12) totals(vi_a08com8) append

quietly: table (ig_a02esp) (vi_a08com9) if vi_a08com1!=. | vi_a08com2!=. | vi_a08com3!=. | vi_a08com4!=. | vi_a08com5!=. | vi_a08com6!=. | vi_a08com7!=. | vi_a08com8!=. | vi_a08com9!=., statistic(percent, across(vi_a08com9)) nformat(%6.1f) name(table12) totals(vi_a08com9) append

collect layout (ig_a02esp) (N vi_a08com1[1] vi_a08com2[1] vi_a08com3[1] vi_a08com4[1] vi_a08com5[1] vi_a08com6[1] vi_a08com7[1] vi_a08com8[1] vi_a08com9[1]) 

collect style header N, level(hide)
collect style header vi_a08com1, level(hide)
collect style header vi_a08com2, level(hide)
collect style header vi_a08com3, level(hide)
collect style header vi_a08com4, level(hide)
collect style header vi_a08com5, level(hide)
collect style header vi_a08com6, level(hide)
collect style header vi_a08com7, level(hide)
collect style header vi_a08com8, level(hide)
collect style header vi_a08com9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 22: How it provides antimicrobial resistance data to health care facilities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.2 Dengue Surveillance")

/////
quietly: table (ig_a02esp) (N) if vi_a09!=. | vi_a09_10!=., statistic(frequency) nformat(%6.0f) name(table13) totals(N)
quietly: table (ig_a02esp) (vi_a09) if vi_a09!=. | vi_a09_10!=., statistic(percent, across(vi_a09)) nformat(%6.1f) name(table13) totals(vi_a09) append
quietly: table (ig_a02esp) (vi_a09_10) if vi_a09!=. | vi_a09_10!=., statistic(percent, across(vi_a09_10)) nformat(%6.1f) name(table13) totals(vi_a09_10) append

collect layout (ig_a02esp) (N vi_a09 vi_a09_10[1])

collect style header N, level(hide)
collect style header vi_a09_10, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 23: Characteristics of Dengue Surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected electronically")

//////
quietly: table (ig_a02esp) (N) if vi_a09_15!=. | vi_a09_15sis1!=. | vi_a09_15sis2!=. | vi_a09_15sis3!=. | vi_a09_15sis4!=. | vi_a09_15sis5!=., statistic(frequency) nformat(%6.0f) name(table14) totals(N)

quietly: table (ig_a02esp) (vi_a09_15) if vi_a09_15!=. | vi_a09_15sis1!=. | vi_a09_15sis2!=. | vi_a09_15sis3!=. | vi_a09_15sis4!=. | vi_a09_15sis5!=., statistic(percent, across(vi_a09_15)) nformat(%6.1f) name(table14) totals(vi_a09_15) append

quietly: table (ig_a02esp) (vi_a09_15sis1) if vi_a09_15!=. | vi_a09_15sis1!=. | vi_a09_15sis2!=. | vi_a09_15sis3!=. | vi_a09_15sis4!=. | vi_a09_15sis5!=., statistic(percent, across(vi_a09_15sis1)) nformat(%6.1f) name(table14) totals(vi_a09_15sis1) append

quietly: table (ig_a02esp) (vi_a09_15sis2) if vi_a09_15!=. | vi_a09_15sis1!=. | vi_a09_15sis2!=. | vi_a09_15sis3!=. | vi_a09_15sis4!=. | vi_a09_15sis5!=., statistic(percent, across(vi_a09_15sis2)) nformat(%6.1f) name(table14) totals(vi_a09_15sis2) append

quietly: table (ig_a02esp) (vi_a09_15sis3) if vi_a09_15!=. | vi_a09_15sis1!=. | vi_a09_15sis2!=. | vi_a09_15sis3!=. | vi_a09_15sis4!=. | vi_a09_15sis5!=., statistic(percent, across(vi_a09_15sis3)) nformat(%6.1f) name(table14) totals(vi_a09_15sis3) append

quietly: table (ig_a02esp) (vi_a09_15sis4) if vi_a09_15!=. | vi_a09_15sis1!=. | vi_a09_15sis2!=. | vi_a09_15sis3!=. | vi_a09_15sis4!=. | vi_a09_15sis5!=., statistic(percent, across(vi_a09_15sis4)) nformat(%6.1f) name(table14) totals(vi_a09_15sis4) append

quietly: table (ig_a02esp) (vi_a09_15sis5) if vi_a09_15!=. | vi_a09_15sis1!=. | vi_a09_15sis2!=. | vi_a09_15sis3!=. | vi_a09_15sis4!=. | vi_a09_15sis5!=., statistic(percent, across(vi_a09_15sis5)) nformat(%6.1f) name(table14) totals(vi_a09_15sis5) append

collect layout (ig_a02esp) (N vi_a09_15 vi_a09_15sis1[1] vi_a09_15sis2[1] vi_a09_15sis3[1] vi_a09_15sis4[1] vi_a09_15sis5[1]) 

collect style header N, level(hide)
collect style header vi_a09_15sis1, level(hide)
collect style header vi_a09_15sis2, level(hide)
collect style header vi_a09_15sis3, level(hide)
collect style header vi_a09_15sis4, level(hide)
collect style header vi_a09_15sis5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 24: Type of electronic system used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a09_15env!=., statistic(frequency) nformat(%6.0f) name(table14_1) totals(N)
quietly: table (ig_a02esp) (vi_a09_15env) if vi_a09_15env!=., statistic(percent, across(vi_a09_15env)) nformat(%6.1f) name(table14_1) totals(vi_a09_15env) append 

collect layout (ig_a02esp) (N vi_a09_15env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 25: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a09_15cal1!=. | vi_a09_15cal2!=. | vi_a09_15cal3!=. | vi_a09_15cal4!=., statistic(frequency) nformat(%6.0f) name(table15) totals(N)

quietly: table (ig_a02esp) (vi_a09_15cal1) if vi_a09_15cal1!=. | vi_a09_15cal2!=. | vi_a09_15cal3!=. | vi_a09_15cal4!=., statistic(percent, across(vi_a09_15cal1)) nformat(%6.1f) name(table15) totals(vi_a09_15cal1) append

quietly: table (ig_a02esp) (vi_a09_15cal2) if vi_a09_15cal1!=. | vi_a09_15cal2!=. | vi_a09_15cal3!=. | vi_a09_15cal4!=., statistic(percent, across(vi_a09_15cal2)) nformat(%6.1f) name(table15) totals(vi_a09_15cal2) append

quietly: table (ig_a02esp) (vi_a09_15cal3) if vi_a09_15cal1!=. | vi_a09_15cal2!=. | vi_a09_15cal3!=. | vi_a09_15cal4!=., statistic(percent, across(vi_a09_15cal3)) nformat(%6.1f) name(table15) totals(vi_a09_15cal3) append

quietly: table (ig_a02esp) (vi_a09_15cal4) if vi_a09_15cal1!=. | vi_a09_15cal2!=. | vi_a09_15cal3!=. | vi_a09_15cal4!=., statistic(percent, across(vi_a09_15cal4)) nformat(%6.1f) name(table15) totals(vi_a09_15cal4) append

collect layout (ig_a02esp) (N vi_a09_15cal1[1] vi_a09_15cal2[1] vi_a09_15cal3[1] vi_a09_15cal4[1]) 

collect style header N, level(hide)
collect style header vi_a09_15cal1, level(hide)
collect style header vi_a09_15cal2, level(hide)
collect style header vi_a09_15cal3, level(hide)
collect style header vi_a09_15cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 26: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a09_15frec!=., statistic(frequency) nformat(%6.0f) name(table15_1) totals(N)
quietly: table (ig_a02esp) (vi_a09_15frec) if vi_a09_15frec!=., statistic(percent, across(vi_a09_15frec)) nformat(%6.1f) name(table15_1) totals(vi_a09_15frec) append

collect layout (ig_a02esp) (N vi_a09_15frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 27: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a09_15resp!=., statistic(frequency) nformat(%6.0f) name(table15_2) totals(N)
quietly: table (ig_a02esp) (vi_a09_15resp) if vi_a09_15resp!=., statistic(percent, across(vi_a09_15resp)) nformat(%6.1f) name(table15_2) totals(vi_a09_15resp) append

collect layout (ig_a02esp) (N vi_a09_15resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 28: Responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected using paper")

///////
quietly: table (ig_a02esp) (N) if vi_a09_16!=. | vi_a09_16quien!=., statistic(frequency) nformat(%6.0f) name(table16) totals(N)

quietly: table (ig_a02esp) (vi_a09_16) if vi_a09_16!=. | vi_a09_16quien!=., statistic(percent, across(vi_a09_16)) nformat(%6.1f) name(table16) totals(vi_a09_16) append
 
quietly: table (ig_a02esp) (vi_a09_16quien) if vi_a09_16!=. | vi_a09_16quien!=., statistic(percent, across(vi_a09_16quien)) nformat(%6.1f) name(table16) totals(vi_a09_16quien) append

collect layout (ig_a02esp) (N vi_a09_16 vi_a09_16quien) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 29: The data is collected using paper and who provides the record or form used to collect patient data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a09_16env!=., statistic(frequency) nformat(%6.0f) name(table16_1) totals(N)
quietly: table (ig_a02esp) (vi_a09_16env) if vi_a09_16env!=., statistic(percent, across(vi_a09_16env)) nformat(%6.1f) name(table16_1) totals(vi_a09_16env) append

collect layout (ig_a02esp) (N vi_a09_16env) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 30: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a09_16cal1!=. | vi_a09_16cal2!=. | vi_a09_16cal3!=. | vi_a09_16cal4!=., statistic(frequency) nformat(%6.0f) name(table17) totals(N)

quietly: table (ig_a02esp) (vi_a09_16cal1) if vi_a09_16cal1!=. | vi_a09_16cal2!=. | vi_a09_16cal3!=. | vi_a09_16cal4!=., statistic(percent, across(vi_a09_16cal1)) nformat(%6.1f) name(table17) totals(vi_a09_16cal1) append
 
quietly: table (ig_a02esp) (vi_a09_16cal2) if vi_a09_16cal1!=. | vi_a09_16cal2!=. | vi_a09_16cal3!=. | vi_a09_16cal4!=., statistic(percent, across(vi_a09_16cal2)) nformat(%6.1f) name(table17) totals(vi_a09_16cal2) append

quietly: table (ig_a02esp) (vi_a09_16cal3) if vi_a09_16cal1!=. | vi_a09_16cal2!=. | vi_a09_16cal3!=. | vi_a09_16cal4!=., statistic(percent, across(vi_a09_16cal3)) nformat(%6.1f) name(table17) totals(vi_a09_16cal3) append

quietly: table (ig_a02esp) (vi_a09_16cal4) if vi_a09_16cal1!=. | vi_a09_16cal2!=. | vi_a09_16cal3!=. | vi_a09_16cal4!=., statistic(percent, across(vi_a09_16cal4)) nformat(%6.1f) name(table17) totals(vi_a09_16cal4) append

collect layout (ig_a02esp) (N vi_a09_16cal1[1] vi_a09_16cal2[1] vi_a09_16cal3[1] vi_a09_16cal4[1]) 

collect style header N, level(hide)
collect style header vi_a09_16cal1, level(hide)
collect style header vi_a09_16cal2, level(hide)
collect style header vi_a09_16cal3, level(hide)
collect style header vi_a09_16cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 31: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a09_16frec!=., statistic(frequency) nformat(%6.0f) name(table17_1) totals(N)
quietly: table (ig_a02esp) (vi_a09_16frec) if vi_a09_16frec!=., statistic(percent, across(vi_a09_16frec)) nformat(%6.1f) name(table17_1) totals(vi_a09_16frec) append

collect layout (ig_a02esp) (N vi_a09_16frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 32: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a09_16resp!=., statistic(frequency) nformat(%6.0f) name(table17_2) totals(N)
quietly: table (ig_a02esp) (vi_a09_16resp) if vi_a09_16resp!=., statistic(percent, across(vi_a09_16resp)) nformat(%6.1f) name(table17_2) totals(vi_a09_16resp) append

collect layout (ig_a02esp) (N vi_a09_16resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 33: Who is responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.3 Indicator-Based Surveillance")

////////
quietly: table (ig_a02esp) (N) if vi_a10!=. | vi_a10_10!=. | vi_a10_11!=., statistic(frequency) nformat(%6.0f) name(table18) totals(N)
quietly: table (ig_a02esp) (vi_a10) if vi_a10!=. | vi_a10_10!=. | vi_a10_11!=., statistic(percent, across(vi_a10)) nformat(%6.1f) name(table18) totals(vi_a10) append
quietly: table (ig_a02esp) (vi_a10_10) if vi_a10!=. | vi_a10_10!=. | vi_a10_11!=., statistic(percent, across(vi_a10_10)) nformat(%6.1f) name(table18) totals(vi_a10_10) append
quietly: table (ig_a02esp) (vi_a10_11) if vi_a10!=. | vi_a10_10!=. | vi_a10_11!=., statistic(percent, across(vi_a10_11)) nformat(%6.1f) name(table18) totals(vi_a10_11) append

collect layout (ig_a02esp) (N vi_a10 vi_a10_10[1] vi_a10_11[1])
collect style header N, level(hide)
collect style header vi_a10_10, level(hide)
collect style header vi_a10_11, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 34: Characteristics of Indicator-Based Surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected electronically")

///////
quietly: table (ig_a02esp) (N) if vi_a10_15!=. | vi_a10_15sis1!=. | vi_a10_15sis2!=. | vi_a10_15sis3!=. | vi_a10_15sis4!=. | vi_a10_15sis5!=., statistic(frequency) nformat(%6.0f) name(table19) totals(N)

quietly: table (ig_a02esp) (vi_a10_15) if vi_a10_15!=. | vi_a10_15sis1!=. | vi_a10_15sis2!=. | vi_a10_15sis3!=. | vi_a10_15sis4!=. | vi_a10_15sis5!=., statistic(percent, across(vi_a10_15)) nformat(%6.1f) name(table19) totals(vi_a10_15) append

quietly: table (ig_a02esp) (vi_a10_15sis1) if vi_a10_15!=. | vi_a10_15sis1!=. | vi_a10_15sis2!=. | vi_a10_15sis3!=. | vi_a10_15sis4!=. | vi_a10_15sis5!=., statistic(percent, across(vi_a10_15sis1)) nformat(%6.1f) name(table19) totals(vi_a10_15sis1) append

quietly: table (ig_a02esp) (vi_a10_15sis2) if vi_a10_15!=. | vi_a10_15sis1!=. | vi_a10_15sis2!=. | vi_a10_15sis3!=. | vi_a10_15sis4!=. | vi_a10_15sis5!=., statistic(percent, across(vi_a10_15sis2)) nformat(%6.1f) name(table19) totals(vi_a10_15sis2) append

quietly: table (ig_a02esp) (vi_a10_15sis3) if vi_a10_15!=. | vi_a10_15sis1!=. | vi_a10_15sis2!=. | vi_a10_15sis3!=. | vi_a10_15sis4!=. | vi_a10_15sis5!=., statistic(percent, across(vi_a10_15sis3)) nformat(%6.1f) name(table19) totals(vi_a10_15sis3) append

quietly: table (ig_a02esp) (vi_a10_15sis4) if vi_a10_15!=. | vi_a10_15sis1!=. | vi_a10_15sis2!=. | vi_a10_15sis3!=. | vi_a10_15sis4!=. | vi_a10_15sis5!=., statistic(percent, across(vi_a10_15sis4)) nformat(%6.1f) name(table19) totals(vi_a10_15sis4) append

quietly: table (ig_a02esp) (vi_a10_15sis5) if vi_a10_15!=. | vi_a10_15sis1!=. | vi_a10_15sis2!=. | vi_a10_15sis3!=. | vi_a10_15sis4!=. | vi_a10_15sis5!=., statistic(percent, across(vi_a10_15sis5)) nformat(%6.1f) name(table19) totals(vi_a10_15sis5) append

collect layout (ig_a02esp) (N vi_a10_15 vi_a10_15sis1[1] vi_a10_15sis2[1] vi_a10_15sis3[1] vi_a10_15sis4[1] vi_a10_15sis5[1]) 

collect style header N, level(hide)
collect style header vi_a10_15sis1, level(hide)
collect style header vi_a10_15sis2, level(hide)
collect style header vi_a10_15sis3, level(hide)
collect style header vi_a10_15sis4, level(hide)
collect style header vi_a10_15sis5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 35: Type of electronic system used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a10_15env!=., statistic(frequency) nformat(%6.0f) name(table19_1) totals(N)

quietly: table (ig_a02esp) (vi_a10_15env) if vi_a10_15env!=., statistic(percent, across(vi_a10_15env)) nformat(%6.1f) name(table19_1) totals(vi_a10_15env) append

collect layout (ig_a02esp) (N vi_a10_15env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 36: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a10_15cal1!=. | vi_a10_15cal2!=. | vi_a10_15cal3!=. | vi_a10_15cal4!=., statistic(frequency) nformat(%6.0f) name(table20) totals(N)

quietly: table (ig_a02esp) (vi_a10_15cal1) if vi_a10_15cal1!=. | vi_a10_15cal2!=. | vi_a10_15cal3!=. | vi_a10_15cal4!=., statistic(percent, across(vi_a10_15cal1)) nformat(%6.1f) name(table20) totals(vi_a10_15cal1) append

quietly: table (ig_a02esp) (vi_a10_15cal2) if vi_a10_15cal1!=. | vi_a10_15cal2!=. | vi_a10_15cal3!=. | vi_a10_15cal4!=., statistic(percent, across(vi_a10_15cal2)) nformat(%6.1f) name(table20) totals(vi_a10_15cal2) append

quietly: table (ig_a02esp) (vi_a10_15cal3) if vi_a10_15cal1!=. | vi_a10_15cal2!=. | vi_a10_15cal3!=. | vi_a10_15cal4!=., statistic(percent, across(vi_a10_15cal3)) nformat(%6.1f) name(table20) totals(vi_a10_15cal3) append

quietly: table (ig_a02esp) (vi_a10_15cal4) if vi_a10_15cal1!=. | vi_a10_15cal2!=. | vi_a10_15cal3!=. | vi_a10_15cal4!=., statistic(percent, across(vi_a10_15cal4)) nformat(%6.1f) name(table20) totals(vi_a10_15cal4) append

collect layout (ig_a02esp) (N vi_a10_15cal1[1] vi_a10_15cal2[1] vi_a10_15cal3[1] vi_a10_15cal4[1]) 

collect style header N, level(hide)
collect style header vi_a10_15cal1, level(hide)
collect style header vi_a10_15cal2, level(hide)
collect style header vi_a10_15cal3, level(hide)
collect style header vi_a10_15cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 37: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a10_15frec!=., statistic(frequency) nformat(%6.0f) name(table20_1) totals(N)

quietly: table (ig_a02esp) (vi_a10_15frec) if vi_a10_15frec!=., statistic(percent, across(vi_a10_15frec)) nformat(%6.1f) name(table20_1) totals(vi_a10_15frec) append

collect layout (ig_a02esp) (N vi_a10_15frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 38: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a10_15resp!=., statistic(frequency) nformat(%6.0f) name(table20_2) totals(N)

quietly: table (ig_a02esp) (vi_a10_15resp) if vi_a10_15resp!=., statistic(percent, across(vi_a10_15resp)) nformat(%6.1f) name(table20_2) totals(vi_a10_15resp) append

collect layout (ig_a02esp) (N vi_a10_15resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 39: Responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected using paper")

/////
quietly: table (ig_a02esp) (N) if vi_a10_16!=. | vi_a10_16quien!=., statistic(frequency) nformat(%6.0f) name(table21) totals(N)

quietly: table (ig_a02esp) (vi_a10_16) if vi_a10_16!=. | vi_a10_16quien!=., statistic(percent, across(vi_a10_16)) nformat(%6.1f) name(table21) totals(vi_a10_16) append

quietly: table (ig_a02esp) (vi_a10_16quien) if vi_a10_16!=. | vi_a10_16quien!=., statistic(percent, across(vi_a10_16quien)) nformat(%6.1f) name(table21) totals(vi_a10_16quien) append

collect layout (ig_a02esp) (N vi_a10_16 vi_a10_16quien) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 40: The data is collected using paper and who provides the record or form used to collect patient data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a10_16env!=., statistic(frequency) nformat(%6.0f) name(table21_1) totals(N)
quietly: table (ig_a02esp) (vi_a10_16env) if vi_a10_16env!=., statistic(percent, across(vi_a10_16env)) nformat(%6.1f) name(table21_1) totals(vi_a10_16env) append

collect layout (ig_a02esp) (N vi_a10_16env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 41: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a10_16cal1!=. | vi_a10_16cal2!=. | vi_a10_16cal3!=. | vi_a10_16cal4!=., statistic(frequency) nformat(%6.0f) name(table22) totals(N)

quietly: table (ig_a02esp) (vi_a10_16cal1) if vi_a10_16cal1!=. | vi_a10_16cal2!=. | vi_a10_16cal3!=. | vi_a10_16cal4!=., statistic(percent, across(vi_a10_16cal1)) nformat(%6.1f) name(table22) totals(vi_a10_16cal1) append
 
quietly: table (ig_a02esp) (vi_a10_16cal2) if vi_a10_16cal1!=. | vi_a10_16cal2!=. | vi_a10_16cal3!=. | vi_a10_16cal4!=., statistic(percent, across(vi_a10_16cal2)) nformat(%6.1f) name(table22) totals(vi_a10_16cal2) append

quietly: table (ig_a02esp) (vi_a10_16cal3) if vi_a10_16cal1!=. | vi_a10_16cal2!=. | vi_a10_16cal3!=. | vi_a10_16cal4!=., statistic(percent, across(vi_a10_16cal3)) nformat(%6.1f) name(table22) totals(vi_a10_16cal3) append

quietly: table (ig_a02esp) (vi_a10_16cal4) if vi_a10_16cal1!=. | vi_a10_16cal2!=. | vi_a10_16cal3!=. | vi_a10_16cal4!=., statistic(percent, across(vi_a10_16cal4)) nformat(%6.1f) name(table22) totals(vi_a10_16cal4) append

collect layout (ig_a02esp) (N vi_a10_16cal1[1] vi_a10_16cal2[1] vi_a10_16cal3[1] vi_a10_16cal4[1]) 

collect style header N, level(hide)
collect style header vi_a10_16cal1, level(hide)
collect style header vi_a10_16cal2, level(hide)
collect style header vi_a10_16cal3, level(hide)
collect style header vi_a10_16cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 42: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a10_16frec!=., statistic(frequency) nformat(%6.0f) name(table22_1) totals(N)
quietly: table (ig_a02esp) (vi_a10_16frec) if vi_a10_16frec!=., statistic(percent, across(vi_a10_16frec)) nformat(%6.1f) name(table22_1) totals(vi_a10_16frec) append 

collect layout (ig_a02esp) (N vi_a10_16frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 43: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a10_16resp!=., statistic(frequency) nformat(%6.0f) name(table22_2) totals(N)
quietly: table (ig_a02esp) (vi_a10_16resp) if vi_a10_16resp!=., statistic(percent, across(vi_a10_16resp)) nformat(%6.1f) name(table22_2) totals(vi_a10_16resp) append

collect layout (ig_a02esp) (N vi_a10_16resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 44: Who is responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.4 Event-Based Surveillance")

//////
quietly: table (ig_a02esp) (N) if vi_a11!=. | vi_a11_10!=. | vi_a11_11!=., statistic(frequency) nformat(%6.0f) name(table23) totals(N)

quietly: table (ig_a02esp) (vi_a11) if vi_a11!=. | vi_a11_10!=. | vi_a11_11!=., statistic(percent, across(vi_a11)) nformat(%6.1f) name(table23) totals(vi_a11) append

quietly: table (ig_a02esp) (vi_a11_10) if vi_a11!=. | vi_a11_10!=. | vi_a11_11!=., statistic(percent, across(vi_a11_10)) nformat(%6.1f) name(table23) totals(vi_a11_10) append

quietly: table (ig_a02esp) (vi_a11_11) if vi_a11!=. | vi_a11_10!=. | vi_a11_11!=., statistic(percent, across(vi_a11_11)) nformat(%6.1f) name(table23) totals(vi_a11_11) append

collect layout (ig_a02esp) (N vi_a11 vi_a11_10[1] vi_a11_11[1])

collect style header N, level(hide)
collect style header vi_a11_10, level(hide)
collect style header vi_a11_11, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 45: Characteristics of Event-Based Surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected electronically")

///////
quietly: table (ig_a02esp) (N) if vi_a11_15!=. | vi_a11_15sis1!=. | vi_a11_15sis2!=. | vi_a11_15sis3!=. | vi_a11_15sis4!=. | vi_a11_15sis5!=., statistic(frequency) nformat(%6.0f) name(table24) totals(N)

quietly: table (ig_a02esp) (vi_a11_15) if vi_a11_15!=. | vi_a11_15sis1!=. | vi_a11_15sis2!=. | vi_a11_15sis3!=. | vi_a11_15sis4!=. | vi_a11_15sis5!=., statistic(percent, across(vi_a11_15)) nformat(%6.1f) name(table24) totals(vi_a11_15) append

quietly: table (ig_a02esp) (vi_a11_15sis1) if vi_a11_15!=. | vi_a11_15sis1!=. | vi_a11_15sis2!=. | vi_a11_15sis3!=. | vi_a11_15sis4!=. | vi_a11_15sis5!=., statistic(percent, across(vi_a11_15sis1)) nformat(%6.1f) name(table24) totals(vi_a11_15sis1) append

quietly: table (ig_a02esp) (vi_a11_15sis2) if vi_a11_15!=. | vi_a11_15sis1!=. | vi_a11_15sis2!=. | vi_a11_15sis3!=. | vi_a11_15sis4!=. | vi_a11_15sis5!=., statistic(percent, across(vi_a11_15sis2)) nformat(%6.1f) name(table24) totals(vi_a11_15sis2) append

quietly: table (ig_a02esp) (vi_a11_15sis3) if vi_a11_15!=. | vi_a11_15sis1!=. | vi_a11_15sis2!=. | vi_a11_15sis3!=. | vi_a11_15sis4!=. | vi_a11_15sis5!=., statistic(percent, across(vi_a11_15sis3)) nformat(%6.1f) name(table24) totals(vi_a11_15sis3) append

quietly: table (ig_a02esp) (vi_a11_15sis4) if vi_a11_15!=. | vi_a11_15sis1!=. | vi_a11_15sis2!=. | vi_a11_15sis3!=. | vi_a11_15sis4!=. | vi_a11_15sis5!=., statistic(percent, across(vi_a11_15sis4)) nformat(%6.1f) name(table24) totals(vi_a11_15sis4) append

quietly: table (ig_a02esp) (vi_a11_15sis5) if vi_a11_15!=. | vi_a11_15sis1!=. | vi_a11_15sis2!=. | vi_a11_15sis3!=. | vi_a11_15sis4!=. | vi_a11_15sis5!=., statistic(percent, across(vi_a11_15sis5)) nformat(%6.1f) name(table24) totals(vi_a11_15sis5) append

collect layout (ig_a02esp) (N vi_a11_15 vi_a11_15sis1[1] vi_a11_15sis2[1] vi_a11_15sis3[1] vi_a11_15sis4[1] vi_a11_15sis5[1]) 

collect style header N, level(hide)
collect style header vi_a11_15sis1, level(hide)
collect style header vi_a11_15sis2, level(hide)
collect style header vi_a11_15sis3, level(hide)
collect style header vi_a11_15sis4, level(hide)
collect style header vi_a11_15sis5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 46: Type of electronic system used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a11_15env!=., statistic(frequency) nformat(%6.0f) name(table24_1) totals(N)
quietly: table (ig_a02esp) (vi_a11_15env) if vi_a11_15env!=., statistic(percent, across(vi_a11_15env)) nformat(%6.1f) name(table24_1) totals(vi_a11_15env) append

collect layout (ig_a02esp) (N vi_a11_15env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 47: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a11_15cal1!=. | vi_a11_15cal2!=. | vi_a11_15cal3!=. | vi_a11_15cal4!=., statistic(frequency) nformat(%6.0f) name(table25) totals(N)

quietly: table (ig_a02esp) (vi_a11_15cal1) if vi_a11_15cal1!=. | vi_a11_15cal2!=. | vi_a11_15cal3!=. | vi_a11_15cal4!=., statistic(percent, across(vi_a11_15cal1)) nformat(%6.1f) name(table25) totals(vi_a11_15cal1) append

quietly: table (ig_a02esp) (vi_a11_15cal2) if vi_a11_15cal1!=. | vi_a11_15cal2!=. | vi_a11_15cal3!=. | vi_a11_15cal4!=., statistic(percent, across(vi_a11_15cal2)) nformat(%6.1f) name(table25) totals(vi_a11_15cal2) append

quietly: table (ig_a02esp) (vi_a11_15cal3) if vi_a11_15cal1!=. | vi_a11_15cal2!=. | vi_a11_15cal3!=. | vi_a11_15cal4!=., statistic(percent, across(vi_a11_15cal3)) nformat(%6.1f) name(table25) totals(vi_a11_15cal3) append

quietly: table (ig_a02esp) (vi_a11_15cal4) if vi_a11_15cal1!=. | vi_a11_15cal2!=. | vi_a11_15cal3!=. | vi_a11_15cal4!=., statistic(percent, across(vi_a11_15cal4)) nformat(%6.1f) name(table25) totals(vi_a11_15cal4) append

collect layout (ig_a02esp) (N vi_a11_15cal1[1] vi_a11_15cal2[1] vi_a11_15cal3[1] vi_a11_15cal4[1]) 

collect style header N, level(hide)
collect style header vi_a11_15cal1, level(hide)
collect style header vi_a11_15cal2, level(hide)
collect style header vi_a11_15cal3, level(hide)
collect style header vi_a11_15cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 48: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a11_15frec!=., statistic(frequency) nformat(%6.0f) name(table25_1) totals(N)

quietly: table (ig_a02esp) (vi_a11_15frec) if vi_a11_15frec!=., statistic(percent, across(vi_a11_15frec)) nformat(%6.1f) name(table25_1) totals(vi_a11_15frec) append

collect layout (ig_a02esp) (N vi_a11_15frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 49: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a11_15resp!=., statistic(frequency) nformat(%6.0f) name(table25_2) totals(N)
quietly: table (ig_a02esp) (vi_a11_15resp) if vi_a11_15resp!=., statistic(percent, across(vi_a11_15resp)) nformat(%6.1f) name(table25_2) totals(vi_a11_15resp) append

collect layout (ig_a02esp) (N vi_a11_15resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 50: Responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected using paper")

/////
quietly: table (ig_a02esp) (N) if vi_a11_16!=. | vi_a11_16quien!=., statistic(frequency) nformat(%6.0f) name(table26) totals(N)

quietly: table (ig_a02esp) (vi_a11_16) if vi_a11_16!=. | vi_a11_16quien!=., statistic(percent, across(vi_a11_16)) nformat(%6.1f) name(table26) totals(vi_a11_16) append

quietly: table (ig_a02esp) (vi_a11_16quien) if vi_a11_16!=. | vi_a11_16quien!=., statistic(percent, across(vi_a11_16quien)) nformat(%6.1f) name(table26) totals(vi_a11_16quien) append

collect layout (ig_a02esp) (N vi_a11_16 vi_a11_16quien) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 51: The data is collected using paper and who provides the record or form used to collect patient data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a11_16env!=., statistic(frequency) nformat(%6.0f) name(table26_1) totals(N)
quietly: table (ig_a02esp) (vi_a11_16env) if vi_a11_16env!=., statistic(percent, across(vi_a11_16env)) nformat(%6.1f) name(table26_1) totals(vi_a11_16env) append

collect layout (ig_a02esp) (N vi_a11_16 vi_a11_16env) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 52: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a11_16cal1!=. | vi_a11_16cal2!=. | vi_a11_16cal3!=. | vi_a11_16cal4!=., statistic(frequency) nformat(%6.0f) name(table27) totals(N)

quietly: table (ig_a02esp) (vi_a11_16cal1) if vi_a11_16cal1!=. | vi_a11_16cal2!=. | vi_a11_16cal3!=. | vi_a11_16cal4!=., statistic(percent, across(vi_a11_16cal1)) nformat(%6.1f) name(table27) totals(vi_a11_16cal1) append

quietly: table (ig_a02esp) (vi_a11_16cal2) if vi_a11_16cal1!=. | vi_a11_16cal2!=. | vi_a11_16cal3!=. | vi_a11_16cal4!=., statistic(percent, across(vi_a11_16cal2)) nformat(%6.1f) name(table27) totals(vi_a11_16cal2) append

quietly: table (ig_a02esp) (vi_a11_16cal3) if vi_a11_16cal1!=. | vi_a11_16cal2!=. | vi_a11_16cal3!=. | vi_a11_16cal4!=., statistic(percent, across(vi_a11_16cal3)) nformat(%6.1f) name(table27) totals(vi_a11_16cal3) append

quietly: table (ig_a02esp) (vi_a11_16cal4) if vi_a11_16cal1!=. | vi_a11_16cal2!=. | vi_a11_16cal3!=. | vi_a11_16cal4!=., statistic(percent, across(vi_a11_16cal4)) nformat(%6.1f) name(table27) totals(vi_a11_16cal4) append

collect layout (ig_a02esp) (N vi_a11_16cal1[1] vi_a11_16cal2[1] vi_a11_16cal3[1] vi_a11_16cal4[1]) 

collect style header N, level(hide)
collect style header vi_a11_16cal1, level(hide)
collect style header vi_a11_16cal2, level(hide)
collect style header vi_a11_16cal3, level(hide)
collect style header vi_a11_16cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 53: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a11_16frec!=., statistic(frequency) nformat(%6.0f) name(table27_1) totals(N)
quietly: table (ig_a02esp) (vi_a11_16frec) if vi_a11_16frec!=., statistic(percent, across(vi_a11_16frec)) nformat(%6.1f) name(table27_1) totals(vi_a11_16frec) append

collect layout (ig_a02esp) (N vi_a11_16frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 54: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a11_16resp!=., statistic(frequency) nformat(%6.0f) name(table27_2) totals(N)
quietly: table (ig_a02esp) (vi_a11_16resp) if vi_a11_16resp!=., statistic(percent, across(vi_a11_16resp)) nformat(%6.1f) name(table27_2) totals(vi_a11_16resp) append

collect layout (ig_a02esp) (N vi_a11_16resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 55: Who is responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.5 Community-Based Surveillance")

////////
quietly: table (ig_a02esp) (N) if vi_a12!=. | vi_a12_10!=. | vi_a12_11!=., statistic(frequency) nformat(%6.0f) name(table28) totals(N)

quietly: table (ig_a02esp) (vi_a12) if vi_a12!=. | vi_a12_10!=. | vi_a12_11!=., statistic(percent, across(vi_a12)) nformat(%6.1f) name(table28) totals(vi_a12) append

quietly: table (ig_a02esp) (vi_a12_10) if vi_a12!=. | vi_a12_10!=. | vi_a12_11!=., statistic(percent, across(vi_a12_10)) nformat(%6.1f) name(table28) totals(vi_a12_10) append

quietly: table (ig_a02esp) (vi_a12_11) if vi_a12!=. | vi_a12_10!=. | vi_a12_11!=., statistic(percent, across(vi_a12_11)) nformat(%6.1f) name(table28) totals(vi_a12_11) append

collect layout (ig_a02esp) (N vi_a12 vi_a12_10[1] vi_a12_11[1])

collect style header N, level(hide)
collect style header vi_a12_10, level(hide)
collect style header vi_a12_11, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 56: Characteristics of Community-Based Surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected electronically")

/////
quietly: table (ig_a02esp) (N) if vi_a12_15!=. | vi_a12_15sis1!=. | vi_a12_15sis2!=. | vi_a12_15sis3!=. | vi_a12_15sis4!=. | vi_a12_15sis5!=., statistic(frequency) nformat(%6.0f) name(table29) totals(N)

quietly: table (ig_a02esp) (vi_a12_15) if vi_a12_15!=. | vi_a12_15sis1!=. | vi_a12_15sis2!=. | vi_a12_15sis3!=. | vi_a12_15sis4!=. | vi_a12_15sis5!=., statistic(percent, across(vi_a12_15)) nformat(%6.1f) name(table29) totals(vi_a12_15) append

quietly: table (ig_a02esp) (vi_a12_15sis1) if vi_a12_15!=. | vi_a12_15sis1!=. | vi_a12_15sis2!=. | vi_a12_15sis3!=. | vi_a12_15sis4!=. | vi_a12_15sis5!=., statistic(percent, across(vi_a12_15sis1)) nformat(%6.1f) name(table29) totals(vi_a12_15sis1) append

quietly: table (ig_a02esp) (vi_a12_15sis2) if vi_a12_15!=. | vi_a12_15sis1!=. | vi_a12_15sis2!=. | vi_a12_15sis3!=. | vi_a12_15sis4!=. | vi_a12_15sis5!=., statistic(percent, across(vi_a12_15sis2)) nformat(%6.1f) name(table29) totals(vi_a12_15sis2) append

quietly: table (ig_a02esp) (vi_a12_15sis3) if vi_a12_15!=. | vi_a12_15sis1!=. | vi_a12_15sis2!=. | vi_a12_15sis3!=. | vi_a12_15sis4!=. | vi_a12_15sis5!=., statistic(percent, across(vi_a12_15sis3)) nformat(%6.1f) name(table29) totals(vi_a12_15sis3) append

quietly: table (ig_a02esp) (vi_a12_15sis4) if vi_a12_15!=. | vi_a12_15sis1!=. | vi_a12_15sis2!=. | vi_a12_15sis3!=. | vi_a12_15sis4!=. | vi_a12_15sis5!=., statistic(percent, across(vi_a12_15sis4)) nformat(%6.1f) name(table29) totals(vi_a12_15sis4) append

quietly: table (ig_a02esp) (vi_a12_15sis5) if vi_a12_15!=. | vi_a12_15sis1!=. | vi_a12_15sis2!=. | vi_a12_15sis3!=. | vi_a12_15sis4!=. | vi_a12_15sis5!=., statistic(percent, across(vi_a12_15sis5)) nformat(%6.1f) name(table29) totals(vi_a12_15sis5) append

collect layout (ig_a02esp) (N vi_a12_15 vi_a12_15sis1[1] vi_a12_15sis2[1] vi_a12_15sis3[1] vi_a12_15sis4[1] vi_a12_15sis5[1]) 

collect style header N, level(hide)
collect style header vi_a12_15sis1, level(hide)
collect style header vi_a12_15sis2, level(hide)
collect style header vi_a12_15sis3, level(hide)
collect style header vi_a12_15sis4, level(hide)
collect style header vi_a12_15sis5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 57: Type of electronic system used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a12_15env!=., statistic(frequency) nformat(%6.0f) name(table29_1) totals(N)
quietly: table (ig_a02esp) (vi_a12_15env) if vi_a12_15env!=., statistic(percent, across(vi_a12_15env)) nformat(%6.1f) name(table29_1) totals(vi_a12_15env) append

collect layout (ig_a02esp) (N vi_a12_15env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 58: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a12_15cal1!=. | vi_a12_15cal2!=. | vi_a12_15cal3!=. | vi_a12_15cal4!=., statistic(frequency) nformat(%6.0f) name(table30) totals(N)

quietly: table (ig_a02esp) (vi_a12_15cal1) if vi_a12_15cal1!=. | vi_a12_15cal2!=. | vi_a12_15cal3!=. | vi_a12_15cal4!=., statistic(percent, across(vi_a12_15cal1)) nformat(%6.1f) name(table30) totals(vi_a12_15cal1) append

quietly: table (ig_a02esp) (vi_a12_15cal2) if vi_a12_15cal1!=. | vi_a12_15cal2!=. | vi_a12_15cal3!=. | vi_a12_15cal4!=., statistic(percent, across(vi_a12_15cal2)) nformat(%6.1f) name(table30) totals(vi_a12_15cal2) append

quietly: table (ig_a02esp) (vi_a12_15cal3) if vi_a12_15cal1!=. | vi_a12_15cal2!=. | vi_a12_15cal3!=. | vi_a12_15cal4!=., statistic(percent, across(vi_a12_15cal3)) nformat(%6.1f) name(table30) totals(vi_a12_15cal3) append

quietly: table (ig_a02esp) (vi_a12_15cal4) if vi_a12_15cal1!=. | vi_a12_15cal2!=. | vi_a12_15cal3!=. | vi_a12_15cal4!=., statistic(percent, across(vi_a12_15cal4)) nformat(%6.1f) name(table30) totals(vi_a12_15cal4) append

collect layout (ig_a02esp) (N vi_a12_15cal1[1] vi_a12_15cal2[1] vi_a12_15cal3[1] vi_a12_15cal4[1]) 

collect style header N, level(hide)
collect style header vi_a12_15cal1, level(hide)
collect style header vi_a12_15cal2, level(hide)
collect style header vi_a12_15cal3, level(hide)
collect style header vi_a12_15cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 59: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a12_15frec!=., statistic(frequency) nformat(%6.0f) name(table30_1) totals(N)
quietly: table (ig_a02esp) (vi_a12_15frec) if vi_a12_15frec!=., statistic(percent, across(vi_a12_15frec)) nformat(%6.1f) name(table30_1) totals(vi_a12_15frec) append

collect layout (ig_a02esp) (N vi_a12_15frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 60: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a12_15resp!=., statistic(frequency) nformat(%6.0f) name(table30_2) totals(N)

quietly: table (ig_a02esp) (vi_a12_15resp) if vi_a12_15resp!=., statistic(percent, across(vi_a12_15resp)) nformat(%6.1f) name(table30_2) totals(vi_a12_15resp) append

collect layout (ig_a02esp) (N vi_a12_15resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 61: Responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected using paper")

/////
quietly: table (ig_a02esp) (N) if vi_a12_16!=. | vi_a12_16quien!=., statistic(frequency) nformat(%6.0f) name(table31) totals(N)

quietly: table (ig_a02esp) (vi_a12_16) if vi_a12_16!=. | vi_a12_16quien!=., statistic(percent, across(vi_a12_16)) nformat(%6.1f) name(table31) totals(vi_a12_16) append

quietly: table (ig_a02esp) (vi_a12_16quien) if vi_a12_16!=. | vi_a12_16quien!=., statistic(percent, across(vi_a12_16quien)) nformat(%6.1f) name(table31) totals(vi_a12_16quien) append

collect layout (ig_a02esp) (N vi_a12_16 vi_a12_16quien) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 62: The data is collected using paper and who provides the record or form used to collect patient data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a12_16env!=., statistic(frequency) nformat(%6.0f) name(table31_1) totals(N)

quietly: table (ig_a02esp) (vi_a12_16env) if vi_a12_16env!=., statistic(percent, across(vi_a12_16env)) nformat(%6.1f) name(table31_1) totals(vi_a12_16env) append

collect layout (ig_a02esp) (N vi_a12_16env) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 63: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a12_16cal1!=. | vi_a12_16cal2!=. | vi_a12_16cal3!=. | vi_a12_16cal4!=., statistic(frequency) nformat(%6.0f) name(table32) totals(N)

quietly: table (ig_a02esp) (vi_a12_16cal1) if vi_a12_16cal1!=. | vi_a12_16cal2!=. | vi_a12_16cal3!=. | vi_a12_16cal4!=., statistic(percent, across(vi_a12_16cal1)) nformat(%6.1f) name(table32) totals(vi_a12_16cal1) append

quietly: table (ig_a02esp) (vi_a12_16cal2) if vi_a12_16cal1!=. | vi_a12_16cal2!=. | vi_a12_16cal3!=. | vi_a12_16cal4!=., statistic(percent, across(vi_a12_16cal2)) nformat(%6.1f) name(table32) totals(vi_a12_16cal2) append

quietly: table (ig_a02esp) (vi_a12_16cal3) if vi_a12_16cal1!=. | vi_a12_16cal2!=. | vi_a12_16cal3!=. | vi_a12_16cal4!=., statistic(percent, across(vi_a12_16cal3)) nformat(%6.1f) name(table32) totals(vi_a12_16cal3) append

quietly: table (ig_a02esp) (vi_a12_16cal4) if vi_a12_16cal1!=. | vi_a12_16cal2!=. | vi_a12_16cal3!=. | vi_a12_16cal4!=., statistic(percent, across(vi_a12_16cal4)) nformat(%6.1f) name(table32) totals(vi_a12_16cal4) append

collect layout (ig_a02esp) (N vi_a12_16cal1[1] vi_a12_16cal2[1] vi_a12_16cal3[1] vi_a12_16cal4[1]) 

collect style header N, level(hide)
collect style header vi_a12_16cal1, level(hide)
collect style header vi_a12_16cal2, level(hide)
collect style header vi_a12_16cal3, level(hide)
collect style header vi_a12_16cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 64: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a12_16frec!=., statistic(frequency) nformat(%6.0f) name(table32_1) totals(N)

quietly: table (ig_a02esp) (vi_a12_16frec) if vi_a12_16frec!=., statistic(percent, across(vi_a12_16frec)) nformat(%6.1f) name(table32_1) totals(vi_a12_16frec) append

collect layout (ig_a02esp) (N vi_a12_16frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 65: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a12_16resp!=., statistic(frequency) nformat(%6.0f) name(table32_2) totals(N)

quietly: table (ig_a02esp) (vi_a12_16resp) if vi_a12_16resp!=., statistic(percent, across(vi_a12_16resp)) nformat(%6.1f) name(table32_2) totals(vi_a12_16resp) append

collect layout (ig_a02esp) (N vi_a12_16resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 66: Who is responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.6 Syndromic Surveillance")

//////
quietly: table (ig_a02esp) (N) if vi_a13!=. | vi_a13_10!=. | vi_a13_11!=., statistic(frequency) nformat(%6.0f) name(table33) totals(N)

quietly: table (ig_a02esp) (vi_a13) if vi_a13!=. | vi_a13_10!=. | vi_a13_11!=., statistic(percent, across(vi_a13)) nformat(%6.1f) name(table33) totals(vi_a13) append

quietly: table (ig_a02esp) (vi_a13_10) if vi_a13!=. | vi_a13_10!=. | vi_a13_11!=., statistic(percent, across(vi_a13_10)) nformat(%6.1f) name(table33) totals(vi_a13_10) append

quietly: table (ig_a02esp) (vi_a13_11) if vi_a13!=. | vi_a13_10!=. | vi_a13_11!=., statistic(percent, across(vi_a13_11)) nformat(%6.1f) name(table33) totals(vi_a13_11) append

collect layout (ig_a02esp) (N vi_a13 vi_a13_10[1] vi_a13_11[1])

collect style header N, level(hide)
collect style header vi_a13_10, level(hide)
collect style header vi_a13_11, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 67: Characteristics of Syndromic Surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected electronically")

/////
quietly: table (ig_a02esp) (N) if vi_a13_15!=. | vi_a13_15sis1!=. | vi_a13_15sis2!=. | vi_a13_15sis3!=. | vi_a13_15sis4!=. | vi_a13_15sis5!=., statistic(frequency) nformat(%6.0f) name(table34) totals(N)

quietly: table (ig_a02esp) (vi_a13_15) if vi_a13_15!=. | vi_a13_15sis1!=. | vi_a13_15sis2!=. | vi_a13_15sis3!=. | vi_a13_15sis4!=. | vi_a13_15sis5!=., statistic(percent, across(vi_a13_15)) nformat(%6.1f) name(table34) totals(vi_a13_15) append

quietly: table (ig_a02esp) (vi_a13_15sis1) if vi_a13_15!=. | vi_a13_15sis1!=. | vi_a13_15sis2!=. | vi_a13_15sis3!=. | vi_a13_15sis4!=. | vi_a13_15sis5!=., statistic(percent, across(vi_a13_15sis1)) nformat(%6.1f) name(table34) totals(vi_a13_15sis1) append

quietly: table (ig_a02esp) (vi_a13_15sis2) if vi_a13_15!=. | vi_a13_15sis1!=. | vi_a13_15sis2!=. | vi_a13_15sis3!=. | vi_a13_15sis4!=. | vi_a13_15sis5!=., statistic(percent, across(vi_a13_15sis2)) nformat(%6.1f) name(table34) totals(vi_a13_15sis2) append

quietly: table (ig_a02esp) (vi_a13_15sis3) if vi_a13_15!=. | vi_a13_15sis1!=. | vi_a13_15sis2!=. | vi_a13_15sis3!=. | vi_a13_15sis4!=. | vi_a13_15sis5!=., statistic(percent, across(vi_a13_15sis3)) nformat(%6.1f) name(table34) totals(vi_a13_15sis3) append

quietly: table (ig_a02esp) (vi_a13_15sis4) if vi_a13_15!=. | vi_a13_15sis1!=. | vi_a13_15sis2!=. | vi_a13_15sis3!=. | vi_a13_15sis4!=. | vi_a13_15sis5!=., statistic(percent, across(vi_a13_15sis4)) nformat(%6.1f) name(table34) totals(vi_a13_15sis4) append

quietly: table (ig_a02esp) (vi_a13_15sis5) if vi_a13_15!=. | vi_a13_15sis1!=. | vi_a13_15sis2!=. | vi_a13_15sis3!=. | vi_a13_15sis4!=. | vi_a13_15sis5!=., statistic(percent, across(vi_a13_15sis5)) nformat(%6.1f) name(table34) totals(vi_a13_15sis5) append

collect layout (ig_a02esp) (N vi_a13_15 vi_a13_15sis1[1] vi_a13_15sis2[1] vi_a13_15sis3[1] vi_a13_15sis4[1] vi_a13_15sis5[1]) 

collect style header N, level(hide)
collect style header vi_a13_15sis1, level(hide)
collect style header vi_a13_15sis2, level(hide)
collect style header vi_a13_15sis3, level(hide)
collect style header vi_a13_15sis4, level(hide)
collect style header vi_a13_15sis5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 68: Type of electronic system used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a13_15env!=., statistic(frequency) nformat(%6.0f) name(table34_1) totals(N)

quietly: table (ig_a02esp) (vi_a13_15env) if vi_a13_15env!=., statistic(percent, across(vi_a13_15env)) nformat(%6.1f) name(table34_1) totals(vi_a13_15env) append

collect layout (ig_a02esp) (N vi_a13_15env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 69: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a13_15cal1!=. | vi_a13_15cal2!=. | vi_a13_15cal3!=. | vi_a13_15cal4!=., statistic(frequency) nformat(%6.0f) name(table35) totals(N)

quietly: table (ig_a02esp) (vi_a13_15cal1) if vi_a13_15cal1!=. | vi_a13_15cal2!=. | vi_a13_15cal3!=. | vi_a13_15cal4!=., statistic(percent, across(vi_a13_15cal1)) nformat(%6.1f) name(table35) totals(vi_a13_15cal1) append

quietly: table (ig_a02esp) (vi_a13_15cal2) if vi_a13_15cal1!=. | vi_a13_15cal2!=. | vi_a13_15cal3!=. | vi_a13_15cal4!=., statistic(percent, across(vi_a13_15cal2)) nformat(%6.1f) name(table35) totals(vi_a13_15cal2) append

quietly: table (ig_a02esp) (vi_a13_15cal3) if vi_a13_15cal1!=. | vi_a13_15cal2!=. | vi_a13_15cal3!=. | vi_a13_15cal4!=., statistic(percent, across(vi_a13_15cal3)) nformat(%6.1f) name(table35) totals(vi_a13_15cal3) append

quietly: table (ig_a02esp) (vi_a13_15cal4) if vi_a13_15cal1!=. | vi_a13_15cal2!=. | vi_a13_15cal3!=. | vi_a13_15cal4!=., statistic(percent, across(vi_a13_15cal4)) nformat(%6.1f) name(table35) totals(vi_a13_15cal4) append

collect layout (ig_a02esp) (N vi_a13_15cal1[1] vi_a13_15cal2[1] vi_a13_15cal3[1] vi_a13_15cal4[1]) 

collect style header N, level(hide)
collect style header vi_a13_15cal1, level(hide)
collect style header vi_a13_15cal2, level(hide)
collect style header vi_a13_15cal3, level(hide)
collect style header vi_a13_15cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 70: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a13_15frec!=., statistic(frequency) nformat(%6.0f) name(table35_1) totals(N)

quietly: table (ig_a02esp) (vi_a13_15frec) if vi_a13_15frec!=., statistic(percent, across(vi_a13_15frec)) nformat(%6.1f) name(table35_1) totals(vi_a13_15frec) append

collect layout (ig_a02esp) (N vi_a13_15frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 71: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a13_15resp!=., statistic(frequency) nformat(%6.0f) name(table35_2) totals(N)

quietly: table (ig_a02esp) (vi_a13_15resp) if vi_a13_15resp!=., statistic(percent, across(vi_a13_15resp)) nformat(%6.1f) name(table35_2) totals(vi_a13_15resp) append

collect layout (ig_a02esp) (N vi_a13_15resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 72: Responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected using paper")

/////
quietly: table (ig_a02esp) (N) if vi_a13_16!=. | vi_a13_16quien!=., statistic(frequency) nformat(%6.0f) name(table36) totals(N)

quietly: table (ig_a02esp) (vi_a13_16) if vi_a13_16!=. | vi_a13_16quien!=., statistic(percent, across(vi_a13_16)) nformat(%6.1f) name(table36) totals(vi_a13_16) append

quietly: table (ig_a02esp) (vi_a13_16quien) if vi_a13_16!=. | vi_a13_16quien!=., statistic(percent, across(vi_a13_16quien)) nformat(%6.1f) name(table36) totals(vi_a13_16quien) append

collect layout (ig_a02esp) (N vi_a13_16 vi_a13_16quien) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 73: The data is collected using paper and who provides the record or form used to collect patient data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a13_16env!=., statistic(frequency) nformat(%6.0f) name(table36_1) totals(N)
quietly: table (ig_a02esp) (vi_a13_16env) if vi_a13_16env!=., statistic(percent, across(vi_a13_16env)) nformat(%6.1f) name(table36_1) totals(vi_a13_16env) append

collect layout (ig_a02esp) (N vi_a13_16env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 74: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a13_16cal1!=. | vi_a13_16cal2!=. | vi_a13_16cal3!=. | vi_a13_16cal4!=., statistic(frequency) nformat(%6.0f) name(table37) totals(N)

quietly: table (ig_a02esp) (vi_a13_16cal1) if vi_a13_16cal1!=. | vi_a13_16cal2!=. | vi_a13_16cal3!=. | vi_a13_16cal4!=., statistic(percent, across(vi_a13_16cal1)) nformat(%6.1f) name(table37) totals(vi_a13_16cal1) append 

quietly: table (ig_a02esp) (vi_a13_16cal2) if vi_a13_16cal1!=. | vi_a13_16cal2!=. | vi_a13_16cal3!=. | vi_a13_16cal4!=., statistic(percent, across(vi_a13_16cal2)) nformat(%6.1f) name(table37) totals(vi_a13_16cal2) append

quietly: table (ig_a02esp) (vi_a13_16cal3) if vi_a13_16cal1!=. | vi_a13_16cal2!=. | vi_a13_16cal3!=. | vi_a13_16cal4!=., statistic(percent, across(vi_a13_16cal3)) nformat(%6.1f) name(table37) totals(vi_a13_16cal3) append

quietly: table (ig_a02esp) (vi_a13_16cal4) if vi_a13_16cal1!=. | vi_a13_16cal2!=. | vi_a13_16cal3!=. | vi_a13_16cal4!=., statistic(percent, across(vi_a13_16cal4)) nformat(%6.1f) name(table37) totals(vi_a13_16cal4) append

collect layout (ig_a02esp) (N vi_a13_16cal1[1] vi_a13_16cal2[1] vi_a13_16cal3[1] vi_a13_16cal4[1]) 

collect style header N, level(hide)
collect style header vi_a13_16cal1, level(hide)
collect style header vi_a13_16cal2, level(hide)
collect style header vi_a13_16cal3, level(hide)
collect style header vi_a13_16cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 75: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a13_16frec!=., statistic(frequency) nformat(%6.0f) name(table37_1) totals(N)
quietly: table (ig_a02esp) (vi_a13_16frec) if vi_a13_16frec!=., statistic(percent, across(vi_a13_16frec)) nformat(%6.1f) name(table37_1) totals(vi_a13_16frec) append

collect layout (ig_a02esp) (N vi_a13_16frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 76: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a13_16resp!=., statistic(frequency) nformat(%6.0f) name(table37_2) totals(N)
quietly: table (ig_a02esp) (vi_a13_16resp) if vi_a13_16resp!=., statistic(percent, across(vi_a13_16resp)) nformat(%6.1f) name(table37_2) totals(vi_a13_16resp) append

collect layout (ig_a02esp) (N vi_a13_16resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 77: Who is responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.7 Sentinel Surveillance")

///////
quietly: table (ig_a02esp) (N) if vi_a14!=. | vi_a14_10!=. | vi_a14_11!=., statistic(frequency) nformat(%6.0f) name(table38) totals(N)

quietly: table (ig_a02esp) (vi_a14) if vi_a14!=. | vi_a14_10!=. | vi_a14_11!=., statistic(percent, across(vi_a14)) nformat(%6.1f) name(table38) totals(vi_a14) append

quietly: table (ig_a02esp) (vi_a14_10) if vi_a14!=. | vi_a14_10!=. | vi_a14_11!=., statistic(percent, across(vi_a14_10)) nformat(%6.1f) name(table38) totals(vi_a14_10) append

quietly: table (ig_a02esp) (vi_a14_11) if vi_a14!=. | vi_a14_10!=. | vi_a14_11!=., statistic(percent, across(vi_a14_11)) nformat(%6.1f) name(table38) totals(vi_a14_11) append

collect layout (ig_a02esp) (N vi_a14 vi_a14_10[1] vi_a14_11[1])
collect style header N, level(hide)
collect style header vi_a14_10, level(hide)
collect style header vi_a14_11, level(hide)
collect style cell N, nformat(%6.0f)
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 78: Characteristics of Sentinel Surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected electronically")

/////
quietly: table (ig_a02esp) (N) if vi_a14_15!=. | vi_a14_15sis1!=. | vi_a14_15sis2!=. | vi_a14_15sis3!=. | vi_a14_15sis4!=. | vi_a14_15sis5!=., statistic(frequency) nformat(%6.0f) name(table39) totals(N)

quietly: table (ig_a02esp) (vi_a14_15) if vi_a14_15!=. | vi_a14_15sis1!=. | vi_a14_15sis2!=. | vi_a14_15sis3!=. | vi_a14_15sis4!=. | vi_a14_15sis5!=., statistic(percent, across(vi_a14_15)) nformat(%6.1f) name(table39) totals(vi_a14_15) append

quietly: table (ig_a02esp) (vi_a14_15sis1) if vi_a14_15!=. | vi_a14_15sis1!=. | vi_a14_15sis2!=. | vi_a14_15sis3!=. | vi_a14_15sis4!=. | vi_a14_15sis5!=., statistic(percent, across(vi_a14_15sis1)) nformat(%6.1f) name(table39) totals(vi_a14_15sis1) append

quietly: table (ig_a02esp) (vi_a14_15sis2) if vi_a14_15!=. | vi_a14_15sis1!=. | vi_a14_15sis2!=. | vi_a14_15sis3!=. | vi_a14_15sis4!=. | vi_a14_15sis5!=., statistic(percent, across(vi_a14_15sis2)) nformat(%6.1f) name(table39) totals(vi_a14_15sis2) append

quietly: table (ig_a02esp) (vi_a14_15sis3) if vi_a14_15!=. | vi_a14_15sis1!=. | vi_a14_15sis2!=. | vi_a14_15sis3!=. | vi_a14_15sis4!=. | vi_a14_15sis5!=., statistic(percent, across(vi_a14_15sis3)) nformat(%6.1f) name(table39) totals(vi_a14_15sis3) append

quietly: table (ig_a02esp) (vi_a14_15sis4) if vi_a14_15!=. | vi_a14_15sis1!=. | vi_a14_15sis2!=. | vi_a14_15sis3!=. | vi_a14_15sis4!=. | vi_a14_15sis5!=., statistic(percent, across(vi_a14_15sis4)) nformat(%6.1f) name(table39) totals(vi_a14_15sis4) append

quietly: table (ig_a02esp) (vi_a14_15sis5) if vi_a14_15!=. | vi_a14_15sis1!=. | vi_a14_15sis2!=. | vi_a14_15sis3!=. | vi_a14_15sis4!=. | vi_a14_15sis5!=., statistic(percent, across(vi_a14_15sis5)) nformat(%6.1f) name(table39) totals(vi_a14_15sis5) append

collect layout (ig_a02esp) (N vi_a14_15 vi_a14_15sis1[1] vi_a14_15sis2[1] vi_a14_15sis3[1] vi_a14_15sis4[1] vi_a14_15sis5[1])
 
collect style header N, level(hide)
collect style header vi_a14_15sis1, level(hide)
collect style header vi_a14_15sis2, level(hide)
collect style header vi_a14_15sis3, level(hide)
collect style header vi_a14_15sis4, level(hide)
collect style header vi_a14_15sis5, level(hide)

collect style cell N, nformat(%6.0f)
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 79: Type of electronic system used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a14_15env!=., statistic(frequency) nformat(%6.0f) name(table39_1) totals(N)
quietly: table (ig_a02esp) (vi_a14_15env) if vi_a14_15env!=., statistic(percent, across(vi_a14_15env)) nformat(%6.1f) name(table39_1) totals(vi_a14_15env) append

collect layout (ig_a02esp) (N vi_a14_15env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 80: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a14_15cal1!=. | vi_a14_15cal2!=. | vi_a14_15cal3!=. | vi_a14_15cal4!=., statistic(frequency) nformat(%6.0f) name(table40) totals(N)

quietly: table (ig_a02esp) (vi_a14_15cal1) if vi_a14_15cal1!=. | vi_a14_15cal2!=. | vi_a14_15cal3!=. | vi_a14_15cal4!=., statistic(percent, across(vi_a14_15cal1)) nformat(%6.1f) name(table40) totals(vi_a14_15cal1) append

quietly: table (ig_a02esp) (vi_a14_15cal2) if vi_a14_15cal1!=. | vi_a14_15cal2!=. | vi_a14_15cal3!=. | vi_a14_15cal4!=., statistic(percent, across(vi_a14_15cal2)) nformat(%6.1f) name(table40) totals(vi_a14_15cal2) append

quietly: table (ig_a02esp) (vi_a14_15cal3) if vi_a14_15cal1!=. | vi_a14_15cal2!=. | vi_a14_15cal3!=. | vi_a14_15cal4!=., statistic(percent, across(vi_a14_15cal3)) nformat(%6.1f) name(table40) totals(vi_a14_15cal3) append

quietly: table (ig_a02esp) (vi_a14_15cal4) if vi_a14_15cal1!=. | vi_a14_15cal2!=. | vi_a14_15cal3!=. | vi_a14_15cal4!=., statistic(percent, across(vi_a14_15cal4)) nformat(%6.1f) name(table40) totals(vi_a14_15cal4) append

collect layout (ig_a02esp) (N vi_a14_15cal1[1] vi_a14_15cal2[1] vi_a14_15cal3[1] vi_a14_15cal4[1]) 

collect style header N, level(hide)
collect style header vi_a14_15cal1, level(hide)
collect style header vi_a14_15cal2, level(hide)
collect style header vi_a14_15cal3, level(hide)
collect style header vi_a14_15cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 81: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a14_15frec!=., statistic(frequency) nformat(%6.0f) name(table40_1) totals(N)

quietly: table (ig_a02esp) (vi_a14_15frec) if vi_a14_15frec!=., statistic(percent, across(vi_a14_15frec)) nformat(%6.1f) name(table40_1) totals(vi_a14_15frec) append

collect layout (ig_a02esp) (N vi_a14_15frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)
 
collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 82: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a14_15resp!=., statistic(frequency) nformat(%6.0f) name(table40_2) totals(N)

quietly: table (ig_a02esp) (vi_a14_15resp) if vi_a14_15resp!=., statistic(percent, across(vi_a14_15resp)) nformat(%6.1f) name(table40_2) totals(vi_a14_15resp) append 

collect layout (ig_a02esp) (N vi_a14_15resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 83: Responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected using paper")

/////
quietly: table (ig_a02esp) (N) if vi_a14_16!=. | vi_a14_16quien!=., statistic(frequency) nformat(%6.0f) name(table41) totals(N)

quietly: table (ig_a02esp) (vi_a14_16) if vi_a14_16!=. | vi_a14_16quien!=., statistic(percent, across(vi_a14_16)) nformat(%6.1f) name(table41) totals(vi_a14_16) append

quietly: table (ig_a02esp) (vi_a14_16quien) if vi_a14_16!=. | vi_a14_16quien!=., statistic(percent, across(vi_a14_16quien)) nformat(%6.1f) name(table41) totals(vi_a14_16quien) append

collect layout (ig_a02esp) (N vi_a14_16 vi_a14_16quien) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 84: The data is collected using paper and who provides the record or form used to collect patient data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a14_16env!=., statistic(frequency) nformat(%6.0f) name(table41_1) totals(N)

quietly: table (ig_a02esp) (vi_a14_16env) if vi_a14_16env!=., statistic(percent, across(vi_a14_16env)) nformat(%6.1f) name(table41_1) totals(vi_a14_16env) append

collect layout (ig_a02esp) (N vi_a14_16env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 85: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a14_16cal1!=. | vi_a14_16cal2!=. | vi_a14_16cal3!=. | vi_a14_16cal4!=., statistic(frequency) nformat(%6.0f) name(table42) totals(N)

quietly: table (ig_a02esp) (vi_a14_16cal1) if vi_a14_16cal1!=. | vi_a14_16cal2!=. | vi_a14_16cal3!=. | vi_a14_16cal4!=., statistic(percent, across(vi_a14_16cal1)) nformat(%6.1f) name(table42) totals(vi_a14_16cal1) append

quietly: table (ig_a02esp) (vi_a14_16cal2) if vi_a14_16cal1!=. | vi_a14_16cal2!=. | vi_a14_16cal3!=. | vi_a14_16cal4!=., statistic(percent, across(vi_a14_16cal2)) nformat(%6.1f) name(table42) totals(vi_a14_16cal2) append

quietly: table (ig_a02esp) (vi_a14_16cal3) if vi_a14_16cal1!=. | vi_a14_16cal2!=. | vi_a14_16cal3!=. | vi_a14_16cal4!=., statistic(percent, across(vi_a14_16cal3)) nformat(%6.1f) name(table42) totals(vi_a14_16cal3) append

quietly: table (ig_a02esp) (vi_a14_16cal4) if vi_a14_16cal1!=. | vi_a14_16cal2!=. | vi_a14_16cal3!=. | vi_a14_16cal4!=., statistic(percent, across(vi_a14_16cal4)) nformat(%6.1f) name(table42) totals(vi_a14_16cal4) append

collect layout (ig_a02esp) (N vi_a14_16cal1[1] vi_a14_16cal2[1] vi_a14_16cal3[1] vi_a14_16cal4[1]) 

collect style header N, level(hide)
collect style header vi_a14_16cal1, level(hide)
collect style header vi_a14_16cal2, level(hide)
collect style header vi_a14_16cal3, level(hide)
collect style header vi_a14_16cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 86: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a14_16frec!=., statistic(frequency) nformat(%6.0f) name(table42_1) totals(N)
quietly: table (ig_a02esp) (vi_a14_16frec) if vi_a14_16frec!=., statistic(percent, across(vi_a14_16frec)) nformat(%6.1f) name(table42_1) totals(vi_a14_16frec) append

collect layout (ig_a02esp) (N vi_a14_16frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 87: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a14_16resp!=., statistic(frequency) nformat(%6.0f) name(table42_2) totals(N)

quietly: table (ig_a02esp) (vi_a14_16resp) if vi_a14_16resp!=., statistic(percent, across(vi_a14_16resp)) nformat(%6.1f) name(table42_2) totals(vi_a14_16resp) append

collect layout (ig_a02esp) (N vi_a14_16resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 88: Who is responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.8 Environment-Based Surveillance")

//////
quietly: table (ig_a02esp) (N) if vi_a15!=. | vi_a15_10!=. | vi_a15_11!=., statistic(frequency) nformat(%6.0f) name(table43) totals(N)

quietly: table (ig_a02esp) (vi_a15) if vi_a15!=. | vi_a15_10!=. | vi_a15_11!=., statistic(percent, across(vi_a15)) nformat(%6.1f) name(table43) totals(vi_a15) append

quietly: table (ig_a02esp) (vi_a15_10) if vi_a15!=. | vi_a15_10!=. | vi_a15_11!=., statistic(percent, across(vi_a15_10)) nformat(%6.1f) name(table43) totals(vi_a15_10) append

quietly: table (ig_a02esp) (vi_a15_11) if vi_a15!=. | vi_a15_10!=. | vi_a15_11!=., statistic(percent, across(vi_a15_11)) nformat(%6.1f) name(table43) totals(vi_a15_11) append

collect layout (ig_a02esp) (N vi_a15 vi_a15_10[1] vi_a15_11[1])

collect style header N, level(hide)
collect style header vi_a15_10, level(hide)
collect style header vi_a15_11, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 89: Characteristics of Environment-Based Surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected electronically")

/////
quietly: table (ig_a02esp) (N) if vi_a15_15!=. | vi_a15_15sis1!=. | vi_a15_15sis2!=. | vi_a15_15sis3!=. | vi_a15_15sis4!=. | vi_a15_15sis5!=., statistic(frequency) nformat(%6.0f) name(table44) totals(N)

quietly: table (ig_a02esp) (vi_a15_15) if vi_a15_15!=. | vi_a15_15sis1!=. | vi_a15_15sis2!=. | vi_a15_15sis3!=. | vi_a15_15sis4!=. | vi_a15_15sis5!=., statistic(percent, across(vi_a15_15)) nformat(%6.1f) name(table44) totals(vi_a15_15) append

quietly: table (ig_a02esp) (vi_a15_15sis1) if vi_a15_15!=. | vi_a15_15sis1!=. | vi_a15_15sis2!=. | vi_a15_15sis3!=. | vi_a15_15sis4!=. | vi_a15_15sis5!=., statistic(percent, across(vi_a15_15sis1)) nformat(%6.1f) name(table44) totals(vi_a15_15sis1) append

quietly: table (ig_a02esp) (vi_a15_15sis2) if vi_a15_15!=. | vi_a15_15sis1!=. | vi_a15_15sis2!=. | vi_a15_15sis3!=. | vi_a15_15sis4!=. | vi_a15_15sis5!=., statistic(percent, across(vi_a15_15sis2)) nformat(%6.1f) name(table44) totals(vi_a15_15sis2) append

quietly: table (ig_a02esp) (vi_a15_15sis3) if vi_a15_15!=. | vi_a15_15sis1!=. | vi_a15_15sis2!=. | vi_a15_15sis3!=. | vi_a15_15sis4!=. | vi_a15_15sis5!=., statistic(percent, across(vi_a15_15sis3)) nformat(%6.1f) name(table44) totals(vi_a15_15sis3) append

quietly: table (ig_a02esp) (vi_a15_15sis4) if vi_a15_15!=. | vi_a15_15sis1!=. | vi_a15_15sis2!=. | vi_a15_15sis3!=. | vi_a15_15sis4!=. | vi_a15_15sis5!=., statistic(percent, across(vi_a15_15sis4)) nformat(%6.1f) name(table44) totals(vi_a15_15sis4) append

quietly: table (ig_a02esp) (vi_a15_15sis5) if vi_a15_15!=. | vi_a15_15sis1!=. | vi_a15_15sis2!=. | vi_a15_15sis3!=. | vi_a15_15sis4!=. | vi_a15_15sis5!=., statistic(percent, across(vi_a15_15sis5)) nformat(%6.1f) name(table44) totals(vi_a15_15sis5) append

collect layout (ig_a02esp) (N vi_a15_15 vi_a15_15sis1[1] vi_a15_15sis2[1] vi_a15_15sis3[1] vi_a15_15sis4[1] vi_a15_15sis5[1]) 

collect style header N, level(hide)
collect style header vi_a15_15sis1, level(hide)
collect style header vi_a15_15sis2, level(hide)
collect style header vi_a15_15sis3, level(hide)
collect style header vi_a15_15sis4, level(hide)
collect style header vi_a15_15sis5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 90: Type of electronic system used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a15_15env!=., statistic(frequency) nformat(%6.0f) name(table44_1) totals(N)

quietly: table (ig_a02esp) (vi_a15_15env) if vi_a15_15env!=., statistic(percent, across(vi_a15_15env)) nformat(%6.1f) name(table44_1) totals(vi_a15_15env) append

collect layout (ig_a02esp) (N vi_a15_15env)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 91: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a15_15cal1!=. | vi_a15_15cal2!=. | vi_a15_15cal3!=. | vi_a15_15cal4!=., statistic(frequency) nformat(%6.0f) name(table45) totals(N)

quietly: table (ig_a02esp) (vi_a15_15cal1) if vi_a15_15cal1!=. | vi_a15_15cal2!=. | vi_a15_15cal3!=. | vi_a15_15cal4!=., statistic(percent, across(vi_a15_15cal1)) nformat(%6.1f) name(table45) totals(vi_a15_15cal1) append

quietly: table (ig_a02esp) (vi_a15_15cal2) if vi_a15_15cal1!=. | vi_a15_15cal2!=. | vi_a15_15cal3!=. | vi_a15_15cal4!=., statistic(percent, across(vi_a15_15cal2)) nformat(%6.1f) name(table45) totals(vi_a15_15cal2) append

quietly: table (ig_a02esp) (vi_a15_15cal3) if vi_a15_15cal1!=. | vi_a15_15cal2!=. | vi_a15_15cal3!=. | vi_a15_15cal4!=., statistic(percent, across(vi_a15_15cal3)) nformat(%6.1f) name(table45) totals(vi_a15_15cal3) append

quietly: table (ig_a02esp) (vi_a15_15cal4) if vi_a15_15cal1!=. | vi_a15_15cal2!=. | vi_a15_15cal3!=. | vi_a15_15cal4!=., statistic(percent, across(vi_a15_15cal4)) nformat(%6.1f) name(table45) totals(vi_a15_15cal4) append

collect layout (ig_a02esp) (N vi_a15_15cal1[1] vi_a15_15cal2[1] vi_a15_15cal3[1] vi_a15_15cal4[1]) 

collect style header N, level(hide)
collect style header vi_a15_15cal1, level(hide)
collect style header vi_a15_15cal2, level(hide)
collect style header vi_a15_15cal3, level(hide)
collect style header vi_a15_15cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 92: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a15_15frec!=., statistic(frequency) nformat(%6.0f) name(table45_1) totals(N)

quietly: table (ig_a02esp) (vi_a15_15frec) if vi_a15_15frec!=., statistic(percent, across(vi_a15_15frec)) nformat(%6.1f) name(table45_1) totals(vi_a15_15frec) append

collect layout (ig_a02esp) (N vi_a15_15frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 93: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a15_15resp!=., statistic(frequency) nformat(%6.0f) name(table45_2) totals(N)

quietly: table (ig_a02esp) (vi_a15_15resp) if vi_a15_15resp, statistic(percent, across(vi_a15_15resp)) nformat(%6.1f) name(table45_2) totals(vi_a15_15resp) append

collect layout (ig_a02esp) (N vi_a15_15resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 94: Responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
putdocx paragraph, style(Heading1) 
putdocx text ("Data are collected using paper")

/////
quietly: table (ig_a02esp) (N) if vi_a15_16!=. | vi_a15_16quien!=., statistic(frequency) nformat(%6.0f) name(table46) totals(N)

quietly: table (ig_a02esp) (vi_a15_16) if vi_a15_16!=. | vi_a15_16quien!=., statistic(percent, across(vi_a15_16)) nformat(%6.1f) name(table46) totals(vi_a15_16) append

quietly: table (ig_a02esp) (vi_a15_16quien) if vi_a15_16!=. | vi_a15_16quien!=., statistic(percent, across(vi_a15_16quien)) nformat(%6.1f) name(table46) totals(vi_a15_16quien) append

collect layout (ig_a02esp) (N vi_a15_16 vi_a15_16quien) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 95: The data is collected using paper and who provides the record or form used to collect patient data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a15_16env!=., statistic(frequency) nformat(%6.0f) name(table46_1) totals(N)

quietly: table (ig_a02esp) (vi_a15_16env) if vi_a15_16env!=., statistic(percent, across(vi_a15_16env)) nformat(%6.1f) name(table46_1) totals(vi_a15_16env) append

collect layout (ig_a02esp) (N vi_a15_16env) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 96: Where the data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////
quietly: table (ig_a02esp) (N) if vi_a15_16cal1!=. | vi_a15_16cal2!=. | vi_a15_16cal3!=. | vi_a15_16cal4!=., statistic(frequency) nformat(%6.0f) name(table47) totals(N)

quietly: table (ig_a02esp) (vi_a15_16cal1) if vi_a15_16cal1!=. | vi_a15_16cal2!=. | vi_a15_16cal3!=. | vi_a15_16cal4!=., statistic(percent, across(vi_a15_16cal1)) nformat(%6.1f) name(table47) totals(vi_a15_16cal1) append

quietly: table (ig_a02esp) (vi_a15_16cal2) if vi_a15_16cal1!=. | vi_a15_16cal2!=. | vi_a15_16cal3!=. | vi_a15_16cal4!=., statistic(percent, across(vi_a15_16cal2)) nformat(%6.1f) name(table47) totals(vi_a15_16cal2) append

quietly: table (ig_a02esp) (vi_a15_16cal3) if vi_a15_16cal1!=. | vi_a15_16cal2!=. | vi_a15_16cal3!=. | vi_a15_16cal4!=., statistic(percent, across(vi_a15_16cal3)) nformat(%6.1f) name(table47) totals(vi_a15_16cal3) append

quietly: table (ig_a02esp) (vi_a15_16cal4) if vi_a15_16cal1!=. | vi_a15_16cal2!=. | vi_a15_16cal3!=. | vi_a15_16cal4!=., statistic(percent, across(vi_a15_16cal4)) nformat(%6.1f) name(table47) totals(vi_a15_16cal4) append

collect layout (ig_a02esp) (N vi_a15_16cal1[1] vi_a15_16cal2[1] vi_a15_16cal3[1] vi_a15_16cal4[1]) 

collect style header N, level(hide)
collect style header vi_a15_16cal1, level(hide)
collect style header vi_a15_16cal2, level(hide)
collect style header vi_a15_16cal3, level(hide)
collect style header vi_a15_16cal4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 97: Quality control measures that are used to report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a15_16frec!=., statistic(frequency) nformat(%6.0f) name(table47_1) totals(N)

quietly: table (ig_a02esp) (vi_a15_16frec) if vi_a15_16frec!=., statistic(percent, across(vi_a15_16frec)) nformat(%6.1f) name(table47_1) totals(vi_a15_16frec) append

collect layout (ig_a02esp) (N vi_a15_16frec)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 98: Frequency that data is sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a15_16resp!=., statistic(frequency) nformat(%6.0f) name(table47_2) totals(N)

quietly: table (ig_a02esp) (vi_a15_16resp) if vi_a15_16resp!=., statistic(percent, across(vi_a15_16resp)) nformat(%6.1f) name(table47_2) totals(vi_a15_16resp) append 

collect layout (ig_a02esp) (N vi_a15_16resp)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 99: Who is responsible for sending the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////
//////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.9 Other Features of the Surveillance System")

/////////
quietly: table (ig_a02esp) (N) if vi_a18!=. | vi_a19!=., statistic(frequency) nformat(%6.0f) name(table48) totals(N)
quietly: table (ig_a02esp) (vi_a18) if vi_a18!=. | vi_a19!=., statistic(percent, across(vi_a18)) nformat(%6.1f) name(table48) totals(vi_a18) append
quietly: table (ig_a02esp) (vi_a19) if vi_a18!=. | vi_a19!=., statistic(percent, across(vi_a19)) nformat(%6.1f) name(table48) totals(vi_a19) append

collect layout (ig_a02esp) (N vi_a18[1] vi_a19[1]) 

collect style header N, level(hide)
collect style header vi_a18, level(hide)
collect style header vi_a19, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 100: Characteristics of the surveillance system") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////
quietly: table (ig_a02esp) (N) if vi_a20!=. | vi_a20tip1!=. | vi_a20tip2!=. | vi_a20tip3!=. | vi_a20tip4!=. | vi_a20tip5!=., statistic(frequency) nformat(%6.0f) name(table49) totals(N)

quietly: table (ig_a02esp) (vi_a20) if vi_a20!=. | vi_a20tip1!=. | vi_a20tip2!=. | vi_a20tip3!=. | vi_a20tip4!=. | vi_a20tip5!=., statistic(percent, across(vi_a20)) nformat(%6.1f) name(table49) totals(vi_a20) append 

quietly: table (ig_a02esp) (vi_a20tip1) if vi_a20!=. | vi_a20tip1!=. | vi_a20tip2!=. | vi_a20tip3!=. | vi_a20tip4!=. | vi_a20tip5!=., statistic(percent, across(vi_a20tip1)) nformat(%6.1f) name(table49) totals(vi_a20tip1) append

quietly: table (ig_a02esp) (vi_a20tip2) if vi_a20!=. | vi_a20tip1!=. | vi_a20tip2!=. | vi_a20tip3!=. | vi_a20tip4!=. | vi_a20tip5!=., statistic(percent, across(vi_a20tip2)) nformat(%6.1f) name(table49) totals(vi_a20tip2) append

quietly: table (ig_a02esp) (vi_a20tip3) if vi_a20!=. | vi_a20tip1!=. | vi_a20tip2!=. | vi_a20tip3!=. | vi_a20tip4!=. | vi_a20tip5!=., statistic(percent, across(vi_a20tip3)) nformat(%6.1f) name(table49) totals(vi_a20tip3) append

quietly: table (ig_a02esp) (vi_a20tip4) if vi_a20!=. | vi_a20tip1!=. | vi_a20tip2!=. | vi_a20tip3!=. | vi_a20tip4!=. | vi_a20tip5!=., statistic(percent, across(vi_a20tip4)) nformat(%6.1f) name(table49) totals(vi_a20tip4) append

quietly: table (ig_a02esp) (vi_a20tip5) if vi_a20!=. | vi_a20tip1!=. | vi_a20tip2!=. | vi_a20tip3!=. | vi_a20tip4!=. | vi_a20tip5!=., statistic(percent, across(vi_a20tip5)) nformat(%6.1f) name(table49) totals(vi_a20tip5) append

collect layout (ig_a02esp) (N vi_a20 vi_a20tip1[1] vi_a20tip2[1] vi_a20tip3[1] vi_a20tip4[1] vi_a20tip5[1]) 

collect style header N, level(hide)
collect style header vi_a20tip1, level(hide)
collect style header vi_a20tip2, level(hide)
collect style header vi_a20tip3, level(hide)
collect style header vi_a20tip4, level(hide)
collect style header vi_a20tip5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 101: Do some mathematical modeling of disease as part of surveillance activities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////
quietly: table (ig_a02esp) (N) if vi_a21!=., statistic(frequency) nformat(%6.0f) name(table49_1) totals(N)

quietly: table (ig_a02esp) (vi_a21), statistic(percent, across(vi_a21)) nformat(%6.1f) name(table49_1) totals(vi_a21) append

collect layout (ig_a02esp) (N vi_a21)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 102: Spatial/geographic modeling of disease risk performed") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect


//////
quietly: table (ig_a02esp) (N) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(frequency) nformat(%6.0f) name(table49_2) totals(N)

quietly: table (ig_a02esp) (vi_a23) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23)) nformat(%6.1f) name(table49_2) totals(vi_a23) append

quietly: table (ig_a02esp) (vi_a23cuales1) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales1)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales1) append

quietly: table (ig_a02esp) (vi_a23cuales2) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales2)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales2) append

quietly: table (ig_a02esp) (vi_a23cuales3) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales3)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales3) append

quietly: table (ig_a02esp) (vi_a23cuales4) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales4)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales4) append

quietly: table (ig_a02esp) (vi_a23cuales5) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales5)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales5) append

quietly: table (ig_a02esp) (vi_a23cuales6) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales6)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales6) append

quietly: table (ig_a02esp) (vi_a23cuales7) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales7)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales7) append

quietly: table (ig_a02esp) (vi_a23cuales8) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales8)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales8) append

quietly: table (ig_a02esp) (vi_a23cuales9) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales9)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales9) append

quietly: table (ig_a02esp) (vi_a23cuales10) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales10)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales10) append

quietly: table (ig_a02esp) (vi_a23cuales11) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales11)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales11) append

quietly: table (ig_a02esp) (vi_a23cuales12) if vi_a23!=. | vi_a23cuales1!=. | vi_a23cuales2!=. | vi_a23cuales3!=. | vi_a23cuales4!=. | vi_a23cuales5!=. | vi_a23cuales6!=. | vi_a23cuales7!=. | vi_a23cuales8!=. | vi_a23cuales9!=. | vi_a23cuales10!=. | vi_a23cuales11!=. | vi_a23cuales12!=., statistic(percent, across(vi_a23cuales12)) nformat(%6.1f) name(table49_2) totals(vi_a23cuales12) append

collect layout (ig_a02esp) (N vi_a23 vi_a23cuales1[1] vi_a23cuales2[1] vi_a23cuales3[1] vi_a23cuales4[1] vi_a23cuales5[1] vi_a23cuales6[1] vi_a23cuales7[1] vi_a23cuales8[1] vi_a23cuales9[1] vi_a23cuales10[1] vi_a23cuales11[1] vi_a23cuales12[1]) 

collect style header N, level(hide)
collect style header vi_a23cuales1, level(hide)
collect style header vi_a23cuales2, level(hide)
collect style header vi_a23cuales3, level(hide)
collect style header vi_a23cuales4, level(hide)
collect style header vi_a23cuales5, level(hide)
collect style header vi_a23cuales6, level(hide)
collect style header vi_a23cuales7, level(hide)
collect style header vi_a23cuales8, level(hide)
collect style header vi_a23cuales9, level(hide)
collect style header vi_a23cuales10, level(hide)
collect style header vi_a23cuales11, level(hide)
collect style header vi_a23cuales12, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 103: There are plans to implement new electronic tools for human/animal/environmental health surveillance in the future and for which ones") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

****
quietly: table (amb_nue) () if vi_a23cuales12==1, statistic(frequency) statistic(percent) name(table49_3)
quietly: table (cov_nue) () if vi_a23cuales12==1, statistic(frequency) statistic(percent) name(table49_3) append
quietly: table (dengue_nue) () if vi_a23cuales12==1, statistic(frequency) statistic(percent) name(table49_3) append
quietly: table (viruela_nue) () if vi_a23cuales12==1, statistic(frequency) statistic(percent) name(table49_3) append

collect layout (amb_nue[1] cov_nue[1] dengue_nue[1] viruela_nue[1])(result) 

collect label levels amb_nue 1 "N=25", modify
collect label levels cov_nue 1 "N=25", modify
collect label levels dengue_nue 1 "N=25", modify
collect label levels viruela_nue 1 "N=25", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 103.1: Some answers from the other option") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect


///////////
quietly: table (ig_a02esp) (N) if vi_a241!=. | vi_a242!=. | vi_a243!=. | vi_a244!=., statistic(frequency) nformat(%6.0f) name(table50) totals(N)

quietly: table (ig_a02esp) (vi_a241) if vi_a241!=. | vi_a242!=. | vi_a243!=. | vi_a244!=., statistic(percent, across(vi_a241)) nformat(%6.1f) name(table50) totals(vi_a241) append

quietly: table (ig_a02esp) (vi_a242) if vi_a241!=. | vi_a242!=. | vi_a243!=. | vi_a244!=., statistic(percent, across(vi_a242)) nformat(%6.1f) name(table50) totals(vi_a242) append

quietly: table (ig_a02esp) (vi_a243) if vi_a241!=. | vi_a242!=. | vi_a243!=. | vi_a244!=., statistic(percent, across(vi_a243)) nformat(%6.1f) name(table50) totals(vi_a243) append

quietly: table (ig_a02esp) (vi_a244) if vi_a241!=. | vi_a242!=. | vi_a243!=. | vi_a244!=., statistic(percent, across(vi_a244)) nformat(%6.1f) name(table50) totals(vi_a244) append

collect layout (ig_a02esp) (N vi_a241[1] vi_a242[1] vi_a243[1] vi_a244[1]) 

collect style header N, level(hide)
collect style header vi_a241, level(hide)
collect style header vi_a242, level(hide)
collect style header vi_a243, level(hide)
collect style header vi_a244, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 104: Place where you refer patients for major illnesses or conditions") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

////////////////////
////////////////////
putdocx paragraph, style(Heading1) font(, 16)
putdocx text ("2.10 Outbreak Investigation")

///////////
quietly: table (ig_a02esp) (N) if br_a011!=. | br_a012!=. | br_a013!=. | br_a014!=. | br_a015!=. | br_a016!=., statistic(frequency) nformat(%6.0f) name(table51) totals(N)

quietly: table (ig_a02esp) (br_a011) if br_a011!=. | br_a012!=. | br_a013!=. | br_a014!=. | br_a015!=. | br_a016!=., statistic(percent, across(br_a011)) nformat(%6.1f) name(table51) totals(br_a011) append

quietly: table (ig_a02esp) (br_a012) if br_a011!=. | br_a012!=. | br_a013!=. | br_a014!=. | br_a015!=. | br_a016!=., statistic(percent, across(br_a012)) nformat(%6.1f) name(table51) totals(br_a012) append

quietly: table (ig_a02esp) (br_a013) if br_a011!=. | br_a012!=. | br_a013!=. | br_a014!=. | br_a015!=. | br_a016!=., statistic(percent, across(br_a013)) nformat(%6.1f) name(table51) totals(br_a013) append

quietly: table (ig_a02esp) (br_a014) if br_a011!=. | br_a012!=. | br_a013!=. | br_a014!=. | br_a015!=. | br_a016!=., statistic(percent, across(br_a014)) nformat(%6.1f) name(table51) totals(br_a014) append

quietly: table (ig_a02esp) (br_a015) if br_a011!=. | br_a012!=. | br_a013!=. | br_a014!=. | br_a015!=. | br_a016!=., statistic(percent, across(br_a015)) nformat(%6.1f) name(table51) totals(br_a015) append

quietly: table (ig_a02esp) (br_a016) if br_a011!=. | br_a012!=. | br_a013!=. | br_a014!=. | br_a015!=. | br_a016!=., statistic(percent, across(br_a016)) nformat(%6.1f) name(table51) totals(br_a016) append

collect layout (ig_a02esp) (N br_a011[1] br_a012[1] br_a013[1] br_a014[1] br_a015[1] br_a016[1]) 

collect style header N, level(hide)
collect style header br_a011, level(hide)
collect style header br_a012, level(hide)
collect style header br_a013, level(hide)
collect style header br_a014, level(hide)
collect style header br_a015, level(hide)
collect style header br_a016, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 105: Conditions for an outbreak investigation to be initiated") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////
quietly: table (ig_a02esp) (N) if br_a02!=., statistic(frequency) nformat(%6.0f) name(table51_1) totals(N)

quietly: table (ig_a02esp) (br_a02) if br_a02!=., statistic(percent, across(br_a02)) nformat(%6.1f) name(table51_1) totals(br_a02) append

collect layout (ig_a02esp) (N br_a02)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 106: It has team for outbreak investigation") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////
table (ig_a02esp) (var), statistic(count N) statistic(mean br_a02equi) statistic(sd br_a02equi) listwise 

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[br_a02equi]#result[column1], nformat(%6.0f)
collect style cell var[br_a02equi]#result[column2 column3], nformat(%6.1f)
collect style cell var[br_a02equi]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)

collect style cell border_block, border(right, pattern(nil))

collect preview
collect style putdocx, title("Table 107: Number of outbreak investigation teams") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////
quietly: table (ig_a02esp) (N) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(frequency) nformat(%6.0f) name(table52) totals(N)

quietly: table (ig_a02esp) (br_a02conf1) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(percent, across(br_a02conf1)) nformat(%6.1f) name(table52) totals(br_a02conf1) append

quietly: table (ig_a02esp) (br_a02conf2) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(percent, across(br_a02conf2)) nformat(%6.1f) name(table52) totals(br_a02conf2) append

quietly: table (ig_a02esp) (br_a02conf3) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(percent, across(br_a02conf3)) nformat(%6.1f) name(table52) totals(br_a02conf3) append

quietly: table (ig_a02esp) (br_a02conf4) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(percent, across(br_a02conf4)) nformat(%6.1f) name(table52) totals(br_a02conf4) append

quietly: table (ig_a02esp) (br_a02conf5) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(percent, across(br_a02conf5)) nformat(%6.1f) name(table52) totals(br_a02conf5) append

quietly: table (ig_a02esp) (br_a02conf6) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(percent, across(br_a02conf6)) nformat(%6.1f) name(table52) totals(br_a02conf6) append

quietly: table (ig_a02esp) (br_a02conf7) if br_a02conf1!=. | br_a02conf2!=. | br_a02conf3!=. | br_a02conf4!=. | br_a02conf5!=. | br_a02conf6!=. | br_a02conf7!=., statistic(percent, across(br_a02conf7)) nformat(%6.1f) name(table52) totals(br_a02conf7) append

collect layout (ig_a02esp) (N br_a02conf1[1] br_a02conf2[1] br_a02conf3[1] br_a02conf4[1] br_a02conf5[1] br_a02conf6[1] br_a02conf7[1]) 

collect style header N, level(hide)
collect style header br_a02conf1, level(hide)
collect style header br_a02conf2, level(hide)
collect style header br_a02conf3, level(hide)
collect style header br_a02conf4, level(hide)
collect style header br_a02conf5, level(hide)
collect style header br_a02conf6, level(hide)
collect style header br_a02conf7, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 108: Type of professionals that make up the outbreak teams") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////
quietly: table (ig_a02esp) (N) if br_a02act1!=. | br_a02act2!=. | br_a02act3!=. | br_a02act4!=. | br_a02act5!=. | br_a02act6!=., statistic(frequency) nformat(%6.0f) name(table53) totals(N)

quietly: table (ig_a02esp) (br_a02act1) if br_a02act1!=. | br_a02act2!=. | br_a02act3!=. | br_a02act4!=. | br_a02act5!=. | br_a02act6!=., statistic(percent, across(br_a02act1)) nformat(%6.1f) name(table53) totals(br_a02act1) append

quietly: table (ig_a02esp) (br_a02act2) if br_a02act1!=. | br_a02act2!=. | br_a02act3!=. | br_a02act4!=. | br_a02act5!=. | br_a02act6!=., statistic(percent, across(br_a02act2)) nformat(%6.1f) name(table53) totals(br_a02act2) append

quietly: table (ig_a02esp) (br_a02act3) if br_a02act1!=. | br_a02act2!=. | br_a02act3!=. | br_a02act4!=. | br_a02act5!=. | br_a02act6!=., statistic(percent, across(br_a02act3)) nformat(%6.1f) name(table53) totals(br_a02act3) append

quietly: table (ig_a02esp) (br_a02act4) if br_a02act1!=. | br_a02act2!=. | br_a02act3!=. | br_a02act4!=. | br_a02act5!=. | br_a02act6!=., statistic(percent, across(br_a02act4)) nformat(%6.1f) name(table53) totals(br_a02act4) append

quietly: table (ig_a02esp) (br_a02act5) if br_a02act1!=. | br_a02act2!=. | br_a02act3!=. | br_a02act4!=. | br_a02act5!=. | br_a02act6!=., statistic(percent, across(br_a02act5)) nformat(%6.1f) name(table53) totals(br_a02act5) append

quietly: table (ig_a02esp) (br_a02act6) if br_a02act1!=. | br_a02act2!=. | br_a02act3!=. | br_a02act4!=. | br_a02act5!=. | br_a02act6!=., statistic(percent, across(br_a02act6)) nformat(%6.1f) name(table53) totals(br_a02act6) append

collect layout (ig_a02esp) (N br_a02act1[1] br_a02act2[1] br_a02act3[1] br_a02act4[1] br_a02act5[1] br_a02act6[1]) 

collect style header N, level(hide)
collect style header br_a02act1, level(hide)
collect style header br_a02act2, level(hide)
collect style header br_a02act3, level(hide)
collect style header br_a02act4, level(hide)
collect style header br_a02act5, level(hide)
collect style header br_a02act6, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 109: Activities involved in the investigation of a disease outbreak") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////////
putdocx paragraph, style(Heading1)
putdocx text ("Latest Outbreak")

//////////
quietly: table (ig_a02esp) (N) if br_a04!=., statistic(frequency) nformat(%6.0f) name(table53_1) totals(N)
quietly: table (ig_a02esp) (br_a04) if br_a04!=., statistic(percent, across(br_a04)) nformat(%6.1f) name(table53_1) totals(br_a04) append

collect layout (ig_a02esp) (N br_a04)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))
collect preview
collect style putdocx, title("Table 110: Other than covid, have there been any outbreaks in your area in the last 10 years?") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////
quietly: table (ig_a02esp) (N) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(frequency) nformat(%6.0f) name(table54) totals(N)

quietly: table (ig_a02esp) (br_a04esp1) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp1)) nformat(%6.1f) name(table54) totals(br_a04esp1) append

quietly: table (ig_a02esp) (br_a04esp2) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp2)) nformat(%6.1f) name(table54) totals(br_a04esp2) append

quietly: table (ig_a02esp) (br_a04esp3) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp3)) nformat(%6.1f) name(table54) totals(br_a04esp3) append

quietly: table (ig_a02esp) (br_a04esp4) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp4)) nformat(%6.1f) name(table54) totals(br_a04esp4) append

quietly: table (ig_a02esp) (br_a04esp5) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp5)) nformat(%6.1f) name(table54) totals(br_a04esp5) append

quietly: table (ig_a02esp) (br_a04esp6) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp6)) nformat(%6.1f) name(table54) totals(br_a04esp6) append

quietly: table (ig_a02esp) (br_a04esp7) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp7)) nformat(%6.1f) name(table54) totals(br_a04esp7) append

quietly: table (ig_a02esp) (br_a04esp8) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp8)) nformat(%6.1f) name(table54) totals(br_a04esp8) append

quietly: table (ig_a02esp) (br_a04esp9) if br_a04esp1!=. | br_a04esp2!=. | br_a04esp3!=. | br_a04esp4!=. | br_a04esp5!=. | br_a04esp6!=. | br_a04esp7!=. | br_a04esp8!=. | br_a04esp9!=., statistic(percent, across(br_a04esp9)) nformat(%6.1f) name(table54) totals(br_a04esp9) append

collect layout (ig_a02esp) (N br_a04esp1[1] br_a04esp2[1] br_a04esp3[1] br_a04esp4[1] br_a04esp5[1] br_a04esp6[1] br_a04esp7[1] br_a04esp8[1] br_a04esp9[1]) 

collect style header N, level(hide)
collect style header br_a04esp1, level(hide)
collect style header br_a04esp2, level(hide)
collect style header br_a04esp3, level(hide)
collect style header br_a04esp4, level(hide)
collect style header br_a04esp5, level(hide)
collect style header br_a04esp6, level(hide)
collect style header br_a04esp7, level(hide)
collect style header br_a04esp8, level(hide)
collect style header br_a04esp9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 111: Species affected") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////
table (ig_a02esp) (var), statistic(count N) statistic(mean br_a04per) statistic(sd br_a04per) listwise 

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[br_a04per]#result[column1], nformat(%6.0f)
collect style cell var[br_a04per]#result[column2 column3], nformat(%6.1f)
collect style cell var[br_a04per]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)

collect style cell border_block, border(right, pattern(nil))

collect preview
collect style putdocx, title("Table 112: Number of people affected by the outbreak") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////
quietly: table (ig_a02esp) (N) if br_a04llam1!=. | br_a04llam2!=. | br_a04llam3!=. | br_a04llam4!=. | br_a04llam5!=., statistic(frequency) nformat(%6.0f) name(table55) totals(N)

quietly: table (ig_a02esp) (br_a04llam1) if br_a04llam1!=. | br_a04llam2!=. | br_a04llam3!=. | br_a04llam4!=. | br_a04llam5!=., statistic(percent, across(br_a04llam1)) nformat(%6.1f) name(table55) totals(br_a04llam1) append

quietly: table (ig_a02esp) (br_a04llam2) if br_a04llam1!=. | br_a04llam2!=. | br_a04llam3!=. | br_a04llam4!=. | br_a04llam5!=., statistic(percent, across(br_a04llam2)) nformat(%6.1f) name(table55) totals(br_a04llam2) append

quietly: table (ig_a02esp) (br_a04llam3) if br_a04llam1!=. | br_a04llam2!=. | br_a04llam3!=. | br_a04llam4!=. | br_a04llam5!=., statistic(percent, across(br_a04llam3)) nformat(%6.1f) name(table55) totals(br_a04llam3) append

quietly: table (ig_a02esp) (br_a04llam4) if br_a04llam1!=. | br_a04llam2!=. | br_a04llam3!=. | br_a04llam4!=. | br_a04llam5!=., statistic(percent, across(br_a04llam4)) nformat(%6.1f) name(table55) totals(br_a04llam4) append

quietly: table (ig_a02esp) (br_a04llam5) if br_a04llam1!=. | br_a04llam2!=. | br_a04llam3!=. | br_a04llam4!=. | br_a04llam5!=., statistic(percent, across(br_a04llam5)) nformat(%6.1f) name(table55) totals(br_a04llam5) append

collect layout (ig_a02esp) (N br_a04llam1[1] br_a04llam2[1] br_a04llam3[1] br_a04llam4[1] br_a04llam5[1]) 

collect style header N, level(hide)
collect style header br_a04llam1, level(hide)
collect style header br_a04llam2, level(hide)
collect style header br_a04llam3, level(hide)
collect style header br_a04llam4, level(hide)
collect style header br_a04llam5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 113: How the outbreak came to the attention of animal or human health authorities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(frequency) nformat(%6.0f) name(table56) totals(N)

quietly: table (ig_a02esp) (br_a04mue0) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue0)) nformat(%6.1f) name(table56) totals(br_a04mue0) append

quietly: table (ig_a02esp) (br_a04mue1) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue1)) nformat(%6.1f) name(table56) totals(br_a04mue1) append

quietly: table (ig_a02esp) (br_a04mue2) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue2)) nformat(%6.1f) name(table56) totals(br_a04mue2) append

quietly: table (ig_a02esp) (br_a04mue3) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue3)) nformat(%6.1f) name(table56) totals(br_a04mue3) append

quietly: table (ig_a02esp) (br_a04mue4) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue4)) nformat(%6.1f) name(table56) totals(br_a04mue4) append

quietly: table (ig_a02esp) (br_a04mue5) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue5)) nformat(%6.1f) name(table56) totals(br_a04mue5) append

quietly: table (ig_a02esp) (br_a04mue6) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue6)) nformat(%6.1f) name(table56) totals(br_a04mue6) append

quietly: table (ig_a02esp) (br_a04mue7) if br_a04mue0!=. | br_a04mue1!=. | br_a04mue2!=. | br_a04mue3!=. | br_a04mue4!=. | br_a04mue5!=. | br_a04mue6!=. | br_a04mue7!=., statistic(percent, across(br_a04mue7)) nformat(%6.1f) name(table56) totals(br_a04mue7) append

collect layout (ig_a02esp) (N br_a04mue0[1] br_a04mue1[1] br_a04mue2[1] br_a04mue3[1] br_a04mue4[1] br_a04mue5[1] br_a04mue6[1] br_a04mue7[1]) 

collect style header N, level(hide)
collect style header br_a04mue0, level(hide)
collect style header br_a04mue1, level(hide)
collect style header br_a04mue2, level(hide)
collect style header br_a04mue3, level(hide)
collect style header br_a04mue4, level(hide)
collect style header br_a04mue5, level(hide)
collect style header br_a04mue6, level(hide)
collect style header br_a04mue7, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 114: Type of samples collected") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(frequency) nformat(%6.0f) name(table57) totals(N)

quietly: table (ig_a02esp) (br_a04rec1) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(percent, across(br_a04rec1)) nformat(%6.1f) name(table57) totals(br_a04rec1) append

quietly: table (ig_a02esp) (br_a04rec2) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(percent, across(br_a04rec2)) nformat(%6.1f) name(table57) totals(br_a04rec2) append

quietly: table (ig_a02esp) (br_a04rec3) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(percent, across(br_a04rec3)) nformat(%6.1f) name(table57) totals(br_a04rec3) append

quietly: table (ig_a02esp) (br_a04rec4) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(percent, across(br_a04rec4)) nformat(%6.1f) name(table57) totals(br_a04rec4) append

quietly: table (ig_a02esp) (br_a04rec5) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(percent, across(br_a04rec5)) nformat(%6.1f) name(table57) totals(br_a04rec5) append

quietly: table (ig_a02esp) (br_a04rec6) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(percent, across(br_a04rec6)) nformat(%6.1f) name(table57) totals(br_a04rec6) append

quietly: table (ig_a02esp) (br_a04rec7) if br_a04rec1!=. | br_a04rec2!=. | br_a04rec3!=. | br_a04rec4!=. | br_a04rec5!=. | br_a04rec6!=. | br_a04rec7!=., statistic(percent, across(br_a04rec7)) nformat(%6.1f) name(table57) totals(br_a04rec7) append

collect layout (ig_a02esp) (N br_a04rec1[1] br_a04rec2[1] br_a04rec3[1] br_a04rec4[1] br_a04rec5[1] br_a04rec6[1] br_a04rec7[1]) 

collect style header N, level(hide)
collect style header br_a04rec1, level(hide)
collect style header br_a04rec2, level(hide)
collect style header br_a04rec3, level(hide)
collect style header br_a04rec4, level(hide)
collect style header br_a04rec5, level(hide)
collect style header br_a04rec6, level(hide)
collect style header br_a04rec7, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 115: Who collected the samples") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
quietly: table (ig_a02esp) (N) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(frequency) nformat(%6.0f) name(table58) totals(N)

quietly: table (ig_a02esp) (br_a04comp1) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp1)) nformat(%6.1f) name(table58) totals(br_a04comp1) append

quietly: table (ig_a02esp) (br_a04comp2) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp2)) nformat(%6.1f) name(table58) totals(br_a04comp2) append

quietly: table (ig_a02esp) (br_a04comp3) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp3)) nformat(%6.1f) name(table58) totals(br_a04comp3) append

quietly: table (ig_a02esp) (br_a04comp4) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp4)) nformat(%6.1f) name(table58) totals(br_a04comp4) append

quietly: table (ig_a02esp) (br_a04comp5) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp5)) nformat(%6.1f) name(table58) totals(br_a04comp5) append

quietly: table (ig_a02esp) (br_a04comp6) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp6)) nformat(%6.1f) name(table58) totals(br_a04comp6) append

quietly: table (ig_a02esp) (br_a04comp7) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp7)) nformat(%6.1f) name(table58) totals(br_a04comp7) append

quietly: table (ig_a02esp) (br_a04comp8) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp8)) nformat(%6.1f) name(table58) totals(br_a04comp8) append

quietly: table (ig_a02esp) (br_a04comp9) if br_a04comp1!=. | br_a04comp2!=. | br_a04comp3!=. | br_a04comp4!=. | br_a04comp5!=. | br_a04comp6!=. | br_a04comp7!=. | br_a04comp8!=. | br_a04comp9!=., statistic(percent, across(br_a04comp9)) nformat(%6.1f) name(table58) totals(br_a04comp9) append

collect layout (ig_a02esp) (N br_a04comp1[1] br_a04comp2[1] br_a04comp3[1] br_a04comp4[1] br_a04comp5[1] br_a04comp6[1] br_a04comp7[1] br_a04comp8[1] br_a04comp9[1]) 

collect style header N, level(hide)
collect style header br_a04comp1, level(hide)
collect style header br_a04comp2, level(hide)
collect style header br_a04comp3, level(hide)
collect style header br_a04comp4, level(hide)
collect style header br_a04comp5, level(hide)
collect style header br_a04comp6, level(hide)
collect style header br_a04comp7, level(hide)
collect style header br_a04comp8, level(hide)
collect style header br_a04comp9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 116: Other establishments, institutions, departments or agencies that shared the report") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("3. Analysis, Reports and Interpretation")

//////////////
putdocx paragraph, style(Heading1)
putdocx text ("National")

quietly: table (ig_a02esp) (N) if ai_a02!=. | ai_a03!=., statistic(frequency) nformat(%6.0f) name(table59) totals(N) 
quietly: table (ig_a02esp) (ai_a02) if ai_a02!=. | ai_a03!=., statistic(percent, across(ai_a02)) nformat(%6.1f) name(table59) totals(ai_a02) append
quietly: table (ig_a02esp) (ai_a03) if ai_a02!=. | ai_a03!=., statistic(percent, across(ai_a03)) nformat(%6.1f) name(table59) totals(ai_a03) append

collect layout (ig_a02esp) (N ai_a02[1] ai_a03[1]) 

collect style header N, level(hide)
collect style header ai_a02, level(hide)
collect style header ai_a03, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 117: Characteristics of the analysis, reporting and interpretation of surveillance data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(frequency) nformat(%6.0f) name(table60) totals(N) 
quietly: table (ig_a02esp) (ai_a03sof1) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof1)) nformat(%6.1f) name(table60) totals(ai_a03sof1) append
quietly: table (ig_a02esp) (ai_a03sof2) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof2)) nformat(%6.1f) name(table60) totals(ai_a03sof2) append
quietly: table (ig_a02esp) (ai_a03sof3) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof3)) nformat(%6.1f) name(table60) totals(ai_a03sof3) append
quietly: table (ig_a02esp) (ai_a03sof4) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof4)) nformat(%6.1f) name(table60) totals(ai_a03sof4) append
quietly: table (ig_a02esp) (ai_a03sof5) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof5)) nformat(%6.1f) name(table60) totals(ai_a03sof5) append
quietly: table (ig_a02esp) (ai_a03sof6) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof6)) nformat(%6.1f) name(table60) totals(ai_a03sof6) append
quietly: table (ig_a02esp) (ai_a03sof7) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof7)) nformat(%6.1f) name(table60) totals(ai_a03sof7) append
quietly: table (ig_a02esp) (ai_a03sof8) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof8)) nformat(%6.1f) name(table60) totals(ai_a03sof8) append
quietly: table (ig_a02esp) (ai_a03sof9) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof9)) nformat(%6.1f) name(table60) totals(ai_a03sof9) append
quietly: table (ig_a02esp) (ai_a03sof10) if ai_a03sof1!=.  | ai_a03sof2!=.  | ai_a03sof3!=.  | ai_a03sof4!=.  | ai_a03sof5!=.  | ai_a03sof6!=.  | ai_a03sof7!=.  | ai_a03sof8!=.  | ai_a03sof9!=.  | ai_a03sof10!=., statistic(percent, across(ai_a03sof10)) nformat(%6.1f) name(table60) totals(ai_a03sof10) append

collect layout (ig_a02esp) (N ai_a03sof1[1] ai_a03sof2[1] ai_a03sof3[1] ai_a03sof4[1] ai_a03sof5[1] ai_a03sof6[1] ai_a03sof7[1] ai_a03sof8[1] ai_a03sof9[1] ai_a03sof10[1]) 

collect style header N, level(hide)
collect style header ai_a03sof1, level(hide)
collect style header ai_a03sof2, level(hide)
collect style header ai_a03sof3, level(hide)
collect style header ai_a03sof4, level(hide)
collect style header ai_a03sof5, level(hide)
collect style header ai_a03sof6, level(hide)
collect style header ai_a03sof7, level(hide)
collect style header ai_a03sof8, level(hide)
collect style header ai_a03sof9, level(hide)
collect style header ai_a03sof10, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 118: Softwares used to prepare surveillance reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(frequency) nformat(%6.0f) name(table61) totals(N) 

quietly: table (ig_a02esp) (ai_a04) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04)) nformat(%6.1f) name(table61) totals(ai_a04) append

quietly: table (ig_a02esp) (ai_a04ofi1) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04ofi1)) nformat(%6.1f) name(table61) totals(ai_a04ofi1) append

quietly: table (ig_a02esp) (ai_a04ofi2) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04ofi2)) nformat(%6.1f) name(table61) totals(ai_a04ofi2) append

quietly: table (ig_a02esp) (ai_a04ofi3) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04ofi3)) nformat(%6.1f) name(table61) totals(ai_a04ofi3) append

quietly: table (ig_a02esp) (ai_a04ofi4) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04ofi4)) nformat(%6.1f) name(table61) totals(ai_a04ofi4) append

quietly: table (ig_a02esp) (ai_a04ofi5) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04ofi5)) nformat(%6.1f) name(table61) totals(ai_a04ofi5) append

quietly: table (ig_a02esp) (ai_a04ofi6) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04ofi6)) nformat(%6.1f) name(table61) totals(ai_a04ofi6) append

quietly: table (ig_a02esp) (ai_a04ofi7) if ai_a04!=. | ai_a04ofi1!=.  | ai_a04ofi2!=.  | ai_a04ofi3!=.  | ai_a04ofi4!=.  | ai_a04ofi5!=.  | ai_a04ofi6!=.  | ai_a04ofi7!=., statistic(percent, across(ai_a04ofi7)) nformat(%6.1f) name(table61) totals(ai_a04ofi7) append


collect layout (ig_a02esp) (N ai_a04 ai_a04ofi1[1] ai_a04ofi2[1] ai_a04ofi3[1] ai_a04ofi4[1] ai_a04ofi5[1] ai_a04ofi6[1] ai_a04ofi7[1]) 

collect style header N, level(hide)
collect style header ai_a04ofi1, level(hide)
collect style header ai_a04ofi2, level(hide)
collect style header ai_a04ofi3, level(hide)
collect style header ai_a04ofi4, level(hide)
collect style header ai_a04ofi5, level(hide)
collect style header ai_a04ofi6, level(hide)
collect style header ai_a04ofi7, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 119: Receive surveillance reports and from which offices") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ai_a04frec!=., statistic(frequency) nformat(%6.0f) name(table62) totals(N) 
quietly: table (ig_a02esp) (ai_a04frec) if ai_a04frec!=., statistic(percent, across(ai_a04frec)) nformat(%6.1f) name(table62) totals(ai_a04frec) append

collect layout (ig_a02esp) (N ai_a04frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 120: Frequency of receiving surveillance reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(frequency) nformat(%6.0f) name(table63) totals(N) 

quietly: table (ig_a02esp) (ai_a04inf1) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf1)) nformat(%6.1f) name(table63) totals(ai_a04inf1) append

quietly: table (ig_a02esp) (ai_a04inf2) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf2)) nformat(%6.1f) name(table63) totals(ai_a04inf2) append

quietly: table (ig_a02esp) (ai_a04inf3) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf3)) nformat(%6.1f) name(table63) totals(ai_a04inf3) append

quietly: table (ig_a02esp) (ai_a04inf4) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf4)) nformat(%6.1f) name(table63) totals(ai_a04inf4) append

quietly: table (ig_a02esp) (ai_a04inf5) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf5)) nformat(%6.1f) name(table63) totals(ai_a04inf5) append

quietly: table (ig_a02esp) (ai_a04inf6) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf6)) nformat(%6.1f) name(table63) totals(ai_a04inf6) append

quietly: table (ig_a02esp) (ai_a04inf7) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf7)) nformat(%6.1f) name(table63) totals(ai_a04inf7) append

quietly: table (ig_a02esp) (ai_a04inf8) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf8)) nformat(%6.1f) name(table63) totals(ai_a04inf8) append

quietly: table (ig_a02esp) (ai_a04inf9) if ai_a04inf1!=.  | ai_a04inf2!=.  | ai_a04inf3!=.  | ai_a04inf4!=.  | ai_a04inf5!=.  | ai_a04inf6!=.  | ai_a04inf7!=. | ai_a04inf8!=. | ai_a04inf9!=., statistic(percent, across(ai_a04inf9)) nformat(%6.1f) name(table63) totals(ai_a04inf9) append

collect layout (ig_a02esp) (N ai_a04inf1[1] ai_a04inf2[1] ai_a04inf3[1] ai_a04inf4[1] ai_a04inf5[1] ai_a04inf6[1] ai_a04inf7[1] ai_a04inf8[1] ai_a04inf9[1])

collect style header N, level(hide)
collect style header ai_a04inf1, level(hide)
collect style header ai_a04inf2, level(hide)
collect style header ai_a04inf3, level(hide)
collect style header ai_a04inf4, level(hide)
collect style header ai_a04inf5, level(hide)
collect style header ai_a04inf6, level(hide)
collect style header ai_a04inf7, level(hide)
collect style header ai_a04inf8, level(hide)
collect style header ai_a04inf9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 121: How you receive the reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if ai_a04tip1!=.  | ai_a04tip2!=.  | ai_a04tip3!=.  | ai_a04tip4!=., statistic(frequency) nformat(%6.0f) name(table64) totals(N) 
quietly: table (ig_a02esp) (ai_a04tip1) if ai_a04tip1!=.  | ai_a04tip2!=.  | ai_a04tip3!=.  | ai_a04tip4!=., statistic(percent, across(ai_a04tip1)) nformat(%6.1f) name(table64) totals(ai_a04tip1) append

quietly: table (ig_a02esp) (ai_a04tip2) if ai_a04tip1!=.  | ai_a04tip2!=.  | ai_a04tip3!=.  | ai_a04tip4!=., statistic(percent, across(ai_a04tip2)) nformat(%6.1f) name(table64) totals(ai_a04tip2) append

quietly: table (ig_a02esp) (ai_a04tip3) if ai_a04tip1!=.  | ai_a04tip2!=.  | ai_a04tip3!=.  | ai_a04tip4!=., statistic(percent, across(ai_a04tip3)) nformat(%6.1f) name(table64) totals(ai_a04tip3) append

quietly: table (ig_a02esp) (ai_a04tip4) if ai_a04tip1!=.  | ai_a04tip2!=.  | ai_a04tip3!=.  | ai_a04tip4!=., statistic(percent, across(ai_a04tip4)) nformat(%6.1f) name(table64) totals(ai_a04tip4) append

collect layout (ig_a02esp) (N ai_a04tip1[1] ai_a04tip2[1] ai_a04tip3[1] ai_a04tip4[1])

collect style header N, level(hide)
collect style header ai_a04tip1, level(hide)
collect style header ai_a04tip2, level(hide)
collect style header ai_a04tip3, level(hide)
collect style header ai_a04tip4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 122: Type of reports received") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if ai_a05!=., statistic(frequency) nformat(%6.0f) name(table65) totals(N) 
quietly: table (ig_a02esp) (ai_a05) if ai_a05!=., statistic(percent, across(ai_a05)) nformat(%6.1f) name(table65) totals(ai_a05) append

collect layout (ig_a02esp) (N ai_a05) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 123: The report formats are standardized") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////////
quietly: table (ig_a02esp) (N) if ai_a071!=.  | ai_a072!=.  | ai_a073!=.  | ai_a074!=.  | ai_a075!=., statistic(frequency) nformat(%6.0f) name(table66) totals(N) 
quietly: table (ig_a02esp) (ai_a071) if ai_a071!=.  | ai_a072!=.  | ai_a073!=.  | ai_a074!=.  | ai_a075!=., statistic(percent, across(ai_a071)) nformat(%6.1f) name(table66) totals(ai_a071) append
quietly: table (ig_a02esp) (ai_a072) if ai_a071!=.  | ai_a072!=.  | ai_a073!=.  | ai_a074!=.  | ai_a075!=., statistic(percent, across(ai_a072)) nformat(%6.1f) name(table66) totals(ai_a072) append
quietly: table (ig_a02esp) (ai_a073) if ai_a071!=.  | ai_a072!=.  | ai_a073!=.  | ai_a074!=.  | ai_a075!=., statistic(percent, across(ai_a073)) nformat(%6.1f) name(table66) totals(ai_a073) append
quietly: table (ig_a02esp) (ai_a074) if ai_a071!=.  | ai_a072!=.  | ai_a073!=.  | ai_a074!=.  | ai_a075!=., statistic(percent, across(ai_a074)) nformat(%6.1f) name(table66) totals(ai_a074) append
quietly: table (ig_a02esp) (ai_a075) if ai_a071!=.  | ai_a072!=.  | ai_a073!=.  | ai_a074!=.  | ai_a075!=., statistic(percent, across(ai_a075)) nformat(%6.1f) name(table66) totals(ai_a075) append

collect layout (ig_a02esp) (N ai_a071[1] ai_a072[1] ai_a073[1] ai_a074[1] ai_a075[1])

collect style header N, level(hide)
collect style header ai_a071, level(hide)
collect style header ai_a072, level(hide)
collect style header ai_a073, level(hide)
collect style header ai_a074, level(hide)
collect style header ai_a075, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 124: Target audience for surveillance reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////////
quietly: table (ig_a02esp) (N) if ai_a08!=., statistic(frequency) nformat(%6.0f) name(table67) totals(N) 
quietly: table (ig_a02esp) (ai_a08) if ai_a08!=., statistic(percent, across(ai_a08)) nformat(%6.1f) name(table67) totals(ai_a08) append

collect layout (ig_a02esp) (N ai_a08) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 125: Their office send reports to other agencies, establishments or locations") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////////
quietly: table (ig_a02esp) (N) if ai_a08cua1!=.  | ai_a08cua2!=.  | ai_a08cua3!=.  | ai_a08cua4!=.  | ai_a08cua5!=.  | ai_a08cua6!=., statistic(frequency) nformat(%6.0f) name(table68) totals(N) 
quietly: table (ig_a02esp) (ai_a08cua1) if ai_a08cua1!=.  | ai_a08cua2!=.  | ai_a08cua3!=.  | ai_a08cua4!=.  | ai_a08cua5!=.  | ai_a08cua6!=., statistic(percent, across(ai_a08cua1)) nformat(%6.1f) name(table68) totals(ai_a08cua1) append

quietly: table (ig_a02esp) (ai_a08cua2) if ai_a08cua1!=.  | ai_a08cua2!=.  | ai_a08cua3!=.  | ai_a08cua4!=.  | ai_a08cua5!=.  | ai_a08cua6!=., statistic(percent, across(ai_a08cua2)) nformat(%6.1f) name(table68) totals(ai_a08cua2) append

quietly: table (ig_a02esp) (ai_a08cua3) if ai_a08cua1!=.  | ai_a08cua2!=.  | ai_a08cua3!=.  | ai_a08cua4!=.  | ai_a08cua5!=.  | ai_a08cua6!=., statistic(percent, across(ai_a08cua3)) nformat(%6.1f) name(table68) totals(ai_a08cua3) append

quietly: table (ig_a02esp) (ai_a08cua4) if ai_a08cua1!=.  | ai_a08cua2!=.  | ai_a08cua3!=.  | ai_a08cua4!=.  | ai_a08cua5!=.  | ai_a08cua6!=., statistic(percent, across(ai_a08cua4)) nformat(%6.1f) name(table68) totals(ai_a08cua4) append

quietly: table (ig_a02esp) (ai_a08cua5) if ai_a08cua1!=.  | ai_a08cua2!=.  | ai_a08cua3!=.  | ai_a08cua4!=.  | ai_a08cua5!=.  | ai_a08cua6!=., statistic(percent, across(ai_a08cua5)) nformat(%6.1f) name(table68) totals(ai_a08cua5) append

quietly: table (ig_a02esp) (ai_a08cua6) if ai_a08cua1!=.  | ai_a08cua2!=.  | ai_a08cua3!=.  | ai_a08cua4!=.  | ai_a08cua5!=.  | ai_a08cua6!=., statistic(percent, across(ai_a08cua6)) nformat(%6.1f) name(table68) totals(ai_a08cua6) append

collect layout (ig_a02esp) (N ai_a08cua1[1] ai_a08cua2[1] ai_a08cua3[1] ai_a08cua4[1] ai_a08cua5[1] ai_a08cua6[1])

collect style header N, level(hide)
collect style header ai_a08cua1, level(hide)
collect style header ai_a08cua2, level(hide)
collect style header ai_a08cua3, level(hide)
collect style header ai_a08cua4, level(hide)
collect style header ai_a08cua5, level(hide)
collect style header ai_a08cua6, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 126: Agencies, establishments or locations to which it sends reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////
quietly: table (ig_a02esp) (N) if ai_a08frec!=., statistic(frequency) nformat(%6.0f) name(table69) totals(N) 
quietly: table (ig_a02esp) (ai_a08frec) if ai_a08frec!=., statistic(percent, across(ai_a08frec)) nformat(%6.1f) name(table69) totals(ai_a08frec) append

collect layout (ig_a02esp) (N ai_a08frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 127: Frequency of reporting to other agencies") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
quietly: table (ig_a02esp) (N) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(frequency) nformat(%6.0f) name(table70) totals(N) 
quietly: table (ig_a02esp) (ai_a08env1) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env1)) nformat(%6.1f) name(table70) totals(ai_a08env1) append

quietly: table (ig_a02esp) (ai_a08env2) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env2)) nformat(%6.1f) name(table70) totals(ai_a08env2) append

quietly: table (ig_a02esp) (ai_a08env3) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env3)) nformat(%6.1f) name(table70) totals(ai_a08env3) append

quietly: table (ig_a02esp) (ai_a08env4) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env4)) nformat(%6.1f) name(table70) totals(ai_a08env4) append

quietly: table (ig_a02esp) (ai_a08env5) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env5)) nformat(%6.1f) name(table70) totals(ai_a08env5) append

quietly: table (ig_a02esp) (ai_a08env6) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env6)) nformat(%6.1f) name(table70) totals(ai_a08env6) append

quietly: table (ig_a02esp) (ai_a08env7) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env7)) nformat(%6.1f) name(table70) totals(ai_a08env7) append

quietly: table (ig_a02esp) (ai_a08env8) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env8)) nformat(%6.1f) name(table70) totals(ai_a08env8) append

quietly: table (ig_a02esp) (ai_a08env9) if ai_a08env1!=.  | ai_a08env2!=.  | ai_a08env3!=.  | ai_a08env4!=.  | ai_a08env5!=.  | ai_a08env6!=.  | ai_a08env7!=. | ai_a08env8!=. | ai_a08env9!=., statistic(percent, across(ai_a08env9)) nformat(%6.1f) name(table70) totals(ai_a08env9) append

collect layout (ig_a02esp) (N ai_a08env1[1] ai_a08env2[1] ai_a08env3[1] ai_a08env4[1] ai_a08env5[1] ai_a08env6[1] ai_a08env7[1] ai_a08env8[1] ai_a08env9[1])

collect style header N, level(hide)
collect style header ai_a08env1, level(hide)
collect style header ai_a08env2, level(hide)
collect style header ai_a08env3, level(hide)
collect style header ai_a08env4, level(hide)
collect style header ai_a08env5, level(hide)
collect style header ai_a08env6, level(hide)
collect style header ai_a08env7, level(hide)
collect style header ai_a08env8, level(hide)
collect style header ai_a08env9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 128: How to send reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ai_a09!=. | ai_a09cua1!=. | ai_a09cua2!=. | ai_a09cua3!=. | ai_a09cua4!=., statistic(frequency) nformat(%6.0f) name(table71) totals(N) 
quietly: table (ig_a02esp) (ai_a09) if ai_a09!=. | ai_a09cua1!=. | ai_a09cua2!=. | ai_a09cua3!=. | ai_a09cua4!=., statistic(percent, across(ai_a09)) nformat(%6.1f) name(table71) totals(ai_a09) append
quietly: table (ig_a02esp) (ai_a09cua1) if ai_a09!=. | ai_a09cua1!=. | ai_a09cua2!=. | ai_a09cua3!=. | ai_a09cua4!=., statistic(percent, across(ai_a09cua1)) nformat(%6.1f) name(table71) totals(ai_a09cua1) append
quietly: table (ig_a02esp) (ai_a09cua2) if ai_a09!=. | ai_a09cua1!=. | ai_a09cua2!=. | ai_a09cua3!=. | ai_a09cua4!=., statistic(percent, across(ai_a09cua2)) nformat(%6.1f) name(table71) totals(ai_a09cua2) append
quietly: table (ig_a02esp) (ai_a09cua3) if ai_a09!=. | ai_a09cua1!=. | ai_a09cua2!=. | ai_a09cua3!=. | ai_a09cua4!=., statistic(percent, across(ai_a09cua3)) nformat(%6.1f) name(table71) totals(ai_a09cua3) append
quietly: table (ig_a02esp) (ai_a09cua4) if ai_a09!=. | ai_a09cua1!=. | ai_a09cua2!=. | ai_a09cua3!=. | ai_a09cua4!=., statistic(percent, across(ai_a09cua4)) nformat(%6.1f) name(table71) totals(ai_a09cua4) append

collect layout (ig_a02esp) (N ai_a09 ai_a09cua1[1] ai_a09cua2[1] ai_a09cua3[1] ai_a09cua4[1])

collect style header N, level(hide)
collect style header ai_a09cua1, level(hide)
collect style header ai_a09cua2, level(hide)
collect style header ai_a09cua3, level(hide)
collect style header ai_a09cua4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 129: Requests data or information from other entities and from whom it is requested") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////////
quietly: table (ig_a02esp) (N) if ai_a09frec!=., statistic(frequency) nformat(%6.0f) name(table72) totals(N) 
quietly: table (ig_a02esp) (ai_a09frec) if ai_a09frec!=., statistic(percent, across(ai_a09frec)) nformat(%6.1f) name(table72) totals(ai_a09frec) append

collect layout (ig_a02esp) (N ai_a09frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 130: Frequency of requests for data or information from other entities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
quietly: table (ig_a02esp) (N) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(frequency) nformat(%6.0f) name(table73) totals(N) 
quietly: table (ig_a02esp) (ai_a09sol1) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol1)) nformat(%6.1f) name(table73) totals(ai_a09sol1) append

quietly: table (ig_a02esp) (ai_a09sol2) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol2)) nformat(%6.1f) name(table73) totals(ai_a09sol2) append

quietly: table (ig_a02esp) (ai_a09sol3) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol3)) nformat(%6.1f) name(table73) totals(ai_a09sol3) append

quietly: table (ig_a02esp) (ai_a09sol4) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol4)) nformat(%6.1f) name(table73) totals(ai_a09sol4) append

quietly: table (ig_a02esp) (ai_a09sol5) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol5)) nformat(%6.1f) name(table73) totals(ai_a09sol5) append

quietly: table (ig_a02esp) (ai_a09sol6) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol6)) nformat(%6.1f) name(table73) totals(ai_a09sol6) append

quietly: table (ig_a02esp) (ai_a09sol7) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol7)) nformat(%6.1f) name(table73) totals(ai_a09sol7) append

quietly: table (ig_a02esp) (ai_a09sol8) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol8)) nformat(%6.1f) name(table73) totals(ai_a09sol8) append

quietly: table (ig_a02esp) (ai_a09sol9) if ai_a09sol1!=.  | ai_a09sol2!=.  | ai_a09sol3!=.  | ai_a09sol4!=.  | ai_a09sol5!=.  | ai_a09sol6!=.  | ai_a09sol7!=. | ai_a09sol8!=. | ai_a09sol9!=., statistic(percent, across(ai_a09sol9)) nformat(%6.1f) name(table73) totals(ai_a09sol9) append

collect layout (ig_a02esp) (N ai_a09sol1[1] ai_a09sol2[1] ai_a09sol3[1] ai_a09sol4[1] ai_a09sol5[1] ai_a09sol6[1] ai_a09sol7[1] ai_a09sol8[1] ai_a09sol9[1])

collect style header N, level(hide)
collect style header ai_a09sol1, level(hide)
collect style header ai_a09sol2, level(hide)
collect style header ai_a09sol3, level(hide)
collect style header ai_a09sol4, level(hide)
collect style header ai_a09sol5, level(hide)
collect style header ai_a09sol6, level(hide)
collect style header ai_a09sol7, level(hide)
collect style header ai_a09sol8, level(hide)
collect style header ai_a09sol9, level(hide)

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 131: How information is requested from other entities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(frequency) nformat(%6.0f) name(table74) totals(N) 
quietly: table (ig_a02esp) (ai_a100) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a100)) nformat(%6.1f) name(table74) totals(ai_a100) append

quietly: table (ig_a02esp) (ai_a101) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a101)) nformat(%6.1f) name(table74) totals(ai_a101) append

quietly: table (ig_a02esp) (ai_a102) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a102)) nformat(%6.1f) name(table74) totals(ai_a102) append

quietly: table (ig_a02esp) (ai_a103) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a103)) nformat(%6.1f) name(table74) totals(ai_a103) append

quietly: table (ig_a02esp) (ai_a104) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a104)) nformat(%6.1f) name(table74) totals(ai_a104) append

quietly: table (ig_a02esp) (ai_a105) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a105)) nformat(%6.1f) name(table74) totals(ai_a105) append

quietly: table (ig_a02esp) (ai_a106) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a106)) nformat(%6.1f) name(table74) totals(ai_a106) append

quietly: table (ig_a02esp) (ai_a107) if ai_a100!=. | ai_a101!=.  | ai_a102!=.  | ai_a103!=.  | ai_a104!=.  | ai_a105!=.  | ai_a106!=.  | ai_a107!=., statistic(percent, across(ai_a107)) nformat(%6.1f) name(table74) totals(ai_a107) append

collect layout (ig_a02esp) (N ai_a100[1] ai_a101[1] ai_a102[1] ai_a103[1] ai_a104[1] ai_a105[1] ai_a106[1] ai_a107[1])

collect style header N, level(hide)
collect style header ai_a100, level(hide)
collect style header ai_a101, level(hide)
collect style header ai_a102, level(hide)
collect style header ai_a103, level(hide)
collect style header ai_a104, level(hide)
collect style header ai_a105, level(hide)
collect style header ai_a106, level(hide)
collect style header ai_a107, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 132: Reports data or information to one of the following entities (international surveillance networks") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////////////
quietly: table (ig_a02esp) (N) if ai_a10rep1!=.  | ai_a10rep2!=.  | ai_a10rep3!=.  | ai_a10rep4!=.  | ai_a10rep5!=., statistic(frequency) nformat(%6.0f) name(table75) totals(N) 
quietly: table (ig_a02esp) (ai_a10rep1) if ai_a10rep1!=.  | ai_a10rep2!=.  | ai_a10rep3!=.  | ai_a10rep4!=.  | ai_a10rep5!=., statistic(percent, across(ai_a10rep1)) nformat(%6.1f) name(table75) totals(ai_a10rep1) append
quietly: table (ig_a02esp) (ai_a10rep2) if ai_a10rep1!=.  | ai_a10rep2!=.  | ai_a10rep3!=.  | ai_a10rep4!=.  | ai_a10rep5!=., statistic(percent, across(ai_a10rep2)) nformat(%6.1f) name(table75) totals(ai_a10rep2) append
quietly: table (ig_a02esp) (ai_a10rep3) if ai_a10rep1!=.  | ai_a10rep2!=.  | ai_a10rep3!=.  | ai_a10rep4!=.  | ai_a10rep5!=., statistic(percent, across(ai_a10rep3)) nformat(%6.1f) name(table75) totals(ai_a10rep3) append
quietly: table (ig_a02esp) (ai_a10rep4) if ai_a10rep1!=.  | ai_a10rep2!=.  | ai_a10rep3!=.  | ai_a10rep4!=.  | ai_a10rep5!=., statistic(percent, across(ai_a10rep4)) nformat(%6.1f) name(table75) totals(ai_a10rep4) append
quietly: table (ig_a02esp) (ai_a10rep5) if ai_a10rep1!=.  | ai_a10rep2!=.  | ai_a10rep3!=.  | ai_a10rep4!=.  | ai_a10rep5!=., statistic(percent, across(ai_a10rep5)) nformat(%6.1f) name(table75) totals(ai_a10rep5) append

collect layout (ig_a02esp) (N ai_a10rep1[1] ai_a10rep2[1] ai_a10rep3[1] ai_a10rep4[1] ai_a10rep5[1])

collect style header N, level(hide)
collect style header ai_a10rep1, level(hide)
collect style header ai_a10rep2, level(hide)
collect style header ai_a10rep3, level(hide)
collect style header ai_a10rep4, level(hide)
collect style header ai_a10rep5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 133: What data it reports to international surveillance networks") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////////
quietly: table (ig_a02esp) (N) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(frequency) nformat(%6.0f) name(table76) totals(N) 
quietly: table (ig_a02esp) (ai_a10como1) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como1)) nformat(%6.1f) name(table76) totals(ai_a10como1) append

quietly: table (ig_a02esp) (ai_a10como2) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como2)) nformat(%6.1f) name(table76) totals(ai_a10como2) append

quietly: table (ig_a02esp) (ai_a10como3) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como3)) nformat(%6.1f) name(table76) totals(ai_a10como3) append

quietly: table (ig_a02esp) (ai_a10como4) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como4)) nformat(%6.1f) name(table76) totals(ai_a10como4) append

quietly: table (ig_a02esp) (ai_a10como5) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como5)) nformat(%6.1f) name(table76) totals(ai_a10como5) append

quietly: table (ig_a02esp) (ai_a10como6) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como6)) nformat(%6.1f) name(table76) totals(ai_a10como6) append

quietly: table (ig_a02esp) (ai_a10como7) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como7)) nformat(%6.1f) name(table76) totals(ai_a10como7) append

quietly: table (ig_a02esp) (ai_a10como8) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como8)) nformat(%6.1f) name(table76) totals(ai_a10como8) append

quietly: table (ig_a02esp) (ai_a10como9) if ai_a10como1!=.  | ai_a10como2!=.  | ai_a10como3!=.  | ai_a10como4!=.  | ai_a10como5!=.  | ai_a10como6!=.  | ai_a10como7!=. | ai_a10como8!=. | ai_a10como9!=., statistic(percent, across(ai_a10como9)) nformat(%6.1f) name(table76) totals(ai_a10como9) append

collect layout (ig_a02esp) (N ai_a10como1[1] ai_a10como2[1] ai_a10como3[1] ai_a10como4[1] ai_a10como5[1] ai_a10como6[1] ai_a10como7[1] ai_a10como8[1] ai_a10como9[1])

collect style header N, level(hide)
collect style header ai_a10como1, level(hide)
collect style header ai_a10como2, level(hide)
collect style header ai_a10como3, level(hide)
collect style header ai_a10como4, level(hide)
collect style header ai_a10como5, level(hide)
collect style header ai_a10como6, level(hide)
collect style header ai_a10como7, level(hide)
collect style header ai_a10como8, level(hide)
collect style header ai_a10como9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 134: How data is reported to international surveillance networks") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if ai_a10frec!=., statistic(frequency) nformat(%6.0f) name(table77) totals(N) 
quietly: table (ig_a02esp) (ai_a10frec) if ai_a10frec!=., statistic(percent, across(ai_a10frec)) nformat(%6.1f) name(table77) totals(ai_a10frec) append

collect layout (ig_a02esp) (N ai_a10frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 135: Frequency with which it reports data to international monitoring networks") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
quietly: table (ig_a02esp) (N) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(frequency) nformat(%6.0f) name(table78) totals(N) 
quietly: table (ig_a02esp) (ai_a111) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(percent, across(ai_a111)) nformat(%6.1f) name(table78) totals(ai_a111) append
quietly: table (ig_a02esp) (ai_a112) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(percent, across(ai_a112)) nformat(%6.1f) name(table78) totals(ai_a112) append
quietly: table (ig_a02esp) (ai_a113) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(percent, across(ai_a113)) nformat(%6.1f) name(table78) totals(ai_a113) append
quietly: table (ig_a02esp) (ai_a114) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(percent, across(ai_a114)) nformat(%6.1f) name(table78) totals(ai_a114) append
quietly: table (ig_a02esp) (ai_a115) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(percent, across(ai_a115)) nformat(%6.1f) name(table78) totals(ai_a115) append
quietly: table (ig_a02esp) (ai_a116) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(percent, across(ai_a116)) nformat(%6.1f) name(table78) totals(ai_a116) append
quietly: table (ig_a02esp) (ai_a117) if ai_a111!=.  | ai_a112!=.  | ai_a113!=.  | ai_a114!=.  | ai_a115!=.  | ai_a116!=.  | ai_a117!=., statistic(percent, across(ai_a117)) nformat(%6.1f) name(table78) totals(ai_a117) append

collect layout (ig_a02esp) (N ai_a111[1] ai_a112[1] ai_a113[1] ai_a114[1] ai_a115[1] ai_a116[1] ai_a117[1])

collect style header N, level(hide)
collect style header ai_a111, level(hide)
collect style header ai_a112, level(hide)
collect style header ai_a113, level(hide)
collect style header ai_a114, level(hide)
collect style header ai_a115, level(hide)
collect style header ai_a116, level(hide)
collect style header ai_a117, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 136: Receives data or information from any of the following entities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////////
quietly: table (ig_a02esp) (N) if ai_a11rep1!=.  | ai_a11rep2!=.  | ai_a11rep3!=.  | ai_a11rep4!=.  | ai_a11rep5!=., statistic(frequency) nformat(%6.0f) name(table79) totals(N) 
quietly: table (ig_a02esp) (ai_a11rep1) if ai_a11rep1!=.  | ai_a11rep2!=.  | ai_a11rep3!=.  | ai_a11rep4!=.  | ai_a11rep5!=., statistic(percent, across(ai_a11rep1)) nformat(%6.1f) name(table79) totals(ai_a11rep1) append
quietly: table (ig_a02esp) (ai_a11rep2) if ai_a11rep1!=.  | ai_a11rep2!=.  | ai_a11rep3!=.  | ai_a11rep4!=.  | ai_a11rep5!=., statistic(percent, across(ai_a11rep2)) nformat(%6.1f) name(table79) totals(ai_a11rep2) append
quietly: table (ig_a02esp) (ai_a11rep3) if ai_a11rep1!=.  | ai_a11rep2!=.  | ai_a11rep3!=.  | ai_a11rep4!=.  | ai_a11rep5!=., statistic(percent, across(ai_a11rep3)) nformat(%6.1f) name(table79) totals(ai_a11rep3) append
quietly: table (ig_a02esp) (ai_a11rep4) if ai_a11rep1!=.  | ai_a11rep2!=.  | ai_a11rep3!=.  | ai_a11rep4!=.  | ai_a11rep5!=., statistic(percent, across(ai_a11rep4)) nformat(%6.1f) name(table79) totals(ai_a11rep4) append
quietly: table (ig_a02esp) (ai_a11rep5) if ai_a11rep1!=.  | ai_a11rep2!=.  | ai_a11rep3!=.  | ai_a11rep4!=.  | ai_a11rep5!=., statistic(percent, across(ai_a11rep5)) nformat(%6.1f) name(table79) totals(ai_a11rep5) append

collect layout (ig_a02esp) (N ai_a11rep1[1] ai_a11rep2[1] ai_a11rep3[1] ai_a11rep4[1] ai_a11rep5[1])

collect style header N, level(hide)
collect style header ai_a11rep1, level(hide)
collect style header ai_a11rep2, level(hide)
collect style header ai_a11rep3, level(hide)
collect style header ai_a11rep4, level(hide)
collect style header ai_a11rep5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 137: Data it receives from the entities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if ai_a11frec!=., statistic(frequency) nformat(%6.0f) name(table80) totals(N) 
quietly: table (ig_a02esp) (ai_a11frec) if ai_a11frec!=., statistic(percent, across(ai_a11frec)) nformat(%6.1f) name(table80) totals(ai_a11frec) append

collect layout (ig_a02esp) (N ai_a11frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 138: Frequency with receives data from the entities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(frequency) nformat(%6.0f) name(table81) totals(N) 
quietly: table (ig_a02esp) (ai_a11rec1) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec1)) nformat(%6.1f) name(table81) totals(ai_a11rec1) append

quietly: table (ig_a02esp) (ai_a11rec2) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec2)) nformat(%6.1f) name(table81) totals(ai_a11rec2) append

quietly: table (ig_a02esp) (ai_a11rec3) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec3)) nformat(%6.1f) name(table81) totals(ai_a11rec3) append

quietly: table (ig_a02esp) (ai_a11rec4) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec4)) nformat(%6.1f) name(table81) totals(ai_a11rec4) append

quietly: table (ig_a02esp) (ai_a11rec5) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec5)) nformat(%6.1f) name(table81) totals(ai_a11rec5) append

quietly: table (ig_a02esp) (ai_a11rec6) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec6)) nformat(%6.1f) name(table81) totals(ai_a11rec6) append

quietly: table (ig_a02esp) (ai_a11rec7) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec7)) nformat(%6.1f) name(table81) totals(ai_a11rec7) append

quietly: table (ig_a02esp) (ai_a11rec8) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec8)) nformat(%6.1f) name(table81) totals(ai_a11rec8) append

quietly: table (ig_a02esp) (ai_a11rec9) if ai_a11rec1!=.  | ai_a11rec2!=.  | ai_a11rec3!=.  | ai_a11rec4!=.  | ai_a11rec5!=.  | ai_a11rec6!=.  | ai_a11rec7!=. | ai_a11rec8!=. | ai_a11rec9!=., statistic(percent, across(ai_a11rec9)) nformat(%6.1f) name(table81) totals(ai_a11rec9) append

collect layout (ig_a02esp) (N ai_a11rec1[1] ai_a11rec2[1] ai_a11rec3[1] ai_a11rec4[1] ai_a11rec5[1] ai_a11rec6[1] ai_a11rec7[1] ai_a11rec8[1] ai_a11rec9[1])

collect style header N, level(hide)
collect style header ai_a11rec1, level(hide)
collect style header ai_a11rec2, level(hide)
collect style header ai_a11rec3, level(hide)
collect style header ai_a11rec4, level(hide)
collect style header ai_a11rec5, level(hide)
collect style header ai_a11rec6, level(hide)
collect style header ai_a11rec7, level(hide)
collect style header ai_a11rec8, level(hide)
collect style header ai_a11rec9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 139: How it receives data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

//////////////
putdocx paragraph, style(Heading1)
putdocx text ("Local Health Facility")

/////////////
quietly: table (ig_a02esp) (N) if  ai_b011!=. | ai_b012!=. | ai_b013!=. | ai_b014!=., statistic(frequency) nformat(%6.0f) name(table82) totals(N) 
quietly: table (ig_a02esp) (ai_b011) if ai_b011!=. | ai_b012!=. | ai_b013!=. | ai_b014!=., statistic(percent, across(ai_b011)) nformat(%6.1f) name(table82) totals(ai_b011) append
quietly: table (ig_a02esp) (ai_b012) if ai_b011!=. | ai_b012!=. | ai_b013!=. | ai_b014!=., statistic(percent, across(ai_b012)) nformat(%6.1f) name(table82) totals(ai_b012) append
quietly: table (ig_a02esp) (ai_b013) if ai_b011!=. | ai_b012!=. | ai_b013!=. | ai_b014!=., statistic(percent, across(ai_b013)) nformat(%6.1f) name(table82) totals(ai_b013) append
quietly: table (ig_a02esp) (ai_b014) if ai_b011!=. | ai_b012!=. | ai_b013!=. | ai_b014!=., statistic(percent, across(ai_b014)) nformat(%6.1f) name(table82) totals(ai_b014) append

collect layout (ig_a02esp) (N ai_b011[1] ai_b012[1] ai_b013[1] ai_b014[1])

collect style header N, level(hide)
collect style header ai_b011, level(hide)
collect style header ai_b012, level(hide)
collect style header ai_b013, level(hide)
collect style header ai_b014, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 140: How surveillance reports are used in your facility") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if ai_b02!=., statistic(frequency) nformat(%6.0f) name(table83) totals(N) 
quietly: table (ig_a02esp) (ai_b02) if ai_b02!=., statistic(percent, across(ai_b02)) nformat(%6.1f) name(table83) totals(ai_b02) append

collect layout (ig_a02esp) (N ai_b02) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 141: Frequency with which reports are used for scheduling at your facility") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect


////////////
quietly: table (ig_a02esp) (N) if ai_b03!=., statistic(frequency) nformat(%6.0f) name(table84) totals(N) 
quietly: table (ig_a02esp) (ai_b03) if ai_b03!=., statistic(percent, across(ai_b03)) nformat(%6.1f) name(table84) totals(ai_b03) append

collect layout (ig_a02esp) (N ai_b03) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 142: Frequency of reporting at meetings") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if ai_b05!=. | ai_b05tip1!=.  | ai_b05tip2!=.  | ai_b05tip3!=.  | ai_b05tip4!=.  | ai_b05tip5!=., statistic(frequency) nformat(%6.0f) name(table85) totals(N) 
quietly: table (ig_a02esp) (ai_b05) if ai_b05!=. | ai_b05tip1!=.  | ai_b05tip2!=.  | ai_b05tip3!=.  | ai_b05tip4!=.  | ai_b05tip5!=., statistic(percent, across(ai_b05)) nformat(%6.1f) name(table85) totals(ai_b05) append

quietly: table (ig_a02esp) (ai_b05tip1) if ai_b05!=. | ai_b05tip1!=.  | ai_b05tip2!=.  | ai_b05tip3!=.  | ai_b05tip4!=.  | ai_b05tip5!=., statistic(percent, across(ai_b05tip1)) nformat(%6.1f) name(table85) totals(ai_b05tip1) append

quietly: table (ig_a02esp) (ai_b05tip2) if ai_b05!=. | ai_b05tip1!=.  | ai_b05tip2!=.  | ai_b05tip3!=.  | ai_b05tip4!=.  | ai_b05tip5!=., statistic(percent, across(ai_b05tip2)) nformat(%6.1f) name(table85) totals(ai_b05tip2) append

quietly: table (ig_a02esp) (ai_b05tip3) if ai_b05!=. | ai_b05tip1!=.  | ai_b05tip2!=.  | ai_b05tip3!=.  | ai_b05tip4!=.  | ai_b05tip5!=., statistic(percent, across(ai_b05tip3)) nformat(%6.1f) name(table85) totals(ai_b05tip3) append

quietly: table (ig_a02esp) (ai_b05tip4) if ai_b05!=. | ai_b05tip1!=.  | ai_b05tip2!=.  | ai_b05tip3!=.  | ai_b05tip4!=.  | ai_b05tip5!=., statistic(percent, across(ai_b05tip4)) nformat(%6.1f) name(table85) totals(ai_b05tip4) append

quietly: table (ig_a02esp) (ai_b05tip5) if ai_b05!=. | ai_b05tip1!=.  | ai_b05tip2!=.  | ai_b05tip3!=.  | ai_b05tip4!=.  | ai_b05tip5!=., statistic(percent, across(ai_b05tip5)) nformat(%6.1f) name(table85) totals(ai_b05tip5) append

collect layout (ig_a02esp) (N ai_b05 ai_b05tip1[1] ai_b05tip2[1] ai_b05tip3[1] ai_b05tip4[1] ai_b05tip5[1])

collect style header N, level(hide)
collect style header ai_b05tip1, level(hide)
collect style header ai_b05tip2, level(hide)
collect style header ai_b05tip3, level(hide)
collect style header ai_b05tip4, level(hide)
collect style header ai_b05tip5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 143: Perform spatial/geographic modeling of disease risk and of what types of modeling") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if ai_b08!=. | ai_b08cua1!=.  | ai_b08cua2!=.  | ai_b08cua3!=.  | ai_b08cua4!=., statistic(frequency) nformat(%6.0f) name(table86) totals(N) 
quietly: table (ig_a02esp) (ai_b08) if ai_b08!=. | ai_b08cua1!=.  | ai_b08cua2!=.  | ai_b08cua3!=.  | ai_b08cua4!=., statistic(percent, across(ai_b08)) nformat(%6.1f) name(table86) totals(ai_b08) append
quietly: table (ig_a02esp) (ai_b08cua1) if ai_b08!=. | ai_b08cua1!=.  | ai_b08cua2!=.  | ai_b08cua3!=.  | ai_b08cua4!=., statistic(percent, across(ai_b08cua1)) nformat(%6.1f) name(table86) totals(ai_b08cua1) append
quietly: table (ig_a02esp) (ai_b08cua2) if ai_b08!=. | ai_b08cua1!=.  | ai_b08cua2!=.  | ai_b08cua3!=.  | ai_b08cua4!=., statistic(percent, across(ai_b08cua2)) nformat(%6.1f) name(table86) totals(ai_b08cua2) append
quietly: table (ig_a02esp) (ai_b08cua3) if ai_b08!=. | ai_b08cua1!=.  | ai_b08cua2!=.  | ai_b08cua3!=.  | ai_b08cua4!=., statistic(percent, across(ai_b08cua3)) nformat(%6.1f) name(table86) totals(ai_b08cua3) append
quietly: table (ig_a02esp) (ai_b08cua4) if ai_b08!=. | ai_b08cua1!=.  | ai_b08cua2!=.  | ai_b08cua3!=.  | ai_b08cua4!=., statistic(percent, across(ai_b08cua4)) nformat(%6.1f) name(table86) totals(ai_b08cua4) append

collect layout (ig_a02esp) (N ai_b08 ai_b08cua1[1] ai_b08cua2[1] ai_b08cua3[1] ai_b08cua4[1])

collect style header N, level(hide)
collect style header ai_b08cua1, level(hide)
collect style header ai_b08cua2, level(hide)
collect style header ai_b08cua3, level(hide)
collect style header ai_b08cua4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 144: Condition during the year that affects their ability to report and of what type") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////
quietly: table (ig_a02esp) (N) if ai_b171!=.  | ai_b172!=.  | ai_b173!=.  | ai_b174!=.  | ai_b175!=., statistic(frequency) nformat(%6.0f) name(table87) totals(N) 
quietly: table (ig_a02esp) (ai_b171) if ai_b171!=.  | ai_b172!=.  | ai_b173!=.  | ai_b174!=.  | ai_b175!=., statistic(percent, across(ai_b171)) nformat(%6.1f) name(table87) totals(ai_b171) append
quietly: table (ig_a02esp) (ai_b172) if ai_b171!=.  | ai_b172!=.  | ai_b173!=.  | ai_b174!=.  | ai_b175!=., statistic(percent, across(ai_b172)) nformat(%6.1f) name(table87) totals(ai_b172) append
quietly: table (ig_a02esp) (ai_b173) if ai_b171!=.  | ai_b172!=.  | ai_b173!=.  | ai_b174!=.  | ai_b175!=., statistic(percent, across(ai_b173)) nformat(%6.1f) name(table87) totals(ai_b173) append
quietly: table (ig_a02esp) (ai_b174) if ai_b171!=.  | ai_b172!=.  | ai_b173!=.  | ai_b174!=.  | ai_b175!=., statistic(percent, across(ai_b174)) nformat(%6.1f) name(table87) totals(ai_b174) append
quietly: table (ig_a02esp) (ai_b175) if ai_b171!=.  | ai_b172!=.  | ai_b173!=.  | ai_b174!=.  | ai_b175!=., statistic(percent, across(ai_b175)) nformat(%6.1f) name(table87) totals(ai_b175) append

collect layout (ig_a02esp) (N ai_b171[1] ai_b172[1] ai_b173[1] ai_b174[1] ai_b175[1])

collect style header N, level(hide)
collect style header ai_b171, level(hide)
collect style header ai_b172, level(hide)
collect style header ai_b173, level(hide)
collect style header ai_b174, level(hide)
collect style header ai_b175, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 145: Who has access to the reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////////
quietly: table (ig_a02esp) (N) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(frequency) nformat(%6.0f) name(table88) totals(N) 
quietly: table (ig_a02esp) (ai_b181) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b181)) nformat(%6.1f) name(table88) totals(ai_b181) append

quietly: table (ig_a02esp) (ai_b182) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b182)) nformat(%6.1f) name(table88) totals(ai_b182) append

quietly: table (ig_a02esp) (ai_b183) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b183)) nformat(%6.1f) name(table88) totals(ai_b183) append

quietly: table (ig_a02esp) (ai_b184) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b184)) nformat(%6.1f) name(table88) totals(ai_b184) append

quietly: table (ig_a02esp) (ai_b185) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b185)) nformat(%6.1f) name(table88) totals(ai_b185) append

quietly: table (ig_a02esp) (ai_b186) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b186)) nformat(%6.1f) name(table88) totals(ai_b186) append

quietly: table (ig_a02esp) (ai_b187) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b187)) nformat(%6.1f) name(table88) totals(ai_b187) append

quietly: table (ig_a02esp) (ai_b180) if ai_b181!=.  | ai_b182!=.  | ai_b183!=.  | ai_b184!=.  | ai_b185!=.  | ai_b186!=.  | ai_b187!=. | ai_b180!=., statistic(percent, across(ai_b180)) nformat(%6.1f) name(table88) totals(ai_b180) append

collect layout (ig_a02esp) (N ai_b181[1] ai_b182[1] ai_b183[1] ai_b184[1] ai_b185[1] ai_b186[1] ai_b187[1] ai_b180[1])

collect style header N, level(hide)
collect style header ai_b181, level(hide)
collect style header ai_b182, level(hide)
collect style header ai_b183, level(hide)
collect style header ai_b184, level(hide)
collect style header ai_b185, level(hide)
collect style header ai_b186, level(hide)
collect style header ai_b187, level(hide)
collect style header ai_b180, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 146: Type of analysis and graphs performed on the data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if ai_b19!=. | ai_b20!=., statistic(frequency) nformat(%6.0f) name(table89) totals(N) 
quietly: table (ig_a02esp) (ai_b19) if ai_b19!=. | ai_b20!=., statistic(percent, across(ai_b19)) nformat(%6.1f) name(table89) totals(ai_b19) append
quietly: table (ig_a02esp) (ai_b20) if ai_b19!=. | ai_b20!=., statistic(percent, across(ai_b20)) nformat(%6.1f) name(table89) totals(ai_b20) append

collect layout (ig_a02esp) (N ai_b19[1] ai_b20[1]) 

collect style header N, level(hide)
collect style header ai_b19, level(hide)
collect style header ai_b20, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 147: The data results allow you to make health forecasts/predictions and if you are confident in the data reported") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("4. Communication and Dissemination")

/////////////
quietly: table (ig_a02esp) (N) if cd_a01!=. | cd_a01tip!=., statistic(frequency) nformat(%6.0f) name(table90) totals(N) 
quietly: table (ig_a02esp) (cd_a01) if cd_a01!=. | cd_a01tip!=., statistic(percent, across(cd_a01)) nformat(%6.1f) name(table90) totals(cd_a01) append
quietly: table (ig_a02esp) (cd_a01tip) if cd_a01!=. | cd_a01tip!=., statistic(percent, across(cd_a01tip)) nformat(%6.1f) name(table90) totals(cd_a01tip) append

collect layout (ig_a02esp) (N cd_a01[1] cd_a01tip) 

collect style header N, level(hide)
collect style header cd_a01, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 148: Your institution is involved in communications between human health, animal health and/or environmental health and what types of communications are involved") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
quietly: table (ig_a02esp) (N) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(frequency) nformat(%6.0f) name(table91) totals(N) 

quietly: table (ig_a02esp) (cd_a04) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04)) nformat(%6.1f) name(table91) totals(cd_a04) append

quietly: table (ig_a02esp) (cd_a04qui1) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui1)) nformat(%6.1f) name(table91) totals(cd_a04qui1) append

quietly: table (ig_a02esp) (cd_a04qui2) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui2)) nformat(%6.1f) name(table91) totals(cd_a04qui2) append

quietly: table (ig_a02esp) (cd_a04qui3) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui3)) nformat(%6.1f) name(table91) totals(cd_a04qui3) append

quietly: table (ig_a02esp) (cd_a04qui4) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui4)) nformat(%6.1f) name(table91) totals(cd_a04qui4) append

quietly: table (ig_a02esp) (cd_a04qui5) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui5)) nformat(%6.1f) name(table91) totals(cd_a04qui5) append

quietly: table (ig_a02esp) (cd_a04qui6) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui6)) nformat(%6.1f) name(table91) totals(cd_a04qui6) append

quietly: table (ig_a02esp) (cd_a04qui7) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui7)) nformat(%6.1f) name(table91) totals(cd_a04qui7) append

quietly: table (ig_a02esp) (cd_a04qui8) if cd_a04!=. | cd_a04qui1!=. | cd_a04qui2!=. | cd_a04qui3!=. | cd_a04qui4!=. | cd_a04qui5!=. | cd_a04qui6!=. | cd_a04qui7!=. | cd_a04qui8!=., statistic(percent, across(cd_a04qui8)) nformat(%6.1f) name(table91) totals(cd_a04qui8) append

collect layout (ig_a02esp) (N cd_a04 cd_a04qui1[1] cd_a04qui2[1] cd_a04qui3[1] cd_a04qui4[1] cd_a04qui5[1] cd_a04qui6[1] cd_a04qui7[1] cd_a04qui8[1]) 

collect style header N, level(hide)
collect style header cd_a04qui1, level(hide)
collect style header cd_a04qui2, level(hide)
collect style header cd_a04qui3, level(hide)
collect style header cd_a04qui4, level(hide)
collect style header cd_a04qui5, level(hide)
collect style header cd_a04qui6, level(hide)
collect style header cd_a04qui7, level(hide)
collect style header cd_a04qui8, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 149: If there is suspicion that a case of an animal disease that could cause a human disease has been detected, the case would be reported and to whom it would be reported") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

*******
quietly: table (diresa_qui) () if cd_a04qui8==1, statistic(frequency) statistic(percent) name(table91_1)
quietly: table (diris_qui) () if cd_a04qui8==1, statistic(frequency) statistic(percent) name(table91_1) append
quietly: table (micro_qui) () if cd_a04qui8==1, statistic(frequency) statistic(percent) name(table91_1) append
quietly: table (red_qui) () if cd_a04qui8==1, statistic(frequency) statistic(percent) name(table91_1) append
quietly: table (ris_qui) () if cd_a04qui8==1, statistic(frequency) statistic(percent) name(table91_1) append

collect layout (diresa_qui[1] diris_qui[1] micro_qui[1] red_qui[1] ris_qui[1])(result) 

collect label levels diresa_qui 1 "N=192", modify
collect label levels diris_qui 1 "N=192", modify
collect label levels micro_qui 1 "N=192", modify
collect label levels red_qui 1 "N=192", modify
collect label levels ris_qui 1 "N=192", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 149.1: Some answers from the other option") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect


///////////////
quietly: table (ig_a02esp) (N) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(frequency) nformat(%6.0f) name(table92) totals(N) 

quietly: table (ig_a02esp) (cd_a04com1) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com1)) nformat(%6.1f) name(table92) totals(cd_a04com1) append

quietly: table (ig_a02esp) (cd_a04com2) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com2)) nformat(%6.1f) name(table92) totals(cd_a04com2) append

quietly: table (ig_a02esp) (cd_a04com3) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com3)) nformat(%6.1f) name(table92) totals(cd_a04com3) append

quietly: table (ig_a02esp) (cd_a04com4) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com4)) nformat(%6.1f) name(table92) totals(cd_a04com4) append

quietly: table (ig_a02esp) (cd_a04com5) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com5)) nformat(%6.1f) name(table92) totals(cd_a04com5) append

quietly: table (ig_a02esp) (cd_a04com6) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com6)) nformat(%6.1f) name(table92) totals(cd_a04com6) append

quietly: table (ig_a02esp) (cd_a04com7) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com7)) nformat(%6.1f) name(table92) totals(cd_a04com7) append

quietly: table (ig_a02esp) (cd_a04com8) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com8)) nformat(%6.1f) name(table92) totals(cd_a04com8) append

quietly: table (ig_a02esp) (cd_a04com9) if cd_a04com1!=. | cd_a04com2!=. | cd_a04com3!=. | cd_a04com4!=. | cd_a04com5!=. | cd_a04com6!=. | cd_a04com7!=. | cd_a04com8!=. | cd_a04com9!=., statistic(percent, across(cd_a04com9)) nformat(%6.1f) name(table92) totals(cd_a04com9) append

collect layout (ig_a02esp) (N cd_a04com1[1] cd_a04com2[1] cd_a04com3[1] cd_a04com4[1] cd_a04com5[1] cd_a04com6[1] cd_a04com7[1] cd_a04com8[1] cd_a04com9[1]) 

collect style header N, level(hide)
collect style header cd_a04com1, level(hide)
collect style header cd_a04com2, level(hide)
collect style header cd_a04com3, level(hide)
collect style header cd_a04com4, level(hide)
collect style header cd_a04com5, level(hide)
collect style header cd_a04com6, level(hide)
collect style header cd_a04com7, level(hide)
collect style header cd_a04com8, level(hide)
collect style header cd_a04com9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 150: How would you communicate information about the case") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////////
quietly: table (ig_a02esp) (N) if cd_a05!=., statistic(frequency) nformat(%6.0f) name(table93) totals(N) 
quietly: table (ig_a02esp) (cd_a05) if cd_a05!=., statistic(percent, across(cd_a05)) nformat(%6.1f) name(table93) totals(cd_a05) append

collect layout (ig_a02esp) (N cd_a05) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 151: There are better ways to communicate with other institutions") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(frequency) nformat(%6.0f) name(table94) totals(N) 

quietly: table (ig_a02esp) (cd_a06) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06)) nformat(%6.1f) name(table94) totals(cd_a06) append

quietly: table (ig_a02esp) (cd_a06cua1) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua1)) nformat(%6.1f) name(table94) totals(cd_a06cua1) append

quietly: table (ig_a02esp) (cd_a06cua2) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua2)) nformat(%6.1f) name(table94) totals(cd_a06cua2) append

quietly: table (ig_a02esp) (cd_a06cua3) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua3)) nformat(%6.1f) name(table94) totals(cd_a06cua3) append

quietly: table (ig_a02esp) (cd_a06cua4) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua4)) nformat(%6.1f) name(table94) totals(cd_a06cua4) append

quietly: table (ig_a02esp) (cd_a06cua5) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua5)) nformat(%6.1f) name(table94) totals(cd_a06cua5) append

quietly: table (ig_a02esp) (cd_a06cua6) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua6)) nformat(%6.1f) name(table94) totals(cd_a06cua6) append

quietly: table (ig_a02esp) (cd_a06cua7) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua7)) nformat(%6.1f) name(table94) totals(cd_a06cua7) append

quietly: table (ig_a02esp) (cd_a06cua8) if cd_a06!=. | cd_a06cua1!=. | cd_a06cua2!=. | cd_a06cua3!=. | cd_a06cua4!=. | cd_a06cua5!=. | cd_a06cua6!=. | cd_a06cua7!=. | cd_a06cua8!=., statistic(percent, across(cd_a06cua8)) nformat(%6.1f) name(table94) totals(cd_a06cua8) append

collect layout (ig_a02esp) (N cd_a06 cd_a06cua1[1] cd_a06cua2[1] cd_a06cua3[1] cd_a06cua4[1] cd_a06cua5[1] cd_a06cua6[1] cd_a06cua7[1] cd_a06cua8[1]) 

collect style header N, level(hide)
collect style header cd_a06cua1, level(hide)
collect style header cd_a06cua2, level(hide)
collect style header cd_a06cua3, level(hide)
collect style header cd_a06cua4, level(hide)
collect style header cd_a06cua5, level(hide)
collect style header cd_a06cua6, level(hide)
collect style header cd_a06cua7, level(hide)
collect style header cd_a06cua8, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 152: Institutions with which they communicate") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect


/////////////////
quietly: table (ig_a02esp) (N) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(frequency) nformat(%6.0f) name(table95) totals(N) 

quietly: table (ig_a02esp) (cd_a06com1) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com1)) nformat(%6.1f) name(table95) totals(cd_a06com1) append

quietly: table (ig_a02esp) (cd_a06com2) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com2)) nformat(%6.1f) name(table95) totals(cd_a06com2) append

quietly: table (ig_a02esp) (cd_a06com3) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com3)) nformat(%6.1f) name(table95) totals(cd_a06com3) append

quietly: table (ig_a02esp) (cd_a06com4) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com4)) nformat(%6.1f) name(table95) totals(cd_a06com4) append

quietly: table (ig_a02esp) (cd_a06com5) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com5)) nformat(%6.1f) name(table95) totals(cd_a06com5) append

quietly: table (ig_a02esp) (cd_a06com6) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com6)) nformat(%6.1f) name(table95) totals(cd_a06com6) append

quietly: table (ig_a02esp) (cd_a06com7) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com7)) nformat(%6.1f) name(table95) totals(cd_a06com7) append

quietly: table (ig_a02esp) (cd_a06com8) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com8)) nformat(%6.1f) name(table95) totals(cd_a06com8) append

quietly: table (ig_a02esp) (cd_a06com9) if cd_a06com1!=. | cd_a06com2!=. | cd_a06com3!=. | cd_a06com4!=. | cd_a06com5!=. | cd_a06com6!=. | cd_a06com7!=. | cd_a06com8!=. | cd_a06com9!=., statistic(percent, across(cd_a06com9)) nformat(%6.1f) name(table95) totals(cd_a06com9) append

collect layout (ig_a02esp) (N cd_a06com1[1] cd_a06com2[1] cd_a06com3[1] cd_a06com4[1] cd_a06com5[1] cd_a06com6[1] cd_a06com7[1] cd_a06com8[1] cd_a06com9[1]) 

collect style header N, level(hide)
collect style header cd_a06com1, level(hide)
collect style header cd_a06com2, level(hide)
collect style header cd_a06com3, level(hide)
collect style header cd_a06com4, level(hide)
collect style header cd_a06com5, level(hide)
collect style header cd_a06com6, level(hide)
collect style header cd_a06com7, level(hide)
collect style header cd_a06com8, level(hide)
collect style header cd_a06com9, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 153: How they communicate with you or your office") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////////////
quietly: table (ig_a02esp) (N) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(frequency) nformat(%6.0f) name(table96) totals(N) 

quietly: table (ig_a02esp) (cd_a070) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(percent, across(cd_a070)) nformat(%6.1f) name(table96) totals(cd_a070) append

quietly: table (ig_a02esp) (cd_a071) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(percent, across(cd_a071)) nformat(%6.1f) name(table96) totals(cd_a071) append

quietly: table (ig_a02esp) (cd_a072) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(percent, across(cd_a072)) nformat(%6.1f) name(table96) totals(cd_a072) append

quietly: table (ig_a02esp) (cd_a073) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(percent, across(cd_a073)) nformat(%6.1f) name(table96) totals(cd_a073) append

quietly: table (ig_a02esp) (cd_a074) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(percent, across(cd_a074)) nformat(%6.1f) name(table96) totals(cd_a074) append

quietly: table (ig_a02esp) (cd_a075) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(percent, across(cd_a075)) nformat(%6.1f) name(table96) totals(cd_a075) append

quietly: table (ig_a02esp) (cd_a076) if cd_a070!=. | cd_a071!=. | cd_a072!=. | cd_a073!=. | cd_a074!=. | cd_a075!=. | cd_a076!=., statistic(percent, across(cd_a076)) nformat(%6.1f) name(table96) totals(cd_a076) append

collect layout (ig_a02esp) (N cd_a070[1] cd_a071[1] cd_a072[1] cd_a073[1] cd_a074[1] cd_a075[1] cd_a076[1]) 

collect style header N, level(hide)
collect style header cd_a070, level(hide)
collect style header cd_a071, level(hide)
collect style header cd_a072, level(hide)
collect style header cd_a073, level(hide)
collect style header cd_a074, level(hide)
collect style header cd_a075, level(hide)
collect style header cd_a076, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 154: Types of communication it provides to the community") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if cd_a07frec!=., statistic(frequency) nformat(%6.0f) name(table97) totals(N) 
quietly: table (ig_a02esp) (cd_a07frec) if cd_a07frec!=., statistic(percent, across(cd_a07frec)) nformat(%6.1f) name(table97) totals(cd_a07frec) append

collect layout (ig_a02esp) (N cd_a07frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 155: Frequency that sends communication messages to the community") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////////
quietly: table (ig_a02esp) (N) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(frequency) nformat(%6.0f) name(table98) totals(N) 

quietly: table (ig_a02esp) (cd_a07com1) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com1)) nformat(%6.1f) name(table98) totals(cd_a07com1) append

quietly: table (ig_a02esp) (cd_a07com2) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com2)) nformat(%6.1f) name(table98) totals(cd_a07com2) append

quietly: table (ig_a02esp) (cd_a07com3) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com3)) nformat(%6.1f) name(table98) totals(cd_a07com3) append

quietly: table (ig_a02esp) (cd_a07com4) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com4)) nformat(%6.1f) name(table98) totals(cd_a07com4) append

quietly: table (ig_a02esp) (cd_a07com5) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com5)) nformat(%6.1f) name(table98) totals(cd_a07com5) append

quietly: table (ig_a02esp) (cd_a07com6) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com6)) nformat(%6.1f) name(table98) totals(cd_a07com6) append

quietly: table (ig_a02esp) (cd_a07com7) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com7)) nformat(%6.1f) name(table98) totals(cd_a07com7) append

quietly: table (ig_a02esp) (cd_a07com8) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com8)) nformat(%6.1f) name(table98) totals(cd_a07com8) append

quietly: table (ig_a02esp) (cd_a07com9) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com9)) nformat(%6.1f) name(table98) totals(cd_a07com9) append

quietly: table (ig_a02esp) (cd_a07com10) if cd_a07com1!=. | cd_a07com2!=. | cd_a07com3!=. | cd_a07com4!=. | cd_a07com5!=. | cd_a07com6!=. | cd_a07com7!=. | cd_a07com8!=. | cd_a07com9!=. | cd_a07com10!=., statistic(percent, across(cd_a07com10)) nformat(%6.1f) name(table98) totals(cd_a07com10) append


collect layout (ig_a02esp) (N cd_a07com1[1] cd_a07com2[1] cd_a07com3[1] cd_a07com4[1] cd_a07com5[1] cd_a07com6[1] cd_a07com7[1] cd_a07com8[1] cd_a07com9[1] cd_a07com10[1]) 

collect style header N, level(hide)
collect style header cd_a07com1, level(hide)
collect style header cd_a07com2, level(hide)
collect style header cd_a07com3, level(hide)
collect style header cd_a07com4, level(hide)
collect style header cd_a07com5, level(hide)
collect style header cd_a07com6, level(hide)
collect style header cd_a07com7, level(hide)
collect style header cd_a07com8, level(hide)
collect style header cd_a07com9, level(hide)
collect style header cd_a07com10, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 156: How to communicate this information to the community") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("5. Policies")


/////////////////
quietly: table (ig_a02esp) (N) if po_a01!=. | po_a02!=., statistic(frequency) nformat(%6.0f) name(table99) totals(N) 
quietly: table (ig_a02esp) (po_a01) if po_a01!=. | po_a02!=., statistic(percent, across(po_a01)) nformat(%6.1f) name(table99) totals(po_a01) append
quietly: table (ig_a02esp) (po_a02) if po_a01!=. | po_a02!=., statistic(percent, across(po_a02)) nformat(%6.1f) name(table99) totals(po_a02) append

collect layout (ig_a02esp) (N po_a01[1] po_a02[1]) 

collect style header N, level(hide)
collect style header po_a01, level(hide)
collect style header po_a02, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 157: There are collaborative One Health surveillance policies between the human, animal and environmental sectors and whether there are legal frameworks (rules, guidelines and regulations) that have been standardized across all sectors") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if po_a03!=. | po_a05!=., statistic(frequency) nformat(%6.0f) name(table100) totals(N) 
quietly: table (ig_a02esp) (po_a03) if po_a03!=. | po_a05!=., statistic(percent, across(po_a03)) nformat(%6.1f) name(table100) totals(po_a03) append
quietly: table (ig_a02esp) (po_a05) if po_a03!=. | po_a05!=., statistic(percent, across(po_a05)) nformat(%6.1f) name(table100) totals(po_a05) append

collect layout (ig_a02esp) (N po_a03[1] po_a05[1]) 

collect style header N, level(hide)
collect style header po_a03, level(hide)
collect style header po_a05, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 158: legal frameworks (regulations, policies, guidelines and regulations) are sufficient to govern all aspects of surveillance (human, animal, environmental) and strategic frameworks and plans for coordinated surveillance are in place") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if po_a06!=. | po_a06fom!=. | po_a06imp!=., statistic(frequency) nformat(%6.0f) name(table101) totals(N) 
quietly: table (ig_a02esp) (po_a06) if po_a06!=. | po_a06fom!=. | po_a06imp!=., statistic(percent, across(po_a06)) nformat(%6.1f) name(table101) totals(po_a06) append
quietly: table (ig_a02esp) (po_a06fom) if po_a06!=. | po_a06fom!=. | po_a06imp!=., statistic(percent, across(po_a06fom)) nformat(%6.1f) name(table101) totals(po_a06fom) append
quietly: table (ig_a02esp) (po_a06imp) if po_a06!=. | po_a06fom!=. | po_a06imp!=., statistic(percent, across(po_a06imp)) nformat(%6.1f) name(table101) totals(po_a06imp) append

collect layout (ig_a02esp) (N po_a06 po_a06fom[1] po_a06imp[1]) 

collect style header N, level(hide)
collect style header po_a06fom, level(hide)
collect style header po_a06imp, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 159: There are regional differences in the legal frameworks for surveillance and data exchange, there is a plan to encourage reporting of animal diseases and There is a plan to address factors that may prevent owners/farmers from reporting animal diseases") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if po_a07!=. | po_a07reu!=., statistic(frequency) nformat(%6.0f) name(table102) totals(N) 
quietly: table (ig_a02esp) (po_a07) if po_a07!=. | po_a07reu!=., statistic(percent, across(po_a07)) nformat(%6.1f) name(table102) totals(po_a07) append
quietly: table (ig_a02esp) (po_a07reu) if po_a07!=. | po_a07reu!=., statistic(percent, across(po_a07reu)) nformat(%6.1f) name(table102) totals(po_a07reu) append

collect layout (ig_a02esp) (N po_a07 po_a07reu[1]) 

collect style header N, level(hide)
collect style header po_a07reu, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 160: There is a (formal) multisectoral policy of collaboration on zoonotic diseases in the country") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if po_a07!=. | po_a07frec!=., statistic(frequency) nformat(%6.0f) name(table103) totals(N) 
quietly: table (ig_a02esp) (po_a07frec) if po_a07!=. | po_a07frec!=., statistic(percent, across(po_a07frec)) nformat(%6.1f) name(table103) totals(po_a07frec) append

collect layout (ig_a02esp) (N po_a07 po_a07frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 161: Frequency that they meet") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if po_a08!=. | po_a09!=., statistic(frequency) nformat(%6.0f) name(table104) totals(N) 
quietly: table (ig_a02esp) (po_a08) if po_a08!=. | po_a09!=., statistic(percent, across(po_a08)) nformat(%6.1f) name(table104) totals(po_a08) append
quietly: table (ig_a02esp) (po_a09) if po_a08!=. | po_a09!=., statistic(percent, across(po_a09)) nformat(%6.1f) name(table104) totals(po_a09) append

collect layout (ig_a02esp) (N po_a08[1] po_a09[1]) 

collect style header N, level(hide)
collect style header po_a08, level(hide)
collect style header po_a09, level(hide)


collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 162: There is a plan to strengthen PAHO's international sanitary regulation capabilities. There is a plan to coordinate the functions and operations of the International Health Regulations between environmental and agricultural responders in Peru") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if po_a10!=. | po_a11!=., statistic(frequency) nformat(%6.0f) name(table105) totals(N) 
quietly: table (ig_a02esp) (po_a10) if po_a10!=. | po_a11!=., statistic(percent, across(po_a10)) nformat(%6.1f) name(table105) totals(po_a10) append
quietly: table (ig_a02esp) (po_a11) if po_a10!=. | po_a11!=., statistic(percent, across(po_a11)) nformat(%6.1f) name(table105) totals(po_a11) append

collect layout (ig_a02esp) (N po_a10[1] po_a11[1]) 

collect style header N, level(hide)
collect style header po_a10, level(hide)
collect style header po_a11, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 163: Any assessment of laws, regulations or administrative requirements among other governmental instruments relevant to surveillance has been carried out. The veterinary sector has any legislation that gives them the authority to quarantine, immobilize or slaughter animals to control a disease") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if po_a12!=. | po_a13!=., statistic(frequency) nformat(%6.0f) name(table106) totals(N) 
quietly: table (ig_a02esp) (po_a12) if po_a12!=. | po_a13!=., statistic(percent, across(po_a12)) nformat(%6.1f) name(table106) totals(po_a12) append
quietly: table (ig_a02esp) (po_a13) if po_a12!=. | po_a13!=., statistic(percent, across(po_a13)) nformat(%6.1f) name(table106) totals(po_a13) append

collect layout (ig_a02esp) (N po_a12[1] po_a13[1]) 

collect style header N, level(hide)
collect style header po_a12, level(hide)
collect style header po_a13, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 164: There is evidence of the use of relevant multisectoral legislative policies in the implementation of COVID-19 activities. There is evidence of the use of relevant multisectoral legislative policies in the implementation of the International Health Regulations (IHR)") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////
collect clear
table (ig_a02esp) (var) if ig_a02esp!=1801, statistic(count N) statistic(mean po_a15) statistic(sd po_a15) statistic(mean po_a16) statistic(sd po_a16) listwise 

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[po_a15 po_a16]#result[column1], nformat(%6.0f)
collect style cell var[po_a15 po_a16]#result[column2 column3], nformat(%6.1f)
collect style cell var[po_a15 po_a16]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)


collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 165: Proportion of the national health budget that is allocated to public health, IHR or health security functions related to prevention, detection and response. Within IHR functions, how much money is allocated directly to surveillance activities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

******AT THE END OF THE REPORT TO CORRECT VALUES IN TABLE 165
table (ig_a02esp) (var) if ig_a02esp!=1801, statistic(count N) statistic(mean po_a15) statistic(sd po_a15) listwise 
table (ig_a02esp) (var) if ig_a02esp!=1801, statistic(count N) statistic(mean po_a16) statistic(sd po_a16) listwise 
**

/////////////////
quietly: table (ig_a02esp) (N) if po_a18!=. | po_a19!=. | po_a21!=., statistic(frequency) nformat(%6.0f) name(table107) totals(N) 
quietly: table (ig_a02esp) (po_a18) if po_a18!=. | po_a19!=. | po_a21!=., statistic(percent, across(po_a18)) nformat(%6.1f) name(table107) totals(po_a18) append
quietly: table (ig_a02esp) (po_a19) if po_a18!=. | po_a19!=. | po_a21!=., statistic(percent, across(po_a19)) nformat(%6.1f) name(table107) totals(po_a19) append
quietly: table (ig_a02esp) (po_a21) if po_a18!=. | po_a19!=. | po_a21!=., statistic(percent, across(po_a21)) nformat(%6.1f) name(table107) totals(po_a21) append

collect layout (ig_a02esp) (N po_a18[1] po_a19[1] po_a21[1]) 

collect style header N, level(hide)
collect style header po_a18, level(hide)
collect style header po_a19, level(hide)
collect style header po_a21, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 166: There is a continuous distribution of funds for recurrent activities that are part of the existing national plan. There is timely distribution of funds for recurrent activities that are part of the existing national plan. There are mechanisms in place to monitor financial execution") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("6. Interoperability")

/////////////////
table (in_a01), statistic(freq) statistic(percent) 
collect style cell border_block, border(right, pattern(nil))
collect style column, width(asis)
collect preview
collect style putdocx, title("Table 167: The option that best describes the exchange of data at the individual level between the three systems (human/animal/environment)") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect


////////////
table (var)(), statistic(fvfrequency in_a01tip in_a02 in_a02no in_a02mec in_a03) statistic(fvpercent in_a01tip in_a02 in_a02no in_a02mec in_a03) statistic(fvfrequency in_a04 in_a05 in_a05mar in_a06) statistic(fvpercent in_a04 in_a05 in_a05mar in_a06)
collect recode result fvfrequency = column1 fvpercent = column2 mean = column1 sd = column2
collect layout (var) (result[column1 column2])
collect style cell var[in_a01tip in_a02 in_a02no in_a02mec in_a04 in_a05 in_a05mar in_a06 in_a03]#result[column1], nformat(%6.0fc)
collect style cell var[in_a01tip in_a02 in_a02no in_a02mec in_a04 in_a05 in_a05mar in_a06 in_a03]#result[column2], nformat(%6.1f) 

collect label levels result column1 "Frequency" column2 "Percent", modify

collect label dim in_a03 "Percent of health facilities that have geographic coordinates attached to them mean (sd)", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 168: Interoperability features") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
table (var)(), statistic(fvfrequency in_a07 in_a07sis1 in_a07sis2 in_a07sis3 in_a07sis4 in_a08 in_a09 in_a09frec in_a10 in_a10frec) statistic(fvpercent in_a07 in_a07sis1 in_a07sis2 in_a07sis3 in_a07sis4 in_a08 in_a09 in_a09frec in_a10 in_a10frec) 
collect recode result fvfrequency = column1 fvpercent = column2 
collect layout (var) (result[column1 column2])
collect style cell var[in_a07 in_a07sis1 in_a07sis2 in_a07sis3 in_a07sis4 in_a08 in_a09 in_a09frec in_a10 in_a10frec]#result[column1], nformat(%6.0fc)
collect style cell var[in_a07 in_a07sis1 in_a07sis2 in_a07sis3 in_a07sis4 in_a08 in_a09 in_a09frec in_a10 in_a10frec]#result[column2], nformat(%6.1f) 

collect label levels result column1 "Frequency" column2 "Percent", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 169: Interoperability features") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
table (var)(), statistic(fvfrequency in_a11a in_a11b in_a11c in_a11d in_a11e in_a11f in_a11g in_a11h in_a11i in_a11j in_a11k in_a11l in_a11m in_a11n in_a11o in_a11p in_a11q in_a11r in_a11s in_a11t) statistic(fvpercent in_a11a in_a11b in_a11c in_a11d in_a11e in_a11f in_a11g in_a11h in_a11i in_a11j in_a11k in_a11l in_a11m in_a11n in_a11o in_a11p in_a11q in_a11r in_a11s in_a11t) 
collect recode result fvfrequency = column1 fvpercent = column2 mean = column1 sd = column2
collect layout (var) (result[column1 column2])
collect style cell var[fvfrequency in_a11a in_a11b in_a11c in_a11d in_a11e in_a11f in_a11g in_a11h in_a11i in_a11j in_a11k in_a11l in_a11m in_a11n in_a11o in_a11p in_a11q in_a11r in_a11s in_a11t]#result[column1], nformat(%6.0fc)
collect style cell var[fvfrequency in_a11a in_a11b in_a11c in_a11d in_a11e in_a11f in_a11g in_a11h in_a11i in_a11j in_a11k in_a11l in_a11m in_a11n in_a11o in_a11p in_a11q in_a11r in_a11s in_a11t]#result[column2], nformat(%6.1f) 

collect label levels result column1 "Frequency" column2 "Percent", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 170: The extent to which the software application meets the following interoperability requirements") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////////
table (var)(), statistic(fvfrequency in_a12_0) statistic(fvpercent in_a12_0) 
collect recode result fvfrequency = column1 fvpercent = column2 
collect layout (var) (result[column1 column2])
collect style cell var[fvfrequency in_a12_0]#result[column1], nformat(%6.0fc)
collect style cell var[fvfrequency in_a12_0]#result[column2], nformat(%6.1f) 

collect label levels result column1 "Frequency" column2 "Percent", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 171: Interoperability features") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////////
quietly: table (in_a121) (), statistic(frequency) statistic(percent) name(table108)
quietly: table (in_a122) (), statistic(frequency) statistic(percent) name(table108) append
quietly: table (in_a123) (), statistic(frequency) statistic(percent) name(table108) append
quietly: table (in_a124) (), statistic(frequency) statistic(percent) name(table108) append
quietly: table (in_a125) (), statistic(frequency) statistic(percent) name(table108) append
quietly: table (in_a126) (), statistic(frequency) statistic(percent) name(table108) append

collect layout (in_a121 in_a122 in_a123 in_a124 in_a125 in_a126)(result) 
collect layout (in_a121[1] in_a122[1] in_a123[1] in_a125[1] in_a126[1]) (result)
collect label levels in_a121 1 "N=24", modify
collect label levels in_a122 1 "N=24", modify
collect label levels in_a123 1 "N=24", modify
collect label levels in_a124 1 "N=24", modify
collect label levels in_a125 1 "N=24", modify
collect label levels in_a126 1 "N=24", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 172: Routine systems and disease software in use in Peru") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////
table (var)(), statistic(fvfrequency in_a12e) statistic(fvpercent in_a12e) 
collect recode result fvfrequency = column1 fvpercent = column2 
collect layout (var) (result[column1 column2])
collect style cell var[fvfrequency in_a12e]#result[column1], nformat(%6.0fc)
collect style cell var[fvfrequency in_a12e]#result[column2], nformat(%6.1f) 

collect label levels result column1 "Frequency" column2 "Percent", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 173: If mention more than one system being used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
table (var)(), statistic(fvfrequency in_a12int in_a12pla) statistic(fvpercent in_a12int in_a12pla) 
collect recode result fvfrequency = column1 fvpercent = column2 
collect layout (var) (result[column1 column2])
collect style cell var[fvfrequency in_a12int in_a12pla]#result[column1], nformat(%6.0fc)
collect style cell var[fvfrequency in_a12int in_a12pla]#result[column2], nformat(%6.1f) 

collect label levels result column1 "Frequency" column2 "Percent", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 174: If mention more than one system being used") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
table (var)(), statistic(fvfrequency in_a13 in_a13anon) statistic(fvpercent in_a13 in_a13anon) 
collect recode result fvfrequency = column1 fvpercent = column2 
collect layout (var) (result[column1 column2])
collect style cell var[fvfrequency in_a13 in_a13anon]#result[column1], nformat(%6.0fc)
collect style cell var[fvfrequency in_a13 in_a13anon]#result[column2], nformat(%6.1f) 

collect label levels result column1 "Frequency" column2 "Percent", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 175: Raw data contain personal identifiers or are anonymized") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////////
quietly: table (in_a15) (), statistic(frequency) statistic(percent) name(table109)
quietly: table (in_a16) (), statistic(frequency) statistic(percent) name(table109) append

collect layout (in_a15[1] in_a16[1])(result) 

collect label levels in_a15 1 "N=24", modify
collect label levels in_a16 1 "N=24", modify

collect style row stack, nobinder spacer
collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 176: Documentation exists that includes definitions of Inputs/outputs including characteristics such as valid ranges, data types and others. There is documentation on transformations that are performed on the original data before loading it into the system") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("7. Training")

/////////////////
putdocx paragraph, style(Heading1)
putdocx text ("General Information about the Training Program")

//////////////
quietly: table (ig_a02esp) (N) if ca_a01!=. | ca_a02!=., statistic(frequency) nformat(%6.0f) name(table110) totals(N) 
quietly: table (ig_a02esp) (ca_a01) if ca_a01!=. | ca_a02!=., statistic(percent, across(ca_a01)) nformat(%6.1f) name(table110) totals(ca_a01) append
quietly: table (ig_a02esp) (ca_a02) if ca_a01!=. | ca_a02!=., statistic(percent, across(ca_a02)) nformat(%6.1f) name(table110) totals(ca_a02) append

collect layout (ig_a02esp) (N ca_a01[1] ca_a02[1]) 

collect style header N, level(hide)
collect style header ca_a01, level(hide)
collect style header ca_a02, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 177: Characteristics about training") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(frequency) nformat(%6.0f) name(table111) totals(N) 
quietly: table (ig_a02esp) (ca_a031) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a031)) nformat(%6.1f) name(table111) totals(ca_a031) append

quietly: table (ig_a02esp) (ca_a032) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a032)) nformat(%6.1f) name(table111) totals(ca_a032) append

quietly: table (ig_a02esp) (ca_a033) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a033)) nformat(%6.1f) name(table111) totals(ca_a033) append

quietly: table (ig_a02esp) (ca_a034) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a034)) nformat(%6.1f) name(table111) totals(ca_a034) append

quietly: table (ig_a02esp) (ca_a035) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a035)) nformat(%6.1f) name(table111) totals(ca_a035) append

quietly: table (ig_a02esp) (ca_a036) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a036)) nformat(%6.1f) name(table111) totals(ca_a036) append

quietly: table (ig_a02esp) (ca_a037) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a037)) nformat(%6.1f) name(table111) totals(ca_a037) append

quietly: table (ig_a02esp) (ca_a038) if ca_a031!=. | ca_a032!=. | ca_a033!=. | ca_a034!=. | ca_a035!=. | ca_a036!=. | ca_a037!=. | ca_a038!=., statistic(percent, across(ca_a038)) nformat(%6.1f) name(table111) totals(ca_a038) append

collect layout (ig_a02esp) (N ca_a031[1] ca_a032[1] ca_a033[1] ca_a034[1] ca_a035[1] ca_a036[1] ca_a037[1] ca_a038[1]) 

collect style header N, level(hide)
collect style header ca_a031, level(hide)
collect style header ca_a032, level(hide)
collect style header ca_a033, level(hide)
collect style header ca_a034, level(hide)
collect style header ca_a035, level(hide)
collect style header ca_a036, level(hide)
collect style header ca_a037, level(hide)
collect style header ca_a038, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 178: Who is trained in surveillance activities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ca_a04!=., statistic(frequency) nformat(%6.0f) name(table112) totals(N) 
quietly: table (ig_a02esp) (ca_a04) if ca_a04!=., statistic(percent, across(ca_a04)) nformat(%6.1f) name(table112) totals(ca_a04) append

collect layout (ig_a02esp) (N ca_a04) 

collect style header N, level(hide)


collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 179: Frequency of training sessions") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ca_a05!=. | ca_a06!=., statistic(frequency) nformat(%6.0f) name(table113) totals(N) 
quietly: table (ig_a02esp) (ca_a05) if ca_a05!=. | ca_a06!=., statistic(percent, across(ca_a05)) nformat(%6.1f) name(table113) totals(ca_a05) append
quietly: table (ig_a02esp) (ca_a06) if ca_a05!=. | ca_a06!=., statistic(percent, across(ca_a06)) nformat(%6.1f) name(table113) totals(ca_a06) append

collect layout (ig_a02esp) (N ca_a05[1] ca_a06[1]) 

collect style header N, level(hide)
collect style header ca_a05, level(hide)
collect style header ca_a06, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 180: Characteristics about training") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

/////////////////
putdocx paragraph, style(Heading1)
putdocx text ("Available Technical Training")

//////////////
quietly: table (ig_a02esp) (N) if ca_b01!=., statistic(frequency) nformat(%6.0f) name(table114) totals(N) 
quietly: table (ig_a02esp) (ca_b01) if ca_b01!=., statistic(percent, across(ca_b01)) nformat(%6.1f) name(table114) totals(ca_b01) append

collect layout (ig_a02esp) (N ca_b01) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 181: The organization/facility provides training (and refresher training) on surveillance-related topics") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(frequency) nformat(%6.0f) name(table115) totals(N) 

quietly: table (ca_b021) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b021)) nformat(%6.1f) name(table115) totals(ca_b021) append

quietly: table (ca_b022) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b022)) nformat(%6.1f) name(table115) totals(ca_b022) append

quietly: table (ca_b023) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b023)) nformat(%6.1f) name(table115) totals(ca_b023) append

quietly: table (ca_b024) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b024)) nformat(%6.1f) name(table115) totals(ca_b024) append

quietly: table (ca_b025) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b025)) nformat(%6.1f) name(table115) totals(ca_b025) append

quietly: table (ca_b026) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b026)) nformat(%6.1f) name(table115) totals(ca_b026) append

quietly: table (ca_b027) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b027)) nformat(%6.1f) name(table115) totals(ca_b027) append

quietly: table (ca_b028) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b028)) nformat(%6.1f) name(table115) totals(ca_b028) append

quietly: table (ca_b029) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b029)) nformat(%6.1f) name(table115) totals(ca_b029) append

quietly: table (ca_b0210) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0210)) nformat(%6.1f) name(table115) totals(ca_b0210) append

quietly: table (ca_b0211) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0211)) nformat(%6.1f) name(table115) totals(ca_b0211) append

quietly: table (ca_b0212) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0212)) nformat(%6.1f) name(table115) totals(ca_b0212) append

quietly: table (ca_b0213) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0213)) nformat(%6.1f) name(table115) totals(ca_b0213) append

quietly: table (ca_b0214) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0214)) nformat(%6.1f) name(table115) totals(ca_b0214) append

quietly: table (ca_b0215) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0215)) nformat(%6.1f) name(table115) totals(ca_b0215) append

quietly: table (ca_b0216) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0216)) nformat(%6.1f) name(table115) totals(ca_b0216) append

quietly: table (ca_b0217) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0217)) nformat(%6.1f) name(table115) totals(ca_b0217) append

quietly: table (ca_b0218) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0218)) nformat(%6.1f) name(table115) totals(ca_b0218) append

quietly: table (ca_b0219) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0219)) nformat(%6.1f) name(table115) totals(ca_b0219) append

quietly: table (ca_b0220) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0220)) nformat(%6.1f) name(table115) totals(ca_b0220) append

quietly: table (ca_b0221) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0221)) nformat(%6.1f) name(table115) totals(ca_b0221) append

quietly: table (ca_b0222) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0222)) nformat(%6.1f) name(table115) totals(ca_b0222) append

quietly: table (ca_b0223) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0223)) nformat(%6.1f) name(table115) totals(ca_b0223) append

quietly: table (ca_b0224) (ig_a02esp) if ca_b021!=. | ca_b022!=. | ca_b023!=. | ca_b024!=. | ca_b025!=. | ca_b026!=. | ca_b027!=. | ca_b028!=. | ca_b029!=. | ca_b0210!=. | ca_b0211!=. | ca_b0212!=. | ca_b0213!=. | ca_b0214!=. | ca_b0215!=. | ca_b0216!=. | ca_b0217!=. | ca_b0218!=. | ca_b0219!=. | ca_b0220!=. | ca_b0221!=. | ca_b0222!=. | ca_b0223!=. | ca_b0224!=., statistic(percent, across(ca_b0224)) nformat(%6.1f) name(table115) totals(ca_b0224) append


collect layout (N ca_b021[1] ca_b022[1] ca_b023[1] ca_b024[1] ca_b025[1] ca_b026[1] ca_b027[1] ca_b028[1] ca_b029[1] ca_b0210[1] ca_b0211[1] ca_b0212[1] ca_b0213[1] ca_b0214[1] ca_b0215[1] ca_b0216[1] ca_b0217[1] ca_b0218[1] ca_b0219[1] ca_b0220[1] ca_b0221[1] ca_b0222[1] ca_b0223[1] ca_b0224[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header ca_b021, level(hide)
collect style header ca_b022, level(hide)
collect style header ca_b023, level(hide)
collect style header ca_b024, level(hide)
collect style header ca_b025, level(hide)
collect style header ca_b026, level(hide)
collect style header ca_b027, level(hide)
collect style header ca_b028, level(hide)
collect style header ca_b029, level(hide)
collect style header ca_b0210, level(hide)
collect style header ca_b0211, level(hide)
collect style header ca_b0212, level(hide)
collect style header ca_b0213, level(hide)
collect style header ca_b0214, level(hide)
collect style header ca_b0215, level(hide)
collect style header ca_b0216, level(hide)
collect style header ca_b0217, level(hide)
collect style header ca_b0218, level(hide)
collect style header ca_b0219, level(hide)
collect style header ca_b0220, level(hide)
collect style header ca_b0221, level(hide)
collect style header ca_b0222, level(hide)
collect style header ca_b0223, level(hide)
collect style header ca_b0224, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 182: Training courses offered") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

/////////////////
putdocx paragraph, style(Heading1)
putdocx text ("Technical Training Received")

//////////////
quietly: table (ig_a02esp) (N) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(frequency) nformat(%6.0f) name(table116) totals(N) 

quietly: table (ca_c01) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c01)) nformat(%6.1f) name(table116) totals(ca_c01) append

quietly: table (ca_c02) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c02)) nformat(%6.1f) name(table116) totals(ca_c02) append

quietly: table (ca_c03) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c03)) nformat(%6.1f) name(table116) totals(ca_c03) append

quietly: table (ca_c04) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c04)) nformat(%6.1f) name(table116) totals(ca_c04) append

quietly: table (ca_c05) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c05)) nformat(%6.1f) name(table116) totals(ca_c05) append

quietly: table (ca_c06) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c06)) nformat(%6.1f) name(table116) totals(ca_c06) append

quietly: table (ca_c07) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c07)) nformat(%6.1f) name(table116) totals(ca_c07) append

quietly: table (ca_c08) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c08)) nformat(%6.1f) name(table116) totals(ca_c08) append

quietly: table (ca_c09) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c09)) nformat(%6.1f) name(table116) totals(ca_c09) append

quietly: table (ca_c10) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c10)) nformat(%6.1f) name(table116) totals(ca_c10) append

quietly: table (ca_c11) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c11)) nformat(%6.1f) name(table116) totals(ca_c11) append

quietly: table (ca_c12) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c12)) nformat(%6.1f) name(table116) totals(ca_c12) append

quietly: table (ca_c13) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c13)) nformat(%6.1f) name(table116) totals(ca_c13) append

quietly: table (ca_c14) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c14)) nformat(%6.1f) name(table116) totals(ca_c14) append

quietly: table (ca_c15) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c15)) nformat(%6.1f) name(table116) totals(ca_c15) append

quietly: table (ca_c16) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c16)) nformat(%6.1f) name(table116) totals(ca_c16) append

quietly: table (ca_c17) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c17)) nformat(%6.1f) name(table116) totals(ca_c17) append

quietly: table (ca_c18) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c18)) nformat(%6.1f) name(table116) totals(ca_c18) append

quietly: table (ca_c19) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c19)) nformat(%6.1f) name(table116) totals(ca_c19) append

quietly: table (ca_c20) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c20)) nformat(%6.1f) name(table116) totals(ca_c20) append

quietly: table (ca_c21) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c21)) nformat(%6.1f) name(table116) totals(ca_c21) append

quietly: table (ca_c22) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c22)) nformat(%6.1f) name(table116) totals(ca_c22) append

quietly: table (ca_c23) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c23)) nformat(%6.1f) name(table116) totals(ca_c23) append

quietly: table (ca_c24) (ig_a02esp) if ca_c01!=. | ca_c02!=. | ca_c03!=. | ca_c04!=. | ca_c05!=. | ca_c06!=. | ca_c07!=. | ca_c08!=. | ca_c09!=. | ca_c10!=. | ca_c11!=. | ca_c12!=. | ca_c13!=. | ca_c14!=. | ca_c15!=. | ca_c16!=. | ca_c17!=. | ca_c18!=. | ca_c19!=. | ca_c20!=. | ca_c21!=. | ca_c22!=. | ca_c23!=. | ca_c24!=., statistic(percent, across(ca_c24)) nformat(%6.1f) name(table116) totals(ca_c24) append


collect layout (N ca_c01[1] ca_c02[1] ca_c03[1] ca_c04[1] ca_c05[1] ca_c06[1] ca_c07[1] ca_c08[1] ca_c09[1] ca_c10[1] ca_c11[1] ca_c12[1] ca_c13[1] ca_c14[1] ca_c15[1] ca_c16[1] ca_c17[1] ca_c18[1] ca_c19[1] ca_c20[1] ca_c21[1] ca_c22[1] ca_c23[1] ca_c24[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header ca_c01, level(hide)
collect style header ca_c02, level(hide)
collect style header ca_c03, level(hide)
collect style header ca_c04, level(hide)
collect style header ca_c05, level(hide)
collect style header ca_c06, level(hide)
collect style header ca_c07, level(hide)
collect style header ca_c08, level(hide)
collect style header ca_c09, level(hide)
collect style header ca_c10, level(hide)
collect style header ca_c11, level(hide)
collect style header ca_c12, level(hide)
collect style header ca_c13, level(hide)
collect style header ca_c14, level(hide)
collect style header ca_c15, level(hide)
collect style header ca_c16, level(hide)
collect style header ca_c17, level(hide)
collect style header ca_c18, level(hide)
collect style header ca_c19, level(hide)
collect style header ca_c20, level(hide)
collect style header ca_c21, level(hide)
collect style header ca_c22, level(hide)
collect style header ca_c23, level(hide)
collect style header ca_c24, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 183: Technical training received") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if ca_c25frec!=., statistic(frequency) nformat(%6.0f) name(table117) totals(N) 
quietly: table (ig_a02esp) (ca_c25frec) if ca_c25frec!=., statistic(percent, across(ca_c25frec)) nformat(%6.1f) name(table117) totals(ca_c25frec) append

collect layout (ig_a02esp) (N ca_c25frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 184: When was the last training") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("8. Laboratory")

///////////////
quietly: table (ig_a02esp) (N) if lab_a01!=., statistic(frequency) nformat(%6.0f) name(table118) totals(N) 
quietly: table (ig_a02esp) (lab_a01) if lab_a01!=., statistic(percent, across(lab_a01)) nformat(%6.1f) name(table118) totals(lab_a01) append

collect layout (ig_a02esp) (N lab_a01) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 185: The laboratory participates in the surveillance of infectious diseases") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////////
quietly: table (N) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(frequency) nformat(%6.0f) name(table119) totals(N) 

quietly: table (lab_a01phum0) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum0)) nformat(%6.1f) name(table119) totals(lab_a01phum0) append

quietly: table (lab_a01phum1) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum1)) nformat(%6.1f) name(table119) totals(lab_a01phum1) append

quietly: table (lab_a01phum2) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum2)) nformat(%6.1f) name(table119) totals(lab_a01phum2) append

quietly: table (lab_a01phum3) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum3)) nformat(%6.1f) name(table119) totals(lab_a01phum3) append

quietly: table (lab_a01phum4) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum4)) nformat(%6.1f) name(table119) totals(lab_a01phum4) append

quietly: table (lab_a01phum5) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum5)) nformat(%6.1f) name(table119) totals(lab_a01phum5) append

quietly: table (lab_a01phum6) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum6)) nformat(%6.1f) name(table119) totals(lab_a01phum6) append

quietly: table (lab_a01phum7) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum7)) nformat(%6.1f) name(table119) totals(lab_a01phum7) append

quietly: table (lab_a01phum8) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum8)) nformat(%6.1f) name(table119) totals(lab_a01phum8) append

quietly: table (lab_a01phum9) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum9)) nformat(%6.1f) name(table119) totals(lab_a01phum9) append

quietly: table (lab_a01phum10) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum10)) nformat(%6.1f) name(table119) totals(lab_a01phum10) append

quietly: table (lab_a01phum11) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum11)) nformat(%6.1f) name(table119) totals(lab_a01phum11) append

quietly: table (lab_a01phum12) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum12)) nformat(%6.1f) name(table119) totals(lab_a01phum12) append

quietly: table (lab_a01phum13) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum13)) nformat(%6.1f) name(table119) totals(lab_a01phum13) append

quietly: table (lab_a01phum14) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum14)) nformat(%6.1f) name(table119) totals(lab_a01phum14) append

quietly: table (lab_a01phum15) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum15)) nformat(%6.1f) name(table119) totals(lab_a01phum15) append

quietly: table (lab_a01phum16) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum16)) nformat(%6.1f) name(table119) totals(lab_a01phum16) append

quietly: table (lab_a01phum17) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum17)) nformat(%6.1f) name(table119) totals(lab_a01phum17) append

quietly: table (lab_a01phum18) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum18)) nformat(%6.1f) name(table119) totals(lab_a01phum18) append

quietly: table (lab_a01phum19) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum19)) nformat(%6.1f) name(table119) totals(lab_a01phum19) append

quietly: table (lab_a01phum20) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum20)) nformat(%6.1f) name(table119) totals(lab_a01phum20) append

quietly: table (lab_a01phum21) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum21)) nformat(%6.1f) name(table119) totals(lab_a01phum21) append

quietly: table (lab_a01phum22) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum22)) nformat(%6.1f) name(table119) totals(lab_a01phum22) append

quietly: table (lab_a01phum23) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum23)) nformat(%6.1f) name(table119) totals(lab_a01phum23) append

quietly: table (lab_a01phum24) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum24)) nformat(%6.1f) name(table119) totals(lab_a01phum24) append

quietly: table (lab_a01phum25) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum25)) nformat(%6.1f) name(table119) totals(lab_a01phum25) append

quietly: table (lab_a01phum26) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum26)) nformat(%6.1f) name(table119) totals(lab_a01phum26) append

quietly: table (lab_a01phum27) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum27)) nformat(%6.1f) name(table119) totals(lab_a01phum27) append

quietly: table (lab_a01phum28) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum28)) nformat(%6.1f) name(table119) totals(lab_a01phum28) append

quietly: table (lab_a01phum29) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum29)) nformat(%6.1f) name(table119) totals(lab_a01phum29) append

quietly: table (lab_a01phum30) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum30)) nformat(%6.1f) name(table119) totals(lab_a01phum30) append

quietly: table (lab_a01phum31) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum31)) nformat(%6.1f) name(table119) totals(lab_a01phum31) append

quietly: table (lab_a01phum32) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum32)) nformat(%6.1f) name(table119) totals(lab_a01phum32) append

quietly: table (lab_a01phum33) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum33)) nformat(%6.1f) name(table119) totals(lab_a01phum33) append

quietly: table (lab_a01phum34) (ig_a02esp) if lab_a01phum0!=. | lab_a01phum1!=. | lab_a01phum2!=. | lab_a01phum3!=. | lab_a01phum4!=. | lab_a01phum5!=. | lab_a01phum6!=. | lab_a01phum7!=. | lab_a01phum8!=. | lab_a01phum9!=. | lab_a01phum10!=. | lab_a01phum11!=. | lab_a01phum12!=. | lab_a01phum13!=. | lab_a01phum14!=. | lab_a01phum15!=. | lab_a01phum16!=. | lab_a01phum17!=. | lab_a01phum18!=. | lab_a01phum19!=. | lab_a01phum20!=. | lab_a01phum21!=. | lab_a01phum22!=. | lab_a01phum23!=. | lab_a01phum24!=. | lab_a01phum25!=. | lab_a01phum26!=. | lab_a01phum27!=. | lab_a01phum28!=. | lab_a01phum29!=. | lab_a01phum30!=. | lab_a01phum31!=. | lab_a01phum32!=. | lab_a01phum33!=. | lab_a01phum34!=., statistic(percent, across(lab_a01phum34)) nformat(%6.1f) name(table119) totals(lab_a01phum34) append


collect layout (N lab_a01phum0[1] lab_a01phum1[1] lab_a01phum2[1] lab_a01phum3[1] lab_a01phum4[1] lab_a01phum5[1] lab_a01phum6[1] lab_a01phum7[1] lab_a01phum8[1] lab_a01phum9[1] lab_a01phum10[1] lab_a01phum11[1] lab_a01phum12[1] lab_a01phum13[1] lab_a01phum14[1] lab_a01phum15[1] lab_a01phum16[1] lab_a01phum17[1] lab_a01phum18[1] lab_a01phum19[1] lab_a01phum20[1] lab_a01phum21[1] lab_a01phum22[1] lab_a01phum23[1] lab_a01phum24[1] lab_a01phum25[1] lab_a01phum26[1] lab_a01phum27[1] lab_a01phum28[1] lab_a01phum29[1] lab_a01phum30[1] lab_a01phum31[1] lab_a01phum32[1] lab_a01phum33[1] lab_a01phum34[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header lab_a01phum0, level(hide)
collect style header lab_a01phum1, level(hide)
collect style header lab_a01phum2, level(hide)
collect style header lab_a01phum3, level(hide)
collect style header lab_a01phum4, level(hide)
collect style header lab_a01phum5, level(hide)
collect style header lab_a01phum6, level(hide)
collect style header lab_a01phum7, level(hide)
collect style header lab_a01phum8, level(hide)
collect style header lab_a01phum9, level(hide)
collect style header lab_a01phum10, level(hide)
collect style header lab_a01phum11, level(hide)
collect style header lab_a01phum12, level(hide)
collect style header lab_a01phum13, level(hide)
collect style header lab_a01phum14, level(hide)
collect style header lab_a01phum15, level(hide)
collect style header lab_a01phum16, level(hide)
collect style header lab_a01phum17, level(hide)
collect style header lab_a01phum18, level(hide)
collect style header lab_a01phum19, level(hide)
collect style header lab_a01phum20, level(hide)
collect style header lab_a01phum21, level(hide)
collect style header lab_a01phum22, level(hide)
collect style header lab_a01phum23, level(hide)
collect style header lab_a01phum24, level(hide)
collect style header lab_a01phum25, level(hide)
collect style header lab_a01phum26, level(hide)
collect style header lab_a01phum27, level(hide)
collect style header lab_a01phum28, level(hide)
collect style header lab_a01phum29, level(hide)
collect style header lab_a01phum30, level(hide)
collect style header lab_a01phum31, level(hide)
collect style header lab_a01phum32, level(hide)
collect style header lab_a01phum33, level(hide)
collect style header lab_a01phum34, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 186: Human pathogens in which it performs surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////////
quietly: table  (N) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(frequency) nformat(%6.0f) name(table120) totals(N) 

quietly: table (lab_a01pani0) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani0)) nformat(%6.1f) name(table120) totals(lab_a01pani0) append

quietly: table (lab_a01pani1) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani1)) nformat(%6.1f) name(table120) totals(lab_a01pani1) append

quietly: table (lab_a01pani2) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani2)) nformat(%6.1f) name(table120) totals(lab_a01pani2) append

quietly: table (lab_a01pani3) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani3)) nformat(%6.1f) name(table120) totals(lab_a01pani3) append

quietly: table (lab_a01pani4) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani4)) nformat(%6.1f) name(table120) totals(lab_a01pani4) append

quietly: table (lab_a01pani5) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani5)) nformat(%6.1f) name(table120) totals(lab_a01pani5) append

quietly: table (lab_a01pani6) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani6)) nformat(%6.1f) name(table120) totals(lab_a01pani6) append

quietly: table (lab_a01pani7) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani7)) nformat(%6.1f) name(table120) totals(lab_a01pani7) append

quietly: table (lab_a01pani8) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani8)) nformat(%6.1f) name(table120) totals(lab_a01pani8) append

quietly: table (lab_a01pani9) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani9)) nformat(%6.1f) name(table120) totals(lab_a01pani9) append

quietly: table (lab_a01pani10) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani10)) nformat(%6.1f) name(table120) totals(lab_a01pani10) append

quietly: table (lab_a01pani11) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani11)) nformat(%6.1f) name(table120) totals(lab_a01pani11) append

quietly: table (lab_a01pani12) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani12)) nformat(%6.1f) name(table120) totals(lab_a01pani12) append

quietly: table (lab_a01pani13) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani13)) nformat(%6.1f) name(table120) totals(lab_a01pani13) append

quietly: table (lab_a01pani14) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani14)) nformat(%6.1f) name(table120) totals(lab_a01pani14) append

quietly: table (lab_a01pani15) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani15)) nformat(%6.1f) name(table120) totals(lab_a01pani15) append

quietly: table (lab_a01pani16) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani16)) nformat(%6.1f) name(table120) totals(lab_a01pani16) append

quietly: table (lab_a01pani17) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani17)) nformat(%6.1f) name(table120) totals(lab_a01pani17) append

quietly: table (lab_a01pani18) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani18)) nformat(%6.1f) name(table120) totals(lab_a01pani18) append

quietly: table (lab_a01pani19) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani19)) nformat(%6.1f) name(table120) totals(lab_a01pani19) append

quietly: table (lab_a01pani20) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani20)) nformat(%6.1f) name(table120) totals(lab_a01pani20) append

quietly: table (lab_a01pani21) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani21)) nformat(%6.1f) name(table120) totals(lab_a01pani21) append

quietly: table (lab_a01pani22) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani22)) nformat(%6.1f) name(table120) totals(lab_a01pani22) append

quietly: table (lab_a01pani23) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani23)) nformat(%6.1f) name(table120) totals(lab_a01pani23) append

quietly: table (lab_a01pani24) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani24)) nformat(%6.1f) name(table120) totals(lab_a01pani24) append

quietly: table (lab_a01pani25) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani25)) nformat(%6.1f) name(table120) totals(lab_a01pani25) append

quietly: table (lab_a01pani26) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani26)) nformat(%6.1f) name(table120) totals(lab_a01pani26) append

quietly: table (lab_a01pani27) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani27)) nformat(%6.1f) name(table120) totals(lab_a01pani27) append

quietly: table (lab_a01pani28) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani28)) nformat(%6.1f) name(table120) totals(lab_a01pani28) append

quietly: table (lab_a01pani29) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani29)) nformat(%6.1f) name(table120) totals(lab_a01pani29) append

quietly: table (lab_a01pani30) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani30)) nformat(%6.1f) name(table120) totals(lab_a01pani30) append

quietly: table (lab_a01pani31) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani31)) nformat(%6.1f) name(table120) totals(lab_a01pani31) append

quietly: table (lab_a01pani32) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani32)) nformat(%6.1f) name(table120) totals(lab_a01pani32) append

quietly: table (lab_a01pani33) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani33)) nformat(%6.1f) name(table120) totals(lab_a01pani33) append

quietly: table (lab_a01pani34) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani34)) nformat(%6.1f) name(table120) totals(lab_a01pani34) append

quietly: table (lab_a01pani35) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani35)) nformat(%6.1f) name(table120) totals(lab_a01pani35) append

quietly: table (lab_a01pani36) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani36)) nformat(%6.1f) name(table120) totals(lab_a01pani36) append

quietly: table (lab_a01pani37) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani37)) nformat(%6.1f) name(table120) totals(lab_a01pani37) append

quietly: table (lab_a01pani38) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani38)) nformat(%6.1f) name(table120) totals(lab_a01pani38) append

quietly: table (lab_a01pani39) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani39)) nformat(%6.1f) name(table120) totals(lab_a01pani39) append

quietly: table (lab_a01pani40) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani40)) nformat(%6.1f) name(table120) totals(lab_a01pani40) append

quietly: table (lab_a01pani41) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani41)) nformat(%6.1f) name(table120) totals(lab_a01pani41) append

quietly: table (lab_a01pani42) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani42)) nformat(%6.1f) name(table120) totals(lab_a01pani42) append

quietly: table (lab_a01pani43) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani43)) nformat(%6.1f) name(table120) totals(lab_a01pani43) append

quietly: table (lab_a01pani44) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani44)) nformat(%6.1f) name(table120) totals(lab_a01pani44) append

quietly: table (lab_a01pani45) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani45)) nformat(%6.1f) name(table120) totals(lab_a01pani45) append

quietly: table (lab_a01pani46) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani46)) nformat(%6.1f) name(table120) totals(lab_a01pani46) append

quietly: table (lab_a01pani47) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani47)) nformat(%6.1f) name(table120) totals(lab_a01pani47) append

quietly: table (lab_a01pani48) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani48)) nformat(%6.1f) name(table120) totals(lab_a01pani48) append

quietly: table (lab_a01pani49) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani49)) nformat(%6.1f) name(table120) totals(lab_a01pani49) append

quietly: table (lab_a01pani50) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani50)) nformat(%6.1f) name(table120) totals(lab_a01pani50) append

quietly: table (lab_a01pani51) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani51)) nformat(%6.1f) name(table120) totals(lab_a01pani51) append

quietly: table (lab_a01pani52) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani52)) nformat(%6.1f) name(table120) totals(lab_a01pani52) append

quietly: table (lab_a01pani53) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani53)) nformat(%6.1f) name(table120) totals(lab_a01pani53) append

quietly: table (lab_a01pani54) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani54)) nformat(%6.1f) name(table120) totals(lab_a01pani54) append

quietly: table (lab_a01pani55) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani55)) nformat(%6.1f) name(table120) totals(lab_a01pani55) append

quietly: table (lab_a01pani56) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani56)) nformat(%6.1f) name(table120) totals(lab_a01pani56) append

quietly: table (lab_a01pani57) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani57)) nformat(%6.1f) name(table120) totals(lab_a01pani57) append

quietly: table (lab_a01pani58) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani58)) nformat(%6.1f) name(table120) totals(lab_a01pani58) append

quietly: table (lab_a01pani59) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani59)) nformat(%6.1f) name(table120) totals(lab_a01pani59) append

quietly: table (lab_a01pani60) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani60)) nformat(%6.1f) name(table120) totals(lab_a01pani60) append

quietly: table (lab_a01pani61) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani61)) nformat(%6.1f) name(table120) totals(lab_a01pani61) append

quietly: table (lab_a01pani62) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani62)) nformat(%6.1f) name(table120) totals(lab_a01pani62) append

quietly: table (lab_a01pani63) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani63)) nformat(%6.1f) name(table120) totals(lab_a01pani63) append

quietly: table (lab_a01pani64) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani64)) nformat(%6.1f) name(table120) totals(lab_a01pani64) append

quietly: table (lab_a01pani65) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani65)) nformat(%6.1f) name(table120) totals(lab_a01pani65) append

quietly: table (lab_a01pani66) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani66)) nformat(%6.1f) name(table120) totals(lab_a01pani66) append

quietly: table (lab_a01pani67) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani67)) nformat(%6.1f) name(table120) totals(lab_a01pani67) append

quietly: table (lab_a01pani68) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani68)) nformat(%6.1f) name(table120) totals(lab_a01pani68) append

quietly: table (lab_a01pani69) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani69)) nformat(%6.1f) name(table120) totals(lab_a01pani69) append

quietly: table (lab_a01pani70) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani70)) nformat(%6.1f) name(table120) totals(lab_a01pani70) append

quietly: table (lab_a01pani71) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani71)) nformat(%6.1f) name(table120) totals(lab_a01pani71) append

quietly: table (lab_a01pani72) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani72)) nformat(%6.1f) name(table120) totals(lab_a01pani72) append

quietly: table (lab_a01pani73) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani73)) nformat(%6.1f) name(table120) totals(lab_a01pani73) append

quietly: table (lab_a01pani74) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani74)) nformat(%6.1f) name(table120) totals(lab_a01pani74) append

quietly: table (lab_a01pani75) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani75)) nformat(%6.1f) name(table120) totals(lab_a01pani75) append

quietly: table (lab_a01pani76) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani76)) nformat(%6.1f) name(table120) totals(lab_a01pani76) append

quietly: table (lab_a01pani77) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani77)) nformat(%6.1f) name(table120) totals(lab_a01pani77) append

quietly: table (lab_a01pani78) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani78)) nformat(%6.1f) name(table120) totals(lab_a01pani78) append

quietly: table (lab_a01pani79) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani79)) nformat(%6.1f) name(table120) totals(lab_a01pani79) append

quietly: table (lab_a01pani80) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani80)) nformat(%6.1f) name(table120) totals(lab_a01pani80) append

quietly: table (lab_a01pani81) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani81)) nformat(%6.1f) name(table120) totals(lab_a01pani81) append

quietly: table (lab_a01pani82) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani82)) nformat(%6.1f) name(table120) totals(lab_a01pani82) append

quietly: table (lab_a01pani83) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani83)) nformat(%6.1f) name(table120) totals(lab_a01pani83) append

quietly: table (lab_a01pani84) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani84)) nformat(%6.1f) name(table120) totals(lab_a01pani84) append

quietly: table (lab_a01pani85) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani85)) nformat(%6.1f) name(table120) totals(lab_a01pani85) append

quietly: table (lab_a01pani86) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani86)) nformat(%6.1f) name(table120) totals(lab_a01pani86) append

quietly: table (lab_a01pani87) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani87)) nformat(%6.1f) name(table120) totals(lab_a01pani87) append

quietly: table (lab_a01pani88) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani88)) nformat(%6.1f) name(table120) totals(lab_a01pani88) append

quietly: table (lab_a01pani89) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani89)) nformat(%6.1f) name(table120) totals(lab_a01pani89) append

quietly: table (lab_a01pani90) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani90)) nformat(%6.1f) name(table120) totals(lab_a01pani90) append

quietly: table (lab_a01pani91) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani91)) nformat(%6.1f) name(table120) totals(lab_a01pani91) append

quietly: table (lab_a01pani92) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani92)) nformat(%6.1f) name(table120) totals(lab_a01pani92) append

quietly: table (lab_a01pani93) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani93)) nformat(%6.1f) name(table120) totals(lab_a01pani93) append

quietly: table (lab_a01pani94) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani94)) nformat(%6.1f) name(table120) totals(lab_a01pani94) append

quietly: table (lab_a01pani95) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani95)) nformat(%6.1f) name(table120) totals(lab_a01pani95) append

quietly: table (lab_a01pani96) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani96)) nformat(%6.1f) name(table120) totals(lab_a01pani96) append

quietly: table (lab_a01pani97) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani97)) nformat(%6.1f) name(table120) totals(lab_a01pani97) append

quietly: table (lab_a01pani98) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani98)) nformat(%6.1f) name(table120) totals(lab_a01pani98) append

quietly: table (lab_a01pani99) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani99)) nformat(%6.1f) name(table120) totals(lab_a01pani99) append

quietly: table (lab_a01pani100) (ig_a02esp) if lab_a01pani0!=. | lab_a01pani1!=. | lab_a01pani2!=. | lab_a01pani3!=. | lab_a01pani4!=. | lab_a01pani5!=. | lab_a01pani6!=. | lab_a01pani7!=. | lab_a01pani8!=. | lab_a01pani9!=. | lab_a01pani10!=. | lab_a01pani11!=. | lab_a01pani12!=. | lab_a01pani13!=. | lab_a01pani14!=. | lab_a01pani15!=. | lab_a01pani16!=. | lab_a01pani17!=. | lab_a01pani18!=. | lab_a01pani19!=. | lab_a01pani20!=. | lab_a01pani21!=. | lab_a01pani22!=. | lab_a01pani23!=. | lab_a01pani24!=. | lab_a01pani25!=. | lab_a01pani26!=. | lab_a01pani27!=. | lab_a01pani28!=. | lab_a01pani29!=. | lab_a01pani30!=. | lab_a01pani31!=. | lab_a01pani32!=. | lab_a01pani33!=. | lab_a01pani34!=. | lab_a01pani35!=. | lab_a01pani36!=. | lab_a01pani37!=. | lab_a01pani38!=. | lab_a01pani39!=. | lab_a01pani40!=. | lab_a01pani41!=. | lab_a01pani42!=. | lab_a01pani43!=. | lab_a01pani44!=. | lab_a01pani45!=. | lab_a01pani46!=. | lab_a01pani47!=. | lab_a01pani48!=. | lab_a01pani49!=. | lab_a01pani50!=. | lab_a01pani51!=. | lab_a01pani52!=. | lab_a01pani53!=. | lab_a01pani54!=. | lab_a01pani55!=. | lab_a01pani56!=. | lab_a01pani57!=. | lab_a01pani58!=. | lab_a01pani59!=. | lab_a01pani60!=. | lab_a01pani61!=. | lab_a01pani62!=. | lab_a01pani63!=. | lab_a01pani64!=. | lab_a01pani65!=. | lab_a01pani66!=. | lab_a01pani67!=. | lab_a01pani68!=. | lab_a01pani69!=. | lab_a01pani70!=. | lab_a01pani71!=. | lab_a01pani72!=. | lab_a01pani73!=. | lab_a01pani74!=. | lab_a01pani75!=. | lab_a01pani76!=. | lab_a01pani77!=. | lab_a01pani78!=. | lab_a01pani79!=. | lab_a01pani80!=. | lab_a01pani81!=. | lab_a01pani82!=. | lab_a01pani83!=. | lab_a01pani84!=. | lab_a01pani85!=. | lab_a01pani86!=. | lab_a01pani87!=. | lab_a01pani88!=. | lab_a01pani89!=. | lab_a01pani90!=. | lab_a01pani91!=. | lab_a01pani92!=. | lab_a01pani93!=. | lab_a01pani94!=. | lab_a01pani95!=. | lab_a01pani96!=. | lab_a01pani97!=. | lab_a01pani98!=. | lab_a01pani99!=. | lab_a01pani100!=., statistic(percent, across(lab_a01pani100)) nformat(%6.1f) name(table120) totals(lab_a01pani100) append

collect layout (N lab_a01pani0[1] lab_a01pani1[1] lab_a01pani2[1] lab_a01pani3[1] lab_a01pani4[1] lab_a01pani5[1] lab_a01pani6[1] lab_a01pani7[1] lab_a01pani8[1] lab_a01pani9[1] lab_a01pani10[1] lab_a01pani11[1] lab_a01pani12[1] lab_a01pani13[1] lab_a01pani14[1] lab_a01pani15[1] lab_a01pani16[1] lab_a01pani17[1] lab_a01pani18[1] lab_a01pani19[1] lab_a01pani20[1] lab_a01pani21[1] lab_a01pani22[1] lab_a01pani23[1] lab_a01pani24[1] lab_a01pani25[1] lab_a01pani26[1] lab_a01pani27[1] lab_a01pani28[1] lab_a01pani29[1] lab_a01pani30[1] lab_a01pani31[1] lab_a01pani32[1] lab_a01pani33[1] lab_a01pani34[1] lab_a01pani35[1] lab_a01pani36[1] lab_a01pani37[1] lab_a01pani38[1] lab_a01pani39[1] lab_a01pani40[1] lab_a01pani41[1] lab_a01pani42[1] lab_a01pani43[1] lab_a01pani44[1] lab_a01pani45[1] lab_a01pani46[1] lab_a01pani47[1] lab_a01pani48[1] lab_a01pani49[1] lab_a01pani50[1] lab_a01pani51[1] lab_a01pani52[1] lab_a01pani53[1] lab_a01pani54[1] lab_a01pani55[1] lab_a01pani56[1] lab_a01pani57[1] lab_a01pani58[1] lab_a01pani59[1] lab_a01pani60[1] lab_a01pani61[1] lab_a01pani62[1] lab_a01pani63[1] lab_a01pani64[1] lab_a01pani65[1] lab_a01pani66[1] lab_a01pani67[1] lab_a01pani68[1] lab_a01pani69[1] lab_a01pani70[1] lab_a01pani71[1] lab_a01pani72[1] lab_a01pani73[1] lab_a01pani74[1] lab_a01pani75[1] lab_a01pani76[1] lab_a01pani77[1] lab_a01pani78[1] lab_a01pani79[1] lab_a01pani80[1] lab_a01pani81[1] lab_a01pani82[1] lab_a01pani83[1] lab_a01pani84[1] lab_a01pani85[1] lab_a01pani86[1] lab_a01pani87[1] lab_a01pani88[1] lab_a01pani89[1] lab_a01pani90[1] lab_a01pani91[1] lab_a01pani92[1] lab_a01pani93[1] lab_a01pani94[1] lab_a01pani95[1] lab_a01pani96[1] lab_a01pani97[1] lab_a01pani98[1] lab_a01pani99[1] lab_a01pani100[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header lab_a01pani0, level(hide)
collect style header lab_a01pani1, level(hide)
collect style header lab_a01pani2, level(hide)
collect style header lab_a01pani3, level(hide)
collect style header lab_a01pani4, level(hide)
collect style header lab_a01pani5, level(hide)
collect style header lab_a01pani6, level(hide)
collect style header lab_a01pani7, level(hide)
collect style header lab_a01pani8, level(hide)
collect style header lab_a01pani9, level(hide)
collect style header lab_a01pani10, level(hide)
collect style header lab_a01pani11, level(hide)
collect style header lab_a01pani12, level(hide)
collect style header lab_a01pani13, level(hide)
collect style header lab_a01pani14, level(hide)
collect style header lab_a01pani15, level(hide)
collect style header lab_a01pani16, level(hide)
collect style header lab_a01pani17, level(hide)
collect style header lab_a01pani18, level(hide)
collect style header lab_a01pani19, level(hide)
collect style header lab_a01pani20, level(hide)
collect style header lab_a01pani21, level(hide)
collect style header lab_a01pani22, level(hide)
collect style header lab_a01pani23, level(hide)
collect style header lab_a01pani24, level(hide)
collect style header lab_a01pani25, level(hide)
collect style header lab_a01pani26, level(hide)
collect style header lab_a01pani27, level(hide)
collect style header lab_a01pani28, level(hide)
collect style header lab_a01pani29, level(hide)
collect style header lab_a01pani30, level(hide)
collect style header lab_a01pani31, level(hide)
collect style header lab_a01pani32, level(hide)
collect style header lab_a01pani33, level(hide)
collect style header lab_a01pani34, level(hide)
collect style header lab_a01pani35, level(hide)
collect style header lab_a01pani36, level(hide)
collect style header lab_a01pani37, level(hide)
collect style header lab_a01pani38, level(hide)
collect style header lab_a01pani39, level(hide)
collect style header lab_a01pani40, level(hide)
collect style header lab_a01pani41, level(hide)
collect style header lab_a01pani42, level(hide)
collect style header lab_a01pani43, level(hide)
collect style header lab_a01pani44, level(hide)
collect style header lab_a01pani45, level(hide)
collect style header lab_a01pani46, level(hide)
collect style header lab_a01pani47, level(hide)
collect style header lab_a01pani48, level(hide)
collect style header lab_a01pani49, level(hide)
collect style header lab_a01pani50, level(hide)
collect style header lab_a01pani51, level(hide)
collect style header lab_a01pani52, level(hide)
collect style header lab_a01pani53, level(hide)
collect style header lab_a01pani54, level(hide)
collect style header lab_a01pani55, level(hide)
collect style header lab_a01pani56, level(hide)
collect style header lab_a01pani57, level(hide)
collect style header lab_a01pani58, level(hide)
collect style header lab_a01pani59, level(hide)
collect style header lab_a01pani60, level(hide)
collect style header lab_a01pani61, level(hide)
collect style header lab_a01pani62, level(hide)
collect style header lab_a01pani63, level(hide)
collect style header lab_a01pani64, level(hide)
collect style header lab_a01pani65, level(hide)
collect style header lab_a01pani66, level(hide)
collect style header lab_a01pani67, level(hide)
collect style header lab_a01pani68, level(hide)
collect style header lab_a01pani69, level(hide)
collect style header lab_a01pani70, level(hide)
collect style header lab_a01pani71, level(hide)
collect style header lab_a01pani72, level(hide)
collect style header lab_a01pani73, level(hide)
collect style header lab_a01pani74, level(hide)
collect style header lab_a01pani75, level(hide)
collect style header lab_a01pani76, level(hide)
collect style header lab_a01pani77, level(hide)
collect style header lab_a01pani78, level(hide)
collect style header lab_a01pani79, level(hide)
collect style header lab_a01pani80, level(hide)
collect style header lab_a01pani81, level(hide)
collect style header lab_a01pani82, level(hide)
collect style header lab_a01pani83, level(hide)
collect style header lab_a01pani84, level(hide)
collect style header lab_a01pani85, level(hide)
collect style header lab_a01pani86, level(hide)
collect style header lab_a01pani87, level(hide)
collect style header lab_a01pani88, level(hide)
collect style header lab_a01pani89, level(hide)
collect style header lab_a01pani90, level(hide)
collect style header lab_a01pani91, level(hide)
collect style header lab_a01pani92, level(hide)
collect style header lab_a01pani93, level(hide)
collect style header lab_a01pani94, level(hide)
collect style header lab_a01pani95, level(hide)
collect style header lab_a01pani96, level(hide)
collect style header lab_a01pani97, level(hide)
collect style header lab_a01pani98, level(hide)
collect style header lab_a01pani99, level(hide)
collect style header lab_a01pani100, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 187: Animal pathogens in which it performs surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if lab_a02!=., statistic(frequency) nformat(%6.0f) name(table121) totals(N) 
quietly: table (ig_a02esp) (lab_a02) if lab_a02!=., statistic(percent, across(lab_a02)) nformat(%6.1f) name(table121) totals(lab_a02) append

collect layout (ig_a02esp) (N lab_a02) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 188: This organization performs surveillance of biological samples") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(frequency) nformat(%6.0f) name(table122) totals(N) 

quietly: table (ig_a02esp) (lab_a02esp1) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. |  lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02esp1)) nformat(%6.1f) name(table122) totals(lab_a02esp1) append

quietly: table (ig_a02esp) (lab_a02esp2) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02esp2)) nformat(%6.1f) name(table122) totals(lab_a02esp2) append

quietly: table (ig_a02esp) (lab_a02esp3) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02esp3)) nformat(%6.1f) name(table122) totals(lab_a02esp3) append

quietly: table (ig_a02esp) (lab_a02esp4) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02esp4)) nformat(%6.1f) name(table122) totals(lab_a02esp4) append

quietly: table (ig_a02esp) (lab_a02esp5) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02esp5)) nformat(%6.1f) name(table122) totals(lab_a02esp5) append

quietly: table (ig_a02esp) (lab_a02esp6) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02esp6)) nformat(%6.1f) name(table122) totals(lab_a02esp6) append

quietly: table (ig_a02esp) (lab_a02esp7) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02esp7)) nformat(%6.1f) name(table122) totals(lab_a02esp7) append

quietly: table (ig_a02esp) (lab_a02poe) if lab_a02esp1!=. | lab_a02esp2!=. | lab_a02esp3!=. | lab_a02esp4!=. | lab_a02esp5!=. | lab_a02esp6!=. | lab_a02esp7!=. | lab_a02poe!=., statistic(percent, across(lab_a02poe)) nformat(%6.1f) name(table122) totals(lab_a02poe) append

collect layout (ig_a02esp) (N lab_a02esp1[1] lab_a02esp2[1] lab_a02esp3[1] lab_a02esp4[1] lab_a02esp5[1] lab_a02esp6[1] lab_a02esp7[1] lab_a02poe[1])

collect style header N, level(hide)
collect style header lab_a02esp1, level(hide)
collect style header lab_a02esp2, level(hide)
collect style header lab_a02esp3, level(hide)
collect style header lab_a02esp4, level(hide)
collect style header lab_a02esp5, level(hide)
collect style header lab_a02esp6, level(hide)
collect style header lab_a02esp7, level(hide)
collect style header lab_a02poe, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 189: In which species do you perform surveillance of biological samples. Have any Standard Operating Procedure (SOP) manual for sample collection") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////////
quietly: table (ig_a02esp) (N) if lab_a03!=., statistic(frequency) nformat(%6.0f) name(table123) totals(N) 
quietly: table (ig_a02esp) (lab_a03) if lab_a03!=., statistic(percent, across(lab_a03)) nformat(%6.1f) name(table123) totals(lab_a03) append

collect layout (ig_a02esp) (N lab_a03) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 190: Conducts genomic surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if lab_a03ana1!=. | lab_a03ana2!=. | lab_a03ana3!=. | lab_a03ana4!=., statistic(frequency) nformat(%6.0f) name(table124) totals(N) 

quietly: table (ig_a02esp) (lab_a03ana1) if lab_a03ana1!=. | lab_a03ana2!=. | lab_a03ana3!=. | lab_a03ana4!=., statistic(percent, across(lab_a03ana1)) nformat(%6.1f) name(table124) totals(lab_a03ana1) append

quietly: table (ig_a02esp) (lab_a03ana2) if lab_a03ana1!=. | lab_a03ana2!=. | lab_a03ana3!=. | lab_a03ana4!=., statistic(percent, across(lab_a03ana2)) nformat(%6.1f) name(table124) totals(lab_a03ana2) append

quietly: table (ig_a02esp) (lab_a03ana3) if lab_a03ana1!=. | lab_a03ana2!=. | lab_a03ana3!=. | lab_a03ana4!=., statistic(percent, across(lab_a03ana3)) nformat(%6.1f) name(table124) totals(lab_a03ana3) append

quietly: table (ig_a02esp) (lab_a03ana4) if lab_a03ana1!=. | lab_a03ana2!=. | lab_a03ana3!=. | lab_a03ana4!=., statistic(percent, across(lab_a03ana4)) nformat(%6.1f) name(table124) totals(lab_a03ana4) append

collect layout (ig_a02esp) (N lab_a03ana1[1] lab_a03ana2[1] lab_a03ana3[1] lab_a03ana4[1])

collect style header N, level(hide)
collect style header lab_a03ana1, level(hide)
collect style header lab_a03ana2, level(hide)
collect style header lab_a03ana3, level(hide)
collect style header lab_a03ana4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 191: The analyses it performs in genomic surveillance") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a03int!=. | lab_a03sis!=., statistic(frequency) nformat(%6.0f) name(table125) totals(N) 

quietly: table (ig_a02esp) (lab_a03int) if lab_a03int!=. | lab_a03sis!=., statistic(percent, across(lab_a03int)) nformat(%6.1f) name(table125) totals(lab_a03int) append

quietly: table (ig_a02esp) (lab_a03sis) if lab_a03int!=. | lab_a03sis!=., statistic(percent, across(lab_a03sis)) nformat(%6.1f) name(table125) totals(lab_a03sis) append

collect layout (ig_a02esp) (N lab_a03int[1] lab_a03sis[1]) 

collect style header N, level(hide)
collect style header lab_a03int, level(hide)
collect style header lab_a03sis, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 192: Interfaces with genome databases such as Genbank or GISAID. There is a sequence analysis system") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (N) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(frequency) nformat(%6.0f) name(table126) totals(N) 

quietly: table (lab_a041) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a041)) nformat(%6.1f) name(table126) totals(lab_a041) append

quietly: table (lab_a042) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a042)) nformat(%6.1f) name(table126) totals(lab_a042) append

quietly: table (lab_a043) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a043)) nformat(%6.1f) name(table126) totals(lab_a043) append

quietly: table (lab_a044) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a044)) nformat(%6.1f) name(table126) totals(lab_a044) append

quietly: table (lab_a045) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a045)) nformat(%6.1f) name(table126) totals(lab_a045) append

quietly: table (lab_a046) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a046)) nformat(%6.1f) name(table126) totals(lab_a046) append

quietly: table (lab_a047) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a047)) nformat(%6.1f) name(table126) totals(lab_a047) append

quietly: table (lab_a048) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a048)) nformat(%6.1f) name(table126) totals(lab_a048) append

quietly: table (lab_a049) (ig_a02esp) if lab_a041!=. | lab_a042!=. | lab_a043!=. | lab_a044!=. | lab_a045!=. | lab_a046!=. | lab_a047!=. | lab_a048!=. | lab_a049!=., statistic(percent, across(lab_a049)) nformat(%6.1f) name(table126) totals(lab_a049) append

collect layout (N lab_a041[1] lab_a042[1] lab_a043[1] lab_a044[1] lab_a045[1] lab_a046[1] lab_a047[1] lab_a048[1] lab_a049[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header lab_a041, level(hide)
collect style header lab_a042, level(hide)
collect style header lab_a043, level(hide)
collect style header lab_a044, level(hide)
collect style header lab_a045, level(hide)
collect style header lab_a046, level(hide)
collect style header lab_a047, level(hide)
collect style header lab_a048, level(hide)
collect style header lab_a049, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 193: Types of laboratory tests performed") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////
quietly: table (N) (ig_a02esp) if lab_a04ser3!=. | lab_a04ser4!=., statistic(frequency) nformat(%6.0f) name(table127) totals(N) 

quietly: table (lab_a04ser3) (ig_a02esp) if lab_a04ser3!=. | lab_a04ser4!=., statistic(percent, across(lab_a04ser3)) nformat(%6.1f) name(table127) totals(lab_a04ser3) append

quietly: table (lab_a04ser4) (ig_a02esp) if lab_a04ser3!=. | lab_a04ser4!=., statistic(percent, across(lab_a04ser4)) nformat(%6.1f) name(table127) totals(lab_a04ser4) append

collect layout (N lab_a04ser3[1] lab_a04ser4[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header lab_a04ser3, level(hide)
collect style header lab_a04ser4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 194: Serology test performed") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////
quietly: table (N) (ig_a02esp) if lab_a04mol9!=. | lab_a04mol10!=. | lab_a04mol11!=., statistic(frequency) nformat(%6.0f) name(table128) totals(N) 

quietly: table (lab_a04mol9) (ig_a02esp) if lab_a04mol9!=. | lab_a04mol10!=. | lab_a04mol11!=., statistic(percent, across(lab_a04mol9)) nformat(%6.1f) name(table128) totals(lab_a04mol9) append

quietly: table (lab_a04mol10) (ig_a02esp) if lab_a04mol9!=. | lab_a04mol10!=. | lab_a04mol11!=., statistic(percent, across(lab_a04mol10)) nformat(%6.1f) name(table128) totals(lab_a04mol10) append

quietly: table (lab_a04mol11) (ig_a02esp) if lab_a04mol9!=. | lab_a04mol10!=. | lab_a04mol11!=., statistic(percent, across(lab_a04mol11)) nformat(%6.1f) name(table128) totals(lab_a04mol11) append

collect layout (N lab_a04mol9[1] lab_a04mol10[1] lab_a04mol11[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header lab_a04mol9, level(hide)
collect style header lab_a04mol10, level(hide)
collect style header lab_a04mol11, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 195: Molecular tests that perform") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////////////
quietly: table (N) (ig_a02esp) if lab_a04gen15!=. | lab_a04gen16!=. | lab_a04gen17!=. | lab_a04gen18!=. | lab_a04gen19!=., statistic(frequency) nformat(%6.0f) name(table129) totals(N) 

quietly: table (lab_a04gen15) (ig_a02esp) if lab_a04gen15!=. | lab_a04gen16!=. | lab_a04gen17!=. | lab_a04gen18!=. | lab_a04gen19!=., statistic(percent, across(lab_a04gen15)) nformat(%6.1f) name(table129) totals(lab_a04gen15) append

quietly: table (lab_a04gen16) (ig_a02esp) if lab_a04gen15!=. | lab_a04gen16!=. | lab_a04gen17!=. | lab_a04gen18!=. | lab_a04gen19!=., statistic(percent, across(lab_a04gen16)) nformat(%6.1f) name(table129) totals(lab_a04gen16) append

quietly: table (lab_a04gen17) (ig_a02esp) if lab_a04gen15!=. | lab_a04gen16!=. | lab_a04gen17!=. | lab_a04gen18!=. | lab_a04gen19!=., statistic(percent, across(lab_a04gen17)) nformat(%6.1f) name(table129) totals(lab_a04gen17) append

quietly: table (lab_a04gen18) (ig_a02esp) if lab_a04gen15!=. | lab_a04gen16!=. | lab_a04gen17!=. | lab_a04gen18!=. | lab_a04gen19!=., statistic(percent, across(lab_a04gen18)) nformat(%6.1f) name(table129) totals(lab_a04gen18) append

quietly: table (lab_a04gen19) (ig_a02esp) if lab_a04gen15!=. | lab_a04gen16!=. | lab_a04gen17!=. | lab_a04gen18!=. | lab_a04gen19!=., statistic(percent, across(lab_a04gen19)) nformat(%6.1f) name(table129) totals(lab_a04gen19) append

collect layout (N lab_a04gen15[1] lab_a04gen16[1] lab_a04gen17[1] lab_a04gen18[1] lab_a04gen19[1]) (ig_a02esp) 

collect style row split, dups(first)

collect style header N, level(hide)
collect style header lab_a04gen15, level(hide)
collect style header lab_a04gen16, level(hide)
collect style header lab_a04gen17, level(hide)
collect style header lab_a04gen18, level(hide)
collect style header lab_a04gen19, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 196: Sequencing of genes that perform") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a05!=., statistic(frequency) nformat(%6.0f) name(table130) totals(N) 

quietly: table (ig_a02esp) (lab_a05) if lab_a05!=., statistic(percent, across(lab_a05)) nformat(%6.1f) name(table130) totals(lab_a05) append

collect layout (ig_a02esp) (N lab_a05) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 197: Handles biological samples/samples for infectious diseases") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a05nores!=., statistic(frequency) nformat(%6.0f) name(table131) totals(N) 

quietly: table (ig_a02esp) (lab_a05nores) if lab_a05nores!=., statistic(percent, across(lab_a05nores)) nformat(%6.1f) name(table131) totals(lab_a05nores) append

collect layout (ig_a02esp) (N lab_a05nores) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 198: Obtain results of the samples sent") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a06!=., statistic(frequency) nformat(%6.0f) name(table132) totals(N) 

quietly: table (ig_a02esp) (lab_a06) if lab_a06!=., statistic(percent, across(lab_a06)) nformat(%6.1f) name(table132) totals(lab_a06) append

collect layout (ig_a02esp) (N lab_a06) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 199: Receives surveillance data or samples from a private entity, such as a private clinical laboratory") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a07!=., statistic(frequency) nformat(%6.0f) name(table133) totals(N) 

quietly: table (ig_a02esp) (lab_a07) if lab_a07!=., statistic(percent, across(lab_a07)) nformat(%6.1f) name(table133) totals(lab_a07) append

collect layout (ig_a02esp) (N lab_a07) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 200: Has a biobank (specimen repository)") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

//////////
table (ig_a02esp) (var), statistic(count N) statistic(mean lab_a07nmue) statistic(sd lab_a07nmue) listwise 

collect label list result, all
collect recode result count = column1 mean = column2 sd = column3
collect label list result, all
collect layout (ig_a02esp) (var#result[column1 column2 column3])
collect style cell var[lab_a07nmue]#result[column1], nformat(%6.0f)
collect style cell var[lab_a07nmue]#result[column2 column3], nformat(%6.1f)
collect style cell var[lab_a07nmue]#result[column3], sformat("(%s)")
collect label levels result column1 "N" column2 "Mean" column3 "SD", modify

collect style header N, level(hide)


collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 201: Number of samples currently in the biobank") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a07tipm!=. | lab_a07tiem!=., statistic(frequency) nformat(%6.0f) name(table134) totals(N) 

quietly: table (ig_a02esp) (lab_a07tipm) if lab_a07tipm!=. | lab_a07tiem!=., statistic(percent, across(lab_a07tipm)) nformat(%6.1f) name(table134) totals(lab_a07tipm) append

quietly: table (ig_a02esp) (lab_a07tiem) if lab_a07tipm!=. | lab_a07tiem!=., statistic(percent, across(lab_a07tiem)) nformat(%6.1f) name(table134) totals(lab_a07tiem) append

collect layout (ig_a02esp) (N lab_a07tipm lab_a07tiem) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 202: Type of samples kept in the biobank. Time to be kept in the biobank") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a08!=. | lab_a09!=. | lab_a10!=., statistic(frequency) nformat(%6.0f) name(table135) totals(N) 

quietly: table (ig_a02esp) (lab_a08) if lab_a08!=. | lab_a09!=. | lab_a10!=., statistic(percent, across(lab_a08)) nformat(%6.1f) name(table135) totals(lab_a08) append

quietly: table (ig_a02esp) (lab_a09) if lab_a08!=. | lab_a09!=. | lab_a10!=., statistic(percent, across(lab_a09)) nformat(%6.1f) name(table135) totals(lab_a09) append

quietly: table (ig_a02esp) (lab_a10) if lab_a08!=. | lab_a09!=. | lab_a10!=., statistic(percent, across(lab_a10)) nformat(%6.1f) name(table135) totals(lab_a10) append

collect layout (ig_a02esp) (N lab_a08[1] lab_a09[1] lab_a10[1]) 

collect style header N, level(hide)
collect style header lab_a08, level(hide)
collect style header lab_a09, level(hide)
collect style header lab_a10, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 203: The laboratory receives field samples during the investigation of public health events or public health surveys. The laboratory provides training on sample collection and transport practices from the sampling site during the investigation of public health emergencies. The laboratory have agreements with health facilities for the collection and transport of samples from the sampling site during outbreak investigation") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a11!=. | lab_a121!=. | lab_a122!=. | lab_a123!=. | lab_a124!=., statistic(frequency) nformat(%6.0f) name(table136) totals(N) 

quietly: table (ig_a02esp) (lab_a11) if lab_a11!=. | lab_a121!=. | lab_a122!=. | lab_a123!=. | lab_a124!=., statistic(percent, across(lab_a11)) nformat(%6.1f) name(table136) totals(lab_a11) append

quietly: table (ig_a02esp) (lab_a121) if lab_a11!=. | lab_a121!=. | lab_a122!=. | lab_a123!=. | lab_a124!=., statistic(percent, across(lab_a121)) nformat(%6.1f) name(table136) totals(lab_a121) append

quietly: table (ig_a02esp) (lab_a122) if lab_a11!=. | lab_a121!=. | lab_a122!=. | lab_a123!=. | lab_a124!=., statistic(percent, across(lab_a122)) nformat(%6.1f) name(table136) totals(lab_a122) append

quietly: table (ig_a02esp) (lab_a123) if lab_a11!=. | lab_a121!=. | lab_a122!=. | lab_a123!=. | lab_a124!=., statistic(percent, across(lab_a123)) nformat(%6.1f) name(table136) totals(lab_a123) append

quietly: table (ig_a02esp) (lab_a124) if lab_a11!=. | lab_a121!=. | lab_a122!=. | lab_a123!=. | lab_a124!=., statistic(percent, across(lab_a124)) nformat(%6.1f) name(table136) totals(lab_a124) append

collect layout (ig_a02esp) (N lab_a11[1] lab_a121[1] lab_a122[1] lab_a123[1] lab_a124[1]) 

collect style header N, level(hide)
collect style header lab_a11, level(hide)
collect style header lab_a121, level(hide)
collect style header lab_a122, level(hide)
collect style header lab_a123, level(hide)
collect style header lab_a124, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 204: The laboratory sends samples or isolates to a national or international reference laboratory for public health purposes. Where samples are processed") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a13!=., statistic(frequency) nformat(%6.0f) name(table137) totals(N) 

quietly: table (ig_a02esp) (lab_a13) if lab_a13!=., statistic(percent, across(lab_a13)) nformat(%6.1f) name(table137) totals(lab_a13) append

collect layout (ig_a02esp) (N lab_a13) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 205: SOPs (standard operating procedures) are in place for the laboratory processes") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a13sop1!=. | lab_a13sop2!=. | lab_a13sop3!=. | lab_a13sop4!=., statistic(frequency) nformat(%6.0f) name(table138) totals(N) 

quietly: table (ig_a02esp) (lab_a13sop1) if lab_a13sop1!=. | lab_a13sop2!=. | lab_a13sop3!=. | lab_a13sop4!=., statistic(percent, across(lab_a13sop1)) nformat(%6.1f) name(table138) totals(lab_a13sop1) append

quietly: table (ig_a02esp) (lab_a13sop2) if lab_a13sop1!=. | lab_a13sop2!=. | lab_a13sop3!=. | lab_a13sop4!=., statistic(percent, across(lab_a13sop2)) nformat(%6.1f) name(table138) totals(lab_a13sop2) append

quietly: table (ig_a02esp) (lab_a13sop3) if lab_a13sop1!=. | lab_a13sop2!=. | lab_a13sop3!=. | lab_a13sop4!=., statistic(percent, across(lab_a13sop3)) nformat(%6.1f) name(table138) totals(lab_a13sop3) append

quietly: table (ig_a02esp) (lab_a13sop4) if lab_a13sop1!=. | lab_a13sop2!=. | lab_a13sop3!=. | lab_a13sop4!=., statistic(percent, across(lab_a13sop4)) nformat(%6.1f) name(table138) totals(lab_a13sop4) append

collect layout (ig_a02esp) (N lab_a13sop1[1] lab_a13sop2[1] lab_a13sop3[1] lab_a13sop4[1]) 

collect style header N, level(hide)
collect style header lab_a13sop1, level(hide)
collect style header lab_a13sop2, level(hide)
collect style header lab_a13sop3, level(hide)
collect style header lab_a13sop4, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 206: Who develops SOPs for the laboratory processes") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a14!=. | lab_a14tip!=., statistic(frequency) nformat(%6.0f) name(table139) totals(N) 

quietly: table (ig_a02esp) (lab_a14) if lab_a14!=. | lab_a14tip!=., statistic(percent, across(lab_a14)) nformat(%6.1f) name(table139) totals(lab_a14) append

quietly: table (ig_a02esp) (lab_a14tip) if lab_a14!=. | lab_a14tip!=., statistic(percent, across(lab_a14tip)) nformat(%6.1f) name(table139) totals(lab_a14tip) append

collect layout (ig_a02esp) (N lab_a14 lab_a14tip) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 207:  Has a sample tracking system. Type of tracking system it has") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a15!=., statistic(frequency) nformat(%6.0f) name(table140) totals(N) 

quietly: table (ig_a02esp) (lab_a15) if lab_a15!=., statistic(percent, across(lab_a15)) nformat(%6.1f) name(table140) totals(lab_a15) append

collect layout (ig_a02esp) (N lab_a15) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 208: Has a bar coding system for the samples") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a16!=. | lab_a16esp!=., statistic(frequency) nformat(%6.0f) name(table141) totals(N) 

quietly: table (ig_a02esp) (lab_a16) if lab_a16!=. | lab_a16esp!=., statistic(percent, across(lab_a16)) nformat(%6.1f) name(table141) totals(lab_a16) append

quietly: table (ig_a02esp) (lab_a16esp) if lab_a16!=. | lab_a16esp!=., statistic(percent, across(lab_a16esp)) nformat(%6.1f) name(table141) totals(lab_a16esp) append

collect layout (ig_a02esp) (N lab_a16 lab_a16esp) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 209: Where samples are stored. Where else are the samples sent to") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_a17!=. | lab_a17_1!=. | lab_a18!=., statistic(frequency) nformat(%6.0f) name(table142) totals(N) 

quietly: table (ig_a02esp) (lab_a17) if lab_a17!=. | lab_a17_1!=. | lab_a18!=., statistic(percent, across(lab_a17)) nformat(%6.1f) name(table142) totals(lab_a17) append

quietly: table (ig_a02esp) (lab_a17_1) if lab_a17!=. | lab_a17_1!=. | lab_a18!=., statistic(percent, across(lab_a17_1)) nformat(%6.1f) name(table142) totals(lab_a17_1) append

quietly: table (ig_a02esp) (lab_a18) if lab_a17!=. | lab_a17_1!=. | lab_a18!=., statistic(percent, across(lab_a18)) nformat(%6.1f) name(table142) totals(lab_a18) append

collect layout (ig_a02esp) (N lab_a17[1] lab_a17_1[1] lab_a18[1]) 

collect style header N, level(hide)
collect style header lab_a17, level(hide)
collect style header lab_a17_1, level(hide)
collect style header lab_a18, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 210: Characteristics of how samples are stored in laboratories") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

/////////////////
putdocx paragraph, style(Heading1)
putdocx text ("Laboratory Reports")

/////////////////
quietly: table (ig_a02esp) (N) if lab_b01!=., statistic(frequency) nformat(%6.0f) name(table143) totals(N) 

quietly: table (ig_a02esp) (lab_b01) if lab_b01!=., statistic(percent, across(lab_b01)) nformat(%6.1f) name(table143) totals(lab_b01) append

collect layout (ig_a02esp) (N lab_b01) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 211: Notification related to zoonotic viruses to public health authorities has been established and implemented") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_b02!=., statistic(frequency) nformat(%6.0f) name(table144) totals(N) 

quietly: table (ig_a02esp) (lab_b02) if lab_b02!=., statistic(percent, across(lab_b02)) nformat(%6.1f) name(table144) totals(lab_b02) append

collect layout (ig_a02esp) (N lab_b02) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 212: Copies of SOPs, manuals and lab work guides are available on site with the samples") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_b03!=. | lab_b04!=., statistic(frequency) nformat(%6.0f) name(table145) totals(N) 

quietly: table (ig_a02esp) (lab_b03) if lab_b03!=. | lab_b04!=., statistic(percent, across(lab_b03)) nformat(%6.1f) name(table145) totals(lab_b03) append

quietly: table (ig_a02esp) (lab_b04) if lab_b03!=. | lab_b04!=., statistic(percent, across(lab_b04)) nformat(%6.1f) name(table145) totals(lab_b04) append

collect layout (ig_a02esp) (N lab_b03[1] lab_b04[1]) 

collect style header N, level(hide)
collect style header lab_b03, level(hide)
collect style header lab_b04, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 213: Where applicable, test results with reference intervals and/or alert/critical values are reported. Laboratory reports identify the laboratory performing the tests") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

/////////////////
quietly: table (ig_a02esp) (N) if lab_b05!=. | lab_b05tiem!=., statistic(frequency) nformat(%6.0f) name(table146) totals(N) 

quietly: table (ig_a02esp) (lab_b05) if lab_b05!=. | lab_b05tiem!=., statistic(percent, across(lab_b05)) nformat(%6.1f) name(table146) totals(lab_b05) append

quietly: table (ig_a02esp) (lab_b05tiem) if lab_b05!=. | lab_b05tiem!=., statistic(percent, across(lab_b05tiem)) nformat(%6.1f) name(table146) totals(lab_b05tiem) append

collect layout (ig_a02esp) (N lab_b05 lab_b05tiem) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 214: Laboratory archives results data (source data, result printouts, electronic records, etc.). How often is data archived") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

/////////////////
putdocx paragraph, style(Heading1)
putdocx text ("Laboratory Data Management System")

////////////
quietly: table (ig_a02esp) (N) if lab_c01!=., statistic(frequency) nformat(%6.0f) name(table147) totals(N) 

quietly: table (ig_a02esp) (lab_c01) if lab_c01!=., statistic(percent, across(lab_c01)) nformat(%6.1f) name(table147) totals(lab_c01) append

collect layout (ig_a02esp) (N lab_c01) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 215: Laboratory has a Laboratory Data Management System (LDS)") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////////
quietly: table (ig_a02esp) (N) if lab_c01inf1!=. | lab_c01inf2!=. | lab_c01inf3!=. | lab_c01inf4!=. | lab_c01inf5!=. | lab_c01inf6!=., statistic(frequency) nformat(%6.0f) name(table148) totals(N) 

quietly: table (ig_a02esp) (lab_c01inf1) if lab_c01inf1!=. | lab_c01inf2!=. | lab_c01inf3!=. | lab_c01inf4!=. | lab_c01inf5!=. | lab_c01inf6!=., statistic(percent, across(lab_c01inf1)) nformat(%6.1f) name(table148) totals(lab_c01inf1) append

quietly: table (ig_a02esp) (lab_c01inf2) if lab_c01inf1!=. | lab_c01inf2!=. | lab_c01inf3!=. | lab_c01inf4!=. | lab_c01inf5!=. | lab_c01inf6!=., statistic(percent, across(lab_c01inf2)) nformat(%6.1f) name(table148) totals(lab_c01inf2) append

quietly: table (ig_a02esp) (lab_c01inf3) if lab_c01inf1!=. | lab_c01inf2!=. | lab_c01inf3!=. | lab_c01inf4!=. | lab_c01inf5!=. | lab_c01inf6!=., statistic(percent, across(lab_c01inf3)) nformat(%6.1f) name(table148) totals(lab_c01inf3) append

quietly: table (ig_a02esp) (lab_c01inf4) if lab_c01inf1!=. | lab_c01inf2!=. | lab_c01inf3!=. | lab_c01inf4!=. | lab_c01inf5!=. | lab_c01inf6!=., statistic(percent, across(lab_c01inf4)) nformat(%6.1f) name(table148) totals(lab_c01inf4) append

quietly: table (ig_a02esp) (lab_c01inf5) if lab_c01inf1!=. | lab_c01inf2!=. | lab_c01inf3!=. | lab_c01inf4!=. | lab_c01inf5!=. | lab_c01inf6!=., statistic(percent, across(lab_c01inf5)) nformat(%6.1f) name(table148) totals(lab_c01inf5) append

quietly: table (ig_a02esp) (lab_c01inf6) if lab_c01inf1!=. | lab_c01inf2!=. | lab_c01inf3!=. | lab_c01inf4!=. | lab_c01inf5!=. | lab_c01inf6!=., statistic(percent, across(lab_c01inf6)) nformat(%6.1f) name(table148) totals(lab_c01inf6) append

collect layout (ig_a02esp) (N lab_c01inf1[1] lab_c01inf2[1] lab_c01inf3[1] lab_c01inf4[1] lab_c01inf5[1] lab_c01inf6[1]) 

collect style header N, level(hide)
collect style header lab_c01inf1, level(hide)
collect style header lab_c01inf2, level(hide)
collect style header lab_c01inf3, level(hide)
collect style header lab_c01inf4, level(hide)
collect style header lab_c01inf5, level(hide)
collect style header lab_c01inf6, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 216: Information collected in this system") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if lab_c01cop!=. | lab_c01res!=., statistic(frequency) nformat(%6.0f) name(table149) totals(N) 

quietly: table (ig_a02esp) (lab_c01cop) if lab_c01cop!=. | lab_c01res!=., statistic(percent, across(lab_c01cop)) nformat(%6.1f) name(table149) totals(lab_c01cop) append

quietly: table (ig_a02esp) (lab_c01res) if lab_c01cop!=. | lab_c01res!=., statistic(percent, across(lab_c01res)) nformat(%6.1f) name(table149) totals(lab_c01res) append

collect layout (ig_a02esp) (N lab_c01cop[1] lab_c01res[1]) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 217: This system is backed up weekly. The system is connected to a backup power source") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if lab_c02!=. | lab_c02frec!=., statistic(frequency) nformat(%6.0f) name(table150) totals(N) 

quietly: table (ig_a02esp) (lab_c02) if lab_c02!=. | lab_c02frec!=., statistic(percent, across(lab_c02)) nformat(%6.1f) name(table150) totals(lab_c02) append

quietly: table (ig_a02esp) (lab_c02frec) if lab_c02!=. | lab_c02frec!=., statistic(percent, across(lab_c02frec)) nformat(%6.1f) name(table150) totals(lab_c02frec) append

collect layout (ig_a02esp) (N lab_c02 lab_c02frec) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 218: There is a reporting system for the data collected. The frequency of the reports is") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

////////////
quietly: table (ig_a02esp) (N) if lab_c03!=., statistic(frequency) nformat(%6.0f) name(table151) totals(N) 

quietly: table (ig_a02esp) (lab_c03) if lab_c03!=., statistic(percent, across(lab_c03)) nformat(%6.1f) name(table151) totals(lab_c03) append

collect layout (ig_a02esp) (N lab_c03) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 219: The system is integrated with the information system of the Ministry of Health") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////////
quietly: table (ig_a02esp) (N) if lab_c03tip1!=. | lab_c03tip2!=. | lab_c03tip3!=. | lab_c03tip4!=. | lab_c03tip5!=., statistic(frequency) nformat(%6.0f) name(table152) totals(N) 

quietly: table (ig_a02esp) (lab_c03tip1) if lab_c03tip1!=. | lab_c03tip2!=. | lab_c03tip3!=. | lab_c03tip4!=. | lab_c03tip5!=., statistic(percent, across(lab_c03tip1)) nformat(%6.1f) name(table152) totals(lab_c03tip1) append

quietly: table (ig_a02esp) (lab_c03tip2) if lab_c03tip1!=. | lab_c03tip2!=. | lab_c03tip3!=. | lab_c03tip4!=. | lab_c03tip5!=., statistic(percent, across(lab_c03tip2)) nformat(%6.1f) name(table152) totals(lab_c03tip2) append

quietly: table (ig_a02esp) (lab_c03tip3) if lab_c03tip1!=. | lab_c03tip2!=. | lab_c03tip3!=. | lab_c03tip4!=. | lab_c03tip5!=., statistic(percent, across(lab_c03tip3)) nformat(%6.1f) name(table152) totals(lab_c03tip3) append

quietly: table (ig_a02esp) (lab_c03tip4) if lab_c03tip1!=. | lab_c03tip2!=. | lab_c03tip3!=. | lab_c03tip4!=. | lab_c03tip5!=., statistic(percent, across(lab_c03tip4)) nformat(%6.1f) name(table152) totals(lab_c03tip4) append

quietly: table (ig_a02esp) (lab_c03tip5) if lab_c03tip1!=. | lab_c03tip2!=. | lab_c03tip3!=. | lab_c03tip4!=. | lab_c03tip5!=., statistic(percent, across(lab_c03tip5)) nformat(%6.1f) name(table152) totals(lab_c03tip5) append

collect layout (ig_a02esp) (N lab_c03tip1[1] lab_c03tip2[1] lab_c03tip3[1] lab_c03tip4[1] lab_c03tip5[1]) 

collect style header N, level(hide)
collect style header lab_c03tip1, level(hide)
collect style header lab_c03tip2, level(hide)
collect style header lab_c03tip3, level(hide)
collect style header lab_c03tip4, level(hide)
collect style header lab_c03tip5, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 220: Type of data included in the reports") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("9. For the Health Sector (MINSA/DIRESA)")

///////////////
quietly: table (ig_a02esp) (N) if dire_01!=., statistic(frequency) nformat(%6.0f) name(table153) totals(N) 

quietly: table (ig_a02esp) (dire_01) if dire_01!=., statistic(percent, across(dire_01)) nformat(%6.1f) name(table153) totals(dire_01) append

collect layout (ig_a02esp) (N dire_01) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 221: The institutional operational plan includes surveillance activities") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if dire_02!=., statistic(frequency) nformat(%6.0f) name(table154) totals(N) 

quietly: table (ig_a02esp) (dire_02) if dire_02!=., statistic(percent, across(dire_02)) nformat(%6.1f) name(table154) totals(dire_02) append

collect layout (ig_a02esp) (N dire_02) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 222: The epidemiology office within its organizational chart is located as") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if dire_04!=. | dire_05!=., statistic(frequency) nformat(%6.0f) name(table155) totals(N) 

quietly: table (ig_a02esp) (dire_04) if dire_04!=. | dire_05!=., statistic(percent, across(dire_04)) nformat(%6.1f) name(table155) totals(dire_04) append

quietly: table (ig_a02esp) (dire_05) if dire_04!=. | dire_05!=., statistic(percent, across(dire_05)) nformat(%6.1f) name(table155) totals(dire_05) append

collect layout (ig_a02esp) (N dire_04[1] dire_05[1]) 

collect style header N, level(hide)
collect style header dire_04, level(hide)
collect style header dire_05, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 223: Human resources in epidemiology are sufficient for the development of surveillance. Technological infrastructure and equipment are sufficient for processing, analysis and protection of collected data") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if dire_08!=., statistic(frequency) nformat(%6.0f) name(table156) totals(N) 

quietly: table (ig_a02esp) (dire_08) if dire_08!=., statistic(percent, across(dire_08)) nformat(%6.1f) name(table156) totals(dire_08) append

collect layout (ig_a02esp) (N dire_08) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 224: The plans have a budget") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx pagebreak

///////////////
///////////////
putdocx paragraph, style(Heading1) font(, 20)
putdocx text ("10. For CDC Peru")

///////////////
quietly: table (ig_a02esp) (N) if cdc_02!=. | cdc_03!=., statistic(frequency) nformat(%6.0f) name(table157) totals(N) 

quietly: table (ig_a02esp) (cdc_02) if cdc_02!=. | cdc_03!=., statistic(percent, across(cdc_02)) nformat(%6.1f) name(table157) totals(cdc_02) append

quietly: table (ig_a02esp) (cdc_03) if cdc_02!=. | cdc_03!=., statistic(percent, across(cdc_03)) nformat(%6.1f) name(table157) totals(cdc_03) append

collect layout (ig_a02esp) (N cdc_02 cdc_03) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 225: The organization of the CDC responds to the need for outbreak and epidemic care. Sufficient budget is allocated to the CDC") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_05!=., statistic(frequency) nformat(%6.0f) name(table158) totals(N) 

quietly: table (ig_a02esp) (cdc_05) if cdc_05!=., statistic(percent, across(cdc_05)) nformat(%6.1f) name(table158) totals(cdc_05) append

collect layout (ig_a02esp) (N cdc_05) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 226: Budget is available for all surveillance activities (collection, analysis, dissemination)") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_06!=. | cdc_07!=., statistic(frequency) nformat(%6.0f) name(table159) totals(N) 

quietly: table (ig_a02esp) (cdc_06) if cdc_06!=. | cdc_07!=., statistic(percent, across(cdc_06)) nformat(%6.1f) name(table159) totals(cdc_06) append

quietly: table (ig_a02esp) (cdc_07) if cdc_06!=. | cdc_07!=., statistic(percent, across(cdc_07)) nformat(%6.1f) name(table159) totals(cdc_07) append

collect layout (ig_a02esp) (N cdc_06 cdc_07) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 227: Surveillance characteristics") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_08!=. | cdc_09!=., statistic(frequency) nformat(%6.0f) name(table160) totals(N) 

quietly: table (ig_a02esp) (cdc_08) if cdc_08!=. | cdc_09!=., statistic(percent, across(cdc_08)) nformat(%6.1f) name(table160) totals(cdc_08) append

quietly: table (ig_a02esp) (cdc_09) if cdc_08!=. | cdc_09!=., statistic(percent, across(cdc_09)) nformat(%6.1f) name(table160) totals(cdc_09) append

collect layout (ig_a02esp) (N cdc_08 cdc_09) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 228: Surveillance characteristics") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_10!=. | cdc_11!=., statistic(frequency) nformat(%6.0f) name(table161) totals(N) 

quietly: table (ig_a02esp) (cdc_10) if cdc_10!=. | cdc_11!=., statistic(percent, across(cdc_10)) nformat(%6.1f) name(table161) totals(cdc_10) append

quietly: table (ig_a02esp) (cdc_11) if cdc_10!=. | cdc_11!=., statistic(percent, across(cdc_11)) nformat(%6.1f) name(table161) totals(cdc_11) append

collect layout (ig_a02esp) (N cdc_10 cdc_11) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 229: It has the necessary mechanisms in place to ensure the protection of data collected from surveillance. It has backup systems for the data that is collected") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_12!=., statistic(frequency) nformat(%6.0f) name(table162) totals(N) 

quietly: table (ig_a02esp) (cdc_12) if cdc_12!=., statistic(percent, across(cdc_12)) nformat(%6.1f) name(table162) totals(cdc_12) append

collect layout (ig_a02esp) (N cdc_12) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 230: Periodicity with which backups are performed") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_13!=., statistic(frequency) nformat(%6.0f) name(table163) totals(N) 

quietly: table (ig_a02esp) (cdc_13) if cdc_13!=., statistic(percent, across(cdc_13)) nformat(%6.1f) name(table163) totals(cdc_13) append

collect layout (ig_a02esp) (N cdc_13) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 231: Have sufficient staff for the investigation of outbreaks that are reported to the central level") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_15!=., statistic(frequency) nformat(%6.0f) name(table164) totals(N) 

quietly: table (ig_a02esp) (cdc_15) if cdc_15!=., statistic(percent, across(cdc_15)) nformat(%6.1f) name(table164) totals(cdc_15) append

collect layout (ig_a02esp) (N cdc_15) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 232: They have training plans for the formation of human resources specialized and trained in epidemiology") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

///////////////
quietly: table (ig_a02esp) (N) if cdc_16!=., statistic(frequency) nformat(%6.0f) name(table165) totals(N) 

quietly: table (ig_a02esp) (cdc_16) if cdc_16!=., statistic(percent, across(cdc_16)) nformat(%6.1f) name(table165) totals(cdc_16) append

collect layout (ig_a02esp) (N cdc_16) 

collect style header N, level(hide)

collect style cell N, nformat(%6.0f)

collect style cell border_block, border(right, pattern(nil))

collect preview

collect style putdocx, title("Table 233: Periodicity with which the training plans are developed") halign(center) layout(autofitcontents)
collect style cell, font(Times New Roman, size(10))
putdocx collect

putdocx save reportf_insight.docx, replace








