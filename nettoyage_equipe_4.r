setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
#Équipe 4 Benjamin

bd_liens_4<-read.csv2('bd_liens_4.csv',sep = ',',header = T)
bd_etudiants_4<-read.csv2('bd_etudiants_4.csv',sep = ';',header = T)
bd_cours_4<-read.csv2('bd_cours_4.csv',sep = ';',header = T)

#Nom et nombre des colonnes
colnames(bd_liens_4) = tolower(colnames(bd_liens_4))
colnames(bd_etudiants_4) = tolower(colnames(bd_etudiants_4))
colnames(bd_cours_4) = tolower(colnames(bd_cours_4))



#table étudiants
bd_etudiants_4$region_naissance<-c(16,NA,5)

#Modification accents
bd_liens_4<-data.frame(data.frame(t(iconv(t(bd_liens_4), to="ASCII//TRANSLIT"))))
bd_etudiants_4<-data.frame(data.frame(t(iconv(t(bd_etudiants_4), to="ASCII//TRANSLIT"))))

#Mettre tout en minuscule
bd_liens_4<-data.frame(data.frame(t(tolower(t(bd_liens_4)))))
bd_etudiants_4<-data.frame(data.frame(t(tolower(t(bd_etudiants_4)))))
bd_cours_4<-data.frame(data.frame(t(tolower(t(bd_cours_4)))))

#Liens dupliquer
liens_dup_4<-bd_liens_4[,c(1,3,2,4)]
names(liens_dup_4)[2]<-'etudiant1'
names(liens_dup_4)[3]<-'etudiant2'
bd_liens_4 <- rbind(bd_liens_4,liens_dup_4)

#changer en charactère
library(dplyr)
bd_liens_4<-bd_liens_4 %>% mutate_if(is.factor, as.character)

#corriger les noms
for (i in 1:648) {
  if (bd_liens_4[i,2]=='timon_janzing_b...') bd_liens_4[i,2]='timon_janzing-bachelet'
  else if (bd_liens_4[i,2]=='mari_elisa_aparicio') bd_liens_4[i,2]='maria-elisa_aparicio-velasco'
} 
for (i in 1:648) {
  if (bd_liens_4[i,3]=='timon_janzing_b...') bd_liens_4[i,3]='timon_janzing-bachelet'
  else if (bd_liens_4[i,3]=='mari_elisa_aparicio') bd_liens_4[i,3]='maria-elisa_aparicio-velasco'
} 
bd_cours_4[14,2]<-0
bd_cours_4[2,4]<-0
bd_cours_4[12,4]<-0
bd_cours_4[17,4]<-0
bd_cours_4<-bd_cours_4[-7,]
bd_etudiants_4[2,8]<-NA
