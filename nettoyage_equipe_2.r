setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
#Équipe 2 Daphné

bd_liens_2<-read.csv2('bd_liens_2.csv',sep = ';',header = T)
bd_etudiants_2<-read.csv2('bd_etudiants_2.csv',sep = ';',header = T)
bd_cours_2<-read.csv2('bd_cours_2.csv',sep = ';',header = T,stringsAsFactors = F)

#Nom et nombre des colonnes
colnames(bd_liens_2) = tolower(colnames(bd_liens_2))
colnames(bd_etudiants_2) = tolower(colnames(bd_etudiants_2))
colnames(bd_cours_2) = tolower(colnames(bd_cours_2))
bd_etudiants_2<-data.frame(id=c('daphne_dufour','anne-sophie_neron','francois_tremblay'),bd_etudiants_2)

#Modification accents
bd_liens_2<-data.frame(data.frame(t(iconv(t(bd_liens_2), to="ASCII//TRANSLIT"))))
bd_etudiants_2<-data.frame(data.frame(t(iconv(t(bd_etudiants_2), to="ASCII//TRANSLIT"))))

#Mettre tout en minuscule
bd_liens_2<-data.frame(data.frame(t(tolower(t(bd_liens_2)))))
bd_etudiants_2<-data.frame(data.frame(t(tolower(t(bd_etudiants_2)))))
bd_cours_2<-data.frame(data.frame(t(tolower(t(bd_cours_2)))))

#Remettre les variable dans le format charactère
library(dplyr)
bd_cours_2<-bd_cours_2 %>% mutate_if(is.factor, as.character)
bd_etudiants_2<-bd_etudiants_2 %>% mutate_if(is.factor, as.character)

#changer les faux pour des 0 et les vrai pour des 1
#bd_curs
for (i in 1:54) {
  if (bd_cours_2[i,2]=='faux') bd_cours_2[i,2]=0
  else if (bd_cours_2[i,2]=='vrai') bd_cours_2[i,2]=1
}
for (i in 1:54) {
  if (bd_cours_2[i,4]=='faux') bd_cours_2[i,4]=0
  else if (bd_cours_2[i,4]=='vrai') bd_cours_2[i,4]=1
}
for (i in 1:54) {
  if (bd_cours_2[i,5]=='faux') bd_cours_2[i,5]=0
  else if (bd_cours_2[i,5]=='vrai') bd_cours_2[i,5]=1
}
#bd étudiant faux vrai
for (i in 1:3) {
  if (bd_etudiants_2[i,6]=='faux') bd_etudiants_2[i,6]=0
  else if (bd_etudiants_2[i,6]=='vrai') bd_etudiants_2[i,6]=1
}
for (i in 1:3) {
  if (bd_etudiants_2[i,7]=='faux') bd_etudiants_2[i,7]=0
  else if (bd_etudiants_2[i,7]=='vrai') bd_etudiants_2[i,7]=1
}
#bd étudiants male femmelle
for (i in 1:3) {
  if (bd_etudiants_2[i,4]=='m') bd_etudiants_2[i,4]='h'
}

#Liens dupliquer
liens_dup_2<-bd_liens_2[,c(1,3,2,4)]
names(liens_dup_2)[2]<-'etudiant1'
names(liens_dup_2)[3]<-'etudiant2'
bd_liens_2 <- rbind(bd_liens_2,liens_dup_2)

bd_cours_2[10,4]<-0
bd_cours_2[33,4]<-0
bd_cours_2[40,4]<-0
