setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
#Équipe 5 P-A, Émile

bd_liens_5<-read.csv2('bd_liens_5.csv',sep = ';',header = T)
bd_etudiants_5<-read.csv2('bd_etudiants_5.csv',sep = ';',header = T)
bd_cours_5<-read.csv2('bd_cours_5.csv',sep = ';',header = T)

#Nom et nombre des colonnes
colnames(bd_liens_5) = tolower(colnames(bd_liens_5))
colnames(bd_etudiants_5) = tolower(colnames(bd_etudiants_5))
colnames(bd_cours_5) = tolower(colnames(bd_cours_5))
bd_liens_5<-bd_liens_5[,c(1,2,3,4)]
names(bd_liens_5)[2]<-'etudiant1'
names(bd_liens_5)[3]<-'etudiant2'
bd_etudiants_5<-bd_etudiants_5[c(1,2,3,47),]
names(bd_etudiants_5)[5]<-'naissance'
names(bd_etudiants_5)[9]<-'faune'
bd_etudiants_5<-bd_etudiants_5[,1:10]
bd_etudiants_5$faune<-c(0,1,1,1)
bd_etudiants_5$programme<-c(1,1,1,1)
bd_etudiants_5$region_naissance<-c(5,13,5,5)
names(bd_cours_5)[2]<-'credits'
bd_cours_5<-bd_cours_5[,c(1,3,2,4,5)]

bd_cours_5<-bd_cours_5[,C('sigle','pratique','credits','concentration','option')]

#Modification accents
bd_liens_5<-data.frame(data.frame(t(iconv(t(bd_liens_5), to="ASCII//TRANSLIT"))))
bd_etudiants_5<-data.frame(data.frame(t(iconv(t(bd_etudiants_5), to="ASCII//TRANSLIT"))))

#Mettre tout en minuscule
bd_liens_5<-data.frame(data.frame(t(tolower(t(bd_liens_5)))))
bd_etudiants_5<-data.frame(data.frame(t(tolower(t(bd_etudiants_5)))))
bd_cours_5<-data.frame(data.frame(t(tolower(t(bd_cours_5)))))

#changer en charactère
library(dplyr)
bd_liens_5<-bd_liens_5 %>% mutate_if(is.factor, as.character)
bd_cours_5<-bd_cours_5 %>% mutate_if(is.factor, as.character)

#corriger les noms
for (i in 1:490) {
  if (bd_liens_5[i,2]=='mc_lenny_jean') bd_liens_5[i,2]='mc-lenny_jean'
  else if (bd_liens_5[i,2]=='maria_elisa_aparicio') bd_liens_5[i,2]='maria-elisa_aparicio-velasco'
  else if (bd_liens_5[i,2]=='mclenny_jean') bd_liens_5[i,2]='mc-lenny_jean'
  else if (bd_liens_5[i,2]=='elise_paquette') bd_liens_5[i,2]='elyse_paquette'
  else if (bd_liens_5[i,2]=='gabi_dupont') bd_liens_5[i,2]='gaby_dupont'
  else if (bd_liens_5[i,2]=='carolle-anne_dumaine') bd_liens_5[i,2]='carole-anne_dumaine'
  } 
for (i in 1:490) {
  if (bd_liens_5[i,3]=='mc_lenny_jean') bd_liens_5[i,3]='mc-lenny_jean'
  else if (bd_liens_5[i,3]=='maria_elisa_aparicio') bd_liens_5[i,3]='maria-elisa_aparicio-velasco'
  else if (bd_liens_5[i,3]=='mclenny_jean') bd_liens_5[i,3]='mc-lenny_jean'
  else if (bd_liens_5[i,3]=='elise_paquette') bd_liens_5[i,3]='elyse_paquette'
  else if (bd_liens_5[i,3]=='gabi_dupont') bd_liens_5[i,3]='gaby_dupont'
  else if (bd_liens_5[i,3]=='carolle-anne_dumaine') bd_liens_5[i,3]='carole-anne_dumaine'
} 

#corriger vrai faux table cours
for (i in 1:24) {
  if (bd_cours_5[i,5]=='f') bd_cours_5[i,5]=0
  else if (bd_cours_5[i,5]=='v') bd_cours_5[i,5]=1
}
for (i in 1:24) {
  if (bd_cours_5[i,4]=='f') bd_cours_5[i,4]=0
  else if (bd_cours_5[i,4]=='v') bd_cours_5[i,4]=1
}
for (i in 1:24) {
  if (bd_cours_5[i,2]=='f') bd_cours_5[i,2]=0
  else if (bd_cours_5[i,2]=='v') bd_cours_5[i,2]=1
}


bd_cours_5[5,4]<-0
bd_cours_5[7,4]<-0
bd_cours_5[1,4]<-0
bd_cours_5[6,4]<-0
bd_cours_5[24,5]<-1
#ordre table
bd_etudiants_5<-bd_etudiants_5[,c(1,2,3,4,5,9,8,6,7,10)]