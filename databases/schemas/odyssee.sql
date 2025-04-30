-- liste des entités liées à la structure informatique de l'APP

CREATE TABLE IF NOT EXISTS "routes" ();

CREATE TABLE IF NOT EXISTS "pages" ();

CREATE TABLE IF NOT EXISTS "views" ();


-- liste des entités liées aux features de l'APP

------------- gestion de projet : 

CREATE TABLE IF NOT EXISTS "users" ();

CREATE TABLE IF NOT EXISTS "projets" ();

CREATE TABLE IF NOT EXISTS "taches" ();

CREATE TABLE IF NOT EXISTS "documents" ();

CREATE TABLE IF NOT EXISTS "bibles" ();

CREATE TABLE IF NOT EXISTS "idees" ();


------------- contenu des bibles : 

CREATE TABLE IF NOT EXISTS "events" ();

CREATE TABLE IF NOT EXISTS "locations" ();

CREATE TABLE IF NOT EXISTS "items" (); -- needs, goods, actants, etc. 

CREATE TABLE IF NOT EXISTS "characters" (); -- agents

CREATE TABLE IF NOT EXISTS "journeys" (); -- trajectoires des agents

CREATE TABLE IF NOT EXISTS "quests" (); -- objectif que veut ou doit atteindre un agent

CREATE TABLE IF NOT EXISTS "stories" (); -- recit composé des états et situations des ETANTS entre deux EVENTS ; il est stucturé selon une logique narrative


------------- gestion des personnages : 

CREATE TABLE IF NOT EXISTS "appearance" (); -- combinaison des différentes caracteristiques genotypique, phenotypique et biographique

CREATE TABLE IF NOT EXISTS "personnalities" (); -- combinaison des differents types de classification des profils (MBTI, dere, enneagram, etc...)

CREATE TABLE IF NOT EXISTS "beliefs" (); -- combinaisons des éléments qui composent les valeurs, motivations et principes d'un agent

CREATE TABLE IF NOT EXISTS "needs" (); -- liste des elements essentiels à la persistence/existence d'une entité

CREATE TABLE IF NOT EXISTS "wants" (); -- liste des elements ou situations qu'un agent veut posseder ou faire advenir

CREATE TABLE IF NOT EXISTS "actions" (); -- liste des events qu'un agent peut ou veut ou doit mettre en actes. 

CREATE TABLE IF NOT EXISTS "means" (); -- liste des ressources mobilisables ou actionnables ou utilisables pour réaliser une action, atteindre un objectifs ou satisfaire un besoin/desir



------------- gestion des trajectoires ou JOURNEYS des étants : 