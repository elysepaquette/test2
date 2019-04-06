setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
#Équipe 6 Émilie

bd_liens_6<-read.csv2('bd_liens_6.csv',sep = ';',header = T)
bd_etudiants_6<-read.csv2('bd_etudiants_6.csv',sep = ';',header = T)
bd_cours_6<-read.csv2('bd_cours_6.csv',sep = ';',header = T)

#Nom et nombre des colonnes
colnames(bd_liens_6) = tolower(colnames(bd_liens_6))
colnames(bd_etudiants_6) = tolower(colnames(bd_etudiants_6))
colnames(bd_cours_6) = tolower(colnames(bd_cours_6))
names(bd_liens_6)[3]<-'etudiant1'
names(bd_liens_6)[4]<-'etudiant2'
names(bd_liens_6)[1]<-'sigle'
bd_liens_6<-bd_liens_6[,c('sigle','etudiant1','etudiant2','session')]
names(bd_cours_6)[3]<-'credits'

#Modification accents
bd_liens_6<-data.frame(data.frame(t(iconv(t(bd_liens_6), to="ASCII//TRANSLIT"))))
bd_etudiants_6<-data.frame(data.frame(t(iconv(t(bd_etudiants_6), to="ASCII//TRANSLIT"))))

#Mettre tout en minuscule
bd_liens_6<-data.frame(data.frame(t(tolower(t(bd_liens_6)))))
bd_etudiants_6<-data.frame(data.frame(t(tolower(t(bd_etudiants_6)))))
bd_cours_6<-data.frame(data.frame(t(tolower(t(bd_cours_6)))))

#Liens dupliquer
liens_dup_6<-bd_liens_6[,c(1,3,2,4)]
names(liens_dup_6)[2]<-'etudiant1'
names(liens_dup_6)[3]<-'etudiant2'
bd_liens_6 <- rbind(bd_liens_6,liens_dup_6)

#changer en charactère
library(dplyr)
bd_liens_6<-bd_liens_6 %>% mutate_if(is.factor, as.character)

#corriger les noms
for (i in 1:324) {
  if (bd_liens_6[i,2]=='andreanne_deshormeaux') bd_liens_6[i,2]='andreanne_desormeaux'
  else if (bd_liens_6[i,2]=='cyrile_viens') bd_liens_6[i,2]='cyrille_viens'
} 
for (i in 1:324) {
  if (bd_liens_6[i,3]=='andreanne_deshormeaux') bd_liens_6[i,3]='andreanne_desormeaux'
  else if (bd_liens_6[i,3]=='cyrile_viens') bd_liens_6[i,3]='cyrille_viens'
} 

bd_cours_6[15,4]<-0
bd_cours_6[12,4]<-0
bd_cours_6[13,4]<-0
