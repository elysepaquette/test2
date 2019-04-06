setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
#Équipe 1 Jonathan

bd_liens_1<-read.csv('bd_liens_jo.csv',sep = ',',header = T)
bd_etudiants_1<-read.csv('bd_etudiants_jo.csv',sep = ',',header = T)
bd_cours_1<-read.csv('bd_cours_jo.csv',sep = ',',header = T)

#Nom et nombre des colonnes
colnames(bd_liens_1) = tolower(colnames(bd_liens_1))
colnames(bd_etudiants_1) = tolower(colnames(bd_etudiants_1))
colnames(bd_cours_1) = tolower(colnames(bd_cours_1))
names(bd_etudiants_1)[9]<-'region_naissance'

#Modification accents
bd_liens_1<-data.frame(data.frame(t(iconv(t(bd_liens_1), to="ASCII//TRANSLIT"))))
bd_etudiants_1<-data.frame(data.frame(t(iconv(t(bd_etudiants_1), to="ASCII//TRANSLIT"))))

#Mettre tout en minuscule
bd_liens_1<-data.frame(data.frame(t(tolower(t(bd_liens_1)))))
bd_etudiants_1<-data.frame(data.frame(t(tolower(t(bd_etudiants_1)))))
bd_cours_1<-data.frame(data.frame(t(tolower(t(bd_cours_1)))))

#Liens dupliquer
liens_dup_1<-bd_liens_1[,c(1,3,2,4)]
names(liens_dup_1)[2]<-'etudiant1'
names(liens_dup_1)[3]<-'etudiant2'
bd_liens_1 <- rbind(bd_liens_1,liens_dup_1)

#changer en charactère
library(dplyr)
bd_liens_1<-bd_liens_1 %>% mutate_if(is.factor, as.character)

#corriger les noms
for (i in 1:326) {
  if (bd_liens_1[i,2]=='maria_elisa_aparicio_velasco') bd_liens_1[i,2]='maria-elisa_aparicio-velasco'
  else if (bd_liens_1[i,2]=='dave_thibouthot_ste-croix') bd_liens_1[i,2]='dave_thibouthot-ste-croix'
  else if (bd_liens_1[i,2]=='marc-antoine_paul-ouellete') bd_liens_1[i,2]='marc-antoine_paul-ouellet'
  else if (bd_liens_1[i,2]=='guilenne_alejandra_toro') bd_liens_1[i,2]='guilenne_alejandra-toro'
}
for (i in 1:326) {
  if (bd_liens_1[i,3]=='maria_elisa_aparicio_velasco') bd_liens_1[i,3]='maria-elisa_aparicio-velasco'
  else if (bd_liens_1[i,3]=='dave_thibouthot_ste-croix') bd_liens_1[i,3]='dave_thibouthot-ste-croix'
  else if (bd_liens_1[i,3]=='marc-antoine_paul-ouellete') bd_liens_1[i,3]='marc-antoine_paul-ouellet'
  else if (bd_liens_1[i,3]=='guilenne_alejandra_toro') bd_liens_1[i,3]='guilenne_alejandra-toro'
}

bd_cours_1[5,2]<-1
bd_cours_1[6,2]<-0
bd_cours_1[15,2]<-1
bd_cours_1[16,2]<-0
bd_cours_1[4,2]<-0
bd_cours_1[10,2]<-0
bd_cours_1[11,2]<-1
bd_cours_1[13,2]<-1
bd_cours_1[14,2]<-0
bd_cours_1[2,4]<-0
bd_cours_1[4,4]<-0
