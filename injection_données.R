setwd("C:/Users/Acer/Desktop/programmation/donnees_bio500_2019")
library(RSQLite)
tables.db <- dbConnect(SQLite(), dbname="tables.db")
#creation de la table cours
cours_sql<- "CREATE TABLE cours (sigle CHAR(6),pratique BOLEAN(1),credits INTEGER(1),concentration BOLEAN(1),option BOLEAN(1),
PRIMARY KEY(sigle));"
dbSendQuery(tables.db,cours_sql)
#injection des données
bd_cours<-rbind(bd_cours_1,bd_cours_2,bd_cours_3,bd_cours_4,bd_cours_5,bd_cours_6,bd_cours_7)
bd_cours<-unique(bd_cours)
dbWriteTable(tables.db,append=TRUE,name="cours",value=bd_cours, row.names=FALSE)
sql_requete <- "
SELECT *
FROM cours
;"
apercu<-dbGetQuery(tables.db,sql_requete)
apercu


#creation de la table etudiants
etudiants_sql <- "CREATE TABLE etudiants (id VARCHAR,prenom VARCHAR,nom VARCHAR,sexe CHAR(1),naissance INTEGER(4),
faune BOLEAN(1),programme BOLEAN(1),pays_naissance CHAR(2),region_naissance INTEGER(2),diete CHAR(2),PRIMARY KEY(id)
FOREIGN KEY(id) REFERENCES liens(etudiant1));"
dbSendQuery(tables.db,etudiants_sql)
#injection des données
bd_etudiants<-rbind(bd_etudiants_1,bd_etudiants_2,bd_etudiants_3,bd_etudiants_4,bd_etudiants_5,bd_etudiants_6,bd_etudiants_7)
dbWriteTable(tables.db,append=TRUE,name="etudiants",value=bd_etudiants, row.names=FALSE)
sql_requete2 <- "
SELECT *
FROM etudiants
;"
apercu2<-dbGetQuery(tables.db,sql_requete2)
apercu2

#creation de la table liens
liens_sql <- "CREATE TABLE liens (sigle CHAR(6),etudiant1 VARCHAR,etudiant2 VARCCHAR,session CHAR(3),id INTEGER(5),PRIMARY KEY(id) 
FOREIGN KEY(sigle) REFERENCES cours(sigle));"
dbSendQuery(tables.db,liens_sql)
#injection des données
bd_liens<-rbind(bd_liens_1,bd_liens_2,bd_liens_3,bd_liens_4,bd_liens_5,bd_liens_6,bd_liens_7)
bd_liens<-unique(bd_liens)
id_liens<-data.frame(id=10001:11768)
bd_liens<-cbind(bd_liens,id_liens)
dbWriteTable(tables.db,append=TRUE,name="liens",value=bd_liens, row.names=FALSE)
sql_requete3 <- "
SELECT *
FROM liens
;"
apercu3<-dbGetQuery(tables.db,sql_requete3)
apercu3
