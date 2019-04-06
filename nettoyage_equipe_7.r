setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
#Équipe 7 Élianne

bd_liens_7<-read.csv2('bd_liens_7.csv',sep = ';',header = T)
bd_etudiants_7<-read.csv2('bd_etudiants_7.csv',sep = ';',header = T)
bd_cours_7<-read.csv2('bd_cours_7.csv',sep = ';',header = T)

#Nom et nombre des colonnes
colnames(bd_liens_7) = tolower(colnames(bd_liens_7))
colnames(bd_etudiants_7) = tolower(colnames(bd_etudiants_7))
colnames(bd_cours_7) = tolower(colnames(bd_cours_7))
names(bd_liens_7)[3]<-'etudiant1'
names(bd_liens_7)[4]<-'etudiant2'
names(bd_liens_7)[1]<-'sigle'
names(bd_liens_7)[2]<-'session'
bd_liens_7<-bd_liens_7[,c('sigle','etudiant1','etudiant2','session')]
bd_etudiants_7[,4]<-c('f','h','f','f')
names(bd_cours_7)[2]<-'pratique'
names(bd_cours_7)[1]<-'sigle'

#Modification accents
bd_liens_7<-data.frame(data.frame(t(iconv(t(bd_liens_7), to="ASCII//TRANSLIT"))))
bd_etudiants_7<-data.frame(data.frame(t(iconv(t(bd_etudiants_7), to="ASCII//TRANSLIT"))))

#Mettre tout en minuscule
bd_liens_7<-data.frame(data.frame(t(tolower(t(bd_liens_7)))))
bd_etudiants_7<-data.frame(data.frame(t(tolower(t(bd_etudiants_7)))))
bd_cours_7<-data.frame(data.frame(t(tolower(t(bd_cours_7)))))

#Liens dupliquer
liens_dup_7<-bd_liens_7[,c(1,3,2,4)]
names(liens_dup_7)[2]<-'etudiant1'
names(liens_dup_7)[3]<-'etudiant2'
bd_liens_7 <- rbind(bd_liens_7,liens_dup_7)

#changer en charactère
library(dplyr)
bd_liens_7<-bd_liens_7 %>% mutate_if(is.factor, as.character)

#corriger les noms
for (i in 1:316) {
  for (j in 2:3) {
  if (bd_liens_7[i,j]=='maria_elisa_aparicio') bd_liens_7[i,j]='maria-elisa_aparicio-velasco'
  else if (bd_liens_7[i,j]=='francois_coursol_de_carufel') bd_liens_7[i,j]='francois_coursoldecarufel'
  else if (bd_liens_7[i,j]=='daphnee_dufour') bd_liens_7[i,j]='daphne_dufour'
  }
}
 
bd_cours_7[17,3]<-3
bd_cours_7[17,4]<-1
bd_cours_7[16,4]<-1
bd_cours_7[5,3]<-3
bd_cours_7[12,4]<-0
bd_cours_7[13,2]<-0
bd_cours_7[1,3]<-1
