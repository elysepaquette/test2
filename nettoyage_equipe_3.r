setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
#Équipe 3 Gab Boil

bd_liens_3<-read.csv2('bd_liens_3.csv',sep = ';',header = T)
bd_etudiants_3<-read.csv2('bd_etudiants_3.csv',sep = ';',header = T)
bd_cours_3<-read.csv2('bd_cours_3.csv',sep = ';',header = T)

#enlever ligne na
bd_liens_3<-bd_liens_3[-c(25,26),]
#Nom et nombre des colonnes et organisation
colnames(bd_liens_3) = tolower(colnames(bd_liens_3))
colnames(bd_etudiants_3) = tolower(colnames(bd_etudiants_3))
colnames(bd_cours_3) = tolower(colnames(bd_cours_3))
names(bd_liens_3)[2]<-'etudiant1'
names(bd_liens_3)[3]<-'etudiant2'
names(bd_etudiants_3)[9]<-'diete'
bd_etudiants_3<-bd_etudiants_3[,c(3,2,1,4,5,6,7,8,9,10)]
names(bd_liens_3)[1]<-'sigle'

#enlever les etudiants pas rapport
bd_etudiants_3<-bd_etudiants_3[c(4,8,18,20),]

#ajouter info. région et pays et autre vrai faux etc.
bd_etudiants_3$region_naissance<-c(16,0,16,0)
bd_etudiants_3$pays_origine<-c('ca','ca','ca',NA)
bd_etudiants_3$id<-c('gabriel_boilard','josiane_cote-audet','kathryne_moreau','elyse_paquette')
bd_etudiants_3$nom<-c('boilard','cote-audet','moreau','paquette')
bd_etudiants_3$programme<-c(1,1,1,1)
bd_etudiants_3$sexe<-c('h','f','f','f')
names(bd_etudiants_3)[7]<-'faune'
names(bd_etudiants_3)[10]<-'pays_naissance'
names(bd_etudiants_3)[5]<-'naissance'
bd_etudiants_3$naissance<-c(1990,1997,1997,1996)
bd_etudiants_3$faune<-c(0,1,1,0)
library(dplyr)
bd_liens_3<-bd_liens_3 %>% mutate_if(is.factor, as.character)
bd_liens_3[85:89,1]<-c('bio109','bio109','bio109','bio109','bio109')
names(bd_cours_3)[2]<-'sigle'
bd_cours_3<-bd_cours_3[,c(2,3,4,5,6)]
names(bd_cours_3)[4]<-'concentration'

#Modification accents
bd_liens_3<-data.frame(data.frame(t(iconv(t(bd_liens_3), to="ASCII//TRANSLIT"))))
bd_etudiants_3<-data.frame(data.frame(t(iconv(t(bd_etudiants_3), to="ASCII//TRANSLIT"))))

#Mettre tout en minuscule
bd_liens_3<-data.frame(data.frame(t(tolower(t(bd_liens_3)))))
bd_etudiants_3<-data.frame(data.frame(t(tolower(t(bd_etudiants_3)))))
bd_cours_3<-data.frame(data.frame(t(tolower(t(bd_cours_3)))))

#Liens dupliquer
liens_dup_3<-bd_liens_3[,c(1,3,2,4)]
names(liens_dup_3)[2]<-'etudiant1'
names(liens_dup_3)[3]<-'etudiant2'
bd_liens_3 <- rbind(bd_liens_3,liens_dup_3)

#changer en charactère
library(dplyr)
bd_liens_3<-bd_liens_3 %>% mutate_if(is.factor, as.character)
bd_cours_3<-bd_cours_3 %>% mutate_if(is.factor, as.character)

#corriger les noms
for (i in 1:344) {
  if (bd_liens_3[i,2]=='inconnue') bd_liens_3[i,2]='marie-eve_lachance-foisy'
  else if (bd_liens_3[i,2]=='josiane_cote_audet') bd_liens_3[i,2]='josiane_cote-audet'
  else if (bd_liens_3[i,2]=='laurie_chene_cote') bd_liens_3[i,2]='laurie_chene-cote'
  else if (bd_liens_3[i,2]=='maria_elisa_aparicio_velasco') bd_liens_3[i,2]='maria-elisa_aparicio-velasco'
  else if (bd_liens_3[i,2]=='hadjara-madoccoura-no_barro') bd_liens_3[i,2]='hadjara-madoccoura-noura_barro'
  }
for (i in 1:344) {
  if (bd_liens_3[i,3]=='emile_choiunard') bd_liens_3[i,3]='emile_chouinard'
  else if (bd_liens_3[i,3]=='josiane_cote_audet') bd_liens_3[i,3]='josiane_cote-audet'
  else if (bd_liens_3[i,3]=='laurie_chene_cote') bd_liens_3[i,3]='laurie_chene-cote'
  else if (bd_liens_3[i,3]=='maria_elisa_aparicio_velasco') bd_liens_3[i,3]='maria-elisa_aparicio-velasco'
  else if (bd_liens_3[i,3]=='hadjara-madoccoura-no_barro') bd_liens_3[i,3]='hadjara-madoccoura-noura_barro'
  else if (bd_liens_3[i,3]=='inconnue') bd_liens_3[i,3]='marie-eve_lachance-foisy'
  }
#corriger vrai faux table cours
for (i in 1:22) {
  if (bd_cours_3[i,5]=='f') bd_cours_3[i,5]=0
  else if (bd_cours_3[i,5]=='v') bd_cours_3[i,5]=1
}
for (i in 1:22) {
  if (bd_cours_3[i,4]=='f') bd_cours_3[i,4]=0
  else if (bd_cours_3[i,4]=='v') bd_cours_3[i,4]=1
}
for (i in 1:22) {
  if (bd_cours_3[i,2]=='f') bd_cours_3[i,2]=0
  else if (bd_cours_3[i,2]=='v') bd_cours_3[i,2]=1
}

bd_etudiants_3[4,9]<-NA
bd_cours_3[4,4]<-0
bd_cours_3[2,4]<-0
bd_cours_3[16,2]<-1
bd_cours_3[15,2]<-0
bd_cours_3[10,3]<-2
#ordre table
bd_etudiants_3<-bd_etudiants_3[,c('id','prenom','nom','sexe','naissance','faune','programme','pays_naissance','region_naissance','diete')]