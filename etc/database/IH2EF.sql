-- Modification spécifique pour l'IH2EF
-- L'adresse mail peut changer d une acad à l autre et les utilisateurs changent d'acad
ALTER TABLE credential ADD column eppn varchar(128) default null, ADD unique key (eppn);

-- En cas de création des comptes il est necessaire de passer un script du type pour chaque compte
-- update credential set eppn="$eppn" where login = "$courriel"
-- En cas de modification d un mail il est necessaire de passer un script du type
-- update credential set email="$email" where eppn="$eppn"
